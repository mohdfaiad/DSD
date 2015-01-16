--------------------------- !!!!!!!!!!!!!!!!!!!
--------------------------- !!! ����� ����� !!!
--------------------------- !!!!!!!!!!!!!!!!!!!

CREATE OR REPLACE FUNCTION zc_ObjectLink_Account_AccountGroup() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Account_AccountGroup'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Account_AccountGroup', '����� ����� � ������� ������', zc_Object_Account(), zc_Object_AccountGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Account_AccountGroup');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Account_AccountDirection() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Account_AccountDirection'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Account_AccountDirection', '����� ����� � ��������� ������ - �����������', zc_Object_Account(), zc_Object_AccountDirection() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Account_AccountDirection');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Account_InfoMoneyDestination() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Account_InfoMoneyDestination'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Account_InfoMoneyDestination', '����� ����� � �������������� ����������', zc_Object_Account(), zc_Object_InfoMoneyDestination() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Account_InfoMoneyDestination');

--!!! zc_Object_BankAccountContract
CREATE OR REPLACE FUNCTION zc_ObjectLink_Bank_Juridical() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Bank_Juridical'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Bank_Juridical', '����� ����� � �� �����', zc_Object_Bank(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Bank_Juridical');

-- !!!zc_Object_BankAccount!!!
CREATE OR REPLACE FUNCTION zc_ObjectLink_BankAccount_Juridical() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccount_Juridical'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_BankAccount_Juridical', '����� ����� � ��. �����', zc_Object_BankAccount(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccount_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_BankAccount_Bank() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccount_Bank'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_BankAccount_Bank', '����� ����� ������', zc_Object_BankAccount(), zc_Object_Bank() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccount_Bank');

CREATE OR REPLACE FUNCTION zc_ObjectLink_BankAccount_Currency() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccount_Currency'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_BankAccount_Currency', '����� ����� � �������', zc_Object_BankAccount(), zc_Object_Currency() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccount_Currency');

CREATE OR REPLACE FUNCTION zc_ObjectLink_BankAccount_CorrespondentBank() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccount_CorrespondentBank'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_BankAccount_CorrespondentBank', '���� ������������� ��� �����', zc_Object_BankAccount(), zc_Object_Bank() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccount_CorrespondentBank');

CREATE OR REPLACE FUNCTION zc_ObjectLink_BankAccount_BeneficiarysBank() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccount_BeneficiarysBank'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_BankAccount_BeneficiarysBank', '���� � ����� - ��������������', zc_Object_BankAccount(), zc_Object_Bank() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccount_BeneficiarysBank');

CREATE OR REPLACE FUNCTION zc_ObjectLink_BankAccountContract_BankAccount() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccountContract_BankAccount'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_BankAccountContract_BankAccount', '����� � �.������', zc_Object_BankAccountContract(), zc_Object_BankAccount() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccountContract_BankAccount');

CREATE OR REPLACE FUNCTION zc_ObjectLink_BankAccountContract_InfoMoney() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccountContract_InfoMoney'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_BankAccountContract_InfoMoney', '����� �� ������ ����������', zc_Object_BankAccountContract(), zc_Object_InfoMoney() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_BankAccountContract_InfoMoney');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Car_CarModel() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_CarModel'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Car_CarModel', '����� ������ � ������ ����������', zc_Object_Car(), zc_Object_CarModel() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_CarModel');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Car_Unit() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_Unit'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Car_Unit', '����� ������ � ��������������', zc_Object_Car(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_Unit');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Car_PersonalDriver() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_PersonalDriver'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Car_PersonalDriver', '����� ������ � �����������(��������)', zc_Object_Car(), zc_Object_Personal() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_PersonalDriver');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Car_FuelMaster() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_FuelMaster'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Car_FuelMaster', '����� ������ � ����� �������(��������)', zc_Object_Car(), zc_Object_Fuel() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_FuelMaster');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Car_FuelChild() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_FuelChild'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Car_FuelChild', '����� ������ � ����� �������(��������������)', zc_Object_Car(), zc_Object_Fuel() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_FuelChild');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Car_Juridical() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_Juridical'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Car_Juridical', '����� ������ � ����������� ����(���������)', zc_Object_Car(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Car_Juridical');


CREATE OR REPLACE FUNCTION zc_ObjectLink_Cash_Currency() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Cash_Currency'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
   SELECT 'zc_ObjectLink_Cash_Currency', '����� ����� � �������', zc_Object_Cash(), zc_Object_Currency() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Cash_Currency');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Cash_PaidKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Cash_PaidKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Cash_PaidKind', '����� ����� � ������ ������', zc_Object_Cash(), zc_Object_PaidKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Cash_PaidKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Cash_Branch() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Cash_Branch'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
   SELECT 'zc_ObjectLink_Cash_Branch', '����� ����� � ��������', zc_Object_Cash(), zc_Object_Branch() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Cash_Branch');

-- !!!zc_Object_Goods!!!
CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_GoodsGroup() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_GoodsGroup'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Goods_GoodsGroup', '����� ������� � ������� �������', zc_Object_Goods(), zc_Object_GoodsGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_GoodsGroup');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_Measure() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_Measure'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Goods_Measure', '����� ������� � �������� ���������', zc_Object_Goods(), zc_Object_Measure() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_Measure');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_TradeMark() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_TradeMark'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Goods_TradeMark', '����� ������� � �������� ������', zc_Object_Goods(), zc_Object_TradeMark() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_TradeMark');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_InfoMoney() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_InfoMoney'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Goods_InfoMoney', '����� ������� � �������������� �������', zc_Object_Goods(), zc_Object_InfoMoney() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_InfoMoney');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_Business() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_Business'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Goods_Business', '����� ������� � ��������', zc_Object_Goods(), zc_Object_Business() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_Business');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_Fuel() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_Fuel'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Goods_Fuel', '����� ������� � ����� �������', zc_Object_Goods(), zc_Object_Business() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_Fuel');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_GoodsMain() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_GoodsMain'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Goods_GoodsMain', '����� ������� � ������� �������', zc_Object_Goods(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_GoodsMain');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_Object() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_Object'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Goods_Object', '����� ������� � �� ����� ��� �������� �����', zc_Object_Goods(), null WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_Object');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_GoodsGroupStat() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_GoodsGroupStat'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Goods_GoodsGroupStat', '����� ������� � ������� ������� (����������)', zc_Object_Goods(), zc_Object_GoodsGroupStat() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_GoodsGroupStat');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_GoodsTag() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_GoodsTag'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Goods_GoodsTag', '����� ������� � ��������� ������', zc_Object_Goods(), zc_Object_GoodsTag() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_GoodsTag');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_GoodsGroupAnalyst() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_GoodsGroupAnalyst'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Goods_GoodsGroupAnalyst', '����� ������� � ������ �������(���������)', zc_Object_Goods(), zc_Object_GoodsGroupAnalyst() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_GoodsGroupAnalyst');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_Maker() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_Maker'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Goods_Maker', '����� ������� � ��������������', zc_Object_Goods(), zc_Object_Maker() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_Maker');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsGroup_Parent() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsGroup_Parent'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsGroup_Parent', '����� ������ ������� � ������� �������', zc_Object_GoodsGroup(), zc_Object_GoodsGroupStat() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsGroup_Parent');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsGroup_GoodsGroupStat() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsGroup_GoodsGroupStat'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsGroup_GoodsGroupStat', '����� ������ ������� � ������� �������(����������)', zc_Object_GoodsGroup(), zc_Object_GoodsGroupStat() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsGroup_GoodsGroupStat');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsGroup_TradeMark() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsGroup_TradeMark'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsGroup_TradeMark', '����� ������ ������� � �������� ������', zc_Object_GoodsGroup(), zc_Object_TradeMark() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsGroup_TradeMark');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsGroup_GoodsTag() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsGroup_GoodsTag'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsGroup_GoodsTag', '����� ������ ������� � ��������� ������', zc_Object_GoodsGroup(), zc_Object_GoodsTag() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsGroup_GoodsTag');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsGroup_GoodsGroupAnalyst() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsGroup_GoodsGroupAnalyst'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsGroup_GoodsGroupAnalyst', '����� ������ ������� � ������ �������(���������)', zc_Object_GoodsGroup(), zc_Object_GoodsGroupAnalyst() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsGroup_GoodsGroupAnalyst');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsTag_GoodsGroupAnalyst() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsTag_GoodsGroupAnalyst'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsTag_GoodsGroupAnalyst', '����� �������� ������� � ������ �������(���������)', zc_Object_GoodsTag(), zc_Object_GoodsGroupAnalyst() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsTag_GoodsGroupAnalyst');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractTag_ContractTagGroup() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractTag_ContractTagGroup'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ContractTag_ContractTagGroup', '����� ������ �������� �������� � ��������� ��������', zc_Object_ContractTag(), zc_Object_ContractTagGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractTag_ContractTagGroup');




