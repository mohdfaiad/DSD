-- Function: lpInsertUpdate_MovementItem_IncomeFuel()

DROP FUNCTION IF EXISTS lpInsertUpdate_MovementItem_IncomeFuel (Integer, Integer, Integer, TFloat, TFloat, TFloat, Integer);

CREATE OR REPLACE FUNCTION lpInsertUpdate_MovementItem_IncomeFuel(
 INOUT ioId                  Integer   , -- ���� ������� <������� ���������>
    IN inMovementId          Integer   , -- ���� ������� <��������>
    IN inGoodsId             Integer   , -- ������
    IN inAmount              TFloat    , -- ����������
 INOUT ioPrice               TFloat    , -- ����
 INOUT ioCountForPrice       TFloat    , -- ���� �� ����������
   OUT outAmountSumm         TFloat    , -- ����� ���������
    IN inUserId              Integer     -- ������������
)
RETURNS RECORD
AS
$BODY$
   DECLARE vbOperDate Boolean;
   DECLARE vbIsInsert Boolean;
BEGIN
     -- ������� ����
     vbOperDate:= (SELECT Movement.OperDate FROM Movement WHERE Movement.Id = inMovementId);

     -- ������� � ������
     /*ioPrice:= (SELECT COALESCE (ObjectHistoryFloat_Value.ValueData, 0) AS ValuePrice
                FROM ObjectLink AS ObjectLink_Goods
                     INNER JOIN ObjectLink AS ObjectLink_PriceList
                                           ON ObjectLink_PriceList.ObjectId      = ObjectLink_Goods.ObjectId
                                          AND ObjectLink_PriceList.ChildObjectId = zc_PriceList_Fuel()
                                          AND ObjectLink_PriceList.DescId        = zc_ObjectLink_PriceListItem_PriceList()
                     INNER JOIN ObjectHistory AS ObjectHistory_PriceListItem
                                              ON ObjectHistory_PriceListItem.ObjectId = ObjectLink_Goods.ObjectId
                                             AND ObjectHistory_PriceListItem.DescId   = zc_ObjectHistory_PriceListItem()
                                             AND vbOperDate >= ObjectHistory_PriceListItem.StartDate AND vbOperDate < ObjectHistory_PriceListItem.EndDate
                     LEFT JOIN ObjectHistoryFloat AS ObjectHistoryFloat_Value
                                                  ON ObjectHistoryFloat_Value.ObjectHistoryId = ObjectHistory_PriceListItem.Id
                                                 AND ObjectHistoryFloat_Value.DescId = zc_ObjectHistoryFloat_PriceListItem_Value()
                WHERE ObjectLink_Goods.ChildObjectId = inGoodsId
                  AND ObjectLink_Goods.DescId        = zc_ObjectLink_PriceListItem_Goods()
               );*/

     -- �������� - ��� <������ �� �������> ���� ������ ���� = 0, �.�. ��� ���� �����������
     IF ioPrice <> 0 AND EXISTS (SELECT tmpFrom.ObjectId FROM (SELECT ObjectId FROM MovementLinkObject WHERE MovementId = inMovementId AND DescId = zc_MovementLinkObject_From()) AS tmpFrom JOIN Object ON Object.Id = tmpFrom.ObjectId AND Object.DescId = zc_Object_TicketFuel())
     THEN
         RAISE EXCEPTION '������.��� <������ �� �������> ���� ������� �� ����.';
     ELSEIF COALESCE (ioPrice, 0) = 0 AND 1=0
     THEN
         RAISE EXCEPTION '������.��� ������� <%> �� ����������� ���� � ������.', lfGet_Object_ValueData_sh (inGoodsId);
     END IF;

     -- ������������ ������� ��������/�������������
     vbIsInsert:= COALESCE (ioId, 0) = 0;

     -- ��������� <������� ���������>
     ioId := lpInsertUpdate_MovementItem (ioId, zc_MI_Master(), inGoodsId, inMovementId, inAmount, NULL);

     -- ��������� �������� <���������� � �����������>
     PERFORM lpInsertUpdate_MovementItemFloat (zc_MIFloat_AmountPartner(), ioId, inAmount);

     -- ��������� �������� <����>
     PERFORM lpInsertUpdate_MovementItemFloat (zc_MIFloat_Price(), ioId, ioPrice);
     -- ���������/��������� �������� <���� �� ����������>
     IF COALESCE (ioCountForPrice, 0) = 0 THEN ioCountForPrice := 1; END IF;
     PERFORM lpInsertUpdate_MovementItemFloat (zc_MIFloat_CountForPrice(), ioId, ioCountForPrice);

     -- ����������� �������� ����� �� ���������
     PERFORM lpInsertUpdate_MovemenTFloat_TotalSumm (inMovementId);

     -- ��������� ����� �� ��������, ��� �����
     outAmountSumm := CASE WHEN ioCountForPrice > 0
                                THEN CAST (inAmount * inPrice / ioCountForPrice AS NUMERIC (16, 2))
                           ELSE CAST (inAmount * inPrice AS NUMERIC (16, 2))
                      END;

     -- ��������� ��������
     PERFORM lpInsert_MovementItemProtocol (ioId, inUserId, vbIsInsert);

END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;


/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 21.10.13                                        * add IF inPrice <> 0 AND ...
 04.10.13                                        *
*/

-- ����
-- SELECT * FROM lpInsertUpdate_MovementItem_IncomeFuel (ioId:= 0, inMovementId:= 10, inGoodsId:= 1, inAmount:= 0, inAmountPartner:= 0, inAmountPacker:= 0, inPrice:= 1, inCountForPrice:= 1, inLiveWeight:= 0, inHeadCount:= 0, inPartionGoods:= '', inGoodsKindId:= 0, inAssetId:= 0, inSession:= '2')
