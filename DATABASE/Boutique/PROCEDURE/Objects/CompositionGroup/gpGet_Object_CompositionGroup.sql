﻿-- Function: gpGet_Object_CompositionGroup()

DROP FUNCTION IF EXISTS gpGet_Object_CompositionGroup (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_Object_CompositionGroup(
    IN inId          Integer,       -- 
    IN inSession     TVarChar       -- сессия пользователя
)
RETURNS TABLE (Id Integer, Code Integer, Name TVarChar) 
  AS
$BODY$
BEGIN

  -- проверка прав пользователя на вызов процедуры
  -- PERFORM lpCheckRight(inSession, zc_Enum_Process_CompositionGroup());

  IF COALESCE (inId, 0) = 0
   THEN
       RETURN QUERY
       SELECT
             CAST (0 as Integer)    AS Id
           , COALESCE(MAX (Object.ObjectCode), 0) + 1 AS Code
           , CAST ('' as TVarChar)  AS Name
       FROM Object
       WHERE Object.DescId = zc_Object_CompositionGroup();
   ELSE
       RETURN QUERY
       SELECT
             Object.Id         AS Id
           , Object.ObjectCode AS Code
           , Object.ValueData  AS Name
       FROM Object
        
       WHERE Object.Id = inId;
   END IF;

END;
$BODY$

  LANGUAGE plpgsql VOLATILE;


/*-------------------------------------------------------------------------------*/
/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Фелонюк И.В.   Кухтин И.В.   Климентьев К.И.   Манько Д.А.

*/

-- тест
-- SELECT * FROM gpSelect_CompositionGroup('2')