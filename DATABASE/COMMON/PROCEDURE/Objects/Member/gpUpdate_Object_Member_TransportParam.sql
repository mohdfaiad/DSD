-- Function: gpUpdate_Object_Member_TransportParam()

DROP FUNCTION IF EXISTS gpUpdate_Object_Member_TransportParam  ( Integer, TDateTime, TDateTime, Tfloat, Tfloat, Tfloat, Tfloat, Tfloat, TVarChar);
DROP FUNCTION IF EXISTS gpUpdate_Object_Member_TransportParam  ( Integer, Boolean, TDateTime, TDateTime, Tfloat, Tfloat, Tfloat, Tfloat, Tfloat, TVarChar);


CREATE OR REPLACE FUNCTION gpUpdate_Object_Member_TransportParam(
    IN inId                  Integer   ,    -- ���� �������
    IN inisDate              Boolean   ,    -- �������� ���� ��� �����
    IN inStartSummerDate     TDateTime ,    -- ��������� ���� ��� ����� ���� ����
    IN inEndSummerDate       TDateTime ,    -- �������� ���� ��� ����� ���� ����
    IN inSummerFuel          Tfloat    ,    -- ����� ���� ����� ����
    IN inWinterFuel          Tfloat    ,    -- ����� ���� ����� ����
    IN inReparation          Tfloat    ,    -- ����������� �� 1 ��., ���.
    IN inLimit               Tfloat    ,    -- ����� ���
    IN inLimitFuel           Tfloat    ,    -- ����� �����
    IN inSession             TVarChar    -- ������ ������������
)
RETURNS VOID AS
$BODY$
   DECLARE vbUserId Integer;
   
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId := lpCheckRight (inSession, zc_Enum_Process_Update_Object_Member_Transport());

   
     -- ��������� �������� <>

     IF inisDate = True
     THEN
         PERFORM lpInsertUpdate_ObjectDate( zc_ObjectDate_Member_StartSummer(), inId, inStartSummerDate);
         PERFORM lpInsertUpdate_ObjectDate( zc_ObjectDate_Member_EndSummer(), inId, inEndSummerDate); 
     END IF;

     
    IF inisDate = False
    THEN 
	IF COALESCE (inSummerFuel, 0) <> 0 
	THEN
	    PERFORM lpInsertUpdate_ObjectFloat( zc_ObjectFloat_Member_Summer(), inId, inSummerFuel);
	END IF;
     
	IF COALESCE (inWinterFuel, 0) <> 0 
	THEN
	    PERFORM lpInsertUpdate_ObjectFloat( zc_ObjectFloat_Member_Winter(), inId, inWinterFuel);
        END IF;

        IF COALESCE (inReparation, 0) <> 0 
        THEN
            PERFORM lpInsertUpdate_ObjectFloat( zc_ObjectFloat_Member_Reparation(), inId, inReparation);
        END IF;

        IF COALESCE (inLimit, 0) <> 0 
        THEN
            PERFORM lpInsertUpdate_ObjectFloat( zc_ObjectFloat_Member_Limit(), inId, inLimit);
        END IF;

        IF COALESCE (inLimitFuel, 0) <> 0 
        THEN
            PERFORM lpInsertUpdate_ObjectFloat( zc_ObjectFloat_Member_LimitFuel(), inId, inLimitFuel);
        END IF;
     
    END IF;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
  14.01.16        *
*/
 
