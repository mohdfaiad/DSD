-- ��������� �������
DO $$
BEGIN

   -- ��� ���� ���� ��� �������, �� Enum, �� �����
   IF NOT EXISTS (SELECT * FROM Object where DescId = zc_Object_RateFuelKind())
   THEN
       PERFORM lpInsertUpdate_Object (0, zc_Object_RateFuelKind(), 1, '����');
   END IF;

   -- ��������� ����
   PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_Role_Admin(), inDescId:= zc_Object_Role(), inCode:= lfGet_ObjectCode_byEnum ('zc_Enum_Role_Admin'), inName:= '���� ��������������', inEnumName:= 'zc_Enum_Role_Admin');

   -- ��������� ����� ������
   PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_PaidKind_FirstForm(),  inDescId:= zc_Object_PaidKind(), inCode:= 1, inName:= '��', inEnumName:= 'zc_Enum_PaidKind_FirstForm');
   PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_PaidKind_SecondForm(), inDescId:= zc_Object_PaidKind(), inCode:= 2, inName:= '���', inEnumName:= 'zc_Enum_PaidKind_SecondForm');
END $$;
/*
DO $$
DECLARE ioId integer;
BEGIN
   
   IF NOT EXISTS(SELECT * FROM OBJECT 
   JOIN ObjectLink AS RoleRight_Role 
     ON RoleRight_Role.descid = zc_ObjectLink_RoleRight_Role() 
    AND RoleRight_Role.childobjectid = zc_Enum_Role_Admin()
    AND RoleRight_Role.objectid = OBJECT.id 
 
   JOIN ObjectLink AS RoleRight_Process 
     ON RoleRight_Process.descid = zc_ObjectLink_RoleRight_Process() 
    AND RoleRight_Process.childobjectid = zc_Enum_Process_InsertUpdate_Object_User()
    AND RoleRight_Process.objectid = OBJECT.id 
  WHERE OBJECT.descid = zc_Object_RoleRight()) THEN
     -- ������� ����� ���� ��������������
     ioId := lpInsertUpdate_Object(ioId, zc_Object_RoleRight(), 0, '');
     PERFORM lpInsertUpdate_ObjectLink(zc_ObjectLink_RoleRight_Role(), ioId, zc_Enum_Role_Admin());
     PERFORM lpInsertUpdate_ObjectLink(zc_ObjectLink_RoleRight_Process(), ioId, zc_Enum_Process_InsertUpdate_Object_User());
   END IF;

END $$;
*/
DO $$
DECLARE ioId integer;
DECLARE UserId integer;
BEGIN
   -- ������ �������� �������� ���������� ������ ��� �� ��������� �������� ����!!!
   SELECT Id INTO UserId FROM Object WHERE DescId = zc_Object_User() AND ValueData = '�����';

   IF COALESCE(UserId, 0) = 0 THEN
     -- ������� ��������������
     UserId := lpInsertUpdate_Object(0, zc_Object_User(), 0, '�����');

     PERFORM lpInsertUpdate_ObjectString(zc_ObjectString_User_Password(), UserId, '�����');
   END IF;

   IF NOT EXISTS(SELECT * FROM OBJECT 

     JOIN ObjectLink AS UserRole_Role 
       ON UserRole_Role.descid = zc_ObjectLink_UserRole_Role() 
      AND UserRole_Role.childobjectid = zc_Enum_Role_Admin()
      AND UserRole_Role.objectid = OBJECT.id 
 
     JOIN ObjectLink AS UserRole_User 
       ON UserRole_User.descid = zc_ObjectLink_UserRole_User() 
      AND UserRole_User.childobjectid = UserId
      AND UserRole_User.objectid = OBJECT.id 
  WHERE OBJECT.descid = zc_Object_UserRole()) THEN

     -- ��������� ������������ � �����
     ioId := lpInsertUpdate_Object(ioId, zc_Object_UserRole(), 0, '');
     
     PERFORM lpInsertUpdate_ObjectLink(zc_ObjectLink_UserRole_Role(), ioId, zc_Enum_Role_Admin());

     PERFORM lpInsertUpdate_ObjectLink(zc_ObjectLink_UserRole_User(), ioId, UserId);
   END IF;
END $$;


DO $$
BEGIN

     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_Status_UnComplete(), inDescId:= zc_Object_Status(), inCode:= zc_Enum_StatusCode_UnComplete(), inName:= '�� ��������', inEnumName:= 'zc_Enum_Status_UnComplete');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_Status_Complete(), inDescId:= zc_Object_Status(), inCode:= zc_Enum_StatusCode_Complete(), inName:= '��������', inEnumName:= 'zc_Enum_Status_Complete');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_Status_Erased(), inDescId:= zc_Object_Status(), inCode:= zc_Enum_StatusCode_Erased(), inName:= '������', inEnumName:= 'zc_Enum_Status_Erased');

     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_AccountKind_Active(), inDescId:= zc_Object_AccountKind(), inCode:= 1, inName:= '��������', inEnumName:= 'zc_Enum_AccountKind_Active');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_AccountKind_Passive(), inDescId:= zc_Object_AccountKind(), inCode:= 1, inName:= '���������', inEnumName:= 'zc_Enum_AccountKind_Passive');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_AccountKind_All(), inDescId:= zc_Object_AccountKind(), inCode:= 1, inName:= '�������/���������', inEnumName:= 'zc_Enum_AccountKind_All');
     -- !!! ���� ���������
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_RouteKind_Internal(), inDescId:= zc_Object_RouteKind(), inCode:= 1, inName:= '�����', inEnumName:= 'zc_Enum_RouteKind_Internal');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_RouteKind_External(), inDescId:= zc_Object_RouteKind(), inCode:= 2, inName:= '��������', inEnumName:= 'zc_Enum_RouteKind_External');

     -- !!! ���� �������� �������
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_WorkTimeKind_Work(),    inDescId:= zc_Object_WorkTimeKind(), inCode:= 1, inName:= '������� ����', inEnumName:= 'zc_Enum_WorkTimeKind_Work');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_WorkTimeKind_Holiday(), inDescId:= zc_Object_WorkTimeKind(), inCode:= 2, inName:= '������'      , inEnumName:= 'zc_Enum_WorkTimeKind_Holiday');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_WorkTimeKind_Hospital(), inDescId:= zc_Object_WorkTimeKind(), inCode:= 3, inName:= '����������' , inEnumName:= 'zc_Enum_WorkTimeKind_Hospital');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_WorkTimeKind_Skip(),    inDescId:= zc_Object_WorkTimeKind(), inCode:= 4, inName:= '������'      , inEnumName:= 'zc_Enum_WorkTimeKind_Skip');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_WorkTimeKind_Trainee(), inDescId:= zc_Object_WorkTimeKind(), inCode:= 5, inName:= '������'      , inEnumName:= 'zc_Enum_WorkTimeKind_Trainee');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_WorkTimeKind_DayOff(),  inDescId:= zc_Object_WorkTimeKind(), inCode:= 6, inName:= '��������'    , inEnumName:= 'zc_Enum_WorkTimeKind_DayOff');

     -- !!! ���� �������� �������
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_ModelServiceKind_DaySheetWorkTime(),   inDescId:= zc_Object_ModelServiceKind(), inCode:= 1, inName:= '�� ���� ������'         , inEnumName:= 'zc_Enum_ModelServiceKind_DaySheetWorkTime');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_ModelServiceKind_MonthSheetWorkTime(), inDescId:= zc_Object_ModelServiceKind(), inCode:= 1, inName:= '�� ����� ������'        , inEnumName:= 'zc_Enum_ModelServiceKind_MonthSheetWorkTime');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_ModelServiceKind_SatSheetWorkTime(),   inDescId:= zc_Object_ModelServiceKind(), inCode:= 1, inName:= '�� �������� ������'     , inEnumName:= 'zc_Enum_ModelServiceKind_SatSheetWorkTime');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_ModelServiceKind_MonthFundPay(),       inDescId:= zc_Object_ModelServiceKind(), inCode:= 1, inName:= '�� ����� ����/�������'  , inEnumName:= 'zc_Enum_ModelServiceKind_MonthFundPay');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_ModelServiceKind_TurnFundPay(),        inDescId:= zc_Object_ModelServiceKind(), inCode:= 1, inName:= '�� 1 ����� ����/�������', inEnumName:= 'zc_Enum_ModelServiceKind_TurnFundPay');

     -- !!! 
     -- !!! ������: 1-������� �������������� ������
     -- !!! 
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10000,  inDescId:= zc_Object_AccountGroup(), inEnumName:= 'zc_Enum_AccountGroup_10000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20000,  inDescId:= zc_Object_AccountGroup(), inEnumName:= 'zc_Enum_AccountGroup_20000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30000,  inDescId:= zc_Object_AccountGroup(), inEnumName:= 'zc_Enum_AccountGroup_30000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40000,  inDescId:= zc_Object_AccountGroup(), inEnumName:= 'zc_Enum_AccountGroup_40000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 50000,  inDescId:= zc_Object_AccountGroup(), inEnumName:= 'zc_Enum_AccountGroup_50000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 60000,  inDescId:= zc_Object_AccountGroup(), inEnumName:= 'zc_Enum_AccountGroup_60000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70000,  inDescId:= zc_Object_AccountGroup(), inEnumName:= 'zc_Enum_AccountGroup_70000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 80000,  inDescId:= zc_Object_AccountGroup(), inEnumName:= 'zc_Enum_AccountGroup_80000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 90000,  inDescId:= zc_Object_AccountGroup(), inEnumName:= 'zc_Enum_AccountGroup_90000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 100000, inDescId:= zc_Object_AccountGroup(), inEnumName:= 'zc_Enum_AccountGroup_100000');

     -- !!! 
     -- !!! ������: 2-������� �������������� ������
     -- !!! 
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20400,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_20400');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20500,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_20500');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20600,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_20600');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20900,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_20900');

     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30100,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_30100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30200,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_30200');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30300,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_30300');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30400,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_30400');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30500,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_30500');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30600,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_30600');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30700,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_30700');

     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 60100,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_60100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 60200,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_60200');

     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70100,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_70100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70200,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_70200');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70300,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_70300');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70400,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_70400');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70500,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_70500');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70600,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_70600');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70700,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_70700');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70800,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_70800');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70900,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_70900');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 71000,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_71000');

     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 90100,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_90100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 90200,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_90200');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 90300,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_90300');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 90400,  inDescId:= zc_Object_AccountDirection(), inEnumName:= 'zc_Enum_AccountDirection_90400');

     -- !!! 
     -- !!! ������: �������������� ����� (1+2+3 �������)
     -- !!! 
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20901, inDescId:= zc_Object_Account(), inEnumName:= 'zc_Enum_Account_20901');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40101, inDescId:= zc_Object_Account(), inEnumName:= 'zc_Enum_Account_40101');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40301, inDescId:= zc_Object_Account(), inEnumName:= 'zc_Enum_Account_40301');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 100301, inDescId:= zc_Object_Account(), inEnumName:= 'zc_Enum_Account_100301');

     -- !!! 
     -- !!! ��: 2-������� �������������� ����������
     -- !!! 
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10100, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_10100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10200, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_10200');

     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20100, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_20100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20200, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_20200');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20300, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_20300');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20400, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_20400');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20500, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_20500');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20600, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_20600');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20700, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_20700');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20800, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_20800');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20900, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_20900');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 21000, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_21000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 21100, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_21100');

     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30100, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_30100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30200, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_30200');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30300, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_30300');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30400, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_30400');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30500, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_30500');

     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40100, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_40100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40200, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_40200');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40300, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_40300');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40400, inDescId:= zc_Object_InfoMoneyDestination(), inEnumName:= 'zc_Enum_InfoMoneyDestination_40400');

     -- !!! 
     -- !!! ��: �������������� ��������� (1+2+3 �������)
     -- !!! 
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20401, inDescId:= zc_Object_InfoMoney(), inEnumName:= 'zc_Enum_InfoMoney_20401');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20901, inDescId:= zc_Object_InfoMoney(), inEnumName:= 'zc_Enum_InfoMoney_20901');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 21201, inDescId:= zc_Object_InfoMoney(), inEnumName:= 'zc_Enum_InfoMoney_21201');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30101, inDescId:= zc_Object_InfoMoney(), inEnumName:= 'zc_Enum_InfoMoney_30101');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 80401, inDescId:= zc_Object_InfoMoney(), inEnumName:= 'zc_Enum_InfoMoney_80401');

     -- !!! 
     -- !!! ����: 1-������� (������ ����)
     -- !!! 
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10000, inDescId:= zc_Object_ProfitLossGroup(), inEnumName:= 'zc_Enum_ProfitLossGroup_10000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20000, inDescId:= zc_Object_ProfitLossGroup(), inEnumName:= 'zc_Enum_ProfitLossGroup_20000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 30000, inDescId:= zc_Object_ProfitLossGroup(), inEnumName:= 'zc_Enum_ProfitLossGroup_30000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40000, inDescId:= zc_Object_ProfitLossGroup(), inEnumName:= 'zc_Enum_ProfitLossGroup_40000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 50000, inDescId:= zc_Object_ProfitLossGroup(), inEnumName:= 'zc_Enum_ProfitLossGroup_50000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 60000, inDescId:= zc_Object_ProfitLossGroup(), inEnumName:= 'zc_Enum_ProfitLossGroup_60000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70000, inDescId:= zc_Object_ProfitLossGroup(), inEnumName:= 'zc_Enum_ProfitLossGroup_70000');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 80000, inDescId:= zc_Object_ProfitLossGroup(), inEnumName:= 'zc_Enum_ProfitLossGroup_80000');

     -- !!! 
     -- !!! ����: 2-������� (��������� ���� - �����������)
     -- !!! 
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10100, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_10100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10200, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_10200');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10300, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_10300');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10400, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_10400');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10500, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_10500');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10700, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_10700');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10800, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_10800');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10900, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_10900');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 11100, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_11100');

     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20100, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_20100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20200, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_20200');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20300, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_20300');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20400, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_20400');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20500, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_20500');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 20600, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_20600');

     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40100, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_40100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40200, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_40200');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40300, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_40300');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40400, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_40400');


     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70100, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_70100');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70200, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_70200');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70300, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_70300');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 70400, inDescId:= zc_Object_ProfitLossDirection(), inEnumName:= 'zc_Enum_ProfitDirection_70400');

     -- !!! 
     -- !!! ����: ������ (1+2+3 �������)
     -- !!! 
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10101, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10101');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10102, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10102');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10201, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10201');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10202, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10202');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10301, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10301');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10302, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10302');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10401, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10401');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10402, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10402');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10501, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10501');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10502, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10502');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10701, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10701');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10702, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10702');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10801, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10801');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10802, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10802');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 10901, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_10901');
     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 11101, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_11101');

     PERFORM lpUpdate_Object_Enum_byCode (inCode:= 40209, inDescId:= zc_Object_ProfitLoss(), inEnumName:= 'zc_Enum_ProfitLoss_40209');

