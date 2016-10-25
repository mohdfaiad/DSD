-- Function: gpInsert_MovementItem_Inventory_bySend()

DROP FUNCTION IF EXISTS gpInsertUpdate_MovementItem_Inventory_bySend (Integer, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_MovementItem_Inventory_bySend(
    IN inMovementId               Integer   , -- ���� ������� <�������� ��������������>
    IN inMovementId_Send          Integer   , -- ���� ������� <�������� �����������>
    IN inSession                  TVarChar    -- ������ ������������
)
RETURNS void AS
$BODY$
   DECLARE vbUserId Integer;

BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId := lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_MI_Inventory());

     -- ���������
     PERFORM lpInsertUpdate_MovementItem_Inventory (ioId                 := COALESCE (tmp.MovementItemId, 0)
                                                  , inMovementId         := inMovementId
                                                  , inGoodsId            := tmp.GoodsId
                                                  , inAmount             := COALESCE (tmp.Amount,0)
                                                  , inPartionGoodsDate   := CASE WHEN tmp.PartionGoodsDate = zc_DateStart() THEN NULL ELSE tmp.PartionGoodsDate END
                                                  , inPrice              := 0
                                                  , inSumm               := 0
                                                  , inHeadCount          := 0
                                                  , inCount              := 0
                                                  , inPartionGoods       := tmp.PartionGoods
                                                  , inGoodsKindId        := tmp.GoodsKindId
                                                  , inGoodsKindCompleteId:= tmp.GoodsKindCompleteId
                                                  , inAssetId            := NULL
                                                  , inUnitId             := NULL
                                                  , inStorageId          := NULL
                                                  , inUserId             := vbUserId
                                                   )
     FROM (SELECT tmpMI.MovementItemId                                                      AS MovementItemId
                , COALESCE (tmpMI.GoodsId, tmpMI_Send.GoodsId)                              AS GoodsId
                , COALESCE (tmpMI.GoodsKindId, tmpMI_Send.GoodsKindId)                      AS GoodsKindId
                , COALESCE (tmpMI.GoodsKindCompleteId, 0)                                   AS GoodsKindCompleteId
                , COALESCE (tmpMI.PartionGoods, tmpMI_Send.PartionGoods)                    AS PartionGoods
                , COALESCE (tmpMI.PartionGoodsDate, tmpMI_Send.PartionGoodsDate)            AS PartionGoodsDate
                , (COALESCE (tmpMI.Amount, 0) + COALESCE (tmpMI_Send.Amount, 0)) :: TFloat  AS Amount

           FROM (SELECT MovementItem.ObjectId                                               AS GoodsId
                                   , COALESCE (MILinkObject_GoodsKind.ObjectId, 0)                      AS GoodsKindId
                                   , COALESCE (MIString_PartionGoods.ValueData, '')                       AS PartionGoods
                                   , COALESCE (MIDate_PartionGoods.ValueData, zc_DateStart()) AS PartionGoodsDate
                                   , MovementItem.Amount                                                AS Amount

                              FROM MovementItem 
                                 LEFT JOIN MovementItemDate AS MIDate_PartionGoods
                                                            ON MIDate_PartionGoods.MovementItemId =  MovementItem.Id
                                                           AND MIDate_PartionGoods.DescId = zc_MIDate_PartionGoods()
                                 LEFT JOIN MovementItemString AS MIString_PartionGoods
                                                              ON MIString_PartionGoods.MovementItemId =  MovementItem.Id
                                                             AND MIString_PartionGoods.DescId = zc_MIString_PartionGoods()
                                 LEFT JOIN MovementItemLinkObject AS MILinkObject_GoodsKind
                                                         ON MILinkObject_GoodsKind.MovementItemId = MovementItem.Id
                                                        AND MILinkObject_GoodsKind.DescId = zc_MILinkObject_GoodsKind()
                             WHERE MovementItem.MovementId = inMovementId_Send  
                               AND MovementItem.DescId     = zc_MI_Master()
                               AND MovementItem.isErased   = FALSE
                            ) tmpMI_Send
                    LEFT JOIN
                (SELECT MovementItem.Id                                          AS MovementItemId
                      , MovementItem.ObjectId                                    AS GoodsId
                      , COALESCE (MILinkObject_GoodsKind.ObjectId, 0)            AS GoodsKindId
                      , COALESCE (MILinkObject_GoodsKindComplete.ObjectId, 0)    AS GoodsKindCompleteId
                      , COALESCE (MIString_PartionGoods.ValueData, '')           AS PartionGoods
                      , COALESCE (MIDate_PartionGoods.ValueData, zc_DateStart()) AS PartionGoodsDate
                      , MovementItem.Amount                                      AS Amount
                 FROM Movement
                      INNER JOIN MovementItem ON Movement.id = MovementItem.MovementId
                                             AND MovementItem.isErased = FALSE
                      LEFT JOIN MovementItemLinkObject AS MILinkObject_GoodsKind
                                                                 ON MILinkObject_GoodsKind.MovementItemId = MovementItem.Id
                                                                AND MILinkObject_GoodsKind.DescId = zc_MILinkObject_GoodsKind() 
                      LEFT JOIN MovementItemLinkObject AS MILinkObject_GoodsKindComplete
                                                       ON MILinkObject_GoodsKindComplete.MovementItemId = MovementItem.Id
                                                      AND MILinkObject_GoodsKindComplete.DescId = zc_MILinkObject_GoodsKindComplete() 
                      LEFT JOIN MovementItemDate AS MIDate_PartionGoods
                                                           ON MIDate_PartionGoods.MovementItemId =  MovementItem.Id
                                                          AND MIDate_PartionGoods.DescId = zc_MIDate_PartionGoods()
                                LEFT JOIN MovementItemString AS MIString_PartionGoods
                                                             ON MIString_PartionGoods.MovementItemId =  MovementItem.Id
                                                            AND MIString_PartionGoods.DescId = zc_MIString_PartionGoods()
                   WHERE Movement.Id = inMovementId
                   ) AS tmpMI ON tmpMI.GoodsId          = tmpMI_Send.GoodsId
                             AND tmpMI.GoodsKindId      = tmpMI_Send.GoodsKindId
                             AND tmpMI.PartionGoods     = tmpMI_Send.PartionGoods
                             AND tmpMI.PartionGoodsDate = tmpMI_Send.PartionGoodsDate
           ) AS tmp;
            

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.
 17.10.16         *
*/

-- ����
-- SELECT * FROM gpInsertUpdate_MovementItem_Inventory_bySend (ioId:= 0, inMovementId:= 10, inMovementId_Send:= 1, inSession:= '2')