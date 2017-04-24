-- Function: gpInsertUpdate_Object_Composition (Integer,Integer,TVarChar,Integer,TVarChar)

DROP FUNCTION IF EXISTS gpInsertUpdate_Object_Composition (Integer,Integer,TVarChar,Integer,TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_Object_Composition(
 INOUT ioId                       Integer   ,    -- ���� ������� <������ ������> 
    IN inCode                     Integer   ,    -- ��� ������� <������ ������>
    IN inName                     TVarChar  ,    -- �������� ������� <������ ������>
    IN inCompositionGroupId       Integer   ,    -- ���� ������� <������ ��� ������� ������> 
    IN inSession                  TVarChar       -- ������ ������������
)
RETURNS Integer
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   --vbUserId := lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_Object_Composition());
   vbUserId:= lpGetUserBySession (inSession);


   -- !!!��������!!! - �������� ����� Id  ��� �������� �� Sybase - !!!�� ���� � Sybase ��� ������������ - ���� ������!!!
   IF COALESCE (ioId, 0) = 0
   THEN ioId := (SELECT Id FROM Object WHERE Valuedata = inName AND DescId = zc_Object_Composition());
        -- �������� ����� ���
        inCode := (SELECT ObjectCode FROM Object WHERE Id = ioId);
   END IF;
   -- !!!��������!!! - ��� �������� �� Sybase �.�. ��� ��� = 0 
   IF COALESCE (inCode, 0) = 0 THEN  inCode := NEXTVAL ('Object_Composition_seq'); END IF; 

   
   -- �������� - �������� ������ ���� �����������
   -- IF COALESCE (inCompositionGroupId, 0) = 0 THEN
   --    RAISE EXCEPTION '������.�� ����������� �������� <������ ��� ������� ������>.';
   -- END IF;

   -- �������� ������������ �������� <���>
   PERFORM lpCheckUnique_Object_ObjectCode (ioId, zc_Object_Composition(), inCode);
   -- �������� ������������ �������� <��������> ��� !!!�����!! <������ ��� ������� ������>
   IF TRIM (inName) <> '' AND COALESCE (inCompositionGroupId, 0) <> 0 
   THEN
       IF EXISTS (SELECT 1
                  FROM Object
                       LEFT JOIN ObjectLink AS ObjectLink_Composition_CompositionGroup
                                            ON ObjectLink_Composition_CompositionGroup.ObjectId = Object.Id
                                           AND ObjectLink_Composition_CompositionGroup.DescId   = zc_ObjectLink_Composition_CompositionGroup()
                  WHERE Object.Descid           = zc_Object_Composition()
                    AND TRIM (Object.ValueData) = TRIM (inName)
                    AND Object.Id               <> COALESCE (ioId, 0)
                    AND COALESCE (ObjectLink_Composition_CompositionGroup.ChildObjectId, 0) = COALESCE (inCompositionGroupId, 0)
                 )
       THEN
           RAISE EXCEPTION '������. ������ ������ <%> � ������ <%> ��� ����������.', TRIM (inName), lfGet_Object_ValueData (inCompositionGroupId);
       END IF;
   END IF;


   -- ��������� <������>
   ioId := lpInsertUpdate_Object (ioId, zc_Object_Composition(), inCode, inName);

   -- ��������� ����� � <������ ��� ������� ������>
   PERFORM lpInsertUpdate_ObjectLink(zc_ObjectLink_Composition_CompositionGroup(), ioId, inCompositionGroupId);

   -- ��������� ��������
   PERFORM lpInsert_ObjectProtocol (ioId, vbUserId);
   
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.    ��������� �.�.
06.03.17                                                           *
20.02.17                                                           *
*/

-- ����
-- SELECT * FROM gpInsertUpdate_Object_Composition()