-- !!!zc_Object_GoodsPropertyValue!!!
CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsPropertyValue_GoodsProperty() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsPropertyValue_GoodsProperty'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsPropertyValue_GoodsProperty', '����� �������� ������� ������� ��� �������������� � ��������������� ������� �������', zc_Object_GoodsPropertyValue(), zc_Object_GoodsProperty() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsPropertyValue_GoodsProperty');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsPropertyValue_Goods() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsPropertyValue_Goods'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsPropertyValue_Goods', '����� �������� ������� ������� ��� �������������� � ��������', zc_Object_GoodsPropertyValue(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsPropertyValue_Goods');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsPropertyValue_GoodsKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsPropertyValue_GoodsKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsPropertyValue_GoodsKind', '����� �������� ������� ������� ��� �������������� � ������ �������', zc_Object_GoodsPropertyValue(), zc_Object_GoodsKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsPropertyValue_GoodsKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportExportLink_ObjectMain() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportExportLink_ObjectMain'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportExportLink_ObjectMain', '����� �������� ��� ��������, �������� c ��������', zc_Object_ImportExportLink(), NULL WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportExportLink_ObjectMain');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportExportLink_ObjectChild() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportExportLink_ObjectChild'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportExportLink_ObjectChild', '����� �������� ��� ��������, �������� c ��������', zc_Object_ImportExportLink(), NULL WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportExportLink_ObjectChild');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportExportLink_LinkType() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportExportLink_LinkType'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportExportLink_LinkType', '����� �������� ��� ��������, �������� c ��������', zc_Object_ImportExportLink(), zc_Object_ImportExportLinkType() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportExportLink_LinkType');

CREATE OR REPLACE FUNCTION zc_ObjectLink_JuridicalGroup_Parent() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_JuridicalGroup_Parent'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_JuridicalGroup_Parent', '����� ������ �� ��� � ������� �� ���', zc_Object_JuridicalGroup(), zc_Object_JuridicalGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_JuridicalGroup_Parent');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Juridical_JuridicalGroup() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_JuridicalGroup'); END;  $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Juridical_JuridicalGroup', '����� �� ���� � ������� �� ���', zc_Object_Juridical(), zc_Object_JuridicalGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_JuridicalGroup');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Juridical_GoodsProperty() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_GoodsProperty'); END;  $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Juridical_GoodsProperty', '����� �� ���� � ��������������� ������� �������', zc_Object_Juridical(), zc_Object_GoodsProperty() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_GoodsProperty');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Juridical_PriceList() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_PriceList'); END;  $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Juridical_PriceList', '�����-����', zc_Object_Juridical(), zc_Object_PriceList() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_PriceList');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Juridical_PriceListPromo() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_PriceListPromo'); END;  $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Juridical_PriceListPromo', '�����-����(���������)', zc_Object_Juridical(), zc_Object_PriceList() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_PriceListPromo');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Juridical_Retail() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_Retail'); END;  $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Juridical_Retail', '�������� ����', zc_Object_Juridical(), zc_Object_Retail() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_Retail');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Juridical_RetailReport() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_RetailReport'); END;  $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Juridical_RetailReport', '�������� ����(�����)', zc_Object_Juridical(), zc_Object_RetailReport() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_RetailReport');

CREATE OR REPLACE FUNCTION zc_ObjectLink_LinkGoods_GoodsMain() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_LinkGoods_GoodsMain'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_LinkGoods_GoodsMain', '', zc_Object_LinkGoods(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_LinkGoods_GoodsMain');

CREATE OR REPLACE FUNCTION zc_ObjectLink_LinkGoods_Goods() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_LinkGoods_Goods'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_LinkGoods_Goods', '', zc_Object_LinkGoods(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_LinkGoods_Goods');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_MemberTake() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_MemberTake'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Partner_MemberTake', '����� ����������� � ��� ���� (����������)', zc_Object_Partner(), zc_Object_Member() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_MemberTake');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_Personal() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_Personal'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Partner_Personal', '����� ����������� � ��������� (������������� ����)', zc_Object_Partner(), zc_Object_Personal() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_Personal');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_PersonalTrade() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_PersonalTrade'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Partner_PersonalTrade', '����� ����������� � ��������� (��������)', zc_Object_Partner(), zc_Object_Personal() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_PersonalTrade');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_Area() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_Area'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Partner_Area', '����� ����������� � ������', zc_Object_Partner(), zc_Object_Area() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_Area');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_PartnerTag() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_PartnerTag'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Partner_PartnerTag', '����� ����������� � ������� �������� �����', zc_Object_Partner(), zc_Object_PartnerTag() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_PartnerTag');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_Juridical() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_Juridical'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Partner_Juridical', '����� ����������� � �� �����', zc_Object_Partner(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_Route() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_Route'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Partner_Route', '����� ����������� � ���������', zc_Object_Partner(), zc_Object_Route() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_Route');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_RouteSorting() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_RouteSorting'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Partner_RouteSorting', '����� ����������� � ����������� ��������', zc_Object_Partner(), zc_Object_RouteSorting() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_RouteSorting');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_PriceList() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_PriceList'); END;  $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Partner_PriceList', '�����-����', zc_Object_Partner(), zc_Object_PriceList() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_PriceList');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_PriceListPromo() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_PriceListPromo'); END;  $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Partner_PriceListPromo', '�����-����(���������)', zc_Object_Partner(), zc_Object_PriceList() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_PriceListPromo');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner_Street() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_Street'); END;  $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Partner_Street', ' 	�����/��������', zc_Object_Partner(), zc_Object_Street() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner_Street');