END $$;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 07.10.13                                        * role...
 03.10.13                                        * add zc_Enum_InfoMoney_20901, zc_Enum_InfoMoney_30101
 01.10.13         * add ���� �������� ������� (6 ��)
 30.09.13                                        * add zc_Enum_InfoMoney_21201
 29.09.13                                        * add zc_Object_RateFuelKind
 27.09.13                                        * add zc_Enum_InfoMoney_20401
 26.09.13         * del zc_Enum_RateFuelKind_Summer, zc_Enum_RateFuelKind_Winter               
 24.09.13         * add zc_Enum_RateFuelKind_Summer, zc_Enum_RateFuelKind_Winter, zc_Enum_RouteKind_Internal, zc_Enum_RouteKind_External
 21.09.13                                        * add zc_Enum_InfoMoney_80401
 15.09.13                                        * add zc_Enum_AccountDirection_20900 and zc_Enum_Account_20901
 07.09.13                                        * add zc_Enum_ProfitDirection_1... and zc_Enum_ProfitDirection_7...
 01.09.13                                        * add zc_Enum_ProfitDirection_4...
 26.08.13                                        * add ����
 25.08.13                                        * add zc_Enum_Account_100301
 21.08.13                        * add zc_Enum_Account_40101
 20.07.13                                        * add zc_Enum_AccountDirection_20400
 18.07.13                                        * add zc_Enum_AccountDirection_20500, 20600
 02.07.13                                        * add 1-������� �������������� ������
 01.07.13                                        * add 2-������� �������������� ����������
 28.06.13                                        *
*/
