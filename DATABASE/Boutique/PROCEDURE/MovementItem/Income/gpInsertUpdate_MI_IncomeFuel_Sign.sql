-- Function: gpInsertUpdate_MI_IncomeFuel_Sign()

DROP FUNCTION IF EXISTS gpInsertUpdate_MI_IncomeFuel_Sign (Integer, Boolean, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_MI_IncomeFuel_Sign(
    IN inMovementId          Integer   , -- ���� ������� <��������>
    IN inIsSign              Boolean   ,
    IN inSession             TVarChar    -- ������ ������������
)                              
RETURNS VOID AS
$BODY$
  DECLARE vbUserId Integer;
  DECLARE vbIsInsert Boolean;

  DECLARE vbId             Integer;
  DECLARE vbSignInternalId Integer;
  DECLARE vbOrd            Integer;
  DECLARE vbStrIdSign      TVarChar;
  DECLARE vbStrIdSignNo    TVarChar;
  DECLARE vbStrMIIdSign    TVarChar;
  DECLARE vbIndex          Integer; -- � ������������ ����� �����������
  DECLARE vbIndexNo        Integer; -- � ������������ ����� �� �����������
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId := lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_MI_IncomeFuel());


     -- �������� ��� Id �������������
     SELECT tmp.SignInternalId, tmp.strMIIdSign, tmp.strIdSign, tmp.strIdSignNo
          , zfCalc_WordNumber_Split (tmp.strIdSign,   ',', vbUserId :: TVarChar)
          , zfCalc_WordNumber_Split (tmp.strIdSignNo, ',', vbUserId :: TVarChar)
            INTO vbSignInternalId, vbStrMIIdSign, vbStrIdSign, vbStrIdSignNo, vbIndex, vbIndexNo
      FROM lpSelect_MI_IncomeFuel_Sign (inMovementId:= inMovementId) AS tmp;


     -- ��������
     IF inIsSign = TRUE
     THEN -- ���� ���������� ����������� �������

         IF vbIndex > 0 -- ���� �� ����� �����������
         THEN
             RAISE EXCEPTION '������.������������ <%> ��� ���������� ����������� ������� � ��������� � <%> �� <%>.', lfGet_Object_ValueData (vbUserId), (SELECT InvNumber FROM Movement WHERE Id = inMovementId), DATE ((SELECT OperDate FROM Movement WHERE Id = inMovementId));

         ELSEIF vbIndexNo = 0 -- ���� ��� ��� ����� �� �����������
         THEN
             RAISE EXCEPTION '������.������������ <%> �� ��������� ����������� ������� ��� ��������� � <%> �� <%>.', lfGet_Object_ValueData (vbUserId), (SELECT InvNumber FROM Movement WHERE Id = inMovementId), DATE ((SELECT OperDate FROM Movement WHERE Id = inMovementId));

         ELSEIF vbIndexNo <> 1 -- ���� �� ������ ����� �� �����������
         THEN
             RAISE EXCEPTION '������.������������ <%> ������ ����������� ����������� ������� ��� ��������� � <%> �� <%> ������ ����� <%>.', lfGet_Object_ValueData (vbUserId), (SELECT InvNumber FROM Movement WHERE Id = inMovementId), DATE ((SELECT OperDate FROM Movement WHERE Id = inMovementId))
                           , lfGet_Object_ValueData (zfCalc_Word_Split (vbStrIdSignNo, ',', vbIndexNo - 1) :: Integer);

         END IF;

     ELSE -- ���� ������� ����������� �������

         IF vbIndexNo > 0 -- ���� �� ����� �� �����������
         THEN
             RAISE EXCEPTION '������.������������ <%> ��� ������� ����������� ������� � ��������� � <%> �� <%>.', lfGet_Object_ValueData (vbUserId), (SELECT InvNumber FROM Movement WHERE Id = inMovementId), DATE ((SELECT OperDate FROM Movement WHERE Id = inMovementId));

         ELSEIF vbIndex = 0 -- ���� ��� ��� ����� �����������
         THEN
             RAISE EXCEPTION '������.������������ <%> �� ��������� ������ ����������� ������� ���  ��������� � <%> �� <%>.', lfGet_Object_ValueData (vbUserId), (SELECT InvNumber FROM Movement WHERE Id = inMovementId), DATE ((SELECT OperDate FROM Movement WHERE Id = inMovementId));

         ELSEIF zfCalc_Word_Split (vbStrIdSign, ',', vbIndex + 1) <> '' -- ���� �� ��������� ����� �����������
         THEN
             RAISE EXCEPTION '������.������������ <%> ������ �������� ����������� ������� ��� ��������� � <%> �� <%> ������ ����� <%>.', lfGet_Object_ValueData (vbUserId), (SELECT InvNumber FROM Movement WHERE Id = inMovementId), DATE ((SELECT OperDate FROM Movement WHERE Id = inMovementId))
                           , lfGet_Object_ValueData (zfCalc_Word_Split (vbStrIdSign, ',', vbIndex + 1) :: Integer);

         END IF;
     END IF;


     -- ��� ���������� Id ������
     vbId:= CASE WHEN zfCalc_Word_Split (vbStrMIIdSign, ',', vbIndex) <> '' THEN zfCalc_Word_Split (vbStrMIIdSign, ',', vbIndex) :: Integer END;
     -- ��� ���������� � �/�
     IF inIsSign = TRUE
     THEN vbOrd:= 1 + COALESCE ((SELECT MAX (Amount) :: Integer FROM MovementItem WHERE MovementId = inMovementId AND DescId = zc_MI_Sign() AND MovementItem.isErased = FALSE AND MovementItem.Amount > 0), 0);
     ELSE vbOrd:= 0;
     END IF;


     -- ������������ ������� ��������/�������������
     vbIsInsert:= COALESCE (vbId, 0) = 0;
 
     -- ��������� <������� ���������>
     vbId:= lpInsertUpdate_MovementItem (vbId, zc_MI_Sign(), vbSignInternalId, inMovementId, vbOrd, NULL);
   
     -- ��������� ������
     PERFORM lpInsertUpdate_MovementItemDate (zc_MIDate_Insert(), vbId, CURRENT_TIMESTAMP);
     PERFORM lpInsertUpdate_MovementItemLinkObject (zc_MILinkObject_Insert(), vbId, vbUserId);


     -- � ������ ��� � ������
     IF inIsSign = FALSE
     THEN
         PERFORM lpSetErased_MovementItem (inMovementItemId:= vbId, inUserId:= vbUserId);
     END IF;


     -- ��������� ��������
     PERFORM lpInsert_MovementItemProtocol (vbId, vbUserId, vbIsInsert);

END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.  ���������� �.�.
 23.08.16         * 
*/

-- ����
-- SELECT * FROM gpInsertUpdate_MI_IncomeFuel_Sign (inMovementId:= 4136053, inIsSign:= TRUE, inSession:= '12894') -- ���������� �.�.
-- SELECT * FROM gpInsertUpdate_MI_IncomeFuel_Sign (inMovementId:= 4136053, inIsSign:= FALSE, inSession:= '12894') -- ���������� �.�.

-- SELECT * FROM gpInsertUpdate_MI_IncomeFuel_Sign (inMovementId:= 4136053, inIsSign:= TRUE, inSession:= '9463') -- ������ �.�.
-- SELECT * FROM gpInsertUpdate_MI_IncomeFuel_Sign (inMovementId:= 4136053, inIsSign:= FALSE, inSession:= '9463') -- ������ �.�.
