inherited BankAccount_PersonalJournalForm: TBankAccount_PersonalJournalForm
  Caption = #1046#1091#1088#1085#1072#1083' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' <'#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090', '#1074#1099#1087#1083#1072#1090#1072' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080'>'
  ClientWidth = 982
  AddOnFormData.RefreshAction = actRefreshStart
  AddOnFormData.ExecuteDialogAction = ExecuteDialog
  AddOnFormData.Params = FormParams
  ExplicitLeft = -255
  ExplicitTop = -221
  ExplicitWidth = 998
  ExplicitHeight = 714
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TcxPageControl
    Top = 76
    Width = 982
    Height = 599
    TabOrder = 3
    ExplicitTop = 76
    ExplicitWidth = 982
    ExplicitHeight = 599
    ClientRectBottom = 599
    ClientRectRight = 982
    inherited tsMain: TcxTabSheet
      ExplicitWidth = 982
      ExplicitHeight = 599
      inherited cxGrid: TcxGrid
        Width = 982
        Height = 599
        ExplicitWidth = 982
        ExplicitHeight = 599
        inherited cxGridDBTableView: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00##'
              Kind = skSum
              Column = Amount
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = TotalSummToPay_Service
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00##'
              Kind = skSum
              Column = Amount
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = TotalSummToPay_Service
            end>
          OptionsData.CancelOnExit = True
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsView.GroupByBox = True
          Styles.Content = nil
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Header = nil
          inherited colStatus: TcxGridDBColumn
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 60
          end
          inherited colInvNumber: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1082'.'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 35
          end
          inherited colOperDate: TcxGridDBColumn
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 60
          end
          object BankAccountName: TcxGridDBColumn
            Caption = #1050#1072#1089#1089#1072
            DataBinding.FieldName = 'BankAccountName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object PersonalServiceListName: TcxGridDBColumn
            Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100
            DataBinding.FieldName = 'PersonalServiceListName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 150
          end
          object ServiceDate: TcxGridDBColumn
            AlternateCaption = 'ServiceDate'
            Caption = #1052#1077#1089#1103#1094' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
            DataBinding.FieldName = 'ServiceDate'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.DisplayFormat = 'mmmm yyyy'
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object Amount: TcxGridDBColumn
            Caption = #1042#1099#1087#1083#1072#1095#1077#1085#1086' ('#1092#1072#1082#1090')'
            DataBinding.FieldName = 'Amount'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 90
          end
          object TotalSummToPay_Service: TcxGridDBColumn
            AlternateCaption = ',0.####;-,0.####; ;'
            Caption = #1050' '#1074#1099#1087#1083#1072#1090#1077' ('#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080')'
            DataBinding.FieldName = 'TotalSummToPay_Service'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 90
          end
          object MemberName: TcxGridDBColumn
            Caption = #1060#1048#1054' ('#1095#1077#1088#1077#1079' '#1082#1086#1075#1086')'
            DataBinding.FieldName = 'MemberName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 120
          end
          object InvNumber_Service: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1082'. ('#1074#1077#1076#1086#1084#1086#1089#1090#1100')'
            DataBinding.FieldName = 'InvNumber_Service'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object OperDate_Service: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082'. ('#1074#1077#1076#1086#1084#1086#1089#1090#1100')'
            DataBinding.FieldName = 'OperDate_Service'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 60
          end
          object ServiceDate_Service: TcxGridDBColumn
            Caption = #1052#1077#1089#1103#1094' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' ('#1074#1077#1076#1086#1084#1086#1089#1090#1100')'
            DataBinding.FieldName = 'ServiceDate_Service'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 120
          end
          object Comment_Service: TcxGridDBColumn
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' ('#1074#1077#1076#1086#1084#1086#1089#1090#1100')'
            DataBinding.FieldName = 'Comment_Service'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 120
          end
          object Comment: TcxGridDBColumn
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            DataBinding.FieldName = 'Comment'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 200
          end
        end
      end
    end
  end
  inherited Panel: TPanel
    Width = 982
    Height = 50
    ExplicitWidth = 982
    ExplicitHeight = 50
    inherited deStart: TcxDateEdit
      EditValue = 42736d
    end
    inherited deEnd: TcxDateEdit
      EditValue = 42736d
    end
    inherited cxLabel1: TcxLabel
      Top = 7
      ExplicitTop = 7
    end
    inherited cxLabel2: TcxLabel
      Top = 7
      ExplicitTop = 7
    end
    object edBankAccount: TcxButtonEdit
      Left = 468
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 4
      Width = 214
    end
    object cxLabel3: TcxLabel
      Left = 441
      Top = 7
      Caption = #1056'/'#1089#1095':'
    end
    object cbIsServiceDate: TcxCheckBox
      Left = 10
      Top = 26
      Action = actIsServiceDate
      TabOrder = 6
      Width = 200
    end
    object cxLabel27: TcxLabel
      Left = 722
      Top = 6
      Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077':'
    end
    object edJuridicalBasis: TcxButtonEdit
      Left = 800
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 8
      Width = 150
    end
  end
  inherited UserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn
    Left = 83
  end
  inherited ActionList: TActionList
    inherited actInsert: TdsdInsertUpdateAction
      Enabled = False
      FormName = 'TCash_PersonalForm'
      FormNameParam.Value = 'TCash_PersonalForm'
      GuiParams = <
        item
          Name = 'Id'
          Value = Null
          MultiSelectSeparator = ','
        end
        item
          Name = 'ShowAll'
          Value = True
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'inOperDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'CashId_top'
          Value = ''
          Component = GuidesBankAccount
          ComponentItem = 'Key'
          MultiSelectSeparator = ','
        end
        item
          Name = 'CashName_top'
          Value = Null
          Component = GuidesBankAccount
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end>
    end
    inherited actUpdate: TdsdInsertUpdateAction
      FormName = 'TBankAccount_PersonalForm'
      FormNameParam.Value = 'TBankAccount_PersonalForm'
      GuiParams = <
        item
          Name = 'Id'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'Id'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'ShowAll'
          Value = False
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'inOperDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Value = ''
          ParamType = ptUnknown
          MultiSelectSeparator = ','
        end>
    end
    object actIsServiceDate: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spSelect
      StoredProcList = <
        item
          StoredProc = spSelect
        end>
      Caption = #1055#1077#1088#1080#1086#1076' '#1076#1083#1103' <'#1052#1077#1089#1103#1094' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081'>'
      Hint = #1055#1077#1088#1080#1086#1076' '#1076#1083#1103' <'#1052#1077#1089#1103#1094' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081'>'
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object actRefreshStart: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spGet_UserJuridicalBasis
      StoredProcList = <
        item
          StoredProc = spGet_UserJuridicalBasis
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
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1078#1091#1088#1085#1072#1083#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1078#1091#1088#1085#1072#1083#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 35
      FormName = 'TMovement_DateDialogForm'
      FormNameParam.Value = 'TMovement_DateDialogForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <
        item
          Name = 'StartDate'
          Value = 42005d
          Component = deStart
          DataType = ftDateTime
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'EndDate'
          Value = 42005d
          Component = deEnd
          DataType = ftDateTime
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'IsPartnerDate'
          Value = 'False'
          Component = cbIsServiceDate
          DataType = ftBoolean
          ParamType = ptInput
          MultiSelectSeparator = ','
        end>
      isShowModal = True
      RefreshDispatcher = RefreshDispatcher
      OpenBeforeShow = True
    end
  end
  inherited MasterDS: TDataSource
    Left = 72
    Top = 112
  end
  inherited MasterCDS: TClientDataSet
    Left = 24
    Top = 104
  end
  inherited spSelect: TdsdStoredProc
    StoredProcName = 'gpSelect_Movement_BankAccount_Personal'
    Params = <
      item
        Name = 'inStartDate'
        Value = 41640d
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inEndDate'
        Value = 41640d
        Component = deEnd
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inCashId'
        Value = Null
        Component = GuidesBankAccount
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inJuridicalBasisId'
        Value = Null
        Component = JuridicalBasisGuides
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inIsServiceDate'
        Value = Null
        Component = cbIsServiceDate
        DataType = ftBoolean
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inIsErased'
        Value = False
        Component = actShowErased
        DataType = ftBoolean
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 128
    Top = 96
  end
  inherited BarManager: TdxBarManager
    Left = 232
    Top = 144
    DockControlHeights = (
      0
      0
      26
      0)
  end
  inherited DBViewAddOn: TdsdDBViewAddOn
    Left = 400
    Top = 232
  end
  inherited PeriodChoice: TPeriodChoice
    Left = 304
    Top = 144
  end
  inherited RefreshDispatcher: TRefreshDispatcher
    ComponentList = <
      item
        Component = PeriodChoice
      end
      item
        Component = GuidesBankAccount
      end
      item
        Component = JuridicalBasisGuides
      end>
    Left = 400
    Top = 144
  end
  inherited spMovementComplete: TdsdStoredProc
    StoredProcName = 'gpComplete_Movement_BankAccount'
    Left = 80
    Top = 384
  end
  inherited spMovementUnComplete: TdsdStoredProc
    StoredProcName = 'gpUnComplete_Movement_BankAccount'
    Left = 72
    Top = 448
  end
  inherited spMovementSetErased: TdsdStoredProc
    StoredProcName = 'gpSetErased_Movement_BankAccount'
    Left = 72
    Top = 328
  end
  inherited FormParams: TdsdFormParams
    Params = <
      item
        Name = 'Id'
        Value = Null
        ParamType = ptInputOutput
        MultiSelectSeparator = ','
      end
      item
        Name = 'Key'
        Value = Null
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'ShowAll'
        Value = False
        DataType = ftBoolean
        ParamType = ptInputOutput
        MultiSelectSeparator = ','
      end
      item
        Name = 'CashId_top'
        Value = ''
        Component = GuidesBankAccount
        ComponentItem = 'Key'
        ParamType = ptInputOutput
        MultiSelectSeparator = ','
      end
      item
        Name = 'CashName_top'
        Value = ''
        Component = GuidesBankAccount
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInputOutput
        MultiSelectSeparator = ','
      end>
  end
  inherited spMovementReComplete: TdsdStoredProc
    StoredProcName = 'gpReComplete_Movement_BankAccount'
    Left = 200
    Top = 312
  end
  object GuidesBankAccount: TdsdGuides
    KeyField = 'Id'
    LookupControl = edBankAccount
    FormNameParam.Value = 'TBankAccount_ObjectForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TBankAccount_ObjectForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesBankAccount
        ComponentItem = 'Key'
        MultiSelectSeparator = ','
      end
      item
        Name = 'NameAll'
        Value = ''
        Component = GuidesBankAccount
        ComponentItem = 'TextValue'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'inOperDate'
        Value = 'NULL'
        Component = deEnd
        DataType = ftDateTime
        MultiSelectSeparator = ','
      end>
    Left = 552
    Top = 21
  end
  object JuridicalBasisGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = edJuridicalBasis
    Key = '0'
    FormNameParam.Value = 'TJuridical_BasisForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TJuridical_BasisForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = '0'
        Component = JuridicalBasisGuides
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = JuridicalBasisGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 871
  end
  object spGet_UserJuridicalBasis: TdsdStoredProc
    StoredProcName = 'gpGet_User_JuridicalBasis'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'JuridicalBasisId'
        Value = '0'
        Component = JuridicalBasisGuides
        ComponentItem = 'Key'
        MultiSelectSeparator = ','
      end
      item
        Name = 'JuridicalBasisName'
        Value = ''
        Component = JuridicalBasisGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        MultiSelectSeparator = ','
      end>
    PackSize = 1
    Left = 824
    Top = 48
  end
end
