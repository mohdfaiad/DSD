-- Function: gpInsertUpdate_Object_LineFabrica (Integer, Integer, TVarChar, TVarChar)

DROP FUNCTION IF EXISTS gpInsertUpdate_Object_LineFabrica (Integer, Integer, TVarChar, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_Object_LineFabrica(
 INOUT ioId           Integer,       -- ���� ������� <LineFabrica>
    IN inCode         Integer,       -- �������� <��� LineFabrica>
    IN inName         TVarChar,      -- ������� �������� LineFabrica
    IN inSession      TVarChar       -- ������ ������������
)
  RETURNS integer
  AS
$BODY$
  DECLARE UserId Integer;
  DECLARE Code_max Integer;

BEGIN

   -- �������� ���� ������������ �� ����� ���������
   -- PERFORM lpCheckRight(inSession, zc_Enum_Process_LineFabrica());
   UserId := inSession;

   -- �������� ����� ���
   IF ioId <> 0 AND COALESCE (inCode, 0) = 0 THEN inCode := (SELECT ObjectCode FROM Object WHERE Id = ioId); END IF;

   -- ���� ��� �� ����������, ���������� ��� ��� ���������+1
   IF COALESCE (inCode, 0) = 0
   THEN
       SELECT COALESCE( MAX (ObjectCode), 0) + 1 INTO Code_max FROM Object WHERE Object.DescId = zc_Object_LineFabrica();
   ELSE
       Code_max := inCode;
   END IF;

   -- �������� ������������ ��� �������� <������������ LineFabrica>
   PERFORM lpCheckUnique_Object_ValueData(ioId, zc_Object_LineFabrica(), inName); 
   -- �������� ������������ ��� �������� <��� LineFabrica>
   PERFORM lpCheckUnique_Object_ObjectCode (ioId, zc_Object_LineFabrica(), Code_max);


   -- ��������� <������>
   ioId := lpInsertUpdate_Object(ioId, zc_Object_LineFabrica(), Code_max, inName);

   -- ��������� ��������
   PERFORM lpInsert_ObjectProtocol (ioId, UserId);

END;
$BODY$

LANGUAGE plpgsql VOLATILE;



/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ��������� �.�.
22.02.17                                                          *
*/

-- ����
-- SELECT * FROM gpInsertUpdate_Object_LineFabrica()