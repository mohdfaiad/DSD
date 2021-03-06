-- Function: gpInsertUpdate_MI_ProductionUnion_Master()

DROP FUNCTION IF EXISTS gpInsertUpdate_MI_ProductionUnion_Master  (Integer, Integer, Integer, TFloat, TDateTime, TVarChar, Integer, TVarChar);
DROP FUNCTION IF EXISTS gpInsertUpdate_MI_ProductionUnion_Master  (Integer, Integer, Integer, TFloat, TFloat, TDateTime, TVarChar, Integer, TVarChar);
DROP FUNCTION IF EXISTS gpInsertUpdate_MI_ProductionUnion_Master  (Integer, Integer, Integer, TFloat, TFloat, TFloat, TDateTime, TVarChar, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_MI_ProductionUnion_Master(
 INOUT ioId                  Integer   , -- ���� ������� <������� ���������>
    IN inMovementId          Integer   , -- ���� ������� <��������>
    IN inGoodsId             Integer   , -- ������
    IN inAmount              TFloat    , -- ����������
    IN inCount	             TFloat    , -- ���������� �������
    IN inCuterWeight	     TFloat    , -- ����������� ���(�������)
    IN inPartionGoodsDate    TDateTime , -- ������ ������
    IN inPartionGoods        TVarChar  , -- ������ ������
    IN inGoodsKindId         Integer   , -- ���� �������
    IN inSession             TVarChar    -- ������ ������������
)
RETURNS Integer
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   vbUserId:= lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_MI_ProductionUnion());

   -- ��������� <������� ���������>
   ioId :=lpInsertUpdate_MI_ProductionUnion_Master (ioId               := ioId
                                                  , inMovementId       := inMovementId
                                                  , inGoodsId          := inGoodsId
                                                  , inAmount           := inAmount
                                                  , inCount            := inCount
                                                  , inCuterWeight      := inCuterWeight
                                                  , inPartionGoodsDate := inPartionGoodsDate
                                                  , inPartionGoods     := inPartionGoods
                                                  , inGoodsKindId      := inGoodsKindId
                                                  , inUserId           := vbUserId
                                                   );

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 29.06.16         * add inCuterWeight
 12.06.15                                        * add inPartionGoodsDate
 21.03.15                                        * all
 19.12.14                                                       * add zc_MILinkObject_???GoodsKindComplete
 11.12.14         * add lpInsertUpdate_MI_ProductionUnion_Master

 24.07.13                                        * ����� ������� �����
 22.07.13         * add GoodsKind
 17.07.13         *
 30.06.13                                        *

*/

-- ����
-- SELECT * FROM gpInsertUpdate_MI_ProductionUnion_Master (ioId:= 0, inMovementId:= 10, inGoodsId:= 1, inAmount:= 0, inPartionClose:= FALSE, inComment:= '', inCount:= 1, inRealWeight:= 1, inCuterCount:= 0, inReceiptId:= 0, inSession:= '2')