CREATE OR REPLACE FUNCTION zc_ObjectLink_PriceListItem_PriceList() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PriceListItem_PriceList'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_PriceListItem_PriceList', '������ �� �����-����', zc_Object_PriceListItem(), zc_Object_PriceList() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PriceListItem_PriceList');

CREATE OR REPLACE FUNCTION zc_ObjectLink_PriceListItem_Goods()  RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PriceListItem_Goods'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_PriceListItem_Goods', '������ �� �����', zc_Object_PriceListItem(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PriceListItem_Goods');

CREATE OR REPLACE FUNCTION zc_ObjectLink_RoleRight_Role() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleRight_Role'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_RoleRight_Role', '������ �� ���� � ����������� �������� �����', zc_Object_RoleRight(), zc_Object_Role() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleRight_Role');

CREATE OR REPLACE FUNCTION zc_ObjectLink_RoleRight_Process() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleRight_Process'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_RoleRight_Process', '������ �� ������� � ����������� �������� �����', zc_Object_RoleRight(), zc_Object_Process() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleRight_Process');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Unit_Parent() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_Parent'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Unit_Parent', '����� ������������� � ��������������', zc_Object_Unit(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_Parent');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Unit_Branch() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_Branch'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Unit_Branch', '����� ������������� � ��������', zc_Object_Unit(), zc_Object_Branch() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_Branch');

CREATE OR REPLACE FUNCTION zc_ObjectLink_UserRole_Role() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_UserRole_Role'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_UserRole_Role', '������ �� ���� � ����������� ����� ������������� � �����', zc_Object_UserRole(), zc_Object_Role() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_UserRole_Role');

CREATE OR REPLACE FUNCTION zc_ObjectLink_UserRole_User() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_UserRole_User'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_UserRole_User', '����� � ������������� � ����������� ����� ������������', zc_Object_UserRole(), zc_Object_User() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_UserRole_User');

CREATE OR REPLACE FUNCTION zc_ObjectLink_UserFormSettings_User() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_UserFormSettings_User'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_UserFormSettings_User', '������������', zc_Object_UserFormSettings(), zc_Object_User() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_UserFormSettings_User');

CREATE OR REPLACE FUNCTION zc_ObjectLink_UserFormSettings_Form() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_UserFormSettings_Form'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_UserFormSettings_Form', '???', zc_Object_UserFormSettings(), zc_Object_Form() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_UserFormSettings_Form');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Unit_Business()  RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_Business'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Unit_Business', '����� ������������� � ��������', zc_Object_Unit(), zc_Object_Business() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_Business');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Unit_Juridical() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_Juridical'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Unit_Juridical', '����� ������������� � �� �����', zc_Object_Unit(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Unit_AccountDirection() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_AccountDirection'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Unit_AccountDirection', '����� ������������� � ���������� �������������� ������ - �����������', zc_Object_Unit(), zc_Object_AccountDirection() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_AccountDirection');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Unit_ProfitLossDirection() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_ProfitLossDirection'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Unit_ProfitLossDirection', '����� ������������� � ���������� �������������� ������ - �����������', zc_Object_Unit(), zc_Object_ProfitLossDirection() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_ProfitLossDirection');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Unit_HistoryCost() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_HistoryCost'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Unit_HistoryCost', '����� ������������� � �������������� �������������� ��� �/�', zc_Object_Unit(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Unit_HistoryCost');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Account_InfoMoney() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Account_InfoMoney'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Account_InfoMoney', '����� ����� � �������������� ����������', zc_Object_Account(), zc_Object_InfoMoney() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Account_InfoMoney');


-- CREATE OR REPLACE FUNCTION zc_ObjectLink_UnitGroup_Parent() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_UnitGroup_Parent'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;

CREATE OR REPLACE FUNCTION zc_ObjectLink_InfoMoney_InfoMoneyGroup() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_InfoMoney_InfoMoneyGroup'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_InfoMoney_InfoMoneyGroup', '����� ������ ���������� � ������� �������������� ����������', zc_Object_InfoMoney(), zc_Object_InfoMoneyGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_InfoMoney_InfoMoneyGroup');

CREATE OR REPLACE FUNCTION zc_ObjectLink_InfoMoney_InfoMoneyDestination() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_InfoMoney_InfoMoneyDestination'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_InfoMoney_InfoMoneyDestination', '����� ������ ���������� � �������������� �����������', zc_Object_InfoMoney(), zc_Object_InfoMoneyDestination() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_InfoMoney_InfoMoneyDestination');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ProfitLoss_ProfitLossGroup() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ProfitLoss_ProfitLossGroup'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ProfitLoss_ProfitLossGroup', '����� ������ ������ � �������� � ������� � ������� ������ ������ � �������� � �������', zc_Object_ProfitLoss(), zc_Object_ProfitLossGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ProfitLoss_ProfitLossGroup');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ProfitLoss_ProfitLossDirection() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ProfitLoss_ProfitLossDirection'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ProfitLoss_ProfitLossDirection', '����� ������ ������ � �������� � ������� � ���������� ������ ������ � �������� � ������� - �����������', zc_Object_ProfitLoss(), zc_Object_ProfitLossDirection() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ProfitLoss_ProfitLossDirection');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ProfitLoss_InfoMoneyDestination() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ProfitLoss_InfoMoneyDestination'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ProfitLoss_InfoMoneyDestination', '����� ������ ������ � �������� � ������� � �������������� ����������', zc_Object_ProfitLoss(), zc_Object_InfoMoneyDestination() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ProfitLoss_InfoMoneyDestination');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ProfitLoss_InfoMoney() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ProfitLoss_InfoMoney'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ProfitLoss_InfoMoney', '����� ������ ������ � �������� � ������� � �������������� ����������', zc_Object_ProfitLoss(), zc_Object_InfoMoney() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ProfitLoss_InfoMoney');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Personal_Member() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_Member'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Personal_Member', '����� ���������� � ���.������', zc_Object_Personal(), zc_Object_Member() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_Member');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Personal_Position() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_Position'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Personal_Position', '����� ���������� � ����������', zc_Object_Personal(), zc_Object_Position() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_Position');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Personal_PositionLevel() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_PositionLevel'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Personal_PositionLevel', '������ ���������', zc_Object_Personal(), zc_Object_PositionLevel() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_PositionLevel');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Personal_Unit() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_Unit'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Personal_Unit', '����� ���������� � ��������������', zc_Object_Personal(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_Unit');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Personal_Juridical() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_Juridical'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Personal_Juridical', '����� ���������� � ��.�����', zc_Object_Personal(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Personal_Business() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_Business'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Personal_Business', '����� ���������� � ��������', zc_Object_Personal(), zc_Object_Business() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_Business');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Personal_PersonalGroup() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_PersonalGroup'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Personal_PersonalGroup', '����� ���������� � ������������ �����������', zc_Object_Personal(), zc_Object_PersonalGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Personal_PersonalGroup');

CREATE OR REPLACE FUNCTION zc_ObjectLink_AssetGroup_Parent() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_AssetGroup_Parent'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_AssetGroup_Parent', '����� � �������  �������� �������', zc_Object_AssetGroup(), zc_Object_AssetGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_AssetGroup_Parent');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Asset_AssetGroup() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Asset_AssetGroup'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Asset_AssetGroup', '����� �������� ������� � ������� �������� �������', zc_Object_Asset(), zc_Object_AssetGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Asset_AssetGroup');


CREATE OR REPLACE FUNCTION zc_ObjectLink_PartionGoods_Partner() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PartionGoods_Partner'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_PartionGoods_Partner', '�����������', zc_Object_PartionGoods(), zc_Object_Partner() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PartionGoods_Partner');

CREATE OR REPLACE FUNCTION zc_ObjectLink_PartionGoods_Goods() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PartionGoods_Goods'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_PartionGoods_Goods', '������', zc_Object_PartionGoods(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PartionGoods_Goods');

CREATE OR REPLACE FUNCTION zc_ObjectLink_PartionGoods_Storage() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PartionGoods_Storage'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_PartionGoods_Storage', '����� ��������', zc_Object_PartionGoods(), zc_Object_Storage() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PartionGoods_Storage');

CREATE OR REPLACE FUNCTION zc_ObjectLink_PartionGoods_Unit() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PartionGoods_Unit'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_PartionGoods_Unit', '�������������(��� ����)', zc_Object_PartionGoods(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PartionGoods_Unit');


CREATE OR REPLACE FUNCTION zc_ObjectLink_Juridical_InfoMoney() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_InfoMoney'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Juridical_InfoMoney', '����� ����������� � ��������������� �����������', zc_Object_Juridical(), zc_Object_InfoMoney() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Juridical_InfoMoney');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Account_AccountKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Account_AccountKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Account_AccountKind', '����� ����� � ����� ������', zc_Object_Account(), zc_Object_AccountKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Account_AccountKind');


CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsByGoodsKind_Goods() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsByGoodsKind_Goods'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_GoodsByGoodsKind_Goods', '������', zc_Object_GoodsByGoodsKind(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsByGoodsKind_Goods');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsByGoodsKind_GoodsKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsByGoodsKind_GoodsKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_GoodsByGoodsKind_GoodsKind', '���� �������', zc_Object_GoodsByGoodsKind(), zc_Object_GoodsKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsByGoodsKind_GoodsKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ReceiptChild_Receipt() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ReceiptChild_Receipt'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ReceiptChild_Receipt', '���������', zc_Object_ReceiptChild(), zc_Object_Receipt() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ReceiptChild_Receipt');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ReceiptChild_Goods() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ReceiptChild_Goods'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ReceiptChild_Goods', '������', zc_Object_ReceiptChild(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ReceiptChild_Goods');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ReceiptChild_GoodsKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ReceiptChild_GoodsKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ReceiptChild_GoodsKind', '���� �������', zc_Object_ReceiptChild(), zc_Object_GoodsKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ReceiptChild_GoodsKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Receipt_Goods() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Receipt_Goods'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Receipt_Goods', '����� ��������� � �������', zc_Object_Receipt(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Receipt_Goods');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Receipt_GoodsKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Receipt_GoodsKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Receipt_GoodsKind', '����� ��������� � ����� �������', zc_Object_Receipt(), zc_Object_GoodsKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Receipt_GoodsKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Receipt_GoodsKindComplete() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Receipt_GoodsKindComplete'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Receipt_GoodsKindComplete', '����� ��������� � ���� ������� (������� ���������)', zc_Object_Receipt(), zc_Object_GoodsKindComplete() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Receipt_GoodsKindComplete');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Receipt_ReceiptCost() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Receipt_ReceiptCost'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Receipt_ReceiptCost', '����� ��������� � ������� � ����������', zc_Object_Receipt(), zc_Object_ReceiptCost() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Receipt_ReceiptCost');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Receipt_ReceiptKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Receipt_ReceiptKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Receipt_ReceiptKind', '����� ��������� � ���� ��������', zc_Object_Receipt(), zc_Object_ReceiptKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Receipt_ReceiptKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Cash_JuridicalBasis() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Cash_JuridicalBasis'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Cash_JuridicalBasis', '����� ����� � ������� �� �����', zc_Object_Cash(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Cash_JuridicalBasis');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Cash_Business() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Cash_Business'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Cash_Business', '����� ����� � ��������', zc_Object_Cash(), zc_Object_Business() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Cash_Business');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Route_Unit() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Route_Unit'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Route_Unit', '����� �������� � ��������������', zc_Object_Route(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Route_Unit');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Route_Branch() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Route_Branch'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Route_Branch', '����� �������� � ��������', zc_Object_Route(), zc_Object_Branch() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Route_Branch');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Route_RouteKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Route_RouteKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Route_RouteKind', '����� �������� � ����� ��������', zc_Object_Route(), zc_Object_RouteKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Route_RouteKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Route_Freight() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Route_Freight'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Route_Freight', '����� �������� � �������� �����', zc_Object_Route(), zc_Object_Freight() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Route_Freight');

CREATE OR REPLACE FUNCTION zc_ObjectLink_RoleAction_Role() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleAction_Role'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_RoleAction_Role', '������ �� ���� � ����������� �������� �����', zc_Object_RoleAction(), zc_Object_Role() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleAction_Role');

CREATE OR REPLACE FUNCTION zc_ObjectLink_RoleAction_Action() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleAction_Action'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_RoleAction_Action', '������ �� �������� � ����������� ����� �����', zc_Object_RoleAction(), zc_Object_Action() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleAction_Action');

CREATE OR REPLACE FUNCTION zc_ObjectLink_User_Member() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_User_Member'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_User_Member', '��� ����', zc_Object_User(), zc_Object_Member() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_User_Member');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Fuel_RateFuelKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Fuel_RateFuelKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Fuel_RateFuelKind', '��� ����� ��� �������', zc_Object_Fuel(), zc_Object_RateFuelKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Fuel_RateFuelKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_RateFuel_RouteKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RateFuel_RouteKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_RateFuel_RouteKind', '��� ��������', zc_Object_RateFuel(), zc_Object_RateFuelKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RateFuel_RouteKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_RateFuel_Car() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RateFuel_Car'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_RateFuel_Car', '����������', zc_Object_RateFuel(), zc_Object_RateFuelKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RateFuel_Car');

CREATE OR REPLACE FUNCTION zc_ObjectLink_PersonalGroup_Unit() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PersonalGroup_Unit'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_PersonalGroup_Unit', '�������������', zc_Object_PersonalGroup(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PersonalGroup_Unit');

CREATE OR REPLACE FUNCTION zc_ObjectLink_CardFuel_PersonalDriver() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CardFuel_PersonalDriver'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_CardFuel_PersonalDriver', '��������� (��������)', zc_Object_CardFuel(), zc_Object_Personal() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CardFuel_PersonalDriver');

CREATE OR REPLACE FUNCTION zc_ObjectLink_CardFuel_Car() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CardFuel_Car'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_CardFuel_Car', '����������', zc_Object_CardFuel(), zc_Object_Car() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CardFuel_Car');

CREATE OR REPLACE FUNCTION zc_ObjectLink_CardFuel_PaidKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CardFuel_PaidKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_CardFuel_PaidKind', '���� ����� ������', zc_Object_CardFuel(), zc_Object_PaidKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CardFuel_PaidKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_CardFuel_Juridical() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CardFuel_Juridical'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_CardFuel_Juridical', '����������� ����', zc_Object_CardFuel(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CardFuel_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_CardFuel_Goods() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CardFuel_Goods'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_CardFuel_Goods', '�����', zc_Object_CardFuel(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CardFuel_Goods');

CREATE OR REPLACE FUNCTION zc_ObjectLink_TicketFuel_Goods() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_TicketFuel_Goods'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_TicketFuel_Goods', '�����', zc_Object_CardFuel(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_TicketFuel_Goods');

CREATE OR REPLACE FUNCTION zc_ObjectLink_StaffList_Unit() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_StaffList_Unit'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_StaffList_Unit', '�������������', zc_Object_StaffList(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_StaffList_Unit');

CREATE OR REPLACE FUNCTION zc_ObjectLink_StaffList_Position() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_StaffList_Position'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_StaffList_Position', '���������', zc_Object_StaffList(), zc_Object_Position() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_StaffList_Position');

CREATE OR REPLACE FUNCTION zc_ObjectLink_StaffList_PositionLevel() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_StaffList_PositionLevel'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_StaffList_PositionLevel', '������ ���������', zc_Object_StaffList(), zc_Object_PositionLevel() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_StaffList_PositionLevel');

-- !!!zc_Object_Contract!!!
CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_Juridical() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_Juridical'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_Juridical', '����������� ����', zc_Object_Contract(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_JuridicalBasis() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_JuridicalBasis'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
UPDATE ObjectLinkDesc SET ItemName = '����������� ���� (�������)' WHERE Id = zc_ObjectLink_Contract_JuridicalBasis();
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_JuridicalBasis', '����������� ���� (�������)', zc_Object_Contract(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_JuridicalBasis');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_ContractKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_ContractKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_ContractKind', '���� ���������', zc_Object_Contract(), zc_Object_ContractKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_ContractKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_InfoMoney() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_InfoMoney'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_InfoMoney', '������ ����������', zc_Object_Contract(), zc_Object_InfoMoney() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_InfoMoney');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_PaidKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_PaidKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_PaidKind', '���� ���� ������', zc_Object_Contract(), zc_Object_PaidKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_PaidKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_Personal() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_Personal'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_Personal', '���������� (������������ ����)', zc_Object_Contract(), zc_Object_Personal() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_Personal');

-- CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_Area() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_Area'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
-- INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
--   SELECT 'zc_ObjectLink_Contract_Area', '������', zc_Object_Contract(), zc_Object_Area() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_Area');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_AreaContract() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_AreaContract'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_AreaContract', '������(�������)', zc_Object_Contract(), zc_Object_AreaContract() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_AreaContract');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_ContractArticle() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_ContractArticle'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_ContractArticle', '������� ��������', zc_Object_Contract(), zc_Object_ContractArticle() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_ContractArticle');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_ContractStateKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_ContractStateKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_ContractStateKind', '��������� ��������', zc_Object_Contract(), zc_Object_ContractStateKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_ContractStateKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_Bank() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_Bank'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_Bank', '����', zc_Object_Contract(), zc_Object_Bank() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_Bank');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_PersonalTrade() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_PersonalTrade'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_PersonalTrade', '���������� (��������)', zc_Object_Contract(), zc_Object_Personal() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_PersonalTrade');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_PersonalCollation() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_PersonalCollation'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_PersonalCollation', '���������� (������)', zc_Object_Contract(), zc_Object_Personal() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_PersonalCollation');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_BankAccount() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_BankAccount'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_BankAccount', '��������� �����(������ ���)', zc_Object_Contract(), zc_Object_BankAccount() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_BankAccount');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_ContractTag() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_ContractTag'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_ContractTag', '������� ��������', zc_Object_Contract(), zc_Object_ContractTag() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_ContractTag');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_ContractKey() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_ContractKey'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_ContractKey', '���� ��������', zc_Object_Contract(), zc_Object_ContractKey() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_ContractKey');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Contract_JuridicalDocument() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_JuridicalDocument'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Contract_JuridicalDocument', '����������� ����(������ ���.)', zc_Object_Contract(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Contract_JuridicalDocument');

--!!! ContractPartner
CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractPartner_Contract() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractPartner_Contract'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractPartner_Contract', '��������', zc_Object_ContractPartner(), zc_Object_Contract() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractPartner_Contract');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractPartner_Partner() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractPartner_Partner'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractPartner_Partner', '����������', zc_Object_ContractPartner(), zc_Object_Partner() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractPartner_Partner');

--
CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractCondition_ContractConditionKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractCondition_ContractConditionKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractCondition_ContractConditionKind', '��� ������� ��������', zc_Object_ContractCondition(), zc_Object_ContractConditionKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractCondition_ContractConditionKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractCondition_Contract() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractCondition_Contract'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractCondition_Contract', '�������', zc_Object_ContractCondition(), zc_Object_Contract() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractCondition_Contract');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractCondition_BonusKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractCondition_BonusKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractCondition_BonusKind', '�������', zc_Object_ContractCondition(), zc_Object_BonusKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractCondition_BonusKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractCondition_InfoMoney() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractCondition_InfoMoney'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractCondition_InfoMoney', '������ ����������', zc_Object_ContractCondition(), zc_Object_InfoMoney() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractCondition_InfoMoney');


-- !!!zc_Object_ContractKind!!!
CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractKind_AccountKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKind_AccountKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractKind_AccountKind', '���� ������', zc_Object_ContractKind(), zc_Object_AccountKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKind_AccountKind');

-- !!!zc_Object_ModelService!!!
CREATE OR REPLACE FUNCTION zc_ObjectLink_ModelService_ModelServiceKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelService_ModelServiceKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ModelService_ModelServiceKind', '���� ������ ����������', zc_Object_ModelService(), zc_Object_ModelServiceKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelService_ModelServiceKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ModelService_Unit() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelService_Unit'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ModelService_Unit', '�������������', zc_Object_ModelService(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelService_Unit');

-- !!!zc_Object_StaffListCost!!!
CREATE OR REPLACE FUNCTION zc_ObjectLink_StaffListCost_StaffList() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_StaffListCost_StaffList'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_StaffListCost_StaffList', '������� ����������', zc_Object_StaffListCost(), zc_Object_StaffList() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_StaffListCost_StaffList');

CREATE OR REPLACE FUNCTION zc_ObjectLink_StaffListCost_ModelService() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_StaffListCost_ModelService'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_StaffListCost_ModelService', '������� ����������', zc_Object_StaffListCost(), zc_Object_ModelService() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_StaffListCost_ModelService');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ModelServiceItemMaster_ModelService() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemMaster_ModelService'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ModelServiceItemMaster_ModelService', '������ ����������', zc_Object_ModelServiceItemMaster(), zc_Object_ModelService() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemMaster_ModelService');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ModelServiceItemMaster_From() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemMaster_From'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ModelServiceItemMaster_From', '�������������(�� ����)', zc_Object_ModelServiceItemMaster(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemMaster_From');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ModelServiceItemMaster_To() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemMaster_To'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ModelServiceItemMaster_To', '�������������(����)', zc_Object_ModelServiceItemMaster(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemMaster_To');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ModelServiceItemMaster_SelectKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemMaster_SelectKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ModelServiceItemMaster_SelectKind', '��� ������ ������', zc_Object_ModelServiceItemMaster(), zc_Object_Unit() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemMaster_SelectKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ModelServiceItemChild_From() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemChild_From'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ModelServiceItemChild_From', '�����(�� ����)', zc_Object_ModelServiceItemChild(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemChild_From');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ModelServiceItemChild_To() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemChild_To'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ModelServiceItemChild_To', '�����(����)', zc_Object_ModelServiceItemChild(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemChild_To');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ModelServiceItemChild_ModelServiceItemMaster() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemChild_ModelServiceItemMaster'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ModelServiceItemChild_ModelServiceItemMaster', 'C����� �� ������� �������', zc_Object_ModelServiceItemChild(), zc_Object_ModelServiceItemMaster() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ModelServiceItemChild_ModelServiceItemMaster');

CREATE OR REPLACE FUNCTION zc_Objectlink_StaffListSumm_StaffList() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_Objectlink_StaffListSumm_StaffList'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_Objectlink_StaffListSumm_StaffList', 'C����� �� ������� ����������', zc_Object_StaffListSumm(), zc_Object_StaffList() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_Objectlink_StaffListSumm_StaffList');

CREATE OR REPLACE FUNCTION zc_Objectlink_StaffListSumm_StaffListMaster() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_Objectlink_StaffListSumm_StaffListMaster'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_Objectlink_StaffListSumm_StaffListMaster', 'C����� �� ������� ����������', zc_Object_StaffListSumm(), zc_Object_StaffList() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_Objectlink_StaffListSumm_StaffListMaster');

CREATE OR REPLACE FUNCTION zc_Objectlink_StaffListSumm_StaffListSummKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_Objectlink_StaffListSumm_StaffListSummKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_Objectlink_StaffListSumm_StaffListSummKind', 'C����� �� ���� ���� ��� �������� ���������� 	', zc_Object_StaffListSumm(), zc_Object_StaffListSummKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_Objectlink_StaffListSumm_StaffListSummKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_RoleProcessAccess_Role() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleProcessAccess_Role'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_RoleProcessAccess_Role', '������ �� ���� � ����������� �������� �����', zc_Object_RoleProcessAccess(), zc_Object_Role() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleProcessAccess_Role');

CREATE OR REPLACE FUNCTION zc_ObjectLink_RoleProcessAccess_Process() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleProcessAccess_Process'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_RoleProcessAccess_Process', '������ �� ���� � ����������� �������� �����', zc_Object_RoleProcessAccess(), zc_Object_Process() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_RoleProcessAccess_Process');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractDocument_Contract() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractDocument_Contract'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ContractDocument_Contract', '������ �� ������� � ����������� ���������� ���������', zc_Object_ContractDocument(), zc_Object_Contract() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractDocument_Contract');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Maker_Country() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Maker_Country'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Maker_Country', '������ �� ������ � ����������� �������������(��)', zc_Object_Maker(), zc_Object_Country() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Maker_Country');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Asset_Juridical() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Asset_Juridical'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Asset_Juridical', '������ �� ����������� ���� � ����������� �������� ��������', zc_Object_Asset(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Asset_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Asset_Maker() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Asset_Maker'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Asset_Maker', '������ �� �������������(��) � ����������� �������� ��������', zc_Object_Asset(), zc_Object_Maker() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Asset_Maker');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ToolsWeighing_Parent() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ToolsWeighing_Parent'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ToolsWeighing_Parent', '����� ��������� ����������� � ��������� �����������', zc_Object_ToolsWeighing(), zc_Object_ToolsWeighing() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ToolsWeighing_Parent');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsKindWeighing_GoodsKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsKindWeighing_GoodsKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_GoodsKindWeighing_GoodsKind', '���� ��������', zc_Object_GoodsKindWeighing(), zc_Object_GoodsKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsKindWeighing_GoodsKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsKindWeighing_GoodsKindWeighingGroup() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsKindWeighing_GoodsKindWeighingGroup'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_GoodsKindWeighing_GoodsKindWeighingGroup', '����� ���� �������� ��� ����������� � ������ ����� �������� ��� �����������', zc_Object_GoodsKindWeighing(), zc_Object_GoodsKindWeighingGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsKindWeighing_GoodsKindWeighingGroup');

/****  ContractKey  ****/
CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractKey_JuridicalBasis() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_JuridicalBasis'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractKey_JuridicalBasis', '������ �� ������� ��. ���� � ����������� ���� ��������', zc_Object_ContractKey(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_JuridicalBasis');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractKey_Juridical() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_Juridical'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractKey_Juridical', '������ �� ����������� ���� � ����������� ���� ��������', zc_Object_ContractKey(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractKey_InfoMoney() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_InfoMoney'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractKey_InfoMoney', '������ �� ������ ���������� � ����������� ���� ��������', zc_Object_ContractKey(), zc_Object_InfoMoney() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_InfoMoney');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractKey_PaidKind() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_PaidKind'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractKey_PaidKind', '������ �� ���� ���� ������ � ����������� ���� ��������', zc_Object_ContractKey(), zc_Object_PaidKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_PaidKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractKey_Area() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_Area'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractKey_Area', '������ �� ������ � ����������� ���� ��������', zc_Object_ContractKey(), zc_Object_Area() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_Area');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractKey_ContractTag() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_ContractTag'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractKey_ContractTag', '������ �� ������� �������� � ����������� ���� ��������', zc_Object_ContractKey(), zc_Object_ContractTag() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_ContractTag');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContractKey_Contract() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_Contract'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContractKey_Contract', '������ �� ������� (!!!���������!!!) � ����������� ���� ��������', zc_Object_ContractKey(), zc_Object_Contract() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContractKey_Contract');


CREATE OR REPLACE FUNCTION zc_ObjectLink_Province_Region() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Province_Region'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Province_Region', '������ �� �������', zc_Object_Province(), zc_Object_Region() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Province_Region');

CREATE OR REPLACE FUNCTION zc_ObjectLink_City_CityKind() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_City_CityKind'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_City_CityKind', '������ �� ��� ����������� ������', zc_Object_City(), zc_Object_CityKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_City_CityKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_City_Region() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_City_Region'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_City_Region', '������ �� �������', zc_Object_City(), zc_Object_Region() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_City_Region');

CREATE OR REPLACE FUNCTION zc_ObjectLink_City_Province() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_City_Province'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_City_Province', '������ �� �����', zc_Object_City(), zc_Object_Province() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_City_Province');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ProvinceCity_City() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ProvinceCity_City'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ProvinceCity_City', '������ �� ���������� �����', zc_Object_ProvinceCity(), zc_Object_City() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ProvinceCity_City');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Street_StreetKind() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Street_StreetKind'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Street_StreetKind', '������ �� ���(�����,��������)', zc_Object_Street(), zc_Object_StreetKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Street_StreetKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Street_City() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Street_City'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Street_City', '������ �� ���������� �����', zc_Object_Street(), zc_Object_City() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Street_City');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Street_ProvinceCity() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Street_ProvinceCity'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_Street_ProvinceCity', '������ �� ����� � ���������� ������', zc_Object_Street(), zc_Object_ProvinceCity() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Street_ProvinceCity');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContactPerson_Object() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContactPerson_Object'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContactPerson_Object', '������ �� ������', zc_Object_ContactPerson(), NULL WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContactPerson_Object');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ContactPerson_ContactPersonKind() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContactPerson_ContactPersonKind'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ContactPerson_ContactPersonKind', '������ �� ��� ��������', zc_Object_ContactPerson(), zc_Object_ContactPersonKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ContactPerson_ContactPersonKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ArticleLoss_InfoMoney() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ArticleLoss_InfoMoney'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ArticleLoss_InfoMoney', '������ �� ������ ����������', zc_Object_ArticleLoss(), zc_Object_InfoMoney() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ArticleLoss_InfoMoney');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ArticleLoss_ProfitLossDirection() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ArticleLoss_ProfitLossDirection'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ArticleLoss_ProfitLossDirection', '������ �� ��������� ������ ������ � �������� � ������� - �����������', zc_Object_ArticleLoss(), zc_Object_ProfitLossDirection() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ArticleLoss_ProfitLossDirection');

CREATE OR REPLACE FUNCTION zc_ObjectLink_PersonalServiceList_Juridical() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PersonalServiceList_Juridical'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
  INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_PersonalServiceList_Juridical', '����� ��������� ���������� � �� �����', zc_Object_PersonalServiceList(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PersonalServiceList_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsQuality_Goods() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsQuality_Goods'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
  INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_GoodsQuality_Goods', '����� ��������� ������������� ������������� � �������', zc_Object_GoodsQuality(), zc_Object_Goods() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsQuality_Goods');


--!!! ������

CREATE OR REPLACE FUNCTION zc_ObjectLink_Goods_NDSKind() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_NDSKind'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Goods_NDSKind', '����� ������� � ����� ���', zc_Object_Goods(), zc_Object_NDSKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Goods_NDSKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportGroup_Object() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportGroup_Object'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportGroup_Object', '', zc_Object_ImportGroup(), NULL WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportGroup_Object');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportGroupItems_ImportSettings() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportGroupItems_ImportSettings'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportGroupItems_ImportSettings', '', zc_Object_ImportGroupItems(), zc_Object_ImportSettings() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportGroupItems_ImportSettings');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportGroupItems_ImportGroup() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportGroupItems_ImportGroup'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportGroupItems_ImportGroup', '', zc_Object_ImportGroupItems(), zc_Object_ImportGroup() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportGroupItems_ImportGroup');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportSettings_Contract() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettings_Contract'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportSettings_Contract', '����� � ���������', zc_Object_ImportSettings(), zc_Object_Contract() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettings_Contract');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportSettings_FileType() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettings_FileType'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportSettings_FileType', '����� � ����� �����', zc_Object_ImportSettings(), zc_Object_FileTypeKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettings_FileType');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportSettings_ImportType() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettings_ImportType'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportSettings_ImportType', '����� � ���� �������', zc_Object_ImportSettings(), zc_Object_ImportType() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettings_ImportType');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportSettings_Juridical() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettings_Juridical'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportSettings_Juridical', '����� � �� �����', zc_Object_ImportSettings(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettings_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportSettingsItems_ImportSettings() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettingsItems_ImportSettings'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportSettingsItems_ImportSettings', '����� � ��������� �������', zc_Object_ImportSettingsItems(), zc_Object_ImportSettings() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettingsItems_ImportSettings');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportSettingsItems_ImportTypeItems() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettingsItems_ImportTypeItems'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportSettingsItems_ImportTypeItems', '����� � ��������� ��������� �������', zc_Object_ImportSettingsItems(), zc_Object_ImportTypeItems() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportSettingsItems_ImportTypeItems');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportTypeItems_ImportSettings() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportTypeItems_ImportSettings'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_ImportTypeItems_ImportSettings', '����� � ��������� ��������� �������', zc_Object_ImportTypeItems(), zc_Object_ImportSettings() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportTypeItems_ImportSettings');

CREATE OR REPLACE FUNCTION zc_ObjectLink_ImportTypeItems_ImportType() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportTypeItems_ImportType'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_ImportTypeItems_ImportType', '������ �� ��� �������', zc_Object_ImportTypeItems(), zc_Object_ImportType() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_ImportTypeItems_ImportType');

CREATE OR REPLACE FUNCTION zc_ObjectLink_JuridicalSettings_Juridical() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_JuridicalSettings_Juridical'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_JuridicalSettings_Juridical', '������ �� ����������� ����', zc_Object_JuridicalSettings(), zc_Object_Juridical() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_JuridicalSettings_Juridical');

CREATE OR REPLACE FUNCTION zc_ObjectLink_JuridicalSettings_Retail() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_JuridicalSettings_Retail'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_JuridicalSettings_Retail', '������ �� �������� ����', zc_Object_JuridicalSettings(), zc_Object_Retail() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_JuridicalSettings_Retail');

CREATE OR REPLACE FUNCTION zc_ObjectLink_PriceGroupSettings_Retail() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PriceGroupSettings_Retail'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
  SELECT 'zc_ObjectLink_PriceGroupSettings_Retail', '������ �� �������� ����', zc_Object_PriceGroupSettings(), zc_Object_Retail() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PriceGroupSettings_Retail');

CREATE OR REPLACE FUNCTION zc_ObjectLink_CorrespondentAccount_BankAccount() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CorrespondentAccount_BankAccount'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_CorrespondentAccount_BankAccount', '������� ����, ��� �������� ������ ����������������� ����', zc_Object_CorrespondentAccount(), zc_Object_BankAccount() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CorrespondentAccount_BankAccount');

CREATE OR REPLACE FUNCTION zc_ObjectLink_CorrespondentAccount_Bank() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CorrespondentAccount_Bank'); END; $BODY$ LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_CorrespondentAccount_Bank', '	� ����� ����� ��������� ����������������� ����', zc_Object_CorrespondentAccount(), zc_Object_Bank() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_CorrespondentAccount_Bank');


