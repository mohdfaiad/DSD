unit MovementItemProtocol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AncestorDBGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxPCdxBarPopupMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData,
  Vcl.Menus, dsdAddOn, dxBarExtItems, dxBar, cxClasses, dsdDB,
  Datasnap.DBClient, dsdAction, Vcl.ActnList, cxPropertiesStore, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxButtonEdit, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  Vcl.ExtCtrls, dsdGuides, dsdXMLTransform;

type
  TMovementItemProtocolForm = class(TAncestorDBGridForm)
    Panel: TPanel;
    deStart: TcxDateEdit;
    deEnd: TcxDateEdit;
    cxLabel1: TcxLabel;
    edUser: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    FormParams: TdsdFormParams;
    UserGuides: TdsdGuides;
    clOperDate: TcxGridDBColumn;
    clProtocolData: TcxGridDBColumn;
    clUserName: TcxGridDBColumn;
    clMovementItemId: TcxGridDBColumn;
    ProtocolDataCDS: TClientDataSet;
    ProtocolDataCDSFieldName: TStringField;
    ProtocolDataCDSFieldValue: TStringField;
    ProtocolDataDS: TDataSource;
    dsdXMLTransform: TdsdXMLTransform;
    cxGridProtocolData: TcxGrid;
    cxGridViewProtocolData: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevelProtocolData: TcxGridLevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

initialization
  RegisterClass(TMovementItemProtocolForm);


end.
