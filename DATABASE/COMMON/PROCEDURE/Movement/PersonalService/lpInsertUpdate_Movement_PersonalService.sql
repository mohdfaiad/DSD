-- Function: lpInsertUpdate_Movement_PersonalService()

DROP FUNCTION IF EXISTS lpInsertUpdate_Movement_PersonalService (Integer, TVarChar, TDateTime, TDateTime, TVarChar, Integer, Integer);
DROP FUNCTION IF EXISTS lpInsertUpdate_Movement_PersonalService (Integer, TVarChar, TDateTime, TDateTime, TVarChar, Integer, Integer, Integer);

CREATE OR REPLACE FUNCTION lpInsertUpdate_Movement_PersonalService(
 INOUT ioId                     Integer   , -- ���� ������� <�������� �����������>
    IN inInvNumber              TVarChar  , -- ����� ���������
    IN inOperDate               TDateTime , -- ���� ���������
    IN inServiceDate            TDateTime , -- ����� ����������
    IN inComment                TVarChar  , -- ����������
    IN inPersonalServiceListId  Integer   , -- 
    IN inJuridicalId            Integer   , -- 
    IN inUserId                 Integer     -- ������������
)
RETURNS Integer AS
$BODY$
   DECLARE vbAccessKeyId Integer;
   DECLARE vbIsInsert Boolean;
   DECLARE vbMovementId_check Integer;
BEGIN
     -- ��������
     IF inOperDate <> DATE_TRUNC ('DAY', inOperDate)
     THEN
         RAISE EXCEPTION '������.�������� ������ ����.';
     END IF;
     -- ��������
     IF COALESCE (inPersonalServiceListId, 0) = 0
     THEN
         RAISE EXCEPTION '������.�� ����������� �������� <��������� ����������>.';
     END IF;

     -- ������ - 1-�� ����� ������
     inServiceDate:= DATE_TRUNC ('MONTH', inServiceDate);


     -- �������� - ������ ���� �� ������
     vbMovementId_check:= (SELECT MovementDate.MovementId
                           FROM MovementDate
                                INNER JOIN MovementLinkObject ON MovementLinkObject.MovementId = MovementDate.MovementId
                                                             AND MovementLinkObject.DescId = zc_MovementLinkObject_PersonalServiceList()
                                                             AND MovementLinkObject.ObjectId = inPersonalServiceListId
                                INNER JOIN Movement ON Movement.Id = MovementDate.MovementId
                                                   AND Movement.StatusId <> zc_Enum_Status_Erased()
                                                   AND Movement.Id <> COALESCE (ioId, 0)
                           WHERE MovementDate.ValueData = inServiceDate
                             AND MovementDate.DescId = zc_MIDate_ServiceDate()
                           LIMIT 1
                          );
     IF vbMovementId_check <> 0
     THEN
         RAISE EXCEPTION '������.������� ������ <��������� ����������> � <%> �� <%> ��� <%> �� <%>.������������ ���������.', (SELECT Movement.InvNumber FROM Movement WHERE Movement.Id = vbMovementId_check)
                                                                                                                           , DATE ((SELECT Movement.OperDate FROM Movement WHERE Movement.Id = vbMovementId_check))
                                                                                                                           , lfGet_Object_ValueData ((SELECT MovementLinkObject.ObjectId FROM MovementLinkObject WHERE MovementLinkObject.MovementId = vbMovementId_check AND MovementLinkObject.DescId = zc_MovementLinkObject_PersonalServiceList()))
                                                                                                                           , zfCalc_MonthYearName ((SELECT MovementDate.ValueData FROM MovementDate WHERE MovementDate.MovementId = vbMovementId_check AND MovementDate.DescId = zc_MIDate_ServiceDate()));
     END IF;


     -- ���������� ���� �������
     vbAccessKeyId:= lpGetAccessKey (inUserId, zc_Enum_Process_InsertUpdate_Movement_PersonalService());


     -- ������������ ������� ��������/�������������
     vbIsInsert:= COALESCE (ioId, 0) = 0;

     -- ��������� <��������>
     ioId := lpInsertUpdate_Movement (ioId, zc_Movement_PersonalService(), inInvNumber, inOperDate, NULL, vbAccessKeyId);
     -- !!!�����!!!
     UPDATE Movement SET AccessKeyId = vbAccessKeyId WHERE Id = ioId;

     -- �����������
     PERFORM lpInsertUpdate_MovementString (zc_MovementString_Comment(), ioId, inComment);
     -- ��������� �������� <����� ����������>
     PERFORM lpInsertUpdate_MovementDate (zc_MovementDate_ServiceDate(), ioId, inServiceDate);

     -- ��������� ����� � <>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PersonalServiceList(), ioId, inPersonalServiceListId);

     -- ��������� ����� � <>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_Juridical(), ioId, inJuridicalId);
   
     -- ����������� �������� ����� �� ���������
     PERFORM lpInsertUpdate_MovementFloat_TotalSumm (ioId);

     -- ��������� ��������
     PERFORM lpInsert_MovementProtocol (ioId, inUserId, vbIsInsert);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 01.10.14         * add inJuridicalId
 11.09.14         *
*/

-- ����
-- SELECT * FROM lpInsertUpdate_Movement_PersonalService (ioId:= 0, inInvNumber:= '-1', inOperDate:= '01.01.2013', inOperDatePartner:= '01.01.2013', inInvNumberPartner:= 'xxx', inPriceWithVAT:= true, inVATPercent:= 20, inChangePercent:= 0, inFromId:= 1, inToId:= 2, inPaidKindId:= 1, inContractId:= 0, inCarId:= 0, inPersonalDriverId:= 0, inPersonalPackerId:= 0, inSession:= '2')
