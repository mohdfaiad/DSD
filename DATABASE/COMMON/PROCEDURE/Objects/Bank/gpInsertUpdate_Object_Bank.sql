-- Function: gpInsertUpdate_Object_Bank(Integer,Integer,TVarChar,TVarChar,Integer,TVarChar)

-- DROP FUNCTION gpInsertUpdate_Object_Bank(Integer,Integer,TVarChar,TVarChar,Integer,TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_Object_Bank(
 INOUT ioId	                 Integer,       -- ���� ������� < ����>
    IN inCode                Integer,       -- ��� ������� <����>
    IN inName                TVarChar,      -- �������� ������� <����>
    IN inMFO                 TVarChar,      -- ���
    IN inSWIFT               TVarChar,      -- SWIFT
    IN inIBAN                TVarChar,      -- IBAN
    IN inJuridicalId         Integer,       -- ��. ����
    IN inSession             TVarChar       -- ������ ������������
)
  RETURNS integer AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbCode_calc Integer;
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   vbUserId := lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_Object_Bank());

   -- ���� ��� �� ����������, ���������� ��� ��� ���������+1
   vbCode_calc:=lfGet_ObjectCode (inCode, zc_Object_Bank());

   -- �������� ���� ������������ ��� �������� <������������ �����>
   PERFORM lpCheckUnique_Object_ValueData (ioId, zc_Object_Bank(), inName);
   -- �������� ���� ������������ ��� �������� <��� �����>
   PERFORM lpCheckUnique_Object_ObjectCode (ioId, zc_Object_Bank(), vbCode_calc);
   -- �������� ���� ������������ ��� �������� <���>
   PERFORM lpCheckUnique_ObjectString_ValueData (ioId, zc_ObjectString_Bank_MFO(), inMFO);
   -- �������� ���� ������������ ��� �������� <SWIFT>
   PERFORM lpCheckUnique_ObjectString_ValueData (ioId, zc_ObjectString_Bank_SWIFT(), inSWIFT);
   -- �������� ���� ������������ ��� �������� <IBAN>
   PERFORM lpCheckUnique_ObjectString_ValueData (ioId, zc_ObjectString_Bank_IBAN(), inIBAN);

   -- ��������� <������>
   ioId := lpInsertUpdate_Object (ioId, zc_Object_Bank(), vbCode_calc, inName);

   PERFORM lpInsertUpdate_ObjectString (zc_ObjectString_Bank_MFO(), ioId, inMFO);
   PERFORM lpInsertUpdate_ObjectString (zc_ObjectString_Bank_SWIFT(), ioId, inSWIFT);
   PERFORM lpInsertUpdate_ObjectString (zc_ObjectString_Bank_IBAN(), ioId, inIBAN);

   PERFORM lpInsertUpdate_ObjectLink (zc_ObjectLink_Bank_Juridical(), ioId, inJuridicalId);

   -- ��������� ��������
   PERFORM lpInsert_ObjectProtocol (ioId, vbUserId);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpInsertUpdate_Object_Bank (Integer,Integer,TVarChar,TVarChar,Integer,TVarChar) OWNER TO postgres;


/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 10.10.14                                                       *
 08.05.14                                        * add lpCheckRight
 04.07.13          * vbCode_calc
 10.06.13          *
 05.06.13
*/

-- ����
-- SELECT * FROM gpInsertUpdate_Object_Bank ()
                            