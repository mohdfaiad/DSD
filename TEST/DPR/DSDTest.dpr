program DSDTest;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  dbCreateStructureTest in '..\SOURCE\STRUCTURE\dbCreateStructureTest.pas',
  dbMetadataTest in '..\SOURCE\Metadata\dbMetadataTest.pas',
  dbProcedureTest in '..\SOURCE\dbProcedureTest.pas',
  dbEnumTest in '..\SOURCE\dbEnumTest.pas',
  AuthenticationTest in '..\SOURCE\AuthenticationTest.pas',
  CommonObjectProcedureTest in '..\SOURCE\Objects\CommonObjectProcedureTest.pas',
  dbObjectTest in '..\SOURCE\dbObjectTest.pas',
  UnitsTest in '..\SOURCE\Objects\All\UnitsTest.pas',
  CommonMovementProcedureTest in '..\SOURCE\Movement\CommonMovementProcedureTest.pas',
  dbMovementTest in '..\SOURCE\Movement\dbMovementTest.pas',
  LoadFormTest in '..\SOURCE\LoadFormTest.pas',
  Forms,
  CommonContainerProcedureTest in '..\SOURCE\Container\CommonContainerProcedureTest.pas',
  CommonMovementItemProcedureTest in '..\SOURCE\MovementItem\CommonMovementItemProcedureTest.pas',
  CommonMovementItemContainerProcedureTest in '..\SOURCE\MovementItemContainer\CommonMovementItemContainerProcedureTest.pas',
  CommonObjectHistoryProcedureTest in '..\SOURCE\ObjectHistory\CommonObjectHistoryProcedureTest.pas',
  CommonProtocolProcedureTest in '..\SOURCE\Protocol\CommonProtocolProcedureTest.pas',
  CommonFunctionTest in '..\SOURCE\Function\CommonFunctionTest.pas',
  CommonReportsProcedureTest in '..\SOURCE\Reports\CommonReportsProcedureTest.pas',
  DataModul in '..\..\SOURCE\DataModul.pas' {dmMain: TDataModule},
  Authentication in '..\..\SOURCE\Authentication.pas',
  Storage in '..\..\SOURCE\Storage.pas',
  zLibUtil in '..\SOURCE\zLibUtil.pas',
  UtilConst in '..\..\SOURCE\UtilConst.pas',
  UtilConvert in '..\..\SOURCE\UtilConvert.pas',
  CommonData in '..\..\SOURCE\CommonData.pas',
  dsdGuides in '..\..\SOURCE\COMPONENT\dsdGuides.pas',
  FormStorage in '..\..\SOURCE\FormStorage.pas',
  GoodsKindEdit in '..\..\Forms\GoodsKindEdit.pas' {GoodsKindEditForm},
  GoodsPropertyEdit in '..\..\Forms\GoodsPropertyEdit.pas' {GoodsPropertyEditForm},
  GoodsProperty in '..\..\Forms\GoodsProperty.pas' {GoodsPropertyForm},
  CurrencyEdit in '..\..\Forms\CurrencyEdit.pas' {CurencyEditForm},
  GoodsGroupEdit in '..\..\Forms\GoodsGroupEdit.pas' {GoodsGroupEditForm},
  PriceListEdit in '..\..\Forms\PriceListEdit.pas' {PriceListEditForm},
  PriceList in '..\..\Forms\PriceList.pas' {PriceListForm},
  ParentForm in '..\..\SOURCE\ParentForm.pas' {ParentForm},
  dsdAction in '..\..\SOURCE\COMPONENT\dsdAction.pas',
  GoodsKind in '..\..\Forms\GoodsKind.pas' {GoodsKindForm},
  Bank in '..\..\Forms\Bank.pas' {CurrencyForm},
  GoodsGroup in '..\..\Forms\GoodsGroup.pas' {GoodsGroupForm},
  JuridicalGroup in '..\..\Forms\JuridicalGroup.pas' {JuridicalGroupForm},
  PartnerEdit in '..\..\Forms\PartnerEdit.pas' {PartnerEditForm},
  GoodsEdit in '..\..\Forms\GoodsEdit.pas' {GoodsEditForm},
  Goods in '..\..\Forms\Goods.pas' {GoodsForm},
  UnitEdit in '..\..\Forms\UnitEdit.pas' {UnitEditForm},
  MeasureEdit in '..\..\Forms\MeasureEdit.pas' {MeasureEditForm},
  PaidKind in '..\..\Forms\PaidKind.pas' {PaidKindForm},
  Partner in '..\..\Forms\Partner.pas' {PartnerForm},
  CashEdit in '..\..\Forms\CashEdit.pas' {CashEditForm},
  Cash in '..\..\Forms\Cash.pas' {CashForm},
  Currency in '..\..\Forms\Currency.pas' {CurrencyForm},
  BankEdit in '..\..\Forms\BankEdit.pas' {BankEditForm},
  BranchEdit in '..\..\Forms\BranchEdit.pas' {BranchEditForm},
  Branch in '..\..\Forms\Branch.pas' {BranchForm},
  PriceListGoodsItem in '..\..\Forms\PriceListGoodsItem.pas' {PriceListGoodsItemForm},
  GoodsPropertyValue in '..\..\Forms\GoodsPropertyValue.pas' {GoodsPropertyValueForm},
  ContractKindEdit in '..\..\Forms\ContractKindEdit.pas' {ContractKindEditForm},
  ContractKind in '..\..\Forms\ContractKind.pas' {ContractKindForm},
  GoodsPropertyValueEdit in '..\..\Forms\GoodsPropertyValueEdit.pas' {GoodsPropertyValueEditForm},
  BankAccount in '..\..\Forms\BankAccount.pas' {BankAccountForm},
  BankAccountEdit in '..\..\Forms\BankAccountEdit.pas' {BankAccountEditForm},
  BusinessEdit in '..\..\Forms\BusinessEdit.pas' {BusinessEditForm},
  Business in '..\..\Forms\Business.pas' {BusinessForm},
  JuridicalEdit in '..\..\Forms\JuridicalEdit.pas' {JuridicalEditForm},
  Juridical in '..\..\Forms\Juridical.pas' {JuridicalForm},
  dsdDB in '..\..\SOURCE\COMPONENT\dsdDB.pas',
  Units in '..\..\Forms\Units.pas' {UnitForm},
  dbMovementItemTest in '..\SOURCE\dbMovementItemTest.pas',
  Income in '..\..\Forms\Income.pas' {IncomeForm},
  IncomeJournal in '..\..\Forms\IncomeJournal.pas' {ParentForm2},
  dsdAddOn in '..\..\SOURCE\COMPONENT\dsdAddOn.pas',
  dbMovementCompleteTest in '..\SOURCE\dbMovementCompleteTest.pas',
  Report_Balance in '..\..\Forms\Report\Report_Balance.pas' {Report_BalanceForm},
  LoadReportTest in '..\SOURCE\LoadReportTest.pas',
  PriceListItemTest in '..\SOURCE\ObjectHistory\All\PriceListItemTest.pas',
  InfoMoneyGroup in '..\..\Forms\InfoMoneyGroup.pas' {InfoMoneyGroupForm},
  InfoMoneyGroupEdit in '..\..\Forms\InfoMoneyGroupEdit.pas' {InfoMoneyGroupEditForm},
  InfoMoneyDestination in '..\..\Forms\InfoMoneyDestination.pas' {InfoMoneyDestinationForm},
  InfoMoneyDestinationEdit in '..\..\Forms\InfoMoneyDestinationEdit.pas' {InfoMoneyDestinationEditForm},
  InfoMoney in '..\..\Forms\InfoMoney.pas' {InfoMoneyForm},
  InfoMoneyEdit in '..\..\Forms\InfoMoneyEdit.pas' {InfoMoneyEditForm},
  AccountGroup in '..\..\Forms\AccountGroup.pas' {AccountGroupForm},
  AccountGroupEdit in '..\..\Forms\AccountGroupEdit.pas' {AccountGroupEditForm},
  AccountDirection in '..\..\Forms\AccountDirection.pas' {AccountDirectionForm},
  AccountDirectionEdit in '..\..\Forms\AccountDirectionEdit.pas' {AccountDirectionEditForm},
  ProfitLossGroup in '..\..\Forms\ProfitLossGroup.pas' {ProfitLossGroupForm},
  ProfitLossGroupEdit in '..\..\Forms\ProfitLossGroupEdit.pas' {ProfitLossGroupEditForm},
  Account in '..\..\Forms\Account.pas' {AccountForm},
  AccountEdit in '..\..\Forms\AccountEdit.pas' {AccountEditForm},
  ProfitLoss in '..\..\Forms\ProfitLoss.pas' {ProfitLossForm},
  ProfitLossDirection in '..\..\Forms\ProfitLossDirection.pas' {ProfitLossDirectionForm},
  ProfitLossDirectionEdit in '..\..\Forms\ProfitLossDirectionEdit.pas' {ProfitLossDirectionEditForm},
  ProfitLossEdit in '..\..\Forms\ProfitLossEdit.pas' {ProfitLossEditForm},
  dbTest in '..\SOURCE\dbTest.pas',
  TradeMark in '..\..\Forms\TradeMark.pas' {TradeMarkForm},
  TradeMarkEdit in '..\..\Forms\TradeMarkEdit.pas' {TradeMarkEditForm},
  Asset in '..\..\Forms\Asset.pas' {AssetForm},
  Route in '..\..\Forms\Route.pas' {RouteForm},
  RouteEdit in '..\..\Forms\RouteEdit.pas' {RouteEditForm},
  RouteSorting in '..\..\Forms\RouteSorting.pas' {RouteSortingForm},
  RouteSortingEdit in '..\..\Forms\RouteSortingEdit.pas' {RouteSortingEditForm},
  Member in '..\..\Forms\Member.pas' {MemberForm},
  MemberEdit in '..\..\Forms\MemberEdit.pas' {MemberEditForm},
  CarModel in '..\..\Forms\CarModel.pas' {CarModelForm},
  CarModelEdit in '..\..\Forms\CarModelEdit.pas' {CarModelEditForm},
  Car in '..\..\Forms\Car.pas' {CarForm},
  CarEdit in '..\..\Forms\CarEdit.pas' {CarEditForm},
  Position in '..\..\Forms\Position.pas' {PositionForm},
  PositionEdit in '..\..\Forms\PositionEdit.pas' {PositionEditForm},
  AssetEdit in '..\..\Forms\AssetEdit.pas' {AssetEditForm},
  Personal in '..\..\Forms\Personal.pas' {PersonalForm},
  PersonalEdit in '..\..\Forms\PersonalEdit.pas' {PersonalEditForm},
  SendJournal in '..\..\Forms\SendJournal.pas' {SendJournalForm},
  Send in '..\..\Forms\Send.pas' {SendForm},
  SaleJournal in '..\..\Forms\SaleJournal.pas' {SaleJournalForm},
  Sale in '..\..\Forms\Sale.pas' {SaleForm},
  ReturnOutJournal in '..\..\Forms\ReturnOutJournal.pas' {ReturnOutJournalForm},
  ReturnOut in '..\..\Forms\ReturnOut.pas' {ReturnOutForm},
  JuridicalGroupEdit in '..\..\Forms\JuridicalGroupEdit.pas' {JuridicalGroupEditForm},
  JuridicalTest in '..\SOURCE\Objects\All\JuridicalTest.pas',
  SendOnPriceJournal in '..\..\Forms\SendOnPriceJournal.pas' {SendOnPriceJournalForm},
  SendOnPrice in '..\..\Forms\SendOnPrice.pas' {SendOnPriceForm},
  ReturnInJournal in '..\..\Forms\ReturnInJournal.pas' {ReturnInJournalForm},
  ReturnIn in '..\..\Forms\ReturnIn.pas' {ReturnInForm},
  LossJournal in '..\..\Forms\LossJournal.pas' {LossJournalForm},
  Loss in '..\..\Forms\Loss.pas' {LossForm},
  InventoryJournal in '..\..\Forms\InventoryJournal.pas' {InventoryJournalForm},
  Inventory in '..\..\Forms\Inventory.pas' {InventoryForm},
  ProductionSeparateJournal in '..\..\Forms\ProductionSeparateJournal.pas' {ProductionSeparateJournalForm},
  ProductionUnionJournal in '..\..\Forms\ProductionUnionJournal.pas' {ProductionUnionJournalForm},
  Report_ProfitLoss in '..\..\Forms\Report\Report_ProfitLoss.pas' {Report_ProfitLossForm},
  Report_HistoryCost in '..\..\Forms\Report\Report_HistoryCost.pas' {Report_HistoryCostForm},
  ProductionUnion in '..\..\Forms\ProductionUnion.pas' {ProductionUnionForm},
  ProductionSeparate in '..\..\Forms\ProductionSeparate.pas' {ProductionSeparateForm},
  Contract in '..\..\Forms\Contract.pas' {ContractForm},
  ContractEdit in '..\..\Forms\ContractEdit.pas' {ContractEditForm},
  Measure in '..\..\Forms\Measure.pas' {MeasureForm},
  PriceListItem in '..\..\Forms\PriceListItem.pas' {PriceListItemForm},
  ComponentActionTest in '..\SOURCE\Component\ComponentActionTest.pas',
  ComponentDBTest in '..\SOURCE\Component\ComponentDBTest.pas',
  CashOperationTest in '..\SOURCE\Movement\All\CashOperationTest.pas',
  ZakazExternalJournal in '..\..\Forms\ZakazExternalJournal.pas' {ZakazExternalJournalForm},
  ZakazExternal in '..\..\Forms\ZakazExternal.pas' {ZakazExternalForm},
  ZakazInternalJournal in '..\..\Forms\ZakazInternalJournal.pas' {ZakazInternalJournalForm},
  ZakazInternal in '..\..\Forms\ZakazInternal.pas' {ZakazInternalForm},
  CommonObjectCostProcedureTest in '..\SOURCE\ObjectCost\CommonObjectCostProcedureTest.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
  DUnitTestRunner.RunRegisteredTests;
end.

