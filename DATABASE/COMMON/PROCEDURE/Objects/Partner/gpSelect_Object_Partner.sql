-- Function: gpSelect_Object_Partner()

DROP FUNCTION IF EXISTS gpSelect_Object_Partner (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Object_Partner(
    IN inJuridicalId       Integer  , 
    IN inSession           TVarChar   -- ������ ������������
)
RETURNS TABLE (Id Integer, Code Integer, Name TVarChar, 
               ShortName TVarChar, GLNCode TVarChar,
               Address TVarChar, HouseNumber TVarChar, CaseNumber TVarChar, RoomNumber TVarChar,
               StreetId Integer, StreetName TVarChar,
               PrepareDayCount TFloat, DocumentDayCount TFloat,
               JuridicalId Integer, JuridicalCode Integer, JuridicalName TVarChar, JuridicalGroupName TVarChar, 
               RouteId Integer, RouteCode Integer, RouteName TVarChar,
               RouteSortingId Integer, RouteSortingCode Integer, RouteSortingName TVarChar,
               PersonalTakeId Integer, PersonalTakeCode Integer, PersonalTakeName TVarChar,
               OKPO TVarChar,
               PriceListId Integer, PriceListName TVarChar, 
               PriceListPromoId Integer, PriceListPromoName TVarChar,
               StartPromo TDateTime, EndPromo TDateTime,
               isErased Boolean
              )
AS
$BODY$
   DECLARE vbUserId Integer;

   DECLARE vbIsConstraint Boolean;
   DECLARE vbObjectId_Constraint Integer;
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   -- vbUserId:= lpCheckRight(inSession, zc_Enum_Process_Select_Object_Partner());
   vbUserId:= lpGetUserBySession (inSession);


   -- ������������ ������� �������
   vbObjectId_Constraint:= (SELECT Object_RoleAccessKeyGuide_View.JuridicalGroupId FROM Object_RoleAccessKeyGuide_View WHERE Object_RoleAccessKeyGuide_View.UserId = vbUserId AND Object_RoleAccessKeyGuide_View.JuridicalGroupId <> 0);
   vbIsConstraint:= COALESCE (vbObjectId_Constraint, 0) > 0;


   -- ���������
   RETURN QUERY 
     SELECT 
           Object_Partner.Id               AS Id
         , Object_Partner.ObjectCode       AS Code
         , Object_Partner.ValueData        AS Name

         , ObjectString_ShortName.ValueData   AS ShortName
         , ObjectString_GLNCode.ValueData     AS GLNCode
        
         , ObjectString_Address.ValueData     AS Address
         , ObjectString_HouseNumber.ValueData AS HouseNumber
         , ObjectString_CaseNumber.ValueData  AS CaseNumber
         , ObjectString_RoomNumber.ValueData  AS RoomNumber

         , Object_Street.Id                   AS StreetId 
         , Object_Street.ValueData            AS StreetName 
       
         , Partner_PrepareDayCount.ValueData  AS PrepareDayCount
         , Partner_DocumentDayCount.ValueData AS DocumentDayCount

         , Object_Juridical.Id             AS JuridicalId
         , Object_Juridical.ObjectCode     AS JuridicalCode
         , Object_Juridical.ValueData      AS JuridicalName
         , Object_JuridicalGroup.ValueData AS JuridicalGroupName
         
         , Object_Route.Id           AS RouteId
         , Object_Route.ObjectCode   AS RouteCode
         , Object_Route.ValueData    AS RouteName

         , Object_RouteSorting.Id           AS RouteSortingId
         , Object_RouteSorting.ObjectCode   AS RouteSortingCode
         , Object_RouteSorting.ValueData    AS RouteSortingName
         
         , View_PersonalTake.PersonalId   AS PersonalTakeId
         , View_PersonalTake.PersonalCode AS PersonalTakeCode
         , View_PersonalTake.PersonalName AS PersonalTakeName
                  
         , ObjectHistory_JuridicalDetails_View.OKPO

         , Object_PriceList.Id         AS PriceListId 
         , Object_PriceList.ValueData  AS PriceListName 

         , Object_PriceListPromo.Id         AS PriceListPromoId 
         , Object_PriceListPromo.ValueData  AS PriceListPromoName 
       
         , ObjectDate_StartPromo.ValueData AS StartPromo
         , ObjectDate_EndPromo.ValueData   AS EndPromo 
       
         , Object_Partner.isErased   AS isErased
         
     FROM Object AS Object_Partner
         LEFT JOIN ObjectString AS ObjectString_GLNCode 
                                ON ObjectString_GLNCode.ObjectId = Object_Partner.Id 
                               AND ObjectString_GLNCode.DescId = zc_ObjectString_Partner_GLNCode()
         LEFT JOIN ObjectString AS ObjectString_Address
                                ON ObjectString_Address.ObjectId = Object_Partner.Id
                               AND ObjectString_Address.DescId = zc_ObjectString_Partner_Address()

         LEFT JOIN ObjectString AS ObjectString_HouseNumber
                                ON ObjectString_HouseNumber.ObjectId = Object_Partner.Id
                               AND ObjectString_HouseNumber.DescId = zc_ObjectString_Partner_HouseNumber()

         LEFT JOIN ObjectString AS ObjectString_ShortName
                                ON ObjectString_ShortName.ObjectId = Object_Partner.Id
                               AND ObjectString_ShortName.DescId = zc_ObjectString_Partner_ShortName()

         LEFT JOIN ObjectString AS ObjectString_CaseNumber
                                ON ObjectString_CaseNumber.ObjectId = Object_Partner.Id
                               AND ObjectString_CaseNumber.DescId = zc_ObjectString_Partner_CaseNumber()

         LEFT JOIN ObjectString AS ObjectString_RoomNumber
                                ON ObjectString_RoomNumber.ObjectId = Object_Partner.Id
                               AND ObjectString_RoomNumber.DescId = zc_ObjectString_Partner_RoomNumber()

         LEFT JOIN ObjectFloat AS Partner_PrepareDayCount 
                               ON Partner_PrepareDayCount.ObjectId = Object_Partner.Id
                              AND Partner_PrepareDayCount.DescId = zc_ObjectFloat_Partner_PrepareDayCount()  
        
         LEFT JOIN ObjectFloat AS Partner_DocumentDayCount 
                               ON Partner_DocumentDayCount.ObjectId = Object_Partner.Id
                              AND Partner_DocumentDayCount.DescId = zc_ObjectFloat_Partner_DocumentDayCount()                                                              

         LEFT JOIN ObjectDate AS ObjectDate_StartPromo
                              ON ObjectDate_StartPromo.ObjectId = Object_Partner.Id
                             AND ObjectDate_StartPromo.DescId = zc_ObjectDate_Partner_StartPromo()

         LEFT JOIN ObjectDate AS ObjectDate_EndPromo
                              ON ObjectDate_EndPromo.ObjectId = Object_Partner.Id
                             AND ObjectDate_EndPromo.DescId = zc_ObjectDate_Partner_EndPromo()

         LEFT JOIN ObjectLink AS ObjectLink_Partner_Street
                              ON ObjectLink_Partner_Street.ObjectId = Object_Partner.Id 
                             AND ObjectLink_Partner_Street.DescId = zc_ObjectLink_Partner_Street()
         LEFT JOIN Object AS Object_Street ON Object_Street.Id = ObjectLink_Partner_Street.ChildObjectId

         LEFT JOIN ObjectLink AS ObjectLink_Partner_Juridical
                              ON ObjectLink_Partner_Juridical.ObjectId = Object_Partner.Id 
                             AND ObjectLink_Partner_Juridical.DescId = zc_ObjectLink_Partner_Juridical()
         LEFT JOIN Object AS Object_Juridical ON Object_Juridical.Id = ObjectLink_Partner_Juridical.ChildObjectId
         
        LEFT JOIN ObjectLink AS ObjectLink_Juridical_JuridicalGroup
                             ON ObjectLink_Juridical_JuridicalGroup.ObjectId = Object_Juridical.Id
                            AND ObjectLink_Juridical_JuridicalGroup.DescId = zc_ObjectLink_Juridical_JuridicalGroup()
        LEFT JOIN Object AS Object_JuridicalGroup ON Object_JuridicalGroup.Id = ObjectLink_Juridical_JuridicalGroup.ChildObjectId

         LEFT JOIN ObjectLink AS ObjectLink_Partner_Route
                              ON ObjectLink_Partner_Route.ObjectId = Object_Partner.Id 
                             AND ObjectLink_Partner_Route.DescId = zc_ObjectLink_Partner_Route()
         LEFT JOIN Object AS Object_Route ON Object_Route.Id = ObjectLink_Partner_Route.ChildObjectId
         
         LEFT JOIN ObjectLink AS ObjectLink_Partner_RouteSorting
                              ON ObjectLink_Partner_RouteSorting.ObjectId = Object_Partner.Id 
                             AND ObjectLink_Partner_RouteSorting.DescId = zc_ObjectLink_Partner_RouteSorting()
         LEFT JOIN Object AS Object_RouteSorting ON Object_RouteSorting.Id = ObjectLink_Partner_RouteSorting.ChildObjectId
         
         LEFT JOIN ObjectLink AS ObjectLink_Partner_PersonalTake
                              ON ObjectLink_Partner_PersonalTake.ObjectId = Object_Partner.Id 
                             AND ObjectLink_Partner_PersonalTake.DescId = zc_ObjectLink_Partner_PersonalTake()
         LEFT JOIN Object_Personal_View AS View_PersonalTake ON View_PersonalTake.PersonalId = ObjectLink_Partner_PersonalTake.ChildObjectId
         
         LEFT JOIN ObjectHistory_JuridicalDetails_View ON ObjectHistory_JuridicalDetails_View.JuridicalId = Object_Juridical.Id 

         LEFT JOIN ObjectLink AS ObjectLink_Partner_PriceList
                              ON ObjectLink_Partner_PriceList.ObjectId = Object_Partner.Id 
                             AND ObjectLink_Partner_PriceList.DescId = zc_ObjectLink_Partner_PriceList()
         LEFT JOIN Object AS Object_PriceList ON Object_PriceList.Id = ObjectLink_Partner_PriceList.ChildObjectId

         LEFT JOIN ObjectLink AS ObjectLink_Partner_PriceListPromo 
                              ON ObjectLink_Partner_PriceListPromo.ObjectId = Object_Partner.Id 
                             AND ObjectLink_Partner_PriceListPromo.DescId = zc_ObjectLink_Partner_PriceListPromo()
         LEFT JOIN Object AS Object_PriceListPromo ON Object_PriceListPromo.Id = ObjectLink_Partner_PriceListPromo.ChildObjectId         

    WHERE Object_Partner.DescId = zc_Object_Partner() AND (inJuridicalId = 0 OR inJuridicalId = ObjectLink_Partner_Juridical.ChildObjectId)
      AND (ObjectLink_Juridical_JuridicalGroup.ChildObjectId = vbObjectId_Constraint
           OR vbIsConstraint = FALSE)
   ;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpSelect_Object_Partner (integer, TVarChar) OWNER TO postgres;


/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 08.09.14                                        * add Object_RoleAccessKeyGuide_View
 16.08.14                                        * add JuridicalGroupName
 01.06.14         * add ShortName,
                        HouseNumber, CaseNumber, RoomNumber, Street
                        
 11.04.14                        * add inJuridicalId
 12.01.14         * add PriceList,
                        PriceListPromo,
                        StartPromo,
                        EndPromo                
 06.01.14                                        * add zc_ObjectString_Partner_Address
 12.10.13                                        * !!!������� ������� ���� �� ������!!!
 30.09.13                                        * add Object_Personal_View
 29.07.13         *  + PersonalTakeId, PrepareDayCount, DocumentDayCount                      
 03.07.13         *  + Route,RouteSorting
*/

-- ����
-- SELECT * FROM gpSelect_Object_Partner ('2')