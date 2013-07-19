unit JuridicalGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Datasnap.DBClient, dsdDB, cxPropertiesStore, dxBar,
  Vcl.ActnList, dsdAction, ParentForm, DataModul, Vcl.ComCtrls,
  cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit,
  dsdAddOn, dxBarExtItems;

type
  TJuridicalGroupForm = class(TParentForm)
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    cxPropertiesStore: TcxPropertiesStore;
    dxBarManager: TdxBarManager;
    dxBarManagerBar1: TdxBar;
    ActionList: TActionList;
    bbRefresh: TdxBarButton;
    actRefresh: TdsdDataSetRefresh;
    actInsert: TdsdInsertUpdateAction;
    bbInsert: TdxBarButton;
    dsdStoredProc: TdsdStoredProc;
    actUpdate: TdsdInsertUpdateAction;
    bbEdit: TdxBarButton;
    cxDBTreeList: TcxDBTreeList;
    colCode: TcxDBTreeListColumn;
    colName: TcxDBTreeListColumn;
    dsdUserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn;
    dsdDBTreeAddOn: TdsdDBTreeAddOn;
    spErasedUnErased: TdsdStoredProc;
    actSetErased: TdsdUpdateErased;
    actSetUnErased: TdsdUpdateErased;
    actGridToExcel: TdsdGridToExcel;
    actChoiceGuides: TdsdChoiceGuides;
    bbSetErased: TdxBarButton;
    bbSetEnerased: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    bbChoiceGuide: TdxBarButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TJuridicalGroupForm);

end.
