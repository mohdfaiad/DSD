inherited GuideGoodsMovementForm: TGuideGoodsMovementForm
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' '#1076#1083#1103' '#1079#1072#1103#1074#1082#1080
  PixelsPerInch = 96
  TextHeight = 14
  inherited GridPanel: TPanel
    inherited cxDBGrid: TcxGrid
      inherited cxDBGridDBTableView: TcxGridDBTableView
        Styles.Content = nil
        Styles.Inactive = nil
        Styles.Selection = nil
        Styles.Footer = nil
        Styles.Header = nil
        inherited Price_Return: TcxGridDBColumn
          Visible = False
          VisibleForCustomization = False
        end
        inherited Amount_Order: TcxGridDBColumn
          Visible = True
        end
        inherited Amount_Weighing: TcxGridDBColumn
          Visible = True
        end
        inherited Amount_diff: TcxGridDBColumn
          Visible = True
        end
      end
    end
  end
  inherited spSelect: TdsdStoredProc
    Left = 240
    Top = 336
  end
end
