-- Function: gpSelectMobile_MovementItem_Task()

DROP FUNCTION IF EXISTS gpSelectMobile_MovementItem_Task (TDateTime, TVarChar);

CREATE OR REPLACE FUNCTION gpSelectMobile_MovementItem_Task(
    IN inSyncDateIn TDateTime, -- ����/����� ��������� ������������� - ����� "�������" ����������� �������� ���������� - ���������� �����������, ����, �����, �����, ������� � �.�
    IN inSession    TVarChar   -- ������ ������������
)
RETURNS TABLE (Id          Integer   -- ���������� �������������, ����������� � ������� ��, � ������������ ��� �������������
             , MovementId  Integer   -- ���������� ������������� ���������
             , PartnerId   Integer   -- �����������
             , Closed      Boolean   -- ��������� (��/���)
             , Description TVarChar  -- �������� �������
             , Comment     TVarChar  -- ���������� ��������� ��������, ����� ����������/�� ���������� �������
             , isSync      Boolean   
              )

AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbMemberId Integer;
BEGIN
      -- �������� ���� ������������ �� ����� ���������
      -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_...());
      vbUserId:= lpGetUserBySession (inSession);

      vbMemberId:= (SELECT tmpConst.MemberId FROM gpGetMobile_Object_Const (inSession) AS tmpConst);

      -- ���������
      IF vbMemberId IS NOT NULL 
      THEN
           RETURN QUERY
             SELECT MI_Task.Id
                  , MI_Task.MovementId
                  , COALESCE (MI_Task.ObjectId, 0)::Integer                 AS PartnerId
                  , COALESCE (MIBoolean_Close.ValueData, false)             AS Closed
                  , COALESCE (MIString_Description.ValueData, '')::TVarChar AS Description
                  , COALESCE (MIString_Comment.ValueData, '')::TVarChar     AS Comment
                  , true                                                    AS isSync
             FROM Movement AS Movement_Task
                  JOIN MovementLinkObject AS MovementLinkObject_PersonalTrade
                                          ON MovementLinkObject_PersonalTrade.MovementId = Movement_Task.Id
                                         AND MovementLinkObject_PersonalTrade.DescId = zc_MovementLinkObject_PersonalTrade()
                                         AND MovementLinkObject_PersonalTrade.ObjectId = vbMemberId
                  JOIN MovementItem AS MI_Task
                                    ON MI_Task.MovementId = Movement_Task.Id
                                   AND MI_Task.DescId = zc_MI_Master()
                                   AND MI_Task.isErased = false
                  LEFT JOIN MovementItemBoolean AS MIBoolean_Close
                                                ON MIBoolean_Close.MovementItemId = MI_Task.Id
                                               AND MIBoolean_Close.DescId = zc_MIBoolean_Close()
                  LEFT JOIN MovementItemString AS MIString_Description
                                               ON MIString_Description.MovementItemId = MI_Task.Id
                                              AND MIString_Description.DescId = zc_MIString_Description()
                  LEFT JOIN MovementItemString AS MIString_Comment
                                               ON MIString_Comment.MovementItemId = MI_Task.Id
                                              AND MIString_Comment.DescId = zc_MIString_Comment()
             WHERE Movement_Task.DescId = zc_Movement_Task()
               AND Movement_Task.StatusId = zc_Enum_Status_Complete()
               AND COALESCE (MIBoolean_Close.ValueData, false) = false;
      END IF;
END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ��������� �.�.   �������� �.�.
 30.03.17                                                                          *
*/

-- SELECT * FROM gpSelectMobile_MovementItem_Task (inSyncDateIn:= zc_DateStart(), inSession:= zfCalc_UserAdmin())
