program FarmacyTest;

uses
  Forms,
  DUnitTestRunner,
  dbCreateStructureTest in '..\SOURCE\STRUCTURE\dbCreateStructureTest.pas',
  dbMetadataTest in '..\SOURCE\METADATA\dbMetadataTest.pas',
  zLibUtil in '..\SOURCE\zLibUtil.pas',
  dbCreateViewTest in '..\SOURCE\View\dbCreateViewTest.pas',
  dbFarmacyProcedureTest in '..\SOURCE\dbFarmacyProcedureTest.pas',
  UtilConst in '..\..\SOURCE\UtilConst.pas',
  dbEnumTest in '..\SOURCE\dbEnumTest.pas',
  LoadFarmacyFormTest in '..\SOURCE\LoadFarmacyFormTest.pas',
  PriceListGoodsItem in '..\..\Forms\Guides\PriceListGoodsItem.pas' {PriceListGoodsItemForm},
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
  ExtraChargeCategories in '..\..\FormsFarmacy\Guides\ExtraChargeCategories.pas' {ExtraChargeCategoriesForm},
  ExtraChargeCategoriesEdit in '..\..\FormsFarmacy\Guides\ExtraChargeCategoriesEdit.pas' {ExtraChargeCategoriesEditForm},
  Goods in '..\..\FormsFarmacy\Guides\Goods.pas' {GoodsForm},
  GoodsEdit in '..\..\FormsFarmacy\Guides\GoodsEdit.pas' {GoodsEditForm},
  Units in '..\..\FormsFarmacy\Guides\Units.pas' {UnitForm},
  dbTest in '..\SOURCE\dbTest.pas',
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
  ObjectTest in '..\SOURCE\Objects\ObjectTest.pas',
  cxGridAddOn in '..\..\SOURCE\DevAddOn\cxGridAddOn.pas',
  MeDOC in '..\..\SOURCE\MeDOC\MeDOC.pas',
  MeDocXML in '..\..\SOURCE\MeDOC\MeDocXML.pas',
  ComDocXML in '..\..\SOURCE\EDI\ComDocXML.pas',
  DeclarXML in '..\..\SOURCE\EDI\DeclarXML.pas',
  DesadvXML in '..\..\SOURCE\EDI\DesadvXML.pas',
  EDI in '..\..\SOURCE\EDI\EDI.pas',
  OrderXML in '..\..\SOURCE\EDI\OrderXML.pas',
  GoodsGroup in '..\..\Forms\Guides\GoodsGroup.pas' {GoodsGroupForm: TParentForm},
  GoodsGroupEdit in '..\..\Forms\Guides\GoodsGroupEdit.pas' {GoodsGroupEditForm: TParentForm},
  Measure in '..\..\Forms\Measure.pas' {MeasureForm: TParentForm},
  MeasureEdit in '..\..\Forms\MeasureEdit.pas' {MeasureEditForm: TParentForm},
  Maker in '..\..\Forms\Guides\Maker.pas' {MakerForm: TParentForm},
  MakerEdit in '..\..\Forms\Guides\MakerEdit.pas' {MakerEditForm: TParentForm},
  Country in '..\..\Forms\Guides\Country.pas' {CountryForm: TParentForm},
  CountryEdit in '..\..\Forms\Guides\CountryEdit.pas' {CountryEditForm: TParentForm},
  NDSKind in '..\..\Forms\Enum\NDSKind.pas' {NDSKindForm: TParentForm},
  UnitEdit in '..\..\FormsFarmacy\Guides\UnitEdit.pas' {UnitEditForm: TParentForm},
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
  AncestorMain in '..\..\Forms\Ancestor\AncestorMain.pas' {AncestorMainForm},
  AncestorReport in '..\..\Forms\Ancestor\AncestorReport.pas' {AncestorReportForm: TParentForm},
  AboutBoxUnit in '..\..\SOURCE\AboutBoxUnit.pas' {AboutBox},
  dbLoadTest in '..\SOURCE\Load\dbLoadTest.pas',
  PriceListLoad in '..\..\FormsFarmacy\Load\PriceListLoad.pas' {PriceListLoadForm: TParentForm},
  UpdaterTest in '..\SOURCE\Component\UpdaterTest.pas',
  dbObjectTest in '..\SOURCE\dbObjectTest.pas',
  Retail in '..\..\Forms\Guides\Retail.pas' {RetailForm: TParentForm},
  RetailEdit in '..\..\Forms\Guides\RetailEdit.pas' {RetailEditForm: TParentForm},
  Juridical in '..\..\FormsFarmacy\Guides\Juridical.pas' {JuridicalForm: TParentForm},
  JuridicalEdit in '..\..\FormsFarmacy\Guides\JuridicalEdit.pas' {JuridicalEditForm: TParentForm},
  ActionTest in '..\SOURCE\Objects\All\ActionTest.pas',
  MainForm in '..\..\FormsFarmacy\MainForm.pas' {MainForm},
  Contract in '..\..\FormsFarmacy\Guides\Contract.pas' {ContractForm: TParentForm},
  ContractEdit in '..\..\FormsFarmacy\Guides\ContractEdit.pas' {ContractEditForm: TParentForm},
  Income in '..\..\FormsFarmacy\Document\Income.pas' {IncomeForm: TParentForm},
  IncomeJournal in '..\..\FormsFarmacy\Document\IncomeJournal.pas' {IncomeJournalForm: TParentForm},
  PriceList in '..\..\FormsFarmacy\Document\PriceList.pas' {PriceListForm: TParentForm},
  PriceListJournal in '..\..\FormsFarmacy\Document\PriceListJournal.pas' {PriceListJournalForm: TParentForm},
  OrderExternal in '..\..\FormsFarmacy\Document\OrderExternal.pas' {OrderExternalForm: TParentForm},
  OrderExternalJournal in '..\..\FormsFarmacy\Document\OrderExternalJournal.pas' {OrderExternalJournalForm: TParentForm},
  OrderInternal in '..\..\FormsFarmacy\Document\OrderInternal.pas' {OrderInternalForm: TParentForm},
  OrderInternalJournal in '..\..\FormsFarmacy\Document\OrderInternalJournal.pas' {OrderInternalJournalForm: TParentForm},
  User in '..\..\Forms\User.pas' {UserForm: TParentForm},
  UserEdit in '..\..\Forms\UserEdit.pas' {UserEditForm: TParentForm},
  Role in '..\..\Forms\Role.pas' {RoleForm: TParentForm},
  RoleEdit in '..\..\Forms\RoleEdit.pas' {RoleEditForm: TParentForm},
  RoleTest in '..\SOURCE\Objects\All\RoleTest.pas',
  ImportTypeTest in '..\SOURCE\Objects\All\ImportTypeTest.pas',
  ImportTypeItemsTest in '..\SOURCE\Objects\All\ImportTypeItemsTest.pas',
  Unit_Object in '..\..\FormsFarmacy\Guides\Unit_Object.pas' {Unit_ObjectForm: TParentForm};

{$R *.res}
{$R DevExpressRus.res}

begin
  ConnectionPath := '..\INIT\farmacy_init.php';
  CreateStructurePath := '..\DATABASE\FARMACY\STRUCTURE\';
  gc_ProgramName := 'Farmacy.exe';

  Application.Initialize;
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;

  DUnitTestRunner.RunRegisteredTests;
end.
