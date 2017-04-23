-- Function: gpSelect_Movement_Task()

DROP FUNCTION IF EXISTS gpSelect_Movement_Task (TDateTime, TDateTime, Boolean, Integer, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Movement_Task(
    IN inStartDate          TDateTime , --
    IN inEndDate            TDateTime , --
    IN inIsErased           Boolean   ,
    IN inJuridicalBasisId   Integer   ,
    IN inMemberId           Integer   ,
    IN inSession            TVarChar    -- ������ ������������
)
RETURNS TABLE (Id Integer, InvNumber TVarChar, OperDate TDateTime
             , StatusCode Integer, StatusName TVarChar
             , BranchCode Integer, BranchName TVarChar
             , UnitCode Integer, UnitName TVarChar
             , PositionCode Integer, PositionName TVarChar
             , PersonalTradeId Integer, PersonalTradeCode Integer, PersonalTradeName TVarChar
             , InsertId Integer, InsertCode Integer, InsertName TVarChar
             , InsertDate TDateTime

             , PartnerId Integer, PartnerCode Integer, PartnerName TVarChar
             , Description TVarChar
             , Comment TVarChar
             , UpdateMobileDate TDateTime
             , UpdateDate TDateTime
             , isClose Boolean
              )
AS
$BODY$
   DECLARE vbUserId          Integer;

   DECLARE vbIsProjectMobile Boolean;
   DECLARE vbUserId_Member   Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_Select_Movement_Task());
     vbUserId:= lpGetUserBySession (inSession);


     -- ������ ��� ������������ ��� ������������ inSession - �������� ����� - �.�. � ���� ���� ��� �������, ����� ����� ��� ����� ������� ���� ���� � �����������
     vbIsProjectMobile:= (SELECT ObjectBoolean.ValueData FROM ObjectBoolean WHERE ObjectBoolean.ObjectId = vbUserId AND ObjectBoolean.DescId = zc_ObjectBoolean_User_ProjectMobile());

     IF inMemberId > 0
     THEN
         -- ������������ ��� <���������� ����> - ��� UserId
         vbUserId_Member:= (SELECT OL.ObjectId FROM ObjectLink AS OL WHERE OL.DescId = zc_ObjectLink_User_Member() AND OL.ChildObjectId = inMemberId);
         -- ��������
         IF COALESCE (vbUserId_Member, 0) = 0
         THEN
             RAISE EXCEPTION '������.��� ��� <%> �� ��������� �������� <������������>.', lfGet_Object_ValueData (inMemberId);
         END IF;

     ELSEIF vbIsProjectMobile = TRUE
     THEN
         -- � ���� ������ - ����� ������ ����
         vbUserId_Member:= vbUserId;
         -- !!!������ ��������!!! - ������������ ��� UserId - ��� <���������� ����>
         inMemberId:= (SELECT OL.ChildObjectId FROM ObjectLink AS OL WHERE OL.DescId = zc_ObjectLink_User_Member() AND OL.ObjectId = vbUserId);
         -- ��������
         IF COALESCE (inMemberId, 0) = 0
         THEN
             RAISE EXCEPTION '������.��� ������������ <%> �� ��������� �������� <���.����>.', lfGet_Object_ValueData (vbUserId);
         END IF;
     ELSE
         -- � ���� ������ - ����� ���
         vbUserId_Member:= 0;
         -- !!!������ ��������!!!
         inMemberId:= 0;
     END IF;


     -- �������� - �������� ����� ����� ������ ����
     IF vbIsProjectMobile = TRUE AND vbUserId_Member <> vbUserId
     THEN
         RAISE EXCEPTION '������.�� ���������� ���� �������.';
     END IF;


     -- ���������
     RETURN QUERY
        WITH tmpStatus AS (SELECT zc_Enum_Status_Complete()   AS StatusId
                     UNION SELECT zc_Enum_Status_UnComplete() AS StatusId
                     UNION SELECT zc_Enum_Status_Erased()     AS StatusId WHERE inIsErased = TRUE
                          )
         , tmpPersonal AS (SELECT lfSelect.MemberId
                                , lfSelect.PersonalId
                                , lfSelect.UnitId
                                , lfSelect.PositionId
                                , lfSelect.BranchId
                           FROM lfSelect_Object_Member_findPersonal (inSession) AS lfSelect
                           WHERE lfSelect.Ord = 1
                          )
        -- ���������
        SELECT
             Movement.Id                               AS Id
           , Movement.InvNumber                        AS InvNumber
           , Movement.OperDate                         AS OperDate
           , Object_Status.ObjectCode                  AS StatusCode
           , Object_Status.ValueData                   AS StatusName
           , Object_Branch.ObjectCode                  AS BranchCode
           , Object_Branch.ValueData                   AS BranchName
           , Object_Unit.ObjectCode                    AS UnitCode
           , Object_Unit.ValueData                     AS UnitName
           , Object_Position.ObjectCode                AS PositionCode
           , Object_Position.ValueData                 AS PositionName
           , Object_PersonalTrade.Id                   AS PersonalTradeId
           , Object_PersonalTrade.ObjectCode           AS PersonalTradeCode
           , Object_PersonalTrade.ValueData            AS PersonalTradeName
           , Object_Insert.Id                          AS InsertId
           , Object_Insert.ObjectCode                  AS InsertCode
           , Object_Insert.ValueData                   AS InsertName
           , MovementDate_Insert.ValueData             AS InsertDate
           --
           , Object_Partner.Id                         AS PartnerId
           , Object_Partner.ObjectCode                 AS PartnerCode
           , Object_Partner.ValueData                  AS PartnerName
           , MIString_Description.ValueData            AS Description
           , MIString_Comment.ValueData                AS Comment
           , MIDate_UpdateMobile.ValueData             AS UpdateMobileDate
           , MIDate_Update.ValueData                   AS UpdateDate
           , COALESCE (MIBoolean_Close.ValueData, false)::Boolean AS isClose
           
        FROM tmpStatus
             INNER JOIN Movement ON Movement.OperDate BETWEEN inStartDate AND inEndDate
                                AND Movement.DescId = zc_Movement_Task()
                                AND Movement.StatusId = tmpStatus.StatusId
             LEFT JOIN Object AS Object_Status ON Object_Status.Id = Movement.StatusId

             LEFT JOIN MovementBoolean AS MovementBoolean_Closed
                                       ON MovementBoolean_Closed.MovementId = Movement.Id
                                      AND MovementBoolean_Closed.DescId = zc_MovementBoolean_Closed()

             LEFT JOIN MovementDate AS MovementDate_Insert
                                    ON MovementDate_Insert.MovementId = Movement.Id
                                   AND MovementDate_Insert.DescId = zc_MovementDate_Insert()

             LEFT JOIN MovementLinkObject AS MovementLinkObject_PersonalTrade
                                          ON MovementLinkObject_PersonalTrade.MovementId = Movement.Id
                                         AND MovementLinkObject_PersonalTrade.DescId = zc_MovementLinkObject_PersonalTrade()
             LEFT JOIN Object AS Object_PersonalTrade ON Object_PersonalTrade.Id = MovementLinkObject_PersonalTrade.ObjectId
             LEFT JOIN tmpPersonal ON tmpPersonal.MemberId = Object_PersonalTrade.Id

             LEFT JOIN Object AS Object_Branch   ON Object_Branch.Id   = tmpPersonal.BranchId
             LEFT JOIN Object AS Object_Unit     ON Object_Unit.Id     = tmpPersonal.UnitId
             LEFT JOIN Object AS Object_Position ON Object_Position.Id = tmpPersonal.PositionId

             LEFT JOIN MovementLinkObject AS MovementLinkObject_Insert
                                          ON MovementLinkObject_Insert.MovementId = Movement.Id
                                         AND MovementLinkObject_Insert.DescId = zc_MovementLinkObject_Insert()
             LEFT JOIN Object AS Object_Insert ON Object_Insert.Id = MovementLinkObject_Insert.ObjectId

            -- �������� �����
            INNER JOIN MovementItem ON MovementItem.MovementId = Movement.Id
                                   AND MovementItem.DescId     = zc_MI_Master()
                                   AND MovementItem.isErased   = FALSE
            LEFT JOIN Object AS Object_Partner ON Object_Partner.Id = MovementItem.ObjectId
           
            LEFT JOIN MovementItemDate AS MIDate_UpdateMobile
                                       ON MIDate_UpdateMobile.MovementItemId = MovementItem.Id
                                      AND MIDate_UpdateMobile.DescId = zc_MIDate_UpdateMobile()
            LEFT JOIN MovementItemDate AS MIDate_Update
                                       ON MIDate_Update.MovementItemId = MovementItem.Id
                                      AND MIDate_Update.DescId = zc_MIDate_Update()

            LEFT JOIN MovementItemString AS MIString_Description
                                         ON MIString_Description.MovementItemId = MovementItem.Id
                                        AND MIString_Description.DescId = zc_MIString_Description()

            LEFT JOIN MovementItemString AS MIString_Comment
                                         ON MIString_Comment.MovementItemId = MovementItem.Id
                                        AND MIString_Comment.DescId = zc_MIString_Comment()

            LEFT JOIN MovementItemBoolean AS MIBoolean_Close
                                          ON MIBoolean_Close.MovementItemId = MovementItem.Id
                                         AND MIBoolean_Close.DescId = zc_MIBoolean_Close()

        WHERE MovementLinkObject_PersonalTrade.ObjectId = inMemberId
           OR vbUserId_Member = 0
     ;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 24.03.17         *
*/

-- ����
-- SELECT * FROM gpSelect_Movement_Task (inStartDate:= '01.01.2017', inEndDate:= CURRENT_DATE, inIsErased:= TRUE, inJuridicalBasisId:= 0, inMemberId:= 0, inSession:= zfCalc_UserAdmin())
