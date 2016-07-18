unit MainForm;

interface

uses
  DataModul, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBar, cxClasses, Vcl.ActnList,
  Vcl.StdActns, Vcl.StdCtrls, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dsdAction, cxLocalization, frxExportRTF, frxExportXML, frxClass, frxExportXLS,
  Data.DB, Datasnap.DBClient, dsdDB, cxPropertiesStore, dsdAddOn, dxSkinsCore,
  dxSkinsDefaultPainters, AncestorMain, dxSkinsdxBarPainter, Vcl.Menus,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxLabel, frxBarcode, cxTextEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxSkinscxPCPainter;

const
  WM_ChangeKeyboard = WM_USER + 1;

type

  TMainForm = class(TAncestorMainForm)
    actMeasure: TdsdOpenForm;
    actJuridicalGroup: TdsdOpenForm;
    actGoodsProperty: TdsdOpenForm;
    actJuridical: TdsdOpenForm;
    actBusiness: TdsdOpenForm;
    actBranch: TdsdOpenForm;
    actPartner: TdsdOpenForm;
    actIncome: TdsdOpenForm;
    actPaidKind: TdsdOpenForm;
    actContractKind: TdsdOpenForm;
    actUnit: TdsdOpenForm;
    actGoodsGroup: TdsdOpenForm;
    actGoods: TdsdOpenForm;
    actGoodsKind: TdsdOpenForm;
    actBank: TdsdOpenForm;
    actBankAccount: TdsdOpenForm;
    actCash: TdsdOpenForm;
    actCurrency: TdsdOpenForm;
    actReport_Balance: TdsdOpenForm;
    actPriceList: TdsdOpenForm;
    actTradeMark: TdsdOpenForm;
    actAsset: TdsdOpenForm;
    actRoute: TdsdOpenForm;
    actRouteSorting: TdsdOpenForm;
    actMember: TdsdOpenForm;
    actPosition: TdsdOpenForm;
    actPersonal: TdsdOpenForm;
    actCar: TdsdOpenForm;
    actCarModel: TdsdOpenForm;
    actSend: TdsdOpenForm;
    actSaleAll: TdsdOpenForm;
    actReturnOut: TdsdOpenForm;
    actReturnIn: TdsdOpenForm;
    actLoss: TdsdOpenForm;
    actSendOnPrice: TdsdOpenForm;
    actInventory: TdsdOpenForm;
    actProductionSeparate: TdsdOpenForm;
    actProductionUnion: TdsdOpenForm;
    actReport_HistoryCost: TdsdOpenForm;
    actReport_ProfitLoss: TdsdOpenForm;
    actContract: TdsdOpenForm;
    actPriceListItem: TdsdOpenForm;
    actOrderExternal: TdsdOpenForm;
    actQualityParams: TdsdOpenForm;
    actCashOperation: TdsdOpenForm;
    actReport_MotionGoods: TdsdOpenForm;
    actRole: TdsdOpenForm;
    actAction: TdsdOpenForm;
    actUser: TdsdOpenForm;
    actProcess: TdsdOpenForm;
    actTransport: TdsdOpenForm;
    actFuel: TdsdOpenForm;
    actRateFuelKind: TdsdOpenForm;
    actIncomeFuel: TdsdOpenForm;
    actPersonalSendCash: TdsdOpenForm;
    actRateFuel: TdsdOpenForm;
    actFreight: TdsdOpenForm;
    actReport_Transport: TdsdOpenForm;
    actReport_Fuel: TdsdOpenForm;
    actPersonalGroup: TdsdOpenForm;
    actWorkTimeKind: TdsdOpenForm;
    actSheetWorkTime: TdsdOpenForm;
    actReport_Account: TdsdOpenForm;
    actCardFuel: TdsdOpenForm;
    actTicketFuel: TdsdOpenForm;
    actPositionLevel: TdsdOpenForm;
    actStaffListData: TdsdOpenForm;
    actModelService: TdsdOpenForm;
    actReport_TransportHoursWork: TdsdOpenForm;
    actService: TdsdOpenForm;
    actReport_GoodsTax: TdsdOpenForm;
    actSendTicketFuel: TdsdOpenForm;
    actBankLoad: TdsdOpenForm;
    actArea: TdsdOpenForm;
    actContractArticle: TdsdOpenForm;
    actCalendar: TdsdOpenForm;
    actSetUserDefaults: TdsdOpenForm;
    actPersonalAccount: TdsdOpenForm;
    actTransportService: TdsdOpenForm;
    actJuridical_List: TdsdOpenForm;
    actUnit_List: TdsdOpenForm;
    actLossDebt: TdsdOpenForm;
    actBankAccountDocument: TdsdOpenForm;
    actCity: TdsdOpenForm;
    actReport_JuridicalSold: TdsdOpenForm;
    actReport_JuridicalCollation: TdsdOpenForm;
    actReport_GoodsMISale: TdsdOpenForm;
    actSendDebt: TdsdOpenForm;
    actPartner1CLink: TdsdOpenForm;
    actGoodsByGoodsKind1CLink: TdsdOpenForm;
    actLoad1CSale: TdsdOpenForm;
    actReport_GoodsMIReturn: TdsdOpenForm;
    actReport_GoodsMI_byMovementSale: TdsdOpenForm;
    actReport_GoodsMI_byMovementReturn: TdsdOpenForm;
    actReport_GoodsMI_SaleReturnIn: TdsdOpenForm;
    actReport_Production_Union: TdsdOpenForm;
    actContractConditionValue: TdsdOpenForm;
    actReport_GoodsMI_ReturnOutByPartner: TdsdOpenForm;
    actReport_GoodsMI_IncomeByPartner: TdsdOpenForm;
    actReport_JuridicalDefermentPayment: TdsdOpenForm;
    actTax: TdsdOpenForm;
    actTaxCorrection: TdsdOpenForm;
    actGoods_List: TdsdOpenForm;
    actAssetGroup: TdsdOpenForm;
    actMaker: TdsdOpenForm;
    actCountry: TdsdOpenForm;
    actReport_CheckTax: TdsdOpenForm;
    actProfitLossService: TdsdOpenForm;
    actReport_CheckTaxCorrective: TdsdOpenForm;
    actPeriodClose: TdsdOpenForm;
    actSaveTaxDocument: TdsdOpenForm;
    actToolsWeighingTree: TdsdOpenForm;
    actGoodsPropertyValue: TdsdOpenForm;
    actWeighingPartner: TdsdOpenForm;
    actWeighingProduction: TdsdOpenForm;
    actReport_CheckBonus: TdsdOpenForm;
    actGoodsKindWeighing: TdsdOpenForm;
    actReport_GoodsMI_byMovementDifSale: TdsdOpenForm;
    actReport_GoodsMI_byMovementDifReturn: TdsdOpenForm;
    actSale_Partner: TdsdOpenForm;
    actReport_CheckContractInMovement: TdsdOpenForm;
    actTransferDebtOut: TdsdOpenForm;
    actTransferDebtIn: TdsdOpenForm;
    actBankAccountContract: TdsdOpenForm;
    actEDI: TdsdOpenForm;
    actReport_GoodsMI_TransferDebtIn: TdsdOpenForm;
    actReport_GoodsMI_TransferDebtOut: TdsdOpenForm;
    actSaveDocumentTo1C: TdsdOpenForm;
    actReport_Goods: TdsdOpenForm;
    actReport_GoodsMI_byPriceDifSale: TdsdOpenForm;
    actRetail: TdsdOpenForm;
    actPriceCorrective: TdsdOpenForm;
    actRegion: TdsdOpenForm;
    actProvince: TdsdOpenForm;
    actCityKind: TdsdOpenForm;
    actProvinceCity: TdsdOpenForm;
    actStreetKind: TdsdOpenForm;
    actStreet: TdsdOpenForm;
    actContactPersonKind: TdsdOpenForm;
    actContactPerson: TdsdOpenForm;
    actPartnerAddress: TdsdOpenForm;
    actStorage_Object: TdsdOpenForm;
    actCurrencyMovement: TdsdOpenForm;
    actReport_OrderExternal: TdsdOpenForm;
    actReport_GoodsMI_ProductionUnionIncome: TdsdOpenForm;
    actReport_GoodsMI_ProductionUnionReturn: TdsdOpenForm;
    actReport_GoodsMI_ProductionSeparateIncome: TdsdOpenForm;
    actReport_GoodsMI_ProductionSeparateReturn: TdsdOpenForm;
    actReport_GoodsMI_ProductionSeparate: TdsdOpenForm;
    actCashOperationOld: TdsdOpenForm;
    actLoad1CMoney: TdsdOpenForm;
    actFounder: TdsdOpenForm;
    actArticleLoss: TdsdOpenForm;
    actReport_OrderExternal_Sale: TdsdOpenForm;
    actGoodsGroupStat: TdsdOpenForm;
    actReport_Member: TdsdOpenForm;
    actReport_Personal: TdsdOpenForm;
    actReport_Founders: TdsdOpenForm;
    actReport_Cash: TdsdOpenForm;
    actReport_BankAccount: TdsdOpenForm;
    actCashOperationKrRog: TdsdOpenForm;
    actCashOperationNikolaev: TdsdOpenForm;
    actCashOperationKharkov: TdsdOpenForm;
    actCashOperationCherkassi: TdsdOpenForm;
    actCashOperationKiev: TdsdOpenForm;
    actPersonalCash: TdsdOpenForm;
    actPersonalService: TdsdOpenForm;
    actPersonalServiceList: TdsdOpenForm;
    actGoodsTag: TdsdOpenForm;
    actPartner1CLink_Excel: TdsdOpenForm;
    actSaveMarketingDocumentTo1CForm: TdsdOpenForm;
    actPersonalReport: TdsdOpenForm;
    actFounderService: TdsdOpenForm;
    actPeriodClose_User: TdsdOpenForm;
    actBox: TdsdOpenForm;
    actCorrAccount: TdsdOpenForm;
    actCashOperationZaporozhye: TdsdOpenForm;
    actCashOperationDneprOfficial: TdsdOpenForm;
    actSale_Order: TdsdOpenForm;
    actReturnIn_Partner: TdsdOpenForm;
    actSendOnPrice_Branch: TdsdOpenForm;
    actRetailReport: TdsdOpenForm;
    actAreaContract: TdsdOpenForm;
    actPartnerTag: TdsdOpenForm;
    actReport_OLAPSold: TAction;
    actGoodsGroupAnalyst: TdsdOpenForm;
    actReport_GoodsMI_ProductionUnion: TdsdOpenForm;
    actReport_GoodsMI_ProductionUnionMD: TdsdOpenForm;
    actProductionUnionTech: TdsdOpenForm;
    actGoodsQuality: TdsdOpenForm;
    actProductionPeresort: TdsdOpenForm;
    actReceipt: TdsdOpenForm;
    actReceiptCost: TdsdOpenForm;
    actContractTagGroup: TdsdOpenForm;
    actContractTag: TdsdOpenForm;
    actTransferDebtOut_Order: TdsdOpenForm;
    miGoodsDocuments: TMenuItem;
    miIncome: TMenuItem;
    miReturnOut: TMenuItem;
    N4: TMenuItem;
    miSale_all: TMenuItem;
    miSale_Partner: TMenuItem;
    miSale_Order: TMenuItem;
    miReturnIn: TMenuItem;
    miReturnIn_Partner: TMenuItem;
    miSendOnPrice: TMenuItem;
    miSendOnPrice_Branch: TMenuItem;
    N5: TMenuItem;
    miProductionSeparate: TMenuItem;
    miProductionUnion: TMenuItem;
    miProductionUnionTech: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    miWeighingPartner: TMenuItem;
    miWeighingProduction: TMenuItem;
    N8: TMenuItem;
    miSend: TMenuItem;
    miLoss: TMenuItem;
    miInventory: TMenuItem;
    N9: TMenuItem;
    miOrderExternal: TMenuItem;
    miQualityParams: TMenuItem;
    miFinanceDocuments: TMenuItem;
    miIncomeCashOld: TMenuItem;
    miIncomeCash: TMenuItem;
    miCashDneprOfficial: TMenuItem;
    miCashKiev: TMenuItem;
    miCashKrRog: TMenuItem;
    miCashNikolaev: TMenuItem;
    miCashKharkov: TMenuItem;
    miCashCherkassi: TMenuItem;
    miCashZaporozhye: TMenuItem;
    N10: TMenuItem;
    miFounderService: TMenuItem;
    N11: TMenuItem;
    miJuridicalService: TMenuItem;
    miProfitLossService: TMenuItem;
    miBankLoad: TMenuItem;
    miBankAccountDocument: TMenuItem;
    miPersonalReport: TMenuItem;
    N12: TMenuItem;
    miLossDebt: TMenuItem;
    miSendDebt: TMenuItem;
    miCurrencyMovement: TMenuItem;
    miTaxDocuments: TMenuItem;
    miTax: TMenuItem;
    miTaxCorrective: TMenuItem;
    N13: TMenuItem;
    miReport_CheckTax: TMenuItem;
    miReport_CheckTaxCorrective: TMenuItem;
    N14: TMenuItem;
    miSaveTaxDocument: TMenuItem;
    N15: TMenuItem;
    miTransferDebtIn: TMenuItem;
    miTransferDebtOut: TMenuItem;
    miTransferDebtOut_Order: TMenuItem;
    N16: TMenuItem;
    miPriceCorrective: TMenuItem;
    N17: TMenuItem;
    miReport_GoodsMI_TransferDebtIn: TMenuItem;
    miReport_GoodsMI_TransferDebtOut: TMenuItem;
    miAssetDocuments: TMenuItem;
    miAssetGroup: TMenuItem;
    miAsset: TMenuItem;
    N18: TMenuItem;
    miCountry: TMenuItem;
    miMaker: TMenuItem;
    miHistory: TMenuItem;
    miPriceListItem: TMenuItem;
    miTransportDocuments: TMenuItem;
    miTransport: TMenuItem;
    miIncomeFuel: TMenuItem;
    miPersonalSendCash: TMenuItem;
    miPersonalAccount: TMenuItem;
    miTransportService: TMenuItem;
    miSendTicketFuel: TMenuItem;
    N19: TMenuItem;
    miCar: TMenuItem;
    miRoute: TMenuItem;
    miCarModel: TMenuItem;
    miFreight: TMenuItem;
    miFuel: TMenuItem;
    miRateFuelKind: TMenuItem;
    miRateFuel: TMenuItem;
    miCardFuel: TMenuItem;
    miTicketFuel: TMenuItem;
    N20: TMenuItem;
    miReport_Transport: TMenuItem;
    miReport_Fuel: TMenuItem;
    miReport_TransportHoursWork: TMenuItem;
    miPersonalDocuments: TMenuItem;
    miPersonalGroup: TMenuItem;
    miPersonal: TMenuItem;
    miPosition: TMenuItem;
    miPositionLevel: TMenuItem;
    miMember: TMenuItem;
    miWorkTimeKind: TMenuItem;
    miStaffListData: TMenuItem;
    miModelService: TMenuItem;
    miPersonalServiceList: TMenuItem;
    N21: TMenuItem;
    miCalendar: TMenuItem;
    miSheetWorkTime: TMenuItem;
    N22: TMenuItem;
    miPersonalService: TMenuItem;
    miPersonalCash: TMenuItem;
    miReportsProduction: TMenuItem;
    miReportProductionUnion: TMenuItem;
    miReportsGoods: TMenuItem;
    miReport_MotionGoods: TMenuItem;
    miReport_GoodsTax: TMenuItem;
    miReport_Goods: TMenuItem;
    miReport_OrderExternal: TMenuItem;
    miReport_OrderExternal_Sale: TMenuItem;
    N23: TMenuItem;
    miReport_GoodsMI_Income: TMenuItem;
    miReport_GoodsMI_IncomeByPartner: TMenuItem;
    N24: TMenuItem;
    miReport_GoodsMI_SaleReturnIn: TMenuItem;
    miReport_GoodsMISale: TMenuItem;
    miReport_GoodsMI_byMovementSale: TMenuItem;
    miReport_GoodsMI_byMovementDifSale: TMenuItem;
    miReport_GoodsMI_byPriceDifSale: TMenuItem;
    N25: TMenuItem;
    miReport_GoodsMIReturn: TMenuItem;
    miReport_GoodsMI_byMovementReturn: TMenuItem;
    miReport_GoodsMI_byMovementDifReturn: TMenuItem;
    N26: TMenuItem;
    miReport_HistoryCost: TMenuItem;
    N27: TMenuItem;
    miReport_GoodsMI_Production: TMenuItem;
    miReport_GoodsMI_ProductionUnionReturn: TMenuItem;
    miReport_GoodsMI_ProductionSeparateIncome: TMenuItem;
    mitReport_GoodsMI_ProductionSeparateReturn: TMenuItem;
    miReport_GoodsMI_ProductionSeparate: TMenuItem;
    miReport_GoodsMI_ProductionUnion: TMenuItem;
    miReport_GoodsMI_ProductionUnionMD: TMenuItem;
    N28: TMenuItem;
    miReport_CheckContractInMovement: TMenuItem;
    miReportsFinance: TMenuItem;
    miReport_JuridicalSold: TMenuItem;
    miReport_JuridicalDefermentPayment: TMenuItem;
    miReport_JuridicalCollation: TMenuItem;
    N29: TMenuItem;
    miReport_CheckBonus: TMenuItem;
    N30: TMenuItem;
    miReport_Account: TMenuItem;
    miReport_Member: TMenuItem;
    miReport_Personal: TMenuItem;
    miReport_Founders: TMenuItem;
    miReport_Cash: TMenuItem;
    miReport_BankAccount: TMenuItem;
    miReportMain: TMenuItem;
    miReport_Balance: TMenuItem;
    miReport_ProfitLoss: TMenuItem;
    miReport_OLAPSold: TMenuItem;
    miAction: TMenuItem;
    miProcess: TMenuItem;
    miUser: TMenuItem;
    miRole: TMenuItem;
    miSetUserDefaults: TMenuItem;
    miPeriodClose: TMenuItem;
    miPeriodClose_User: TMenuItem;
    miPartner1CLink: TMenuItem;
    miGoodsByGoodsKind1CLink: TMenuItem;
    miPartner1CLink_Excel: TMenuItem;
    miExternalSave: TMenuItem;
    miSaveDocumentTo1C: TMenuItem;
    miSaveMarketingDocumentTo1CForm: TMenuItem;
    miEDI: TMenuItem;
    miLoad1CSale: TMenuItem;
    miLoad1CMoney: TMenuItem;
    miToolsWeighingTree: TMenuItem;
    miImportGroup: TMenuItem;
    miImportType: TMenuItem;
    miImportSettings: TMenuItem;
    miImportExportLink: TMenuItem;
    miJuridicalGroup: TMenuItem;
    miJuridical_List: TMenuItem;
    miJuridical: TMenuItem;
    miPartner: TMenuItem;
    miPartnerAddress: TMenuItem;
    miRouteSorting: TMenuItem;
    miArea: TMenuItem;
    miAreaContract: TMenuItem;
    miRetail: TMenuItem;
    miRetailReport: TMenuItem;
    miContactPerson: TMenuItem;
    miContactPersonKind: TMenuItem;
    miFounder: TMenuItem;
    miPartnerTag: TMenuItem;
    N1: TMenuItem;
    miPaidKind: TMenuItem;
    N32: TMenuItem;
    miContractConditionValue: TMenuItem;
    miContract: TMenuItem;
    miContractKind: TMenuItem;
    miContractTag: TMenuItem;
    miContractTagGroup: TMenuItem;
    miContractArticle: TMenuItem;
    N33: TMenuItem;
    miAdres: TMenuItem;
    miactRegion: TMenuItem;
    miProvince: TMenuItem;
    miProvinceCity: TMenuItem;
    miCity: TMenuItem;
    miCityKind: TMenuItem;
    miStreet: TMenuItem;
    miStreetKind: TMenuItem;
    miBusiness: TMenuItem;
    miBranch: TMenuItem;
    miUnit_List: TMenuItem;
    miUnit: TMenuItem;
    miCash: TMenuItem;
    miBank: TMenuItem;
    miBankAccount: TMenuItem;
    miBankAccountContract: TMenuItem;
    miCorrAccount: TMenuItem;
    miCurrency: TMenuItem;
    N34: TMenuItem;
    miStorage_Object: TMenuItem;
    miGoodsGroup: TMenuItem;
    miGoodsGroupStat: TMenuItem;
    miGoodsGroupAnalyst: TMenuItem;
    miGoods_List: TMenuItem;
    miGoods: TMenuItem;
    miGoodsKind: TMenuItem;
    miGoodsTag: TMenuItem;
    miGoodsKindWeighing: TMenuItem;
    miBox: TMenuItem;
    miMeasure: TMenuItem;
    miGoodsProperty: TMenuItem;
    miGoodsPropertyValue: TMenuItem;
    miGoodsQuality: TMenuItem;
    miTradeMark: TMenuItem;
    miPriceList: TMenuItem;
    miReceipt: TMenuItem;
    miReceiptCost: TMenuItem;
    miBarSubItem: TMenuItem;
    miInfoMoneyGroup: TMenuItem;
    miInfoMoneyDestination: TMenuItem;
    miInfoMoney: TMenuItem;
    miArticleLoss: TMenuItem;
    N35: TMenuItem;
    miAccountGroup: TMenuItem;
    miAccountDirection: TMenuItem;
    miAccount: TMenuItem;
    N36: TMenuItem;
    miProfitLossGroup: TMenuItem;
    miProfitLossDirection: TMenuItem;
    miProfitLoss: TMenuItem;
    N37: TMenuItem;
    miJuridicalGuides: TMenuItem;
    N38: TMenuItem;
    actContractPartner: TdsdOpenForm;
    miContractPartner: TMenuItem;
    actRoleUnion: TdsdOpenForm;
    miRoleUnion: TMenuItem;
    actContractGoods: TdsdOpenForm;
    miContractGoods: TMenuItem;
    actCashOperationOdessa: TdsdOpenForm;
    miCashOdessa: TMenuItem;
    actQuality: TdsdOpenForm;
    N39: TMenuItem;
    actOrderInternal: TdsdOpenForm;
    actOrderExternalUnit: TdsdOpenForm;
    miOrderExternalUnit: TMenuItem;
    miReport_JuridicalDefermentIncome: TMenuItem;
    actReport_JuridicalDefermentIncome: TdsdOpenForm;
    miOrderInternal: TMenuItem;
    actReport_ProductionOrder: TdsdOpenForm;
    actOrderType: TdsdOpenForm;
    miOrderType: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    actProductionUnionTechDelic: TdsdOpenForm;
    N47: TMenuItem;
    miReport_ProductionOrder: TMenuItem;
    miCashPav: TMenuItem;
    actCashOperationPav: TdsdOpenForm;
    actJuridicalGLN: TdsdOpenForm;
    miJuridicalGLN: TMenuItem;
    actPartnerGLN: TdsdOpenForm;
    miPartnerGLN: TMenuItem;
    actGoodsByGoodsKind: TdsdOpenForm;
    N48: TMenuItem;
    actReport_ReceiptProductionAnalyzeForm: TdsdOpenForm;
    miReport_ReceiptProductionAnalyze: TMenuItem;
    actReport_GoodsMI_Defroster: TdsdOpenForm;
    N51: TMenuItem;
    N52: TMenuItem;
    actMemberExternal: TdsdOpenForm;
    miMemberExternal: TMenuItem;
    actTransportGoods: TdsdOpenForm;
    N41: TMenuItem;
    miTransportGoods: TMenuItem;
    actLoadStatusFromMedoc: TdsdOpenForm;
    MEDOC1: TMenuItem;
    actQualityDoc: TdsdOpenForm;
    miQualityDoc: TMenuItem;
    actReport_GoodsMI_Package: TdsdOpenForm;
    N53: TMenuItem;
    actGlobalConst: TdsdOpenForm;
    N31: TMenuItem;
    N40: TMenuItem;
    spRefresh: TdsdExecStoredProc;
    spGetInfo: TdsdStoredProc;
    actPersonalBankAccount: TdsdOpenForm;
    miPersonalBankAccount: TMenuItem;
    actGoodsPlatform: TdsdOpenForm;
    N55: TMenuItem;
    actReport_GoodsMI_byPriceDifReturn: TdsdOpenForm;
    N56: TMenuItem;
    actPersonalCashKiev: TdsdOpenForm;
    actPersonalCashKrRog: TdsdOpenForm;
    actPersonalCashNikolaev: TdsdOpenForm;
    actPersonalCashKharkov: TdsdOpenForm;
    actPersonalCashCherkassi: TdsdOpenForm;
    actPersonalCashZaporozhye: TdsdOpenForm;
    actPersonalCashOdessa: TdsdOpenForm;
    N57: TMenuItem;
    miPersonalCashKiev: TMenuItem;
    miPersonalCashKrRog: TMenuItem;
    miPersonalCashNikolaev: TMenuItem;
    miPersonalCashKharkov: TMenuItem;
    miPersonalCashCherkassi: TMenuItem;
    miPersonalCashZaporozhye: TMenuItem;
    miPersonalCashOdessa: TMenuItem;
    actRouteGroup: TdsdOpenForm;
    N54: TMenuItem;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    CDSGetInfo: TClientDataSet;
    DataSource: TDataSource;
    colText: TcxGridDBColumn;
    colData: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    actReport_GoodsBalance: TdsdOpenForm;
    N58: TMenuItem;
    actReport_MotionGoods_Upak: TdsdOpenForm;
    N59: TMenuItem;
    actReport_MotionGoods_Ceh: TdsdOpenForm;
    N60: TMenuItem;
    actRetail_PrintKindItem: TdsdOpenForm;
    N61: TMenuItem;
    actJuridical_PrintKindItem: TdsdOpenForm;
    N62: TMenuItem;
    actReport_PersonalComplete: TdsdOpenForm;
    N63: TMenuItem;
    N64: TMenuItem;
    actMedocJournal: TdsdOpenForm;
    miReport_WeighingPartner: TMenuItem;
    actPartner_PriceList: TdsdOpenForm;
    actPartner_PriceList_view: TdsdOpenForm;
    actJuridical_PriceList: TdsdOpenForm;
    N65: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    actIncomePartionGoods: TdsdOpenForm;
    N68: TMenuItem;
    actSale: TdsdOpenForm;
    miSale: TMenuItem;
    miOrderInternalPack: TMenuItem;
    actOrderInternalPack: TdsdOpenForm;
    actIncomePartner: TdsdOpenForm;
    N70: TMenuItem;
    actWeighingPartnerItem: TdsdOpenForm;
    actWeighingProductionItem: TdsdOpenForm;
    N71: TMenuItem;
    N72: TMenuItem;
    actOrderInternalBasis: TdsdOpenForm;
    miOrderInternalBasis: TMenuItem;
    actReturnOut_Partner: TdsdOpenForm;
    N69: TMenuItem;
    actReport_GoodsMI_SaleReturnInUnit: TdsdOpenForm;
    miReport_GoodsMI_SaleReturnInUnit: TMenuItem;
    actReport_GoodsMI_Internal: TdsdOpenForm;
    N73: TMenuItem;
    actReport_GoodsMI_Send: TdsdOpenForm;
    actReport_GoodsMI_SendonPrice: TdsdOpenForm;
    N74: TMenuItem;
    N75: TMenuItem;
    actOrderInternalBasisDelik: TdsdOpenForm;
    miOrderInternalBasisDelik: TMenuItem;
    miReport_ReceiptSaleAnalyze: TMenuItem;
    actReport_ReceiptSaleAnalyzeForm: TdsdOpenForm;
    actReport_ReceiptProductionOutAnalyzeForm: TdsdOpenForm;
    miReport_ReceiptProductionOutAnalyze: TMenuItem;
    actReport_TransportList: TdsdOpenForm;
    N49: TMenuItem;
    actReport_BankAccountCash: TdsdOpenForm;
    N50: TMenuItem;
    actReport_LoginProtocol: TdsdOpenForm;
    N76: TMenuItem;
    actReport_GoodsMI_SaleReturnInUnitNew: TdsdOpenForm;
    N77: TMenuItem;
    actReport_Transport_ProfitLoss: TdsdOpenForm;
    N78: TMenuItem;
    actAdvertising: TdsdOpenForm;
    N79: TMenuItem;
    actPromoKind: TdsdOpenForm;
    actConditionPromo: TdsdOpenForm;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    actPromoJournal: TdsdOpenForm;
    N83: TMenuItem;
    N84: TMenuItem;
    actReport_Branch_App7: TdsdOpenForm;
    N710: TMenuItem;
    actReport_Wage: TdsdOpenForm;
    N85: TMenuItem;
    mniReport_Wage: TMenuItem;
    actReport_Weighing: TdsdOpenForm;
    C1: TMenuItem;
    actReport_Branch_App1: TdsdOpenForm;
    N110: TMenuItem;
    actReport_Branch_Cash: TdsdOpenForm;
    N86: TMenuItem;
    N87: TMenuItem;
    actReport_Branch_App7_New: TdsdOpenForm;
    N711: TMenuItem;
    actReport_Promo: TdsdOpenForm;
    N88: TMenuItem;
    actReport_SheetWorkTime: TdsdOpenForm;
    N89: TMenuItem;
    actForms: TdsdOpenForm;
    N90: TMenuItem;
    spGet_Object_Form_HelpFile: TdsdStoredProc;
    actHelp: TShellExecuteAction;
    actGet_Object_Form_HelpFile: TdsdExecStoredProc;
    mactHelp: TMultiAction;
    FormParams: TdsdFormParams;
    N91: TMenuItem;
    actReport_Tara: TdsdOpenForm;
    N92: TMenuItem;
    actGoodsExternal: TdsdOpenForm;
    N93: TMenuItem;
    actReport_SaleOrderExternalList: TdsdOpenForm;
    N94: TMenuItem;
    actMember_Trasport: TdsdOpenForm;
    N95: TMenuItem;
    actRouteMember: TdsdOpenForm;
    N96: TMenuItem;
    actBranchJuridical: TdsdOpenForm;
    N97: TMenuItem;
    actGoodsByGoodsKind_Order: TdsdOpenForm;
    N98: TMenuItem;
    actReceiptComponents: TdsdOpenForm;
    N99: TMenuItem;
    actQualityNumber: TdsdOpenForm;
    N100: TMenuItem;
    actCarExternal: TdsdOpenForm;
    N101: TMenuItem;
    actExportKind: TdsdOpenForm;
    miEmail: TMenuItem;
    N102: TMenuItem;
    actEmailTools: TdsdOpenForm;
    N103: TMenuItem;
    actEmailSettings: TdsdOpenForm;
    N104: TMenuItem;
    actEmailKind: TdsdOpenForm;
    N105: TMenuItem;
    actExportJuridical: TdsdOpenForm;
    N106: TMenuItem;
    actMobileTariff: TdsdOpenForm;
    miMobileTariff: TMenuItem;
    miSubMobile: TMenuItem;
    actMobileNumbersEmployee: TdsdOpenForm;
    actReport_Check_ReturnInToSale: TdsdOpenForm;
    N107: TMenuItem;
    actReport_CheckAmount_ReturnInToSale: TdsdOpenForm;
    miReport_MobileKS: TMenuItem;
    actReport_MobileKS: TdsdOpenForm;
    actDocumentKind: TdsdOpenForm;
    N108: TMenuItem;
    actOrderIncome: TdsdOpenForm;
    N109: TMenuItem;
    actNameBefore: TdsdOpenForm;
    N111: TMenuItem;
    actInvoice: TdsdOpenForm;
    N112: TMenuItem;
    procedure actReport_OLAPSoldExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ChangeKeyboard(var Message: TMessage); message WM_ChangeKeyboard;
  public
    { Public declarations }
  end;

var
  MainFormInstance: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.actReport_OLAPSoldExecute(Sender: TObject);
begin
  inherited;
  with TFormClass(FindClass('TOLAPSetupForm')).Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.ChangeKeyboard(var Message: TMessage);
begin
  //LoadKeyboardLayout('00000419', KLF_ACTIVATE); ru
  LoadKeyboardLayout('00000422', KLF_ACTIVATE); //ukr
end;

procedure TMainForm.FormShow(Sender: TObject);
var Item: TContainedAction;
begin
  inherited;
  PostMessage(Handle, WM_ChangeKeyboard, 0, 0);
  // ��������� ����� �� ��� � �������
  for Item in ActionList do
      if Item is TdsdCustomAction then
         if TdsdCustomAction(Item).EnabledTimer then
            TdsdCustomAction(Item).Execute;
end;

end.
