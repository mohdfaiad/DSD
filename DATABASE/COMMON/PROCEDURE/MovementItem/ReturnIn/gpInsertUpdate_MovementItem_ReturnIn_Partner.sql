-- Function: gpInsertUpdate_MovementItem_ReturnIn_Partner()

DROP FUNCTION IF EXISTS gpInsertUpdate_MovementItem_ReturnIn_Partner (Integer, Integer, Integer, TFloat, TFloat, TFloat, TFloat, TVarChar, Integer, Integer, Integer, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_MovementItem_ReturnIn_Partner(
 INOUT ioId                     Integer   , -- ���� ������� <������� ���������>
    IN inMovementId             Integer   , -- ���� ������� <�������� ������� ����������>
    IN inGoodsId                Integer   , -- ������
    IN inAmountPartner          TFloat    , -- ���������� � �����������
    IN inPrice                  TFloat    , -- ����
 INOUT ioCountForPrice          TFloat    , -- ���� �� ����������
   OUT outAmountSumm            TFloat    , -- ����� ���������
   OUT outAmountSummVat         TFloat    , -- ����� � ��� ���������
    IN inHeadCount              TFloat    , -- ���������� �����
    IN inPartionGoods           TVarChar  , -- ������ ������
    IN inGoodsKindId            Integer   , -- ���� �������
    IN inAssetId                Integer   , -- �������� �������� (��� ������� ���������� ���)
    IN inMovementId_PartionTop  Integer   , -- Id ��������� ������� �� �����
    IN inMovementId_PartionMI   Integer   , -- Id ��������� ������� �������� �����
   OUT outMovementId_Partion    Integer   , --
   OUT outPartionMovementName   TVarChar  , --
   OUT outMovementPromo         TVarChar  , --
   OUT outMemberExpName         TVarChar  , -- ���������� �� ������ ��������
   OUT outChangePercent         TFloat    , -- (-)% ������ (+)% �������
   OUT outPricePromo            TFloat    , --
    IN inSession                TVarChar    -- ������ ������������
)
RETURNS RECORD AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbPriceWithVAT Boolean;
   DECLARE vbVATPercent TFloat;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId:= lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_MI_ReturnIn_Partner());

     -- !!!�������� ��������!!!
     IF COALESCE (inMovementId_PartionMI, 0) = 0
     THEN
         inMovementId_PartionMI := COALESCE (inMovementId_PartionTop, 0);
     END IF;
     -- ��������� ��������� inMovementId_PartionMI
     SELECT Movement_PartionMovement.Id AS MovementId_Partion
          , zfCalc_PartionMovementName (Movement_PartionMovement.DescId, MovementDesc_PartionMovement.ItemName, Movement_PartionMovement.InvNumber, MovementDate_OperDatePartner_PartionMovement.ValueData) AS PartionMovementName
            INTO outMovementId_Partion, outPartionMovementName
     FROM Movement AS Movement_PartionMovement
          LEFT JOIN MovementDesc AS MovementDesc_PartionMovement ON MovementDesc_PartionMovement.Id = Movement_PartionMovement.DescId
          LEFT JOIN MovementDate AS MovementDate_OperDatePartner_PartionMovement
                                 ON MovementDate_OperDatePartner_PartionMovement.MovementId =  Movement_PartionMovement.Id
                                AND MovementDate_OperDatePartner_PartionMovement.DescId = zc_MovementDate_OperDatePartner()
     WHERE Movement_PartionMovement.Id = inMovementId_PartionMI;



     -- ���� � ���, % ���
     SELECT MB_PriceWithVAT.ValueData , MF_VATPercent.ValueData
    INTO vbPriceWithVAT, vbVATPercent
     FROM MovementBoolean AS MB_PriceWithVAT
         LEFT JOIN MovementFloat AS MF_VATPercent
                                 ON MF_VATPercent.MovementId = MB_PriceWithVAT.MovementId
                                AND MF_VATPercent.DescId = zc_MovementFloat_VATPercent()
     WHERE MB_PriceWithVAT.MovementId = inMovementId
       AND MB_PriceWithVAT.DescId = zc_MovementBoolean_PriceWithVAT();


     -- ��������� <������� ���������>
     SELECT tmp.ioId, tmp.ioCountForPrice, tmp.outAmountSumm
          , zfCalc_PromoMovementName (tmp.ioMovementId_Promo, NULL, NULL, NULL, NULL)
          , tmp.ioChangePercent
          , tmp.outPricePromo
            INTO ioId, ioCountForPrice, outAmountSumm, outMovementPromo, outChangePercent, outPricePromo
     FROM lpInsertUpdate_MovementItem_ReturnIn (ioId                 := ioId
                                              , inMovementId         := inMovementId
                                              , inGoodsId            := inGoodsId
                                              , inAmount             := COALESCE ((SELECT Amount FROM MovementItem WHERE Id = ioId AND DescId = zc_MI_Master()), 0)
                                              , inAmountPartner      := inAmountPartner
                                              , inPrice              := inPrice
                                              , ioCountForPrice      := ioCountForPrice
                                              , inHeadCount          := inHeadCount
                                              , inMovementId_Partion := inMovementId_PartionMI   --COALESCE ((SELECT ValueData FROM MovementItemFloat WHERE MovementItemId = ioId AND DescId = zc_MIFloat_MovementId()), 0) :: Integer
                                              , inPartionGoods       := inPartionGoods
                                              , inGoodsKindId        := inGoodsKindId
                                              , inAssetId            := inAssetId
                                              , ioMovementId_Promo   := NULL
                                              , ioChangePercent      := NULL
                                              , inUserId             := vbUserId
                                               ) AS tmp;

    -- ������� - ����� � ��� ���������
    outAmountSummVat:= CASE WHEN ioCountForPrice > 0
                            THEN CASE WHEN vbPriceWithVAT = TRUE THEN CAST(inPrice * inAmountPartner/ioCountForPrice AS NUMERIC (16, 2))
                                                                 ELSE CAST( (( (1 + vbVATPercent / 100)* inPrice) * inAmountPartner/ioCountForPrice) AS NUMERIC (16, 2))
                                 END
                            ELSE CASE WHEN vbPriceWithVAT = TRUE THEN CAST(inPrice * inAmountPartner AS NUMERIC (16, 2))
                                                                 ELSE CAST( (((1 + vbVATPercent / 100)* inPrice) * inAmountPartner) AS NUMERIC (16, 2) )
                                 END
                        END;


    -- ����������� - ���������� �� "������ ��������� �� ����������"
    IF inMovementId_PartionMI > 0 AND NOT EXISTS (SELECT 1 FROM MovementLinkObject AS MLO WHERE MLO.MovementId = inMovementId AND MLO.DescId = zc_MovementLinkObject_MemberExp() AND MLO.ObjectId > 0)
    THEN
        PERFORM lpUpdate_Movement_ReturnIn_MemberExp (inMovementId := inMovementId
                                                    , inUserId     := vbUserId
                                                      );
    END IF;

    -- ������� "���������� �� ������ ��������"
    outMemberExpName := COALESCE((SELECT Object_MemberExp.ValueData AS MemberExpName
                                  FROM MovementLinkObject AS MovementLinkObject_MemberExp
                                       LEFT JOIN Object AS Object_MemberExp ON Object_MemberExp.Id = MovementLinkObject_MemberExp.ObjectId
                                  WHERE MovementLinkObject_MemberExp.MovementId = inMovementId
                                    AND MovementLinkObject_MemberExp.DescId     = zc_MovementLinkObject_MemberExp()
                                  ), '') :: TVarChar;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.    ������ �.�.
 22.04.16         *
 05.11.14                                        *
*/

-- ����
-- SELECT * FROM gpInsertUpdate_MovementItem_ReturnIn_Partner (ioId:= 0, inMovementId:= 10, inGoodsId:= 1, inAmount:= 0, inAmountPartner:= 0, inPrice:= 1, ioCountForPrice:= 1 , inHeadCount:= 0, inPartionGoods:= '', inGoodsKindId:= 0, inAssetId:= 0, inSession:= '2')
