-- Function: gpCompletePeriod_Movement_IncomeFuel (Integer, TVarChar)

DROP FUNCTION IF EXISTS gpCompletePeriod_Movement_IncomeFuel (TDateTime, TDateTime, TVarChar);

CREATE OR REPLACE FUNCTION gpCompletePeriod_Movement_IncomeFuel(
    IN inStartDate    TDateTime ,  
    IN inEndDate      TDateTime ,
    IN inSession      TVarChar DEFAULT ''     -- ������ ������������
)                              
RETURNS VOID
AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN

     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId:= PERFORM lpCheckRight (inSession, zc_Enum_Process_CompletePeriod_IncomeFuel());
     vbUserId:=2; -- CAST (inSession AS Integer);






END;
$BODY$
LANGUAGE PLPGSQL VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 30.10.13         *
*/

-- ����
-- SELECT * FROM gpCompletePeriod_Movement_IncomeFuel (inStartDate:= '01.10.2013', inEndDate:= '01.10.2013', inSession:= zfCalc_UserAdmin())
