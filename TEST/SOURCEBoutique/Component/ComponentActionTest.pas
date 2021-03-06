unit ComponentActionTest;

interface

uses
  TestFramework;

type
  TActionTest = class (TTestCase)
  private
  protected
    // �������������� ������ ��� ������������
    procedure SetUp; override;
  published
    procedure InternetActionTest;
    procedure ScaleTest;
  end;

implementation

uses dsdInternetAction, classes, vcl.ActnList;

{ TActionTest }

procedure TActionTest.InternetActionTest;
begin
  with TdsdSMTPAction.Create(nil) do
    try
      Host.Value := 'dsd.biz.ua';
      UserName.Value := 'test@dsd.biz.ua';
      FromAddress.Value := 'test@dsd.biz.ua';
      Password.Value := 'testtest';
      ToAddress.Value :=  'kukhtinigor@gmail.com, igor@dsd.biz.ua';
      Body.Value := '��� ����� ������!!!';
      Subject.Value := '� ��� � ���������';
      Execute;
    finally
      Free;
    end;
end;

procedure TActionTest.ScaleTest;
var Action: TAction;
begin
   Action := TAction(GetClass('TScaleAction').NewInstance);
   Action.Create(nil);
   Action.Execute;
   Action.Execute;
end;

procedure TActionTest.SetUp;
begin
  inherited;

end;

initialization
  TestFramework.RegisterTest('ActionTest', TActionTest.Suite);

end.
