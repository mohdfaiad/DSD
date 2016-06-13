-- Function: gpSelect_Movement_ProductionUnion()

DROP FUNCTION IF EXISTS gpSelect_Movement_ProductionUnion (TDateTime, TDateTime, Boolean, TVarChar);
DROP FUNCTION IF EXISTS gpSelect_Movement_ProductionUnion (TDateTime, TDateTime, Boolean, Integer, TVarChar);
DROP FUNCTION IF EXISTS gpSelect_Movement_ProductionUnion (TDateTime, TDateTime, Boolean, Boolean, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Movement_ProductionUnion(
    IN inStartDate      TDateTime,
    IN inEndDate        TDateTime,
    IN inIsErased       Boolean  ,
    IN inIsPeresort     Boolean  ,     -- ��������
    IN inSession        TVarChar       -- ������ ������������
)
RETURNS TABLE (Id Integer, InvNumber TVarChar, OperDate TDateTime, StatusCode Integer, StatusName TVarChar
             , TotalCount TFloat, TotalCountChild TFloat
             , FromId Integer, FromName TVarChar, ToId Integer, ToName TVarChar
             , DocumentKindId Integer, DocumentKindName TVarChar
             , isAuto Boolean, InsertDate TDateTime
              )
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_Select_Movement_ProductionUnion());
   vbUserId:= lpGetUserBySession (inSession);

   -- ���������
   RETURN QUERY
     WITH tmpStatus AS (SELECT zc_Enum_Status_Complete()   AS StatusId
                  UNION SELECT zc_Enum_Status_UnComplete() AS StatusId
                  UNION SELECT zc_Enum_Status_Erased()     AS StatusId WHERE inIsErased = TRUE
                       )
        , tmpRoleAccessKey_all AS (SELECT AccessKeyId, UserId FROM Object_RoleAccessKey_View)
        , tmpRoleAccessKey_user AS (SELECT AccessKeyId FROM tmpRoleAccessKey_all WHERE UserId = vbUserId GROUP BY AccessKeyId)
        , tmpAccessKey_IsDocumentAll AS (SELECT 1 AS Id FROM ObjectLink_UserRole_View WHERE RoleId = zc_Enum_Role_Admin() AND UserId = vbUserId
                                   UNION SELECT 1 AS Id FROM tmpRoleAccessKey_user WHERE AccessKeyId = zc_Enum_Process_AccessKey_DocumentAll()
                                        )
        , tmpRoleAccessKey AS (SELECT tmpRoleAccessKey_user.AccessKeyId FROM tmpRoleAccessKey_user WHERE NOT EXISTS (SELECT tmpAccessKey_IsDocumentAll.Id FROM tmpAccessKey_IsDocumentAll)
                         UNION SELECT tmpRoleAccessKey_all.AccessKeyId FROM tmpRoleAccessKey_all WHERE EXISTS (SELECT tmpAccessKey_IsDocumentAll.Id FROM tmpAccessKey_IsDocumentAll) GROUP BY tmpRoleAccessKey_all.AccessKeyId
                              )
     SELECT
           Movement.Id                              AS Id
         , Movement.InvNumber                       AS InvNumber
         , Movement.OperDate                        AS OperDate
         , Object_Status.ObjectCode                 AS StatusCode
         , Object_Status.ValueData                  AS StatusName
         , MovementFloat_TotalCount.ValueData       AS TotalCount
         , MovementFloat_TotalCountChild.ValueData  AS TotalCountChild
         , Object_From.Id                           AS FromId
         , Object_From.ValueData                    AS FromName
         , Object_To.Id                             AS ToId
         , Object_To.ValueData                      AS ToName

         , Object_DocumentKind.Id                   AS DocumentKindId
         , Object_DocumentKind.ValueData            AS DocumentKindName

         , COALESCE(MovementBoolean_isAuto.ValueData, False)          AS isAuto
         , COALESCE(MovementDate_Insert.ValueData,  Null:: TDateTime) AS InsertDate
 
     FROM (SELECT Movement.id
             FROM tmpStatus
                  JOIN Movement ON Movement.OperDate BETWEEN inStartDate AND inEndDate  AND Movement.DescId = zc_Movement_ProductionUnion() AND Movement.StatusId = tmpStatus.StatusId
                  JOIN tmpRoleAccessKey ON tmpRoleAccessKey.AccessKeyId = Movement.AccessKeyId
            ) AS tmpMovement

          LEFT JOIN Movement ON Movement.id = tmpMovement.id

          LEFT JOIN Object AS Object_Status ON Object_Status.Id = Movement.StatusId

          LEFT JOIN MovementFloat AS MovementFloat_TotalCount
                                  ON MovementFloat_TotalCount.MovementId =  Movement.Id
                                 AND MovementFloat_TotalCount.DescId = zc_MovementFloat_TotalCount()

          LEFT JOIN MovementFloat AS MovementFloat_TotalCountChild
                                  ON MovementFloat_TotalCountChild.MovementId =  Movement.Id
                                 AND MovementFloat_TotalCountChild.DescId = zc_MovementFloat_TotalCountChild()

          LEFT JOIN MovementLinkObject AS MovementLinkObject_From
                                       ON MovementLinkObject_From.MovementId = Movement.Id
                                      AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
          LEFT JOIN Object AS Object_From ON Object_From.Id = MovementLinkObject_From.ObjectId

          LEFT JOIN MovementLinkObject AS MovementLinkObject_To
                                       ON MovementLinkObject_To.MovementId = Movement.Id
                                      AND MovementLinkObject_To.DescId = zc_MovementLinkObject_To()
          LEFT JOIN Object AS Object_To ON Object_To.Id = MovementLinkObject_To.ObjectId

          LEFT JOIN MovementLinkObject AS MovementLinkObject_DocumentKind
                                       ON MovementLinkObject_DocumentKind.MovementId = Movement.Id
                                      AND MovementLinkObject_DocumentKind.DescId = zc_MovementLinkObject_DocumentKind()
          LEFT JOIN Object AS Object_DocumentKind ON Object_DocumentKind.Id = MovementLinkObject_DocumentKind.ObjectId

          INNER JOIN MovementBoolean AS MovementBoolean_Peresort
                                     ON MovementBoolean_Peresort.MovementId = Movement.Id
                                    AND MovementBoolean_Peresort.DescId = zc_MovementBoolean_Peresort()
                                    AND MovementBoolean_Peresort.ValueData = inIsPeresort

          LEFT JOIN MovementBoolean AS MovementBoolean_isAuto
                                    ON MovementBoolean_isAuto.MovementId = Movement.Id
                                   AND MovementBoolean_isAuto.DescId = zc_MovementBoolean_isAuto()

          LEFT JOIN MovementDate AS MovementDate_Insert
                                 ON MovementDate_Insert.MovementId = Movement.Id
                                AND MovementDate_Insert.DescId = zc_MovementDate_Insert()
    ;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 13.06.16         * DocumentKind
 26.12.14                                        * add inIsPeresort
 26.12.14                                        * del inArticleLossId
 11.12.14         * add inArticleLossId
 03.06.14                                                        *
 16.17.13                                        * DROP FUNCTION
 15.07.13         *
 30.06.13                                        *
*/

-- ����
-- SELECT * FROM gpSelect_Movement_ProductionUnion (inStartDate:= '01.06.2014', inEndDate:= '01.07.2014', inIsErased:=true, inIsPeresort:=false, inSession:= '2')
