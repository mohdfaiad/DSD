unit AncestorDocumentMC;

interface

uses
  DataModul, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AncestorDBGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxPCdxBarPopupMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, dsdAddOn, dsdGuides, dsdDB,
  dsdAction, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxTextEdit, Vcl.ExtCtrls, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, Vcl.Menus, dxBarExtItems, dxBar, cxClasses,
  Datasnap.DBClient, Vcl.ActnList, cxPropertiesStore, cxGridLevel,
  cxGridCustomView, cxGrid, cxPC, dxSkinsCore, dxSkinsDefaultPainters,
  cxCurrencyEdit, dxSkinscxPCPainter, dxSkinsdxBarPainter;

type
  TAncestorDocumentMCForm = class(TAncestorDBGridForm)
    EntryCDS: TClientDataSet;
    EntryDS: TDataSource;
    spSelectMIContainer: TdsdStoredProc;
    FormParams: TdsdFormParams;
    StatusGuides: TdsdGuides;
    spChangeStatus: TdsdStoredProc;
    spGet: TdsdStoredProc;
    spInsertUpdateMovement: TdsdStoredProc;
    GuidesFiller: TGuidesFiller;
    HeaderSaver: THeaderSaver;
    RefreshAddOn: TRefreshAddOn;
    spErasedMIMaster: TdsdStoredProc;
    spUnErasedMIMaster: TdsdStoredProc;
    spInsertUpdateMIMaster: TdsdStoredProc;
    EntryViewAddOn: TdsdDBViewAddOn;
    colIsErased: TcxGridDBColumn;
    colInvNumber: TcxGridDBColumn;
    colOperDate: TcxGridDBColumn;
    actAddMask: TdsdExecStoredProc;
    spInsertMaskMIMaster: TdsdStoredProc;
    bbAddMask: TdxBarButton;
    spGetTotalSumm: TdsdStoredProc;
    ChildCDS: TClientDataSet;
    ChildDS: TDataSource;
    spErasedMIChild: TdsdStoredProc;
    spUnErasedMIChild: TdsdStoredProc;
    spInsertMaskMIChild: TdsdStoredProc;
    GuidesTo: TdsdGuides;
    GuidesFrom: TdsdGuides;
    DataPanel: TPanel;
    edInvNumber: TcxTextEdit;
    cxLabel1: TcxLabel;
    edOperDate: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxLabel15: TcxLabel;
    ceStatus: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edFrom: TcxButtonEdit;
    edTo: TcxButtonEdit;
    spInsertUpdateMIChild: TdsdStoredProc;
    colGoodsCode: TcxGridDBColumn;
    colGoodsName: TcxGridDBColumn;
    colAmount: TcxGridDBColumn;
    bbAddChild: TdxBarButton;
    InsertRecordChild: TInsertRecord;
    actMIChildSetErased: TdsdUpdateErased;
    actMIChildSetUnErased: TdsdUpdateErased;
    bbErasedChild: TdxBarButton;
    bbUnErasedChild: TdxBarButton;
    dxBarSeparator1: TdxBarSeparator;
    PopupMenuChild: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ChildDBViewAddOn: TdsdDBViewAddOn;
    cxGridChild: TcxGrid;
    cxGridDBTableViewChild: TcxGridDBTableView;
    colChildGoodsCode: TcxGridDBColumn;
    colChildAmount: TcxGridDBColumn;
    colChildAmountReceipt: TcxGridDBColumn;
    colChildPartionGoods: TcxGridDBColumn;
    colChildComment: TcxGridDBColumn;
    colChildIsErased: TcxGridDBColumn;
    cxGridLevelChild: TcxGridLevel;
    actGoodsChoiceForm: TOpenChoiceForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
