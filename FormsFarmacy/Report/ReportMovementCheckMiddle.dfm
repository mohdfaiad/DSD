inherited ReportMovementCheckMiddleForm: TReportMovementCheckMiddleForm
  Caption = #1054#1090#1095#1077#1090' <'#1057#1088#1077#1076#1085#1080#1081' '#1095#1077#1082'> '
  ClientHeight = 480
  ClientWidth = 1251
  AddOnFormData.ExecuteDialogAction = ExecuteDialog
  ExplicitWidth = 1267
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TcxPageControl
    Top = 91
    Width = 1251
    Height = 389
    TabOrder = 3
    ExplicitTop = 91
    ExplicitWidth = 1251
    ExplicitHeight = 389
    ClientRectBottom = 389
    ClientRectRight = 1251
    inherited tsMain: TcxTabSheet
      ExplicitWidth = 1251
      ExplicitHeight = 389
      inherited cxGrid: TcxGrid
        Width = 1251
        Height = 389
        ExplicitWidth = 1251
        ExplicitHeight = 389
        inherited cxGridDBTableView: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.####'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaSale
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount1
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale1
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount2
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale2
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount3
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale3
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount4
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale4
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount5
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale5
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount6
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale6
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount7
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale7
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = cxColor_Amount
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = cxColor_Summa
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = #1042#1089#1077#1075#1086' '#1089#1090#1088#1086#1082': ,0'
              Kind = skCount
            end
            item
              Format = ',0.####'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaSale
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount1
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale1
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount2
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale2
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount3
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale3
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount4
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale4
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount5
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale5
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount6
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale6
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Amount7
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = SummaSale7
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = cxColor_Amount
            end
            item
              Format = ',0.00;-,0.00; ;'
              Kind = skSum
              Column = cxColor_Summa
            end>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsView.GroupByBox = True
          Styles.Content = nil
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Header = nil
          object OperDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'OperDate'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object UnitName: TcxGridDBColumn
            Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
            DataBinding.FieldName = 'UnitName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 193
          end
          object Amount: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1079#1072' '#1076#1077#1085#1100
            DataBinding.FieldName = 'Amount'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1079#1072' '#1076#1077#1085#1100' ('#1096#1090')'
            Width = 84
          end
          object AmountPeriod: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1079#1072' '#1087#1077#1088#1080#1086#1076
            DataBinding.FieldName = 'AmountPeriod'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 77
          end
          object SummaSale: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1079#1072' '#1076#1077#1085#1100
            DataBinding.FieldName = 'SummaSale'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 83
          end
          object SummaSalePeriod: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1095#1077#1082#1086#1074' '#1079#1072' '#1087#1077#1088#1080#1086#1076
            DataBinding.FieldName = 'SummaSalePeriod'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object SummaMiddle: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072' '#1079#1072' '#1076#1077#1085#1100
            DataBinding.FieldName = 'SummaMiddle'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 92
          end
          object SummaMiddlePeriod: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076
            DataBinding.FieldName = 'SummaMiddlePeriod'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 97
          end
          object Amount1: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1087#1077#1088#1080#1086#1076' 1'
            DataBinding.FieldName = 'Amount1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1079#1072' '#1076#1077#1085#1100' ('#1096#1090')'
            Width = 70
          end
          object SummaSale1: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1087#1077#1088#1080#1086#1076' 1'
            DataBinding.FieldName = 'SummaSale1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object SummaMiddle1: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072' '#1087#1077#1088#1080#1086#1076' 1'
            DataBinding.FieldName = 'SummaMiddle1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object Amount2: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1087#1077#1088#1080#1086#1076' 2'
            DataBinding.FieldName = 'Amount2'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1079#1072' '#1076#1077#1085#1100' ('#1096#1090')'
            Width = 70
          end
          object SummaSale2: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1087#1077#1088#1080#1086#1076' 2'
            DataBinding.FieldName = 'SummaSale2'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object SummaMiddle2: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072' '#1087#1077#1088#1080#1086#1076' 2'
            DataBinding.FieldName = 'SummaMiddle2'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object Amount3: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1087#1077#1088#1080#1086#1076' 3'
            DataBinding.FieldName = 'Amount3'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1079#1072' '#1076#1077#1085#1100' ('#1096#1090')'
            Width = 70
          end
          object SummaSale3: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1087#1077#1088#1080#1086#1076' 3'
            DataBinding.FieldName = 'SummaSale3'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object SummaMiddle3: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072' '#1087#1077#1088#1080#1086#1076' 3'
            DataBinding.FieldName = 'SummaMiddle3'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object Amount4: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1087#1077#1088#1080#1086#1076' 4'
            DataBinding.FieldName = 'Amount4'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1079#1072' '#1076#1077#1085#1100' ('#1096#1090')'
            Width = 70
          end
          object SummaSale4: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1087#1077#1088#1080#1086#1076' 4'
            DataBinding.FieldName = 'SummaSale4'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object SummaMiddle4: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072' '#1087#1077#1088#1080#1086#1076' 4'
            DataBinding.FieldName = 'SummaMiddle4'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object Amount5: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1087#1077#1088#1080#1086#1076' 5'
            DataBinding.FieldName = 'Amount5'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1079#1072' '#1076#1077#1085#1100' ('#1096#1090')'
            Width = 70
          end
          object SummaSale5: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1087#1077#1088#1080#1086#1076' 5'
            DataBinding.FieldName = 'SummaSale5'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object SummaMiddle5: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072' '#1087#1077#1088#1080#1086#1076' 5'
            DataBinding.FieldName = 'SummaMiddle5'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object Amount6: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1087#1077#1088#1080#1086#1076' 6'
            DataBinding.FieldName = 'Amount6'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1079#1072' '#1076#1077#1085#1100' ('#1096#1090')'
            Width = 70
          end
          object SummaSale6: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1087#1077#1088#1080#1086#1076' 6'
            DataBinding.FieldName = 'SummaSale6'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object SummaMiddle6: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072' '#1087#1077#1088#1080#1086#1076' 6'
            DataBinding.FieldName = 'SummaMiddle6'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object Amount7: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1087#1077#1088#1080#1086#1076' 7'
            DataBinding.FieldName = 'Amount7'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1079#1072' '#1076#1077#1085#1100' ('#1096#1090')'
            Width = 70
          end
          object SummaSale7: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1087#1077#1088#1080#1086#1076' 7'
            DataBinding.FieldName = 'SummaSale7'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object SummaMiddle7: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072' '#1087#1077#1088#1080#1086#1076' 7'
            DataBinding.FieldName = 'SummaMiddle7'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object cxColor_Amount: TcxGridDBColumn
            DataBinding.FieldName = 'Color_Amount'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
          end
          object cxColor_Summa: TcxGridDBColumn
            DataBinding.FieldName = 'Color_Summa'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
          end
          object cxColor_SummaSale: TcxGridDBColumn
            DataBinding.FieldName = 'Color_SummaSale'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
          end
        end
      end
    end
  end
  inherited Panel: TPanel
    Width = 1251
    Height = 65
    ExplicitWidth = 1251
    ExplicitHeight = 65
    inherited deStart: TcxDateEdit
      Left = 29
      ExplicitLeft = 29
    end
    object ceValue1: TcxCurrencyEdit [1]
      Left = 183
      Top = 5
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = ',0.####'
      TabOrder = 3
      Width = 80
    end
    object ceValue2: TcxCurrencyEdit [2]
      Left = 183
      Top = 31
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = ',0.####'
      TabOrder = 4
      Width = 80
    end
    object ceValue3: TcxCurrencyEdit [3]
      Left = 324
      Top = 5
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = ',0.####'
      TabOrder = 5
      Width = 80
    end
    object ceValue4: TcxCurrencyEdit [4]
      Left = 324
      Top = 31
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = ',0.####'
      TabOrder = 6
      Width = 80
    end
    object ceValue5: TcxCurrencyEdit [5]
      Left = 467
      Top = 5
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = ',0.####'
      TabOrder = 7
      Width = 80
    end
    object ceValue6: TcxCurrencyEdit [6]
      Left = 467
      Top = 31
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = ',0.####'
      TabOrder = 8
      Width = 80
    end
    object ceUnit: TcxButtonEdit [7]
      Left = 557
      Top = 31
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.Nullstring = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077'>'
      Properties.ReadOnly = True
      Properties.UseNullString = True
      TabOrder = 9
      Text = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077'>'
      Width = 316
    end
    inherited deEnd: TcxDateEdit
      Left = 29
      Top = 31
      TabOrder = 2
      ExplicitLeft = 29
      ExplicitTop = 31
    end
    inherited cxLabel1: TcxLabel
      Caption = #1057':'
      ExplicitWidth = 15
    end
    inherited cxLabel2: TcxLabel
      Left = 5
      Top = 32
      Caption = #1087#1086':'
      ExplicitLeft = 5
      ExplicitTop = 32
      ExplicitWidth = 20
    end
    object cxLabel3: TcxLabel
      Left = 557
      Top = 6
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
    end
    object cxLabel8: TcxLabel
      Left = 126
      Top = 6
      Caption = #1055#1088#1077#1076#1077#1083' 1'
    end
    object cxLabel9: TcxLabel
      Left = 126
      Top = 32
      Caption = #1055#1088#1077#1076#1077#1083' 2'
    end
    object cxLabel10: TcxLabel
      Left = 269
      Top = 6
      Caption = #1055#1088#1077#1076#1077#1083' 3'
    end
    object cxLabel11: TcxLabel
      Left = 269
      Top = 32
      Caption = #1055#1088#1077#1076#1077#1083' 4'
    end
    object cxLabel6: TcxLabel
      Left = 412
      Top = 8
      Caption = #1055#1088#1077#1076#1077#1083' 5'
    end
    object cxLabel12: TcxLabel
      Left = 412
      Top = 32
      Caption = #1055#1088#1077#1076#1077#1083' 6'
    end
  end
  object cbisDay: TcxCheckBox [2]
    Left = 895
    Top = 31
    Action = actRefreshOnDay
    TabOrder = 6
    Width = 79
  end
  inherited cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = deEnd
        Properties.Strings = (
          'Date')
      end
      item
        Component = deStart
        Properties.Strings = (
          'Date')
      end
      item
        Component = ceValue1
        Properties.Strings = (
          'Value')
      end
      item
        Component = ceValue2
        Properties.Strings = (
          'Value')
      end
      item
        Component = ceValue3
        Properties.Strings = (
          'Value')
      end
      item
        Component = ceValue4
        Properties.Strings = (
          'Value')
      end
      item
        Component = ceValue5
        Properties.Strings = (
          'Value')
      end
      item
        Component = ceValue6
        Properties.Strings = (
          'Value')
      end
      item
        Component = UnitGuides
        Properties.Strings = (
          'Key'
          'TextValue')
      end>
  end
  inherited ActionList: TActionList
    object actGet_UserUnit: TdsdExecStoredProc
      Category = 'DSDLib'
      MoveParams = <>
      PostDataSetBeforeExecute = False
      StoredProc = spGet_UserUnit
      StoredProcList = <
        item
          StoredProc = spGet_UserUnit
        end>
      Caption = 'actGet_UserUnit'
    end
    object actRefreshStart: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spGet_UserUnit
      StoredProcList = <
        item
          StoredProc = spGet_UserUnit
        end
        item
          StoredProc = spSelect
        end>
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object ExecuteDialog: TExecuteDialog
      Category = 'DSDLib'
      MoveParams = <>
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      ImageIndex = 35
      FormName = 'TReport_MovementCheckMiddleDialogForm'
      FormNameParam.Value = 'TReport_MovementCheckMiddleDialogForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <
        item
          Name = 'StartDate'
          Value = 42370d
          Component = deStart
          DataType = ftDateTime
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'EndDate'
          Value = 42370d
          Component = deEnd
          DataType = ftDateTime
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitId'
          Value = ''
          Component = UnitGuides
          ComponentItem = 'Key'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitName'
          Value = ''
          Component = UnitGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'isDay'
          Value = Null
          Component = cbisDay
          DataType = ftBoolean
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'inValue1'
          Value = Null
          Component = ceValue1
          DataType = ftFloat
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'inValue2'
          Value = Null
          Component = ceValue2
          DataType = ftFloat
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'inValue3'
          Value = Null
          Component = ceValue3
          DataType = ftFloat
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'inValue4'
          Value = Null
          Component = ceValue4
          DataType = ftFloat
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'inValue5'
          Value = Null
          Component = ceValue5
          DataType = ftFloat
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'inValue6'
          Value = Null
          Component = ceValue6
          DataType = ftFloat
          ParamType = ptInput
          MultiSelectSeparator = ','
        end>
      isShowModal = True
      RefreshDispatcher = RefreshDispatcher
      OpenBeforeShow = True
    end
    object actRefreshOnDay: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spSelect
      StoredProcList = <
        item
          StoredProc = spSelect
        end>
      Caption = #1087#1086' '#1044#1085#1103#1084
      Hint = #1087#1086' '#1044#1085#1103#1084
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
  end
  inherited MasterDS: TDataSource
    Left = 48
    Top = 160
  end
  inherited MasterCDS: TClientDataSet
    Left = 16
    Top = 160
  end
  inherited spSelect: TdsdStoredProc
    StoredProcName = 'gpReport_Movement_CheckMiddle'
    Params = <
      item
        Name = 'inUnitId'
        Value = Null
        Component = UnitGuides
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inDateStart'
        Value = 41395d
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inDateFinal'
        Value = 41395d
        Component = deEnd
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inisDay'
        Value = Null
        Component = cbisDay
        DataType = ftBoolean
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inValue1'
        Value = Null
        Component = ceValue1
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inValue2'
        Value = Null
        Component = ceValue2
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inValue3'
        Value = Null
        Component = ceValue3
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inValue4'
        Value = Null
        Component = ceValue4
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inValue5'
        Value = Null
        Component = ceValue5
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inValue6'
        Value = Null
        Component = ceValue6
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 80
    Top = 160
  end
  inherited BarManager: TdxBarManager
    Left = 120
    Top = 160
    DockControlHeights = (
      0
      0
      26
      0)
    inherited Bar: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbExecuteDialog'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbGridToExcel'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end>
    end
    object dxBarButton1: TdxBarButton
      Caption = #1055#1086' '#1087#1072#1088#1090#1080#1103#1084
      Category = 0
      Hint = #1055#1086' '#1087#1072#1088#1090#1080#1103#1084
      Visible = ivAlways
      ImageIndex = 38
    end
    object bbExecuteDialog: TdxBarButton
      Action = ExecuteDialog
      Category = 0
    end
    object bbPrint: TdxBarButton
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1072#1084' '#1085#1072' '#1082#1072#1089#1089#1072#1093
      Category = 0
      Hint = #1054#1090#1095#1077#1090' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1072#1084' '#1085#1072' '#1082#1072#1089#1089#1072#1093
      Visible = ivAlways
      ImageIndex = 3
      ShortCut = 16464
    end
  end
  inherited DBViewAddOn: TdsdDBViewAddOn
    ColorRuleList = <
      item
        ColorColumn = Amount1
        BackGroundValueColumn = cxColor_Amount
        ColorValueList = <>
      end
      item
        ColorColumn = Amount2
        BackGroundValueColumn = cxColor_Amount
        ColorValueList = <>
      end
      item
        ColorColumn = Amount3
        BackGroundValueColumn = cxColor_Amount
        ColorValueList = <>
      end
      item
        ColorColumn = Amount4
        BackGroundValueColumn = cxColor_Amount
        ColorValueList = <>
      end
      item
        ColorColumn = Amount5
        BackGroundValueColumn = cxColor_Amount
        ColorValueList = <>
      end
      item
        ColorColumn = Amount6
        BackGroundValueColumn = cxColor_Amount
        ColorValueList = <>
      end
      item
        ColorColumn = Amount7
        BackGroundValueColumn = cxColor_Amount
        ColorValueList = <>
      end
      item
        ColorColumn = SummaSale1
        BackGroundValueColumn = cxColor_SummaSale
        ColorValueList = <>
      end
      item
        ColorColumn = SummaSale2
        BackGroundValueColumn = cxColor_SummaSale
        ColorValueList = <>
      end
      item
        ColorColumn = SummaSale3
        BackGroundValueColumn = cxColor_SummaSale
        ColorValueList = <>
      end
      item
        ColorColumn = SummaSale4
        BackGroundValueColumn = cxColor_SummaSale
        ColorValueList = <>
      end
      item
        ColorColumn = SummaSale5
        BackGroundValueColumn = cxColor_SummaSale
        ColorValueList = <>
      end
      item
        ColorColumn = SummaSale6
        BackGroundValueColumn = cxColor_SummaSale
        ColorValueList = <>
      end
      item
        ColorColumn = SummaSale7
        BackGroundValueColumn = cxColor_SummaSale
        ColorValueList = <>
      end>
  end
  inherited PeriodChoice: TPeriodChoice
    Left = 24
    Top = 8
  end
  inherited RefreshDispatcher: TRefreshDispatcher
    Left = 1144
    Top = 32
  end
  object rdUnit: TRefreshDispatcher
    IdParam.Value = Null
    IdParam.MultiSelectSeparator = ','
    RefreshAction = actRefresh
    ComponentList = <
      item
        Component = UnitGuides
      end>
    Left = 1096
    Top = 8
  end
  object UnitGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = ceUnit
    FormNameParam.Value = 'TUnitTreeForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TUnitTreeForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = UnitGuides
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = UnitGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 696
    Top = 16
  end
  object spGet_UserUnit: TdsdStoredProc
    StoredProcName = 'gpGet_UserUnit'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'UnitId'
        Value = ''
        Component = UnitGuides
        ComponentItem = 'Key'
        MultiSelectSeparator = ','
      end
      item
        Name = 'UnitName'
        Value = ''
        Component = UnitGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        MultiSelectSeparator = ','
      end>
    PackSize = 1
    Left = 1064
    Top = 40
  end
end
