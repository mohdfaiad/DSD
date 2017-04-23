unit MobileReturnInJournal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AncestorJournal, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData,
  cxImageComboBox, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinsdxBarPainter, dsdAddOn, ChoicePeriod, Vcl.Menus, dxBarExtItems, dxBar,
  cxClasses, dsdDB, Datasnap.DBClient, dsdAction, Vcl.ActnList,
  cxPropertiesStore, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxPC, cxCheckBox, cxCurrencyEdit,
  dsdGuides, cxButtonEdit, dsdInternetAction;

type
  TMobileReturnInJournalForm = class(TAncestorJournalForm)
    colOperDatePartner: TcxGridDBColumn;
    colFromName: TcxGridDBColumn;
    colToName: TcxGridDBColumn;
    colTotalCount: TcxGridDBColumn;
    colTotalCountPartner: TcxGridDBColumn;
    colTotalSumm: TcxGridDBColumn;
    colChangePercent: TcxGridDBColumn;
    colPriceWithVAT: TcxGridDBColumn;
    colVATPercent: TcxGridDBColumn;
    colTotalSummVAT: TcxGridDBColumn;
    colTotalSummMVAT: TcxGridDBColumn;
    colTotalSummPVAT: TcxGridDBColumn;
    colPaidKindName: TcxGridDBColumn;
    colContractName: TcxGridDBColumn;
    colChecked: TcxGridDBColumn;
    edIsPartnerDate: TcxCheckBox;
    colInfoMoneyCode: TcxGridDBColumn;
    colInfoMoneyGroupName: TcxGridDBColumn;
    colInfoMoneyDestinationName: TcxGridDBColumn;
    colInfoMoneyName: TcxGridDBColumn;
    edDocumentTaxKind: TcxButtonEdit;
    cxLabel14: TcxLabel;
    DocumentTaxKindGuides: TdsdGuides;
    spTaxCorrective: TdsdStoredProc;
    actTaxCorrective: TdsdExecStoredProc;
    bbTaxCorrective: TdxBarButton;
    colDocumentTaxKindName: TcxGridDBColumn;
    colOKPO_From: TcxGridDBColumn;
    colJuridicalName_From: TcxGridDBColumn;
    colInvNumberPartner: TcxGridDBColumn;
    colTotalCountTare: TcxGridDBColumn;
    colTotalCountSh: TcxGridDBColumn;
    colTotalCountKg: TcxGridDBColumn;
    spSelectPrint: TdsdStoredProc;
    spSelectPrintTaxCorrective_Client: TdsdStoredProc;
    spSelectPrintTaxCorrective_Us: TdsdStoredProc;
    PrintHeaderCDS: TClientDataSet;
    PrintItemsCDS: TClientDataSet;
    actPrint: TdsdPrintAction;
    bbPrintReturnIn: TdxBarButton;
    bbPrintTaxCorrective_Client: TdxBarButton;
    bbPrintTaxCorrective_Us: TdxBarButton;
    actCorrective: TdsdExecStoredProc;
    bbCorrective: TdxBarButton;
    spCorrective: TdsdStoredProc;
    colInvNumberMark: TcxGridDBColumn;
    spGetReportName: TdsdStoredProc;
    actSPPrintProcName: TdsdExecStoredProc;
    mactPrint: TMultiAction;
    actPrint_ReturnIn_by_TaxCorrective: TdsdPrintAction;
    bbPrint_Return_By_TaxCorrective: TdxBarButton;
    spChecked: TdsdStoredProc;
    actChecked: TdsdExecStoredProc;
    bbactChecked: TdxBarButton;
    colCurrencyValue: TcxGridDBColumn;
    colCurrencyDocumentName: TcxGridDBColumn;
    colCurrencyPartnerName: TcxGridDBColumn;
    colIsEDI: TcxGridDBColumn;
    spGetReportNameTaxCorrective: TdsdStoredProc;
    actPrint_TaxCorrective_Us: TdsdPrintAction;
    actPrint_TaxCorrective_Client: TdsdPrintAction;
    mactPrint_TaxCorrective_Client: TMultiAction;
    mactPrint_TaxCorrective_Us: TMultiAction;
    actSPPrintTaxCorrectiveProcName: TdsdExecStoredProc;
    colContractCode: TcxGridDBColumn;
    colComment: TcxGridDBColumn;
    colInvNumber_Parent: TcxGridDBColumn;
    isPartner: TcxGridDBColumn;
    mactPrintPriceCorr: TMultiAction;
    bbPrintPriceCorr: TdxBarButton;
    spGetReportNamePriceCorr: TdsdStoredProc;
    actSPPrintProcNamePriceCorr: TdsdExecStoredProc;
    actSimpleCheckedList: TMultiAction;
    actCheckedList: TMultiAction;
    spCheckedTrue: TdsdStoredProc;
    N13: TMenuItem;
    N14: TMenuItem;
    actspChecked: TdsdExecStoredProc;
    isPromo: TcxGridDBColumn;
    MovementPromo: TcxGridDBColumn;
    ExecuteDialog: TExecuteDialog;
    actShowMessage: TShowMessageAction;
    spGet_Export_Email: TdsdStoredProc;
    spGet_Export_FileName: TdsdStoredProc;
    spSelect_Export: TdsdStoredProc;
    ExportDS: TDataSource;
    ExportCDS: TClientDataSet;
    ExportEmailCDS: TClientDataSet;
    ExportEmailDS: TDataSource;
    ExportXmlGrid: TcxGrid;
    ExportXmlGridDBTableView: TcxGridDBTableView;
    RowData: TcxGridDBColumn;
    ExportXmlGridLevel: TcxGridLevel;
    actGet_Export_Email: TdsdExecStoredProc;
    actGet_Export_FileName: TdsdExecStoredProc;
    actSelect_Export: TdsdExecStoredProc;
    actExport_Grid: TExportGrid;
    actSMTPFile: TdsdSMTPFileAction;
    actExport: TMultiAction;
    bbExport: TdxBarButton;
    isError: TcxGridDBColumn;
    cxLabel27: TcxLabel;
    edJuridicalBasis: TcxButtonEdit;
    JuridicalBasisGuides: TdsdGuides;
    spGet_UserJuridicalBasis: TdsdStoredProc;
    actRefreshStart: TdsdDataSetRefresh;
    edPersonalTrade: TcxButtonEdit;
    cxLabel3: TcxLabel;
    PersonalTradeGuides: TdsdGuides;
    spGet_PersonalTrade: TdsdStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MobileReturnInJournalForm: TMobileReturnInJournalForm;

implementation

{$R *.dfm}
initialization
  RegisterClass(TMobileReturnInJournalForm);
end.
