-- Function: gpGet_TaxParam()

DROP FUNCTION IF EXISTS gpGet_TaxParam (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_TaxParam(
    IN inMovementId        Integer  , -- ���� ���������
    IN inSession           TVarChar   -- ������ ������������
)
RETURNS TABLE (Id Integer, InvNumber TVarChar, OperDate TDateTime
             , DateRegistered TDateTime
             , InvNumberPartner TVarChar
             , FromId Integer, FromName TVarChar
             , ToId Integer, ToName TVarChar
              )
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- PERFORM lpCheckRight (inSession, zc_Enum_Process_Get_Movement_Tax());
     vbUserId := lpGetUserBySession (inSession);
     

     RETURN QUERY
       SELECT
             Movement.Id					AS Id
           , Movement.InvNumber                                 AS InvNumber
           , Movement.OperDate                                  AS OperDate
           , COALESCE (MovementDate_DateRegistered.ValueData,CAST (DATE_TRUNC ('DAY', CURRENT_TIMESTAMP) AS TDateTime)) AS DateRegistered
           , MovementString_InvNumberPartner.ValueData          AS InvNumberPartner
           , Object_From.Id                    			AS FromId
           , Object_From.ValueData             			AS FromName--
           , Object_To.Id                      			AS ToId
           , Object_To.ValueData               			AS ToName
      
       FROM Movement
            LEFT JOIN MovementDate AS MovementDate_DateRegistered
                                   ON MovementDate_DateRegistered.MovementId = Movement.Id
                                  AND MovementDate_DateRegistered.DescId = zc_MovementDate_DateRegistered()

            LEFT JOIN MovementString AS MovementString_InvNumberPartner
                                     ON MovementString_InvNumberPartner.MovementId = Movement.Id
                                    AND MovementString_InvNumberPartner.DescId = zc_MovementString_InvNumberPartner()

            LEFT JOIN MovementLinkObject AS MovementLinkObject_From
                                         ON MovementLinkObject_From.MovementId = Movement.Id
                                        AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
            LEFT JOIN Object AS Object_From ON Object_From.Id = MovementLinkObject_From.ObjectId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_To
                                         ON MovementLinkObject_To.MovementId = Movement.Id
                                        AND MovementLinkObject_To.DescId = zc_MovementLinkObject_To()
            LEFT JOIN Object AS Object_To ON Object_To.Id = MovementLinkObject_To.ObjectId

       WHERE Movement.Id = inMovementId
         AND Movement.DescId = zc_Movement_Tax();
   

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 02.03.18         *
*/

-- ����
-- SELECT * FROM gpGet_TaxParam (inMovementId:= 0, inSession:= '2')