-- Function: gpSelect_MovementGoodsBarCode_byUser()

DROP FUNCTION IF EXISTS gpSelect_MovementGoodsBarCode_byUser (TDateTime, TDateTime, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_MovementGoodsBarCode_byUser(
    IN inStartDate      TDateTime , --
    IN inEndDate        TDateTime , --
    IN inSession        TVarChar       -- ������ ������������
)
RETURNS TABLE (Id Integer, ItemName_Movement TVarChar, idBarCode TVarChar
             , InvNumber TVarChar, OperDate TDateTime, StatusCode Integer
             , TotalCount TFloat
             , FromName TVarChar, ItemName_from TVarChar
             , ToName TVarChar, ItemName_to TVarChar
             , Comment TVarChar
             , CheckedName   TVarChar
             , CheckedDate   TDateTime
             , Checked       Boolean
              )
AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbMemberId_user  Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId:= lpGetUserBySession (inSession);

     -- ������������ <���������� ����> - ��� ����������� ���� inReestrKindId
     vbMemberId_user:= CASE WHEN vbUserId = 5 THEN 9457 ELSE
                       (SELECT ObjectLink_User_Member.ChildObjectId
                        FROM ObjectLink AS ObjectLink_User_Member
                        WHERE ObjectLink_User_Member.DescId = zc_ObjectLink_User_Member()
                          AND ObjectLink_User_Member.ObjectId = vbUserId)
                       END
                      ;
     -- ��������
     IF COALESCE (vbMemberId_user, 0) = 0
     THEN 
         RAISE EXCEPTION '������.� ������������ <%> �� ��������� �������� <���.����>.', lfGet_Object_ValueData (vbUserId);
     END IF;


   -- ���������
   RETURN QUERY 
   WITH
     -- �������� �� ������ ��� ������ ������������
     tmpMovement AS (SELECT MovementDate_Checked.MovementId      AS Id
                          , MovementLinkObject_Checked.ObjectId  AS CheckedId
                          , MovementDate_Checked.ValueData       AS CheckedDate
                     FROM MovementDate AS MovementDate_Checked

                          INNER JOIN MovementLinkObject AS MovementLinkObject_Checked
                                                        ON MovementLinkObject_Checked.MovementId = MovementDate_Checked.MovementId
                                                       AND MovementLinkObject_Checked.DescId = zc_MovementLinkObject_Checked()
                                                       AND MovementLinkObject_Checked.ObjectId = vbMemberId_user
                          -- ����� ���� ��� ���������� ������ ����������
                     WHERE MovementDate_Checked.DescId = zc_MovementDate_Checked()
                       AND MovementDate_Checked.ValueData >= inStartDate AND MovementDate_Checked.ValueData < inEndDate + INTERVAL '1 DAY'
                     )
                     
     -- ���������
     SELECT  Movement.Id
           , MovementDesc.ItemName              AS ItemName_Movement
           , zfFormat_BarCode (zc_BarCodePref_Movement(), Movement.Id) ::TVarChar AS IdBarCode
           , Movement.InvNumber                 AS InvNumber
           , Movement.OperDate                  AS OperDate
           , Object_Status.ObjectCode           AS StatusCode
           , MovementFloat_TotalCount.ValueData AS TotalCount
           , Object_From.ValueData              AS FromName
           , ObjectDesc_from.ItemName           AS ItemName_from
           , Object_To.ValueData                AS ToName
           , ObjectDesc_to.ItemName             AS ItemName_to
           , MovementString_Comment.ValueData   AS Comment
           , Object_Checked.ValueData           AS CheckedName
           , tmpMovement.CheckedDate            AS CheckedDate
           , COALESCE (MovementBoolean_Checked.ValueData, FALSE) AS Checked
         
     FROM tmpMovement
            LEFT JOIN Movement ON Movement.Id = tmpMovement.Id
            LEFT JOIN MovementDesc ON MovementDesc.Id = Movement.DescId
            LEFT JOIN Object AS Object_Status ON Object_Status.Id = Movement.StatusId

            LEFT JOIN MovementFloat AS MovementFloat_TotalCount
                                    ON MovementFloat_TotalCount.MovementId =  Movement.Id
                                   AND MovementFloat_TotalCount.DescId = zc_MovementFloat_TotalCount()

            LEFT JOIN MovementBoolean AS MovementBoolean_Checked
                                      ON MovementBoolean_Checked.MovementId = Movement.Id
                                     AND MovementBoolean_Checked.DescId = zc_MovementBoolean_Checked()

            LEFT JOIN MovementString AS MovementString_Comment 
                                     ON MovementString_Comment.MovementId = Movement.Id
                                    AND MovementString_Comment.DescId = zc_MovementString_Comment()

            LEFT JOIN MovementDate AS MovementDate_Checked 
                                   ON MovementDate_Checked.MovementId = Movement.Id
                                  AND MovementDate_Checked.DescId = zc_MovementDate_Checked()

            LEFT JOIN MovementLinkObject AS MovementLinkObject_From
                                         ON MovementLinkObject_From.MovementId = Movement.Id
                                        AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
            LEFT JOIN Object AS Object_From ON Object_From.Id = MovementLinkObject_From.ObjectId
            LEFT JOIN ObjectDesc AS ObjectDesc_from ON ObjectDesc_from.Id = Object_From.DescId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_To
                                         ON MovementLinkObject_To.MovementId = Movement.Id
                                        AND MovementLinkObject_To.DescId = zc_MovementLinkObject_To()
            LEFT JOIN Object AS Object_To ON Object_To.Id = MovementLinkObject_To.ObjectId
            LEFT JOIN ObjectDesc AS ObjectDesc_to ON ObjectDesc_to.Id = Object_To.DescId

            LEFT JOIN Object AS Object_Checked ON Object_Checked.Id = tmpMovement.CheckedId
   ;
  
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 11.10.18         *
*/

-- ����
-- SELECT * FROM gpSelect_MovementGoodsBarCode_byUser (inStartDate := '01.10.2018', inEndDate:= '15.10.2018', inSession := '9459');