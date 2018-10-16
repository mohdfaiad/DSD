unit ReportCollation_UpdateObjectDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ParentForm, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, ChoicePeriod,
  dsdGuides, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxPropertiesStore, dsdAddOn, dsdDB, cxLabel, dxSkinsCore,
  dxSkinsDefaultPainters, cxCheckBox, dsdAction, Vcl.ActnList;

type
  TReportCollation_UpdateObjectDialogForm = class(TParentForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    dsdUserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn;
    cxPropertiesStore: TcxPropertiesStore;
    FormParams: TdsdFormParams;
    ActionList: TActionList;
    dsdFormClose: TdsdFormClose;
    edIsBuh: TcxCheckBox;
    cxLabel1: TcxLabel;
    deBuhDate: TcxDateEdit;
    spInsertUpdate: TdsdStoredProc;
    dsdInsertUpdateGuides1: TdsdInsertUpdateGuides;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TReportCollation_UpdateObjectDialogForm);

end.
