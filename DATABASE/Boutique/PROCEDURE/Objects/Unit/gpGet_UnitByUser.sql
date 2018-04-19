-- Function: gpGet_UnitbyUser()

DROP FUNCTION IF EXISTS gpGet_UnitbyUser (TVarChar);
DROP FUNCTION IF EXISTS gpGet_UnitbyUser (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_UnitbyUser(
    IN inUnitId        Integer,    -- ����. �������������
    IN inSession       TVarChar    -- ������ ������������
)
RETURNS TABLE(UnitId Integer, UnitName TVarChar
            , StartDate TDatetime, EndDate TDatetime    -- ��� ������ = CURRENT_DATE
              )
AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbUnitId Integer;
BEGIN

     -- �������� ���� ������������ �� ����� ���������
     -- PERFORM lpCheckRight (inSession, zc_Enum_Process_Select_Movement_Income());
     vbUserId:= lpGetUserBySession (inSession);

     vbUnitId := COALESCE ((SELECT ObjectLink_User_Unit.ChildObjectId AS UnitId
                            FROM ObjectLink AS ObjectLink_User_Unit
                            WHERE ObjectLink_User_Unit.DescId = zc_ObjectLink_User_Unit()
                              AND ObjectLink_User_Unit.ObjectId = vbUserId)
                           , 0) ::Integer;

     -- �������������� ���� ������������� �� ������� �� ��. �����.
     IF vbUnitId = 0 AND COALESCE (inUnitId, 0) <> 0 THEN
        vbUnitId:= inUnitId;
     END IF;
        
     RETURN QUERY
     SELECT Object.Id           AS UnitId
          , Object.ValueData    AS UnitName
          , CURRENT_DATE ::TDatetime AS StartDate
          , CURRENT_DATE ::TDatetime AS EndDate
     FROM Object 
     WHERE Object.Id = vbUnitId AND vbUnitId <> 0
   UNION 
     SELECT 0                        AS UnitId
          , ''           ::TVarChar  AS UnitName
          , CURRENT_DATE ::TDatetime AS StartDate
          , CURRENT_DATE ::TDatetime AS EndDate
     WHERE vbUnitId = 0
     ;

END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 19.04.18         * add inUnitId
 10.04.18         *
 14.03.18         * rename gpGet_UserUnit  - - gpGet_UnitbyUser
 19.02.18         *

*/

-- ����
-- SELECT * FROM gpGet_UnitbyUser (inSession:= zfCalc_UserAdmin())
--select * from gpGet_UnitbyUser( inUnitId:=0;inSession := '6');