program BoutiqueTest;

uses
  Forms,
  DUnitTestRunner,
  SysUtils,
  dbCreateStructureTest in '..\SOURCEBoutique\STRUCTURE\dbCreateStructureTest.pas',
  dbMetadataTest in '..\SOURCEBoutique\METADATA\dbMetadataTest.pas',
  zLibUtil in '..\SOURCEBoutique\zLibUtil.pas',
  CommonFunctionTest in '..\SOURCEBoutique\Function\CommonFunctionTest.pas',
  dbBoutiqueProcedureTest in '..\SOURCEBoutique\dbBoutiqueProcedureTest.pas',
  UtilConst in '..\SOURCEBoutique\UtilConst.pas',
  dbEnumTest in '..\SOURCEBoutique\dbEnumTest.pas',
  ProcessTest in '..\SOURCEBoutique\Process\ProcessTest.pas',
  dbCreateViewTest in '..\SOURCEBoutique\View\dbCreateViewTest.pas',
  DefaultsTest in '..\SOURCEBoutique\Defaults\DefaultsTest.pas',
  LoadBoutiqueFormTest in '..\SOURCEBoutique\LoadBoutiqueFormTest.pas',
  CommonData in '..\..\SOURCE\CommonData.pas',
  Authentication in '..\..\SOURCE\Authentication.pas',
  FormStorage in '..\..\SOURCE\FormStorage.pas',
  ParentForm in '..\..\SOURCE\ParentForm.pas' {ParentForm},
  Storage in '..\..\SOURCE\Storage.pas',
  UtilConvert in '..\..\SOURCE\UtilConvert.pas',
  dsdAction in '..\..\SOURCE\COMPONENT\dsdAction.pas',
  dsdAddOn in '..\..\SOURCE\COMPONENT\dsdAddOn.pas',
  dsdDB in '..\..\SOURCE\COMPONENT\dsdDB.pas',
  dsdGuides in '..\..\SOURCE\COMPONENT\dsdGuides.pas',
  DataModul in '..\..\SOURCE\DataModul.pas' {dmMain: TDataModule},
  dbTest in '..\SOURCEBoutique\dbTest.pas',
  ChoicePeriod in '..\..\SOURCE\COMPONENT\ChoicePeriod.pas' {PeriodChoiceForm},
  Defaults in '..\..\SOURCE\COMPONENT\Defaults.pas',
  UnilWin in '..\..\SOURCE\UnilWin.pas',
  MessagesUnit in '..\..\SOURCE\MessagesUnit.pas' {MessagesForm},
  SimpleGauge in '..\..\SOURCE\SimpleGauge.pas' {SimpleGaugeForm},
  ClientBankLoad in '..\..\SOURCE\COMPONENT\ClientBankLoad.pas',
  Document in '..\..\SOURCE\COMPONENT\Document.pas',
  ExternalLoad in '..\..\SOURCE\COMPONENT\ExternalLoad.pas',
  Log in '..\..\SOURCE\Log.pas',
  ExternalData in '..\..\SOURCE\COMPONENT\ExternalData.pas',
  ExternalSave in '..\..\SOURCE\COMPONENT\ExternalSave.pas',
  VKDBFDataSet in '..\..\SOURCE\DBF\VKDBFDataSet.pas',
  VKDBFPrx in '..\..\SOURCE\DBF\VKDBFPrx.pas',
  VKDBFUtil in '..\..\SOURCE\DBF\VKDBFUtil.pas',
  VKDBFMemMgr in '..\..\SOURCE\DBF\VKDBFMemMgr.pas',
  VKDBFCrypt in '..\..\SOURCE\DBF\VKDBFCrypt.pas',
  VKDBFGostCrypt in '..\..\SOURCE\DBF\VKDBFGostCrypt.pas',
  VKDBFCDX in '..\..\SOURCE\DBF\VKDBFCDX.pas',
  VKDBFIndex in '..\..\SOURCE\DBF\VKDBFIndex.pas',
  VKDBFSorters in '..\..\SOURCE\DBF\VKDBFSorters.pas',
  VKDBFCollate in '..\..\SOURCE\DBF\VKDBFCollate.pas',
  VKDBFParser in '..\..\SOURCE\DBF\VKDBFParser.pas',
  VKDBFNTX in '..\..\SOURCE\DBF\VKDBFNTX.pas',
  VKDBFSortedList in '..\..\SOURCE\DBF\VKDBFSortedList.pas',
  ObjectTest in '..\SOURCEBoutique\Objects\ObjectTest.pas',
  cxGridAddOn in '..\..\SOURCE\DevAddOn\cxGridAddOn.pas',
  MeDOC in '..\..\SOURCE\MeDOC\MeDOC.pas',
  MeDocXML in '..\..\SOURCE\MeDOC\MeDocXML.pas',
  Measure in '..\..\FormsBoutique\Guides\Measure.pas' {MeasureForm: TParentForm},
  MeasureEdit in '..\..\FormsBoutique\Guides\MeasureEdit.pas' {MeasureEditForm: TParentForm},
  CompositionGroup in '..\..\FormsBoutique\Guides\CompositionGroup.pas' {CompositionGroupForm: TParentForm},
  CompositionGroupEdit in '..\..\FormsBoutique\Guides\CompositionGroupEdit.pas' {CompositionGroupEditForm: TParentForm},
  Composition in '..\..\FormsBoutique\Guides\Composition.pas' {CompositionForm: TParentForm},
  CompositionEdit in '..\..\FormsBoutique\Guides\CompositionEdit.pas' {CompositionEditForm: TParentForm},
  CountryBrand in '..\..\FormsBoutique\Guides\CountryBrand.pas' {CountryBrandForm: TParentForm},
  CountryBrandEdit in '..\..\FormsBoutique\Guides\CountryBrandEdit.pas' {CountryBrandEditForm: TParentForm},
  Brand in '..\..\FormsBoutique\Guides\Brand.pas' {BrandForm: TParentForm},
  BrandEdit in '..\..\FormsBoutique\Guides\BrandEdit.pas' {BrandEditForm: TParentForm},
  Fabrika in '..\..\FormsBoutique\Guides\Fabrika.pas' {FabrikaForm: TParentForm},
  FabrikaEdit in '..\..\FormsBoutique\Guides\FabrikaEdit.pas' {FabrikaEditForm: TParentForm},
  LineFabrica in '..\..\FormsBoutique\Guides\LineFabrica.pas' {LineFabricaForm: TParentForm},
  LineFabricaEdit in '..\..\FormsBoutique\Guides\LineFabricaEdit.pas' {LineFabricaEditForm: TParentForm},
  GoodsInfo in '..\..\FormsBoutique\Guides\GoodsInfo.pas' {GoodsInfoForm: TParentForm},
  GoodsInfoEdit in '..\..\FormsBoutique\Guides\GoodsInfoEdit.pas' {GoodsInfoEditForm: TParentForm},
  GoodsSize in '..\..\FormsBoutique\Guides\GoodsSize.pas' {GoodsSizeForm: TParentForm},
  GoodsSizeEdit in '..\..\FormsBoutique\Guides\GoodsSizeEdit.pas' {GoodsSizeEditForm: TParentForm},
  GoodsGroup in '..\..\FormsBoutique\Guides\GoodsGroup.pas' {GoodsGroupForm: TParentForm},
  GoodsGroupEdit in '..\..\FormsBoutique\Guides\GoodsGroupEdit.pas' {GoodsGroupEditForm: TParentForm},
  GoodsGroup_Object in '..\..\FormsBoutique\Guides\GoodsGroup_Object.pas' {GoodsGroup_ObjectForm: TParentForm},
  Cash in '..\..\FormsBoutique\Guides\Cash.pas' {CashForm: TParentForm},
  CashEdit in '..\..\FormsBoutique\Guides\CashEdit.pas' {CashEditForm: TParentForm},
  Currency in '..\..\FormsBoutique\Guides\Currency.pas' {CurrencyForm: TParentForm},
  CurrencyEdit in '..\..\FormsBoutique\Guides\CurrencyEdit.pas' {CurrencyEditForm: TParentForm},
  Member in '..\..\FormsBoutique\Guides\Member.pas' {MemberForm: TParentForm},
  MemberEdit in '..\..\FormsBoutique\Guides\MemberEdit.pas' {MemberEditForm: TParentForm},
  Period in '..\..\FormsBoutique\Guides\Period.pas' {PeriodForm: TParentForm},
  PeriodEdit in '..\..\FormsBoutique\Guides\PeriodEdit.pas' {PeriodEditForm: TParentForm},
  Discount in '..\..\FormsBoutique\Guides\Discount.pas' {DiscountForm: TParentForm},
  DiscountEdit in '..\..\FormsBoutique\Guides\DiscountEdit.pas' {DiscountEditForm: TParentForm},
  DiscountTools in '..\..\FormsBoutique\Guides\DiscountTools.pas' {DiscountToolsForm: TParentForm},
  DiscountToolsEdit in '..\..\FormsBoutique\Guides\DiscountToolsEdit.pas' {DiscountToolsEditForm: TParentForm},
  Partner in '..\..\FormsBoutique\Guides\Partner.pas' {PartnerForm: TParentForm},
  PartnerEdit in '..\..\FormsBoutique\Guides\PartnerEdit.pas' {PartnerEditForm: TParentForm},
  JuridicalGroup in '..\..\FormsBoutique\Guides\JuridicalGroup.pas' {JuridicalGroupForm: TParentForm},
  JuridicalGroupEdit in '..\..\FormsBoutique\Guides\JuridicalGroupEdit.pas' {JuridicalGroupEditForm: TParentForm},
  JuridicalGroup_Object in '..\..\FormsBoutique\Guides\JuridicalGroup_Object.pas' {JuridicalGroup_ObjectForm: TParentForm},
  Juridical in '..\..\FormsBoutique\Guides\Juridical.pas' {JuridicalForm: TParentForm},
  JuridicalEdit in '..\..\FormsBoutique\Guides\JuridicalEdit.pas' {JuridicalEditForm: TParentForm},
  JuridicalBasis in '..\..\FormsBoutique\Guides\JuridicalBasis.pas' {JuridicalBasis: TParentForm},
  Units in '..\..\FormsBoutique\Guides\Units.pas' {UnitsForm: TParentForm},
  UnitEdit in '..\..\FormsBoutique\Guides\UnitEdit.pas' {UnitsEditForm: TParentForm},
  Unit_Object in '..\..\FormsBoutique\Guides\Unit_Object.pas' {UnitsEditForm: TParentForm},
  City in '..\..\FormsBoutique\Guides\City.pas' {CityForm: TParentForm},
  CityEdit in '..\..\FormsBoutique\Guides\CityEdit.pas' {CityEditForm: TParentForm},
  Client in '..\..\FormsBoutique\Guides\Client.pas' {ClientForm: TParentForm},
  ClientEdit in '..\..\FormsBoutique\Guides\ClientEdit.pas' {ClientEditForm: TParentForm},
  Labels in '..\..\FormsBoutique\Guides\Labels.pas' {LabelForm: TParentForm},
  LabelEdit in '..\..\FormsBoutique\Guides\LabelEdit.pas' {LabelEditForm: TParentForm},
  Goods in '..\..\FormsBoutique\Guides\Goods.pas' {GoodsForm: TParentForm},
  GoodsEdit in '..\..\FormsBoutique\Guides\GoodsEdit.pas' {GoodsEditForm: TParentForm},
  GoodsTree in '..\..\FormsBoutique\Guides\GoodsTree.pas' {GoodsTreeForm: TParentForm},
  DiscountKind in '..\..\FormsBoutique\Guides\DiscountKind.pas' {DiscountKindForm: TParentForm},
  GoodsItem in '..\..\FormsBoutique\Guides\GoodsItem.pas' {GoodsItemForm: TParentForm},
  GoodsItemEdit in '..\..\FormsBoutique\Guides\GoodsItemEdit.pas' {GoodsItemEditForm: TParentForm},
  Position in '..\..\FormsBoutique\Guides\Position.pas' {PositionForm: TParentForm},
  PositionEdit in '..\..\FormsBoutique\Guides\PositionEdit.pas' {PositionEditForm: TParentForm},
  Personal in '..\..\FormsBoutique\Guides\Personal.pas' {PersonalForm: TParentForm},
  PersonalEdit in '..\..\FormsBoutique\Guides\PersonalEdit.pas' {PersonalEditForm: TParentForm},
  ImportExportLinkType in '..\..\Forms\Kind\ImportExportLinkType.pas' {ImportExportLinkTypeForm: TParentForm},
  AncestorBase in '..\..\Forms\Ancestor\AncestorBase.pas' {AncestorBaseForm: TParentForm},
  AncestorData in '..\..\Forms\Ancestor\AncestorData.pas' {AncestorDataForm: TParentForm},
  AncestorDBGrid in '..\..\Forms\Ancestor\AncestorDBGrid.pas' {AncestorDBGridForm: TParentForm},
  AncestorDialog in '..\..\Forms\Ancestor\AncestorDialog.pas' {AncestorDialogForm: TParentForm},
  AncestorDocument in '..\..\Forms\Ancestor\AncestorDocument.pas' {AncestorDocumentForm: TParentForm},
  AncestorDocumentMC in '..\..\Forms\Ancestor\AncestorDocumentMC.pas' {AncestorDocumentMCForm: TParentForm},
  AncestorEditDialog in '..\..\Forms\Ancestor\AncestorEditDialog.pas' {AncestorEditDialogForm: TParentForm},
  AncestorEnum in '..\..\Forms\Ancestor\AncestorEnum.pas' {AncestorEnumForm: TParentForm},
  AncestorGuides in '..\..\Forms\Ancestor\AncestorGuides.pas' {AncestorGuidesForm: TParentForm},
  AncestorJournal in '..\..\Forms\Ancestor\AncestorJournal.pas' {AncestorJournalForm: TParentForm},
  AboutBoxUnit in '..\..\SOURCE\AboutBoxUnit.pas' {AboutBox},
  UpdaterTest in '..\SOURCEBoutique\Component\UpdaterTest.pas',
  dbObjectTest in '..\SOURCEBoutique\dbObjectTest.pas',
  MainForm in '..\..\FormsBoutique\MainForm.pas' {MainForm},
  User in '..\..\FormsBoutique\Guides\User.pas' {UserForm: TParentForm},
  UserEdit in '..\..\FormsBoutique\Guides\UserEdit.pas' {UserEditForm: TParentForm},
  RoleTest in '..\SOURCEBoutique\Objects\All\RoleTest.pas',
  UserTest in '..\SOURCEBoutique\Objects\All\UserTest.pas',
  ParentFormTest in '..\SOURCEBoutique\Form\ParentFormTest.pas' {TestForm: TParentForm},
  Objects in '..\..\FormsBoutique\Guides\Objects.pas' {ObjectForm: TParentForm},
  ObjectDesc in '..\..\FormsBoutique\Guides\ObjectDesc.pas' {ObjectDescForm: TParentForm},
  ActionTest in '..\SOURCEBoutique\Objects\All\ActionTest.pas',
  AncestorMain in '..\..\Forms\Ancestor\AncestorMain.pas' {AncestorMainForm},
  Protocol in '..\..\FormsBoutique\Guides\Protocol.pas' {ProtocolForm: TParentForm},
  Account in '..\..\FormsBoutique\Guides\Account.pas' {AccountForm: TParentForm},
  Account_Object in '..\..\FormsBoutique\Guides\Account_Object.pas' {Account_ObjectForm: TParentForm},
  AccountDirection in '..\..\FormsBoutique\Guides\AccountDirection.pas' {AccountDirectionForm: TParentForm},
  AccountDirection_Object in '..\..\FormsBoutique\Guides\AccountDirection_Object.pas' {AccountDirection_ObjectForm: TParentForm},
  AccountDirectionEdit in '..\..\FormsBoutique\Guides\AccountDirectionEdit.pas' {AccountDirectionEditForm: TParentForm},
  AccountEdit in '..\..\FormsBoutique\Guides\AccountEdit.pas' {AccountEditForm: TParentForm},
  AccountGroup in '..\..\FormsBoutique\Guides\AccountGroup.pas' {AccountGroupForm: TParentForm},
  AccountGroup_Object in '..\..\FormsBoutique\Guides\AccountGroup_Object.pas' {AccountGroup_ObjectForm: TParentForm},
  AccountGroupEdit in '..\..\FormsBoutique\Guides\AccountGroupEdit.pas' {AccountGroupEditForm: TParentForm},
  AccountDirectionTest in '..\SOURCEBoutique\Objects\All\AccountDirectionTest.pas',
  AccountGroupTest in '..\SOURCEBoutique\Objects\All\AccountGroupTest.pas',
  AccountTest in '..\SOURCEBoutique\Objects\All\AccountTest.pas',
  AncestorReport in '..\..\Forms\Ancestor\AncestorReport.pas' {AncestorReportForm: TParentForm},
  Vcl.Dialogs,
  dsdDataSetDataLink in '..\..\SOURCE\COMPONENT\dsdDataSetDataLink.pas',
  dsdException in '..\..\SOURCE\dsdException.pas',
  EDI in '..\..\SOURCE\EDI\EDI.pas',
  ComDocXML in '..\..\SOURCE\EDI\ComDocXML.pas',
  OrderXML in '..\..\SOURCE\EDI\OrderXML.pas',
  DeclarXML in '..\..\SOURCE\EDI\DeclarXML.pas',
  DesadvXML in '..\..\SOURCE\EDI\DesadvXML.pas',
  InvoiceXML in '..\..\SOURCE\EDI\InvoiceXML.pas',
  OrdrspXML in '..\..\SOURCE\EDI\OrdrspXML.pas',
  RecadvXML in '..\..\SOURCE\EDI\RecadvXML.pas',
  StatusXML in '..\..\SOURCE\EDI\StatusXML.pas',
  dsdInternetAction in '..\..\SOURCE\COMPONENT\dsdInternetAction.pas',
  LookAndFillSettings in '..\..\SOURCE\LookAndFillSettings.pas' {LookAndFillSettingsForm},
  dsdXMLTransform in '..\..\SOURCE\COMPONENT\dsdXMLTransform.pas',
  IncomeJournal in '..\..\FormsBoutique\Document\IncomeJournal.pas' {IncomeJournalForm: TParentForm},
  Movement_PeriodDialog in '..\..\FormsBoutique\Document\Movement_PeriodDialog.pas' {Movement_PeriodDialogForm: TParentForm},
  IncomeItemEdit in '..\..\FormsBoutique\Document\IncomeItemEdit.pas' {IncomeItemEditForm: TParentForm},
  ReturnOutJournal in '..\..\FormsBoutique\Document\ReturnOutJournal.pas' {ReturnOutJournalForm: TParentForm},
  ReturnOut in '..\..\FormsBoutique\Document\ReturnOut.pas' {ReturnOutForm: TParentForm},
  SendJournal in '..\..\FormsBoutique\Document\SendJournal.pas' {SendJournalForm: TParentForm},
  Send in '..\..\FormsBoutique\Document\Send.pas' {SendForm: TParentForm},
  LoadBoutiqueReportTest in '..\SOURCEBoutique\LoadBoutiqueReportTest.pas',
  PartionGoodsChoice in '..\..\FormsBoutique\Guides\PartionGoodsChoice.pas' {PartionGoodsChoiceForm: TParentForm},
  LossJournal in '..\..\FormsBoutique\Document\LossJournal.pas' {LossJournalForm: TParentForm},
  Loss in '..\..\FormsBoutique\Document\Loss.pas' {LossForm: TParentForm},
  CurrencyMovement in '..\..\FormsBoutique\Document\CurrencyMovement.pas' {CurrencyMovementForm: TParentForm},
  PriceList in '..\..\FormsBoutique\Guides\PriceList.pas' {PriceListForm: TParentForm},
  PriceListEdit in '..\..\FormsBoutique\Guides\PriceListEdit.pas' {PriceListEditForm: TParentForm},
  PriceListItem in '..\..\FormsBoutique\Guides\PriceListItem.pas' {PriceListItemForm: TParentForm},
  PriceListGoodsItem in '..\..\FormsBoutique\Guides\PriceListGoodsItem.pas' {PriceListGoodsItemForm: TParentForm},
  PriceListGoodsItemEdit in '..\..\FormsBoutique\Guides\PriceListGoodsItemEdit.pas' {PriceListGoodsItemEditForm: TParentForm},
  PriceListTaxDialog in '..\..\FormsBoutique\Guides\PriceListTaxDialog.pas' {PriceListTaxDialogForm: TParentForm},
  DiscountPeriodItem in '..\..\FormsBoutique\Guides\DiscountPeriodItem.pas' {DiscountPeriodItemForm: TParentForm},
  DiscountPeriodGoodsItemEdit in '..\..\FormsBoutique\Guides\DiscountPeriodGoodsItemEdit.pas' {DiscountPeriodGoodsItemEditForm: TParentForm},
  DiscountPeriodGoodsItem in '..\..\FormsBoutique\Guides\DiscountPeriodGoodsItem.pas' {DiscountPeriodGoodsItemForm: TParentForm},
  Inventory in '..\..\FormsBoutique\Document\Inventory.pas' {InventoryForm: TParentForm},
  InventoryJournal in '..\..\FormsBoutique\Document\InventoryJournal.pas' {InventoryJournalForm: TParentForm},
  Role in '..\..\FormsBoutique\Guides\Role.pas' {RoleForm: TParentForm},
  RoleEdit in '..\..\FormsBoutique\Guides\RoleEdit.pas' {RoleEditForm: TParentForm},
  Action in '..\..\Forms\Action.pas' {ActionForm: TParentForm},
  Bank in '..\..\FormsBoutique\Guides\Bank.pas' {BankForm: TParentForm},
  BankEdit in '..\..\FormsBoutique\Guides\BankEdit.pas' {BankEditForm: TParentForm},
  SaleJournal in '..\..\FormsBoutique\Document\SaleJournal.pas' {SaleJournalForm: TParentForm},
  Sale in '..\..\FormsBoutique\Document\Sale.pas' {SaleForm: TParentForm},
  BankAccount in '..\..\FormsBoutique\Guides\BankAccount.pas' {BankAccountForm: TParentForm},
  BankAccountEdit in '..\..\FormsBoutique\Guides\BankAccountEdit.pas' {BankAccountEditForm: TParentForm},
  SaleItemEdit in '..\..\FormsBoutique\Document\SaleItemEdit.pas' {SaleItemEditForm: TParentForm},
  InfoMoneyGroup in '..\..\FormsBoutique\Guides\InfoMoneyGroup.pas' {InfoMoneyGroupForm: TParentForm},
  InfoMoneyGroup_Object in '..\..\FormsBoutique\Guides\InfoMoneyGroup_Object.pas' {InfoMoneyGroup_ObjectForm: TParentForm},
  InfoMoneyGroupEdit in '..\..\FormsBoutique\Guides\InfoMoneyGroupEdit.pas' {InfoMoneyGroupEditForm: TParentForm},
  InfoMoneyDestination in '..\..\FormsBoutique\Guides\InfoMoneyDestination.pas' {InfoMoneyDestinationForm: TParentForm},
  InfoMoneyDestination_Object in '..\..\FormsBoutique\Guides\InfoMoneyDestination_Object.pas' {InfoMoneyDestination_ObjectForm: TParentForm},
  InfoMoneyDestinationEdit in '..\..\FormsBoutique\Guides\InfoMoneyDestinationEdit.pas' {InfoMoneyDestinationEditForm: TParentForm},
  ReturnInJournal in '..\..\FormsBoutique\Document\ReturnInJournal.pas' {ReturnInJournalForm: TParentForm},
  ReturnIn in '..\..\FormsBoutique\Document\ReturnIn.pas' {ReturnInForm: TParentForm},
  ReturnInItemEdit in '..\..\FormsBoutique\Document\ReturnInItemEdit.pas' {ReturnInItemEditForm: TParentForm},
  CurrencyJournal in '..\..\FormsBoutique\Document\CurrencyJournal.pas' {CurrencyJournalForm: TParentForm},
  GoodsAccountItemEdit in '..\..\FormsBoutique\Document\GoodsAccountItemEdit.pas' {GoodsAccountItemEditForm: TParentForm},
  GoodsAccount in '..\..\FormsBoutique\Document\GoodsAccount.pas' {GoodsAccountForm: TParentForm},
  GoodsAccountJournal in '..\..\FormsBoutique\Document\GoodsAccountJournal.pas' {GoodsAccountJournalForm: TParentForm},
  Report_MovementReturnOutDialog in '..\..\FormsBoutique\Report\Report_MovementReturnOutDialog.pas' {Report_MovementReturnOutDialogForm: TParentForm},
  Report_MovementSend in '..\..\FormsBoutique\Report\Report_MovementSend.pas' {Report_MovementSendForm: TParentForm},
  Report_MovementSendDialog in '..\..\FormsBoutique\Report\Report_MovementSendDialog.pas' {Report_MovementSendDialogForm: TParentForm},
  Report_MovementLoss in '..\..\FormsBoutique\Report\Report_MovementLoss.pas' {Report_MovementLossForm: TParentForm},
  Report_MovementLossDialog in '..\..\FormsBoutique\Report\Report_MovementLossDialog.pas' {Report_MovementLossDialogForm: TParentForm},
  Report_MovementIncome in '..\..\FormsBoutique\Report\Report_MovementIncome.pas' {Report_MovementIncomeForm: TParentForm},
  Report_Balance in '..\..\FormsBoutique\Report\Report_Balance.pas' {Report_BalanceForm: TParentForm},
  Report_BalanceDialog in '..\..\FormsBoutique\Report\Report_BalanceDialog.pas' {Report_BalanceDialogForm: TParentForm},
  InfoMoney in '..\..\FormsBoutique\Guides\InfoMoney.pas' {InfoMoneyForm: TParentForm},
  InfoMoney_Object in '..\..\FormsBoutique\Guides\InfoMoney_Object.pas' {InfoMoney_ObjectForm: TParentForm},
  InfoMoneyEdit in '..\..\FormsBoutique\Guides\InfoMoneyEdit.pas' {InfoMoneyEditForm: TParentForm},
  FormsUnit in '..\..\FormsBoutique\Guides\FormsUnit.pas' {FormsUnit: TParentForm},
  ProfitLoss in '..\..\FormsBoutique\Guides\ProfitLoss.pas' {ProfitLoss: TParentForm},
  ProfitLoss_Object in '..\..\FormsBoutique\Guides\ProfitLoss_Object.pas' {ProfitLoss_Object: TParentForm},
  ProfitLossEdit in '..\..\FormsBoutique\Guides\ProfitLossEdit.pas' {ProfitLossEdit: TParentForm},
  ProfitLossDirection in '..\..\FormsBoutique\Guides\ProfitLossDirection.pas' {ProfitLossDirection: TParentForm},
  ProfitLossDirection_Object in '..\..\FormsBoutique\Guides\ProfitLossDirection_Object.pas' {ProfitLossDirection_Object: TParentForm},
  ProfitLossDirectionEdit in '..\..\FormsBoutique\Guides\ProfitLossDirectionEdit.pas' {ProfitLossDirectionEdit: TParentForm},
  ProfitLossGroup in '..\..\FormsBoutique\Guides\ProfitLossGroup.pas' {ProfitLossGroup: TParentForm},
  ProfitLossGroup_Object in '..\..\FormsBoutique\Guides\ProfitLossGroup_Object.pas' {ProfitLossGroup_Object: TParentForm},
  ProfitLossGroupEdit in '..\..\FormsBoutique\Guides\ProfitLossGroupEdit.pas' {ProfitLossGroupEdit: TParentForm},
  UserProtocol in '..\..\FormsBoutique\Guides\UserProtocol.pas' {UserProtocol: TParentForm},
  MovementItemProtocol in '..\..\FormsBoutique\Document\MovementItemProtocol.pas' {MovementItemProtocolForm: TParentForm},
  MovementProtocol in '..\..\FormsBoutique\Document\MovementProtocol.pas' {MovementProtocolForm: TParentForm},
  Report_ProfitLoss in '..\..\FormsBoutique\Report\Report_ProfitLoss.pas' {Report_ProfitLossForm: TParentForm},
  Report_ProfitLossDialog in '..\..\FormsBoutique\Report\Report_ProfitLossDialog.pas' {Report_ProfitLossDialogForm: TParentForm},
  MovementItemContainer in '..\..\FormsBoutique\Document\MovementItemContainer.pas' {MovementItemContainerForm: TParentForm},
  Report_Goods_RemainsCurrent in '..\..\FormsBoutique\Report\Report_Goods_RemainsCurrent.pas' {Report_Goods_RemainsCurrentForm: TParentForm},
  Report_Goods_RemainsCurrentDialog in '..\..\FormsBoutique\Report\Report_Goods_RemainsCurrentDialog.pas' {Report_Goods_RemainsCurrentDialogForm: TParentForm},
  Report_Goods in '..\..\FormsBoutique\Report\Report_Goods.pas' {Report_GoodsForm: TParentForm},
  Report_GoodsDialog in '..\..\FormsBoutique\Report\Report_GoodsDialog.pas' {Report_GoodsDialogForm: TParentForm},
  GoodsSizeChoice in '..\..\FormsBoutique\Guides\GoodsSizeChoice.pas' {GoodsSizeChoiceForm: TParentForm},
  DiscountPeriodItemDialog in '..\..\FormsBoutique\Guides\DiscountPeriodItemDialog.pas' {DiscountPeriodItemDialogForm: TParentForm},
  Report_GoodsMI_AccountDialog in '..\..\FormsBoutique\Report\Report_GoodsMI_AccountDialog.pas' {Report_GoodsMI_AccountDialogForm: TParentForm},
  Report_GoodsMI_Account in '..\..\FormsBoutique\Report\Report_GoodsMI_Account.pas' {Report_GoodsMI_AccountForm: TParentForm},
  Report_SaleReturnIn in '..\..\FormsBoutique\Report\Report_SaleReturnIn.pas' {Report_SaleReturnInForm: TParentForm},
  Report_SaleReturnInDialog in '..\..\FormsBoutique\Report\Report_SaleReturnInDialog.pas' {Report_SaleReturnInDialogForm: TParentForm},
  Report_ClientDebt in '..\..\FormsBoutique\Report\Report_ClientDebt.pas' {Report_ClientDebtForm: TParentForm},
  Report_ClientDebtDialog in '..\..\FormsBoutique\Report\Report_ClientDebtDialog.pas' {Report_ClientDebtDialogForm: TParentForm},
  Report_MovementIncomeDialog in '..\..\FormsBoutique\Report\Report_MovementIncomeDialog.pas' {Report_MovementIncomeDialogForm: TParentForm},
  IFIN_J1201009 in '..\..\SOURCE\MeDOC\IFIN_J1201009.pas',
  GoodsAccount_ReturnIn in '..\..\FormsBoutique\Document\GoodsAccount_ReturnIn.pas' {GoodsAccount_ReturnInForm: TParentForm},
  GoodsAccount_ReturnInJournal in '..\..\FormsBoutique\Document\GoodsAccount_ReturnInJournal.pas' {GoodsAccount_ReturnInJournalForm: TParentForm},
  GoodsPrintChoice in '..\..\FormsBoutique\Guides\GoodsPrintChoice.pas' {GoodsPrintChoiceForm: TParentForm},
  GoodsPrint in '..\..\FormsBoutique\Guides\GoodsPrint.pas' {GoodsPrintForm: TParentForm},
  Report_MotionByClient in '..\..\FormsBoutique\Report\Report_MotionByClient.pas' {Report_MotionByClientForm: TParentForm},
  Report_MotionByClientDialog in '..\..\FormsBoutique\Report\Report_MotionByClientDialog.pas' {Report_MotionByClientDialogForm: TParentForm},
  IFIN_J1201209 in '..\..\SOURCE\MeDOC\IFIN_J1201209.pas',
  CommonContainerProcedureTest in '..\SOURCEBoutique\Container\CommonContainerProcedureTest.pas',
  Report_Sale_ContainerError in '..\..\FormsBoutique\Report\Report_Sale_ContainerError.pas' {Report_Sale_ContainerErrorForm: TParentForm},
  Report_ReturnIn_TotalError in '..\..\FormsBoutique\Report\Report_ReturnIn_TotalError.pas' {Report_ReturnIn_TotalErrorForm: TParentForm},
  Report_Sale_TotalError in '..\..\FormsBoutique\Report\Report_Sale_TotalError.pas' {Report_Sale_TotalErrorForm: TParentForm},
  Report_Client_TotalError in '..\..\FormsBoutique\Report\Report_Client_TotalError.pas' {Report_Client_TotalErrorForm: TParentForm},
  Report_Client_LastError in '..\..\FormsBoutique\Report\Report_Client_LastError.pas' {Report_Client_LastErrorForm: TParentForm},
  Report_GoodsAccount_TotalError in '..\..\FormsBoutique\Report\Report_GoodsAccount_TotalError.pas' {Report_GoodsAccount_TotalErrorForm: TParentForm},
  Report_CollationByClientDialog in '..\..\FormsBoutique\Report\Report_CollationByClientDialog.pas' {Report_CollationByClientDialogForm: TParentForm},
  Report_CollationByClient in '..\..\FormsBoutique\Report\Report_CollationByClient.pas' {Report_CollationByClientForm: TParentForm},
  Unit_Dialog in '..\..\FormsBoutique\Guides\Unit_Dialog.pas' {Unit_DialogForm: TParentForm},
  Report_SaleOLAPDialog in '..\..\FormsBoutique\Report\Report_SaleOLAPDialog.pas' {Report_SaleOLAPDialogForm: TParentForm},
  Report_SaleOLAP in '..\..\FormsBoutique\Report\Report_SaleOLAP.pas' {Report_SaleOLAPForm: TParentForm},
  PeriodYear_Choice in '..\..\FormsBoutique\Guides\PeriodYear_Choice.pas' {PeriodYear_ChoiceForm: TParentForm},
  Report_ReturnIn in '..\..\FormsBoutique\Report\Report_ReturnIn.pas' {Report_ReturnInForm: TParentForm},
  Report_SaleDialog in '..\..\FormsBoutique\Report\Report_SaleDialog.pas' {Report_SaleDialogForm: TParentForm},
  Report_OH_DiscountPeriod in '..\..\FormsBoutique\Report\Report_OH_DiscountPeriod.pas' {Report_OH_DiscountPeriodForm: TParentForm},
  Report_OH_DiscountPeriodDialog in '..\..\FormsBoutique\Report\Report_OH_DiscountPeriodDialog.pas' {Report_OH_DiscountPeriodDialogForm: TParentForm},
  DiscountPeriod in '..\..\FormsBoutique\Guides\DiscountPeriod.pas' {DiscountPeriodForm: TParentForm},
  DiscountPeriodEdit in '..\..\FormsBoutique\Guides\DiscountPeriodEdit.pas' {DiscountPeriodEditForm: TParentForm},
  PriceListItemDialog in '..\..\FormsBoutique\Guides\PriceListItemDialog.pas' {PriceListItemDialogForm: TParentForm},
  Report_Sale in '..\..\FormsBoutique\Report\Report_Sale.pas' {Report_SaleForm: TParentForm},
  Report_MovementReturnOut in '..\..\FormsBoutique\Report\Report_MovementReturnOut.pas' {Report_MovementReturnOutForm: TParentForm},
  SaleTwo in '..\..\FormsBoutique\Document\SaleTwo.pas' {SaleTwoForm: TParentForm},
  IncomeKoeffEdit in '..\..\FormsBoutique\Guides\IncomeKoeffEdit.pas' {IncomeKoeffEditForm: TParentForm},
  InventoryItemEdit in '..\..\FormsBoutique\Document\InventoryItemEdit.pas' {InventoryItemEditForm: TParentForm},
  ClientSMSDialog in '..\..\FormsBoutique\Guides\ClientSMSDialog.pas' {ClientSMSDialogForm: TParentForm},
  ClientSMS in '..\..\FormsBoutique\Guides\ClientSMS.pas' {ClientSMSForm: TParentForm},
  DiscountPeriodItemBySendDialog in '..\..\FormsBoutique\Document\DiscountPeriodItemBySendDialog.pas' {DiscountPeriodItemBySendDialogForm: TParentForm},
  Income in '..\..\FormsBoutique\Document\Income.pas' {IncomeForm: TParentForm},
  DiscountPersentDialog in '..\..\FormsBoutique\Guides\DiscountPersentDialog.pas' {DiscountPersentDialogForm: TParentForm};

{$R *.res}
{$R DevExpressRus.res}

begin
  ConnectionPath := '..\INIT\Boutique_init.php';
  EnumPath := '..\DATABASE\Boutique\METADATA\Enum\';
  CreateStructurePath := '..\DATABASE\Boutique\STRUCTURE\';
  LocalViewPath := '..\DATABASE\Boutique\View\';
  LocalProcedurePath := '..\DATABASE\Boutique\PROCEDURE\';
  LocalProcessPath := '..\DATABASE\COMMONBoutique\Boutique\PROCESS\';

  dsdProject := prBoutique;

  if FindCmdLineSwitch('realboutique', true)
  then gc_AdminPassword := 'qsxqsxw1'
  else gc_AdminPassword := '�����';

  gc_ProgramName := 'Boutique.exe';

  Application.Initialize;
  gc_isSetDefault := true;
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;

  DUnitTestRunner.RunRegisteredTests;
end.
