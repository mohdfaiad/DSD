-- Function: gpSetErased_Movement_MobileBills (Integer, TVarChar)

DROP FUNCTION IF EXISTS gpSetErased_Movement_MobileBills (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpSetErased_Movement_MobileBills(
    IN inMovementId        Integer               , -- ���� ���������
    IN inSession           TVarChar DEFAULT ''     -- ������ ������������
)                              
RETURNS VOID
AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId:= lpCheckRight (inSession, zc_Enum_Process_SetErased_MobileBills());

     -- ������� ��������
     PERFORM lpSetErased_Movement (inMovementId := inMovementId
                                 , inUserId     := vbUserId);


END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 28.09.16         *
*/

-- ����
-- SELECT * FROM gpSetErased_Movement_MobileBills (inMovementId:= 149639, inSession:= zfCalc_UserAdmin())
