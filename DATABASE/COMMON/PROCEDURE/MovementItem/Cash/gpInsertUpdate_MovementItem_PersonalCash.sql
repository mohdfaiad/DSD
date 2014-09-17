-- Function: gpInsertUpdate_MovementItem_PersonalCash()

DROP FUNCTION IF EXISTS gpInsertUpdate_MovementItem_PersonalCash (Integer, Integer, Integer, TFloat, TFloat, TFloat, TFloat, TVarChar, Integer, Integer, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_MovementItem_PersonalCash(
 INOUT ioId                  Integer   , -- ���� ������� <������� ���������>
    IN inMovementId          Integer   , -- ���� ������� <��������>
    IN inPersonalId          Integer   , -- ����������
    IN inAmount             TFloat    , -- ����� � �������
   --OUT outAmountCash         TFloat    , -- ����� � ������� �� �����
    IN inComment             TVarChar  , -- 
    IN inInfoMoneyId         Integer   , -- ������ ����������
    IN inUnitId              Integer   , -- �������������
    IN inPositionId          Integer   , -- ���������
    IN inSession             TVarChar    -- ������ ������������
)
RETURNS Integer AS    --RECORD AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId:= lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_MI_PersonalCash());

     -- ���������
     SELECT tmp.ioId, tmp.outAmount, tmp.outAmountCash
       INTO ioId, outAmount, outAmountCash
     FROM lpInsertUpdate_MovementItem_PersonalCash (ioId      := ioId
                                                     , inMovementId         := inMovementId
                                                     , inPersonalId         := inPersonalId
                                                     , inAmount             := inAmount
                                                     , inComment            := inComment
                                                     , inInfoMoneyId        := inInfoMoneyId
                                                     , inUnitId             := inUnitId
                                                     , inPositionId         := inPositionId
                                                     , inUserId             := vbUserId
                                                      ) AS tmp;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 16.09.14         *
*/

-- ����
-- SELECT * FROM gpInsertUpdate_MovementItem_PersonalCash (ioId:= 0, inMovementId:= 258038 , inPersonalId:= 8473, inAmount:= 44, inSummService:= 20, inComment:= 'inComment', inInfoMoneyId:= 8994, inUnitId:= 8426, inPositionId:=12431, inSession:= '2')
