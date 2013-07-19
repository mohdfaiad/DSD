-- Function: gpSelect_Object_Unit_Tree()

-- DROP FUNCTION gpSelect_Object_Unit_Tree(TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Object_Unit_Tree(
    IN inSession     TVarChar       -- ������ ������������
)
RETURNS TABLE (Id Integer, Code Integer, Name TVarChar, 
               ParentId Integer, isErased boolean) AS
$BODY$
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   -- PERFORM lpCheckRight(inSession, zc_Enum_Process_Select_Object_Unit());

   RETURN QUERY 
       SELECT 
             Object_Unit.Id         AS Id
           , Object_Unit.ObjectCode AS Code
           , Object_Unit.ValueData  AS Name
           , COALESCE(ObjectLink_Unit_Parent.ChildObjectId, 0) AS ParentId
           , Object_Unit.isErased AS isErased
       FROM Object AS Object_Unit
           LEFT JOIN ObjectLink AS ObjectLink_Unit_Parent
                                ON ObjectLink_Unit_Parent.ObjectId = Object_Unit.Id
                               AND ObjectLink_Unit_Parent.DescId = zc_ObjectLink_Unit_Parent()
       WHERE Object_Unit.DescId = zc_Object_Unit()
       UNION SELECT
             0 AS Id,
             0 AS Code,
             CAST('���' AS TVarChar) AS Name,
             NULL AS ParentId,
             false AS isErased;
  
END;
$BODY$

LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpSelect_Object_Unit(TVarChar) OWNER TO postgres;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 04.07.13          * ���������� ����� �����������              
 03.06.13          

*/

-- ����
-- SELECT * FROM gpSelect_Object_Unit ('2')