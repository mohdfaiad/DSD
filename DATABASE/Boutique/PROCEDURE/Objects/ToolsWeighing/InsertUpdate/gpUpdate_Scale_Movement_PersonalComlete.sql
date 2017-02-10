-- Function: gpUpdate_Scale_Movement_PersonalComlete()

DROP FUNCTION IF EXISTS gpUpdate_Scale_Movement_PersonalComlete (Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpUpdate_Scale_Movement_PersonalComlete(
    IN inMovementId          Integer   , -- ���� ������� <��������>
    IN inPersonalId1         Integer   , -- ���� �������
    IN inPersonalId2         Integer   , -- ���� �������
    IN inPersonalId3         Integer   , -- ���� �������
    IN inPersonalId4         Integer   , -- ���� �������
    IN inPositionId1         Integer   , -- ���� �������
    IN inPositionId2         Integer   , -- ���� �������
    IN inPositionId3         Integer   , -- ���� �������
    IN inPositionId4         Integer   , -- ���� �������
    IN inSession             TVarChar    -- ������ ������������
)                              
RETURNS VOID
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_Update_Scale_Movement_check());
     vbUserId:= lpGetUserBySession (inSession);


     -- ��������� ����� � <��������� ������������� 1>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PersonalComplete1(), inMovementId, inPersonalId1);
     -- ��������� ����� � <��������� ������������� 2>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PersonalComplete2(), inMovementId, inPersonalId2);
     -- ��������� ����� � <��������� ������������� 3>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PersonalComplete3(), inMovementId, inPersonalId3);
     -- ��������� ����� � <��������� ������������� 4>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PersonalComplete4(), inMovementId, inPersonalId4);

     -- ��������� ����� � <��������� ������������� 1>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PositionComplete1(), inMovementId, inPositionId1);
     -- ��������� ����� � <��������� ������������� 2>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PositionComplete2(), inMovementId, inPositionId2);
     -- ��������� ����� � <��������� ������������� 3>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PositionComplete3(), inMovementId, inPositionId3);
     -- ��������� ����� � <��������� ������������� 4>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PositionComplete4(), inMovementId, inPositionId4);

     -- ��������� ��������
     PERFORM lpInsert_MovementProtocol (inMovementId, vbUserId, FALSE);

END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.
 18.05.15                                        *
*/

-- ����
-- SELECT * FROM gpUpdate_Scale_Movement_PersonalComlete (inMovementId:= 0, inSession:= '2')