--------------------------- !!!!!!!!!!!!!!!!!!!!!!!!!
--------------------------- !!! ��������� ������� !!!
--------------------------- !!!!!!!!!!!!!!!!!!!!!!!!!

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner1CLink_Partner() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner1CLink_Partner'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Partner1CLink_Partner', '������ �� ����� �������� � ������� ����� ����� �������� � ����� � 1�', zc_Object_Partner1CLink(), zc_Object_Partner() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner1CLink_Partner');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Partner1CLink_Branch() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner1CLink_Branch'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Partner1CLink_Branch', '������ �� ������ � ������� ����� ����� �������� � ����� � 1�', zc_Object_Partner1CLink(), zc_Object_Branch() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Partner1CLink_Branch');


CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsByGoodsKind1CLink_Branch() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsByGoodsKind1CLink_Branch'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsByGoodsKind1CLink_Branch', '', zc_Object_GoodsByGoodsKind1CLink(), zc_Object_Branch() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsByGoodsKind1CLink_Branch');

CREATE OR REPLACE FUNCTION zc_ObjectLink_GoodsByGoodsKind1CLink_GoodsByGoodsKind() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsByGoodsKind1CLink_GoodsByGoodsKind'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc(Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_GoodsByGoodsKind1CLink_GoodsByGoodsKind', '', zc_Object_GoodsByGoodsKind1CLink(), zc_Object_GoodsByGoodsKind() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_GoodsByGoodsKind1CLink_GoodsByGoodsKind');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Protocol_Insert() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Protocol_Insert'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Protocol_Insert', '������������ (��������)', zc_Object_Contract(), zc_Object_User() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Protocol_Insert');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Protocol_Update() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Protocol_Update'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Protocol_Update', '������������ (�������������)', zc_Object_Contract(), zc_Object_User() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Protocol_Update');

CREATE OR REPLACE FUNCTION zc_ObjectLink_Founder_InfoMoney() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Founder_InfoMoney'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_Founder_InfoMoney', '�� ������ ����������', zc_Object_Founder(), zc_Object_InfoMoney() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_Founder_InfoMoney');

CREATE OR REPLACE FUNCTION zc_ObjectLink_PriceList_Currency() RETURNS Integer AS $BODY$BEGIN  RETURN (SELECT Id FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PriceList_Currency'); END; $BODY$  LANGUAGE PLPGSQL IMMUTABLE;
INSERT INTO ObjectLinkDesc (Code, ItemName, DescId, ChildObjectDescId)
SELECT 'zc_ObjectLink_PriceList_Currency', '������', zc_Object_PriceList(), zc_Object_Currency() WHERE NOT EXISTS (SELECT * FROM ObjectLinkDesc WHERE Code = 'zc_ObjectLink_PriceList_Currency');


/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 16.01.15         * add zc_ObjectLink_ContractPartner_Contract
                        zc_ObjectLink_ContractPartner_Partner
 12.01.15         * add zc_ObjectLink_GoodsTag_GoodsGroupAnalyst
 17.12.14         * add zc_ObjectLink_Car_Juridical
 08.12.14         * add zc_ObjectLink_GoodsQuality_Goods
 16.11.14                                        * add zc_ObjectLink_PriceList_Currency
 10.11.14         * add redmine zc_Object_Partner
 08.11.14                                        * add zc_ObjectLink_Unit_HistoryCost
 13.10.14                                                        *
 30.09.14         * add zc_ObjectLink_PersonalServiceList_Juridical
 23.09.14                         *
 20.09.14                                        * add zc_ObjectLink_Founder_InfoMoney
 01.09.14         * add zc_ObjectLink_ArticleLoss_InfoMoney
 26.07.14                      	                 * add zc_ObjectLink_PartionGoods_Storage and zc_ObjectLink_PartionGoods_Unit
 31.05.14         * add
 25.04.14         * add ��-�� ��� zc_Object_BankAccountContract
 25.03.14                                                        * + zc_Object_GoodsKindWeighingGroup
 21.03.14                                                        * + zc_ObjectLink_GoodsKindWeighing_GoodsKind
 12.03.14                                                        * + zc_ObjectLink_ToolsWeighing_Parent

 25.02.14                                         * add zc_ObjectLink_Protocol_...
 12.01.14         * add zc_ObjectLink_Partner_PriceList, zc_ObjectLink_Partner_PriceListPromo
                        zc_ObjectLink_Juridical_PriceList, zc_ObjectLink_Juridical_PriceListPromo
 28.12.13                                        * add zc_ObjectLink_Contract_JuridicalBasis
 28.12.13                                        * rename to zc_ObjectLink_Cash_JuridicalBasis
 22.12.13                                        * add zc_ObjectLink_ContractKind_AccountKind
 13.12.13         * add zc_ObjectLink_Route_Branch
 23.11.13                                        * err zc_Objectlink_StaffListSumm_StaffListMaster
 21.11.13                                        * add zc_ObjectLink_Personal_PositionLevel
 30.10.13         * add zc_Objectlink_StaffListSumm_StaffList, zc_Objectlink_StaffListSumm_StaffListMaster, zc_Objectlink_StaffListSumm_StaffListSummKind
 22.10.13         * add zc_ObjectLink_ModelServiceItemChild_ModelServiceItemMaster
 20.10.13                                        * add zc_ObjectLink_Contract_ContractKind and zc_ObjectLink_Contract_PaidKind
 19.10.13         * add zc_ObjectLink_ModelService_ModelServiceKind,       zc_ObjectLink_ModelService_Unit,
                        zc_ObjectLink_StaffListCost_StaffList,             zc_ObjectLink_StaffListCost_ModelService
                        zc_ObjectLink_ModelServiceItemMaster_ModelService, zc_ObjectLink_ModelServiceItemMaster_From,
                        zc_ObjectLink_ModelServiceItemMaster_To,           zc_ObjectLink_ModelServiceItemMaster_SelectKind
 19.10.13                                        * add zc_ObjectLink_Contract_Juridical
 17.10.13         * add _StaffList_Unit,_StaffList_Position, _PositionLevel
 14.10.13         * add _CardFuel_PersonalDriver, _CardFuel_Car, _CardFuel_PaidKind, _CardFuel_Juridical, _CardFuel_Goods  , _TicketFuel_Goods
 29.09.13         * add zc_ObjectLink_PersonalGroup_Unit
 01.09.13                                        * add zc_ObjectLink_Goods_Fuel
 26.09.13         * add zc_ObjectLink_Fuel_RateFuelKind,  del Car_RateFuelKind, RateFuel_RateFuelKind
 24.09.13         * add  _Route_Unit, _Route_RouteKind, _Route_Freight
                       , _RateFuel_Car, _RateFuel_RouteKind, _RateFuel_RateFuelKind
                       , _Car_Unit, _Car_PersonalDriver, _Car_FuelMaster, _Car_FuelChild, _Car_RateFuelKind
 07.09.13                                        * add zc_ObjectLink_Contract_InfoMoney
 01.09.13                                        * add zc_ObjectLink_Goods_Business
 27.08.13         * ����� ����� 2
 28.06.13                                        * ����� �����
*/