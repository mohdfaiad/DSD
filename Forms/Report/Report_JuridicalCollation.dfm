inherited Report_JuridicalCollationForm: TReport_JuridicalCollationForm
  Caption = #1054#1090#1095#1077#1090' <'#1040#1082#1090' '#1089#1074#1077#1088#1082#1080'>'
  ClientHeight = 410
  ClientWidth = 1020
  AddOnFormData.ExecuteDialogAction = ExecuteDialog
  ExplicitWidth = 1036
  ExplicitHeight = 448
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TcxPageControl
    Top = 80
    Width = 1020
    Height = 330
    TabOrder = 3
    ExplicitTop = 80
    ExplicitWidth = 1020
    ExplicitHeight = 330
    ClientRectBottom = 330
    ClientRectRight = 1020
    inherited tsMain: TcxTabSheet
      ExplicitWidth = 1020
      ExplicitHeight = 330
      inherited cxGrid: TcxGrid
        Width = 1020
        Height = 330
        ExplicitWidth = 1020
        ExplicitHeight = 330
        inherited cxGridDBTableView: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colDebet
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colKredit
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colStartRemains
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colEndRemains
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colStartRemains_Currency
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colDebet_Currency
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colKredit_Currency
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colEndRemains_Currency
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colSumm
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colSumm_Currency
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colDebet
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colKredit
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
              Format = ',0.00##'
              Kind = skSum
              Column = colStartRemains
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colEndRemains
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colStartRemains_Currency
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colDebet_Currency
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colKredit_Currency
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colEndRemains_Currency
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colSumm
            end
            item
              Format = ',0.00##'
              Kind = skSum
              Column = colSumm_Currency
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
          object colItemName: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1076#1086#1082'.'
            DataBinding.FieldName = 'ItemName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 95
          end
          object coInvNumber: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1082'.'
            DataBinding.FieldName = 'InvNumber'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object colInvNumberPartner: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1082'.'#1091' '#1087#1086#1082#1091#1087'.'
            DataBinding.FieldName = 'InvNumberPartner'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object MovementComment: TcxGridDBColumn
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1080#1079' '#1076#1086#1082'.'
            DataBinding.FieldName = 'MovementComment'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object colOperDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'OperDate'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object colPartionMovementName: TcxGridDBColumn
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'PartionMovementName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object clPaymentDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
            DataBinding.FieldName = 'PaymentDate'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object colPaidKindName: TcxGridDBColumn
            Caption = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
            DataBinding.FieldName = 'PaidKindName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 55
          end
          object colStartRemains: TcxGridDBColumn
            Caption = #1053#1072#1095'. '#1076#1086#1083#1075' ('#1040#1082#1090#1080#1074')'
            DataBinding.FieldName = 'StartRemains'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colDebet: TcxGridDBColumn
            Caption = #1044#1077#1073#1077#1090
            DataBinding.FieldName = 'Debet'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colKredit: TcxGridDBColumn
            Caption = #1050#1088#1077#1076#1080#1090
            DataBinding.FieldName = 'Kredit'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colEndRemains: TcxGridDBColumn
            Caption = #1050#1086#1085'. '#1076#1086#1083#1075' ('#1040#1082#1090#1080#1074')'
            DataBinding.FieldName = 'EndRemains'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colStartRemains_Currency: TcxGridDBColumn
            Caption = #1053#1072#1095'. '#1076#1086#1083#1075' '#1074' '#1074#1072#1083'. ('#1040#1082#1090#1080#1074')'
            DataBinding.FieldName = 'StartRemains_Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colDebet_Currency: TcxGridDBColumn
            Caption = #1044#1077#1073#1077#1090' '#1074' '#1074#1072#1083'. '
            DataBinding.FieldName = 'Debet_Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colKredit_Currency: TcxGridDBColumn
            Caption = #1050#1088#1077#1076#1080#1090' '#1074' '#1074#1072#1083'. '
            DataBinding.FieldName = 'Kredit_Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colEndRemains_Currency: TcxGridDBColumn
            Caption = #1050#1086#1085'. '#1076#1086#1083#1075' '#1074' '#1074#1072#1083'. ('#1040#1082#1090#1080#1074')'
            DataBinding.FieldName = 'EndRemains_Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object CurrencyName: TcxGridDBColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CurrencyName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colFromName: TcxGridDBColumn
            Caption = #1054#1090' '#1050#1086#1075#1086
            DataBinding.FieldName = 'FromName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 90
          end
          object colToName: TcxGridDBColumn
            Caption = #1050#1086#1084#1091
            DataBinding.FieldName = 'ToName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 90
          end
          object clContractStateKindName: TcxGridDBColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1076#1086#1075'.'
            DataBinding.FieldName = 'ContractStateKindCode'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            Properties.Images = dmMain.ImageList
            Properties.Items = <
              item
                Description = #1055#1086#1076#1087#1080#1089#1072#1085
                ImageIndex = 12
                Value = 1
              end
              item
                Description = #1053#1077' '#1087#1086#1076#1087#1080#1089#1072#1085
                ImageIndex = 11
                Value = 2
              end
              item
                Description = #1047#1072#1074#1077#1088#1096#1077#1085
                ImageIndex = 13
                Value = 3
              end
              item
                Description = #1059' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
                ImageIndex = 66
                Value = 4
              end>
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object colContractCode: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1076#1086#1075'.'
            DataBinding.FieldName = 'ContractCode'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 45
          end
          object colContractName: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1075'.'
            DataBinding.FieldName = 'ContractName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 60
          end
          object clContractTagName: TcxGridDBColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1076#1086#1075'.'
            DataBinding.FieldName = 'ContractTagName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 60
          end
          object colContractComment: TcxGridDBColumn
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1076#1086#1075'.'
            DataBinding.FieldName = 'ContractComment'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object colInfoMoneyGroupCode: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1059#1055' '#1075#1088#1091#1087#1087#1099
            DataBinding.FieldName = 'InfoMoneyGroupCode'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 45
          end
          object colInfoMoneyGroupName: TcxGridDBColumn
            Caption = #1059#1055' '#1075#1088#1091#1087#1087#1072' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
            DataBinding.FieldName = 'InfoMoneyGroupName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colInfoMoneyDestinationCode: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1059#1055' '#1085#1072#1079#1085#1072#1095'.'
            DataBinding.FieldName = 'InfoMoneyDestinationCode'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 45
          end
          object colInfoMoneyDestinationName: TcxGridDBColumn
            Caption = #1059#1055' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'InfoMoneyDestinationName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colInfoMoneyCode: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1059#1055
            DataBinding.FieldName = 'InfoMoneyCode'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 45
          end
          object colInfoMoneyName: TcxGridDBColumn
            Caption = #1059#1055' '#1089#1090#1072#1090#1100#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
            DataBinding.FieldName = 'InfoMoneyName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object colAccountName: TcxGridDBColumn
            Caption = #1057#1095#1077#1090
            DataBinding.FieldName = 'AccountName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 86
          end
          object colSumm: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1054#1073#1086#1088#1086#1090
            DataBinding.FieldName = 'MovementSumm'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 55
          end
          object colSumm_Currency: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1054#1073#1086#1088#1086#1090' '#1074' '#1074#1072#1083'. '
            DataBinding.FieldName = 'MovementSumm_Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 55
          end
          object colOperationSort: TcxGridDBColumn
            Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
            DataBinding.FieldName = 'OperationSort'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 55
          end
        end
      end
    end
  end
  inherited Panel: TPanel
    Width = 1020
    Height = 54
    ExplicitWidth = 1020
    ExplicitHeight = 54
    inherited deStart: TcxDateEdit
      Left = 118
      EditValue = 41640d
      Properties.SaveTime = False
      ExplicitLeft = 118
    end
    inherited deEnd: TcxDateEdit
      Left = 118
      Top = 29
      EditValue = 41640d
      Properties.SaveTime = False
      ExplicitLeft = 118
      ExplicitTop = 29
    end
    inherited cxLabel1: TcxLabel
      Left = 25
      ExplicitLeft = 25
    end
    inherited cxLabel2: TcxLabel
      Left = 6
      Top = 30
      ExplicitLeft = 6
      ExplicitTop = 30
    end
    object cxLabel6: TcxLabel
      Left = 207
      Top = 6
      Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086':'
    end
    object edJuridical: TcxButtonEdit
      Left = 314
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 5
      Width = 210
    end
    object cxLabel3: TcxLabel
      Left = 244
      Top = 30
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090':'
    end
    object edPartner: TcxButtonEdit
      Left = 314
      Top = 29
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 7
      Width = 210
    end
    object cxLabel4: TcxLabel
      Left = 568
      Top = 6
      Caption = #1057#1095#1077#1090' '#1085#1072#1079#1074#1072#1085#1080#1077':'
    end
    object edAccount: TcxButtonEdit
      Left = 653
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 9
      Width = 180
    end
    object cxLabel8: TcxLabel
      Left = 870
      Top = 6
      Caption = #1044#1086#1075#1086#1074#1086#1088':'
    end
    object ceContract: TcxButtonEdit
      Left = 923
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 11
      Width = 90
    end
    object cxLabel5: TcxLabel
      Left = 840
      Top = 30
      Caption = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099':'
    end
    object edPaidKind: TcxButtonEdit
      Left = 923
      Top = 29
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 13
      Width = 90
    end
    object cxLabel7: TcxLabel
      Left = 529
      Top = 30
      Caption = #1059#1055' '#1089#1090#1072#1090#1100#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103':'
    end
    object ceInfoMoney: TcxButtonEdit
      Left = 653
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 15
      Width = 180
    end
    object cxLabel10: TcxLabel
      Left = 1040
      Top = 30
      Caption = #1042#1072#1083#1102#1090#1072':'
    end
    object edCurrency: TcxButtonEdit
      Left = 1089
      Top = 29
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 17
      Width = 150
    end
    object cxLabel9: TcxLabel
      Left = 1024
      Top = 6
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
    end
    object edInvNumberSale: TcxButtonEdit
      Left = 1089
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 19
      Width = 150
    end
  end
  inherited cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = AccountGuides
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = ContractGuides
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = CurrencyGuides
        Properties.Strings = (
          'Key'
          'TextValue')
      end
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
        Component = InfoMoneyGuides
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = JuridicalGuides
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = PaidKindGuides
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = PartnerGuides
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = SaleChoiceGuides
        Properties.Strings = (
          'Key'
          'TextValue')
      end>
    Left = 208
    Top = 272
  end
  inherited ActionList: TActionList
    object actOpenForm: TdsdOpenForm
      Category = 'DSDLib'
      MoveParams = <>
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      FormName = 'NULL'
      FormNameParam.Value = Null
      FormNameParam.Component = FormParams
      FormNameParam.ComponentItem = 'FormName'
      FormNameParam.DataType = ftString
      GuiParams = <
        item
          Name = 'Id'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'MovementId'
          ParamType = ptInput
        end
        item
          Name = 'inOperDate'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'OperDate'
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'inChangePercentAmount'
          Value = '0'
          DataType = ftFloat
        end>
      isShowModal = False
    end
    object actGetForm: TdsdExecStoredProc
      Category = 'DSDLib'
      MoveParams = <>
      PostDataSetBeforeExecute = False
      StoredProc = getMovementForm
      StoredProcList = <
        item
          StoredProc = getMovementForm
        end>
      Caption = 'actGetForm'
    end
    object actOpenDocument: TMultiAction
      Category = 'DSDLib'
      MoveParams = <>
      ActionList = <
        item
          Action = actGetForm
        end
        item
          Action = actOpenForm
        end>
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ImageIndex = 28
    end
    object actPrint: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spJuridicalBalance
      StoredProcList = <
        item
          StoredProc = spJuridicalBalance
        end>
      Caption = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080
      Hint = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080
      ImageIndex = 3
      DataSets = <
        item
          DataSet = MasterCDS
          UserName = 'frxDBDataset'
          IndexFieldNames = 'ItemName;OperDate;InvNumber'
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'AccountName'
          Value = ''
          Component = AccountGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PaidKindName'
          Value = ''
          Component = PaidKindGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'StartBalance'
          Value = Null
          Component = FormParams
          ComponentItem = 'StartBalance'
          DataType = ftFloat
          ParamType = ptInput
        end
        item
          Name = 'StartBalanceCurrency'
          Value = Null
          Component = FormParams
          ComponentItem = 'StartBalanceCurrency'
          DataType = ftFloat
          ParamType = ptInput
        end
        item
          Name = 'JuridicalName'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'JuridicalShortName'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalShortName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PartnerName'
          Value = ''
          Component = FormParams
          ComponentItem = 'PartnerName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'CurrencyName'
          Value = Null
          Component = FormParams
          ComponentItem = 'CurrencyName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PartionMovementName'
          Value = Null
          Component = FormParams
          ComponentItem = 'PartionMovementName'
          DataType = ftString
        end
        item
          Name = 'AccounterName'
          Value = Null
          Component = FormParams
          ComponentItem = 'AccounterName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContracNumber'
          Value = ''
          Component = FormParams
          ComponentItem = 'ContracNumber'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContractTagName'
          Value = Null
          Component = FormParams
          ComponentItem = 'ContractTagName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContractSigningDate'
          Value = 42005d
          Component = FormParams
          ComponentItem = 'ContractSigningDate'
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'JuridicalName_Basis'
          Value = ''
          Component = FormParams
          ComponentItem = 'JuridicalName_Basis'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'JuridicalShortName_Basis'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalShortName_Basis'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'AccounterName_Basis'
          Value = Null
          Component = FormParams
          ComponentItem = 'AccounterName_Basis'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'InfoMoneyName'
          Value = Null
          Component = InfoMoneyGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end>
      ReportName = #1054#1090#1095#1077#1090' '#1048#1090#1086#1075' '#1087#1086' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1102' ('#1040#1082#1090' '#1089#1074#1077#1088#1082#1080')'
      ReportNameParam.Value = #1054#1090#1095#1077#1090' '#1048#1090#1086#1075' '#1087#1086' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1102' ('#1040#1082#1090' '#1089#1074#1077#1088#1082#1080')'
      ReportNameParam.DataType = ftString
    end
    object actPrintOfficial: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spJuridicalBalance
      StoredProcList = <
        item
          StoredProc = spJuridicalBalance
        end>
      Caption = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080' ('#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1080#1081')'
      Hint = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080' ('#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1080#1081')'
      ImageIndex = 17
      ShortCut = 16464
      DataSets = <
        item
          DataSet = MasterCDS
          UserName = 'frxDBDataset'
          IndexFieldNames = 'OperDate;ItemName;InvNumber'
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'AccountName'
          Value = ''
          Component = AccountGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PaidKindName'
          Value = ''
          Component = PaidKindGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'StartBalance'
          Value = Null
          Component = FormParams
          ComponentItem = 'StartBalance'
          DataType = ftFloat
          ParamType = ptInput
        end
        item
          Name = 'StartBalanceCurrency'
          Value = Null
          Component = FormParams
          ComponentItem = 'StartBalanceCurrency'
          DataType = ftFloat
          ParamType = ptInput
        end
        item
          Name = 'JuridicalName'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'JuridicalShortName'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalShortName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PartnerName'
          Value = ''
          Component = FormParams
          ComponentItem = 'PartnerName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'CurrencyName'
          Value = Null
          Component = FormParams
          ComponentItem = 'CurrencyName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PartionMovementName'
          Value = Null
          Component = FormParams
          ComponentItem = 'PartionMovementName'
          DataType = ftString
        end
        item
          Name = 'AccounterName'
          Value = Null
          Component = FormParams
          ComponentItem = 'AccounterName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContracNumber'
          Value = ''
          Component = FormParams
          ComponentItem = 'ContracNumber'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContractTagName'
          Value = Null
          Component = FormParams
          ComponentItem = 'ContractTagName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContractSigningDate'
          Value = Null
          Component = FormParams
          ComponentItem = 'ContractSigningDate'
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'JuridicalName_Basis'
          Value = ''
          Component = FormParams
          ComponentItem = 'JuridicalName_Basis'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'JuridicalShortName_Basis'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalShortName_Basis'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'AccounterName_Basis'
          Value = Null
          Component = FormParams
          ComponentItem = 'AccounterName_Basis'
          DataType = ftString
          ParamType = ptInput
        end>
      ReportName = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080' ('#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1080#1081')'
      ReportNameParam.Value = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080' ('#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1080#1081')'
      ReportNameParam.DataType = ftString
    end
    object actPrintCurrency: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spJuridicalBalance
      StoredProcList = <
        item
          StoredProc = spJuridicalBalance
        end>
      Caption = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080' ('#1074' '#1074#1072#1083#1102#1090#1077')'
      Hint = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080' ('#1074' '#1074#1072#1083#1102#1090#1077')'
      ImageIndex = 21
      DataSets = <
        item
          DataSet = MasterCDS
          UserName = 'frxDBDataset'
          IndexFieldNames = 'OperDate;ItemName;InvNumber'
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'AccountName'
          Value = ''
          Component = AccountGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PaidKindName'
          Value = ''
          Component = PaidKindGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'StartBalance'
          Value = Null
          Component = FormParams
          ComponentItem = 'StartBalance'
          DataType = ftFloat
          ParamType = ptInput
        end
        item
          Name = 'StartBalanceCurrency'
          Value = Null
          Component = FormParams
          ComponentItem = 'StartBalanceCurrency'
          DataType = ftFloat
          ParamType = ptInput
        end
        item
          Name = 'JuridicalName'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'JuridicalShortName'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalShortName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PartnerName'
          Value = ''
          Component = FormParams
          ComponentItem = 'PartnerName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'CurrencyName'
          Value = Null
          Component = FormParams
          ComponentItem = 'CurrencyName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PartionMovementName'
          Value = Null
          Component = FormParams
          ComponentItem = 'PartionMovementName'
          DataType = ftString
        end
        item
          Name = 'InternalCurrencyName'
          Value = Null
          Component = FormParams
          ComponentItem = 'InternalCurrencyName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'AccounterName'
          Value = Null
          Component = FormParams
          ComponentItem = 'AccounterName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContracNumber'
          Value = ''
          Component = FormParams
          ComponentItem = 'ContracNumber'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContractTagName'
          Value = Null
          Component = FormParams
          ComponentItem = 'ContractTagName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContractSigningDate'
          Value = Null
          Component = FormParams
          ComponentItem = 'ContractSigningDate'
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'JuridicalName_Basis'
          Value = ''
          Component = FormParams
          ComponentItem = 'JuridicalName_Basis'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'JuridicalShortName_Basis'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalShortName_Basis'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'AccounterName_Basis'
          Value = Null
          Component = FormParams
          ComponentItem = 'AccounterName_Basis'
          DataType = ftString
          ParamType = ptInput
        end>
      ReportName = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080' ('#1074' '#1074#1072#1083#1102#1090#1077')'
      ReportNameParam.Value = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080' ('#1074' '#1074#1072#1083#1102#1090#1077')'
      ReportNameParam.DataType = ftString
    end
    object actPrintTurnover: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1073#1086#1088#1086#1090#1099' '
      Hint = #1054#1090#1095#1077#1090' '#1087#1086' '#1086#1073#1086#1088#1086#1090#1072#1084
      ImageIndex = 20
      DataSets = <
        item
          UserName = 'DataSet'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'AccountName'
          Value = ''
          Component = AccountGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PaidKindName'
          Value = ''
          Component = PaidKindGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'StartBalance'
          Value = Null
          Component = FormParams
          ComponentItem = 'StartBalance'
          DataType = ftFloat
          ParamType = ptInput
        end
        item
          Name = 'StartBalanceCurrency'
          Value = Null
          Component = FormParams
          ComponentItem = 'StartBalanceCurrency'
          DataType = ftFloat
          ParamType = ptInput
        end
        item
          Name = 'JuridicalName'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'JuridicalShortName'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalShortName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PartnerName'
          Value = ''
          Component = FormParams
          ComponentItem = 'PartnerName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'CurrencyName'
          Value = Null
          Component = FormParams
          ComponentItem = 'CurrencyName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PartionMovementName'
          Value = Null
          Component = FormParams
          ComponentItem = 'PartionMovementName'
          DataType = ftString
        end
        item
          Name = 'AccounterName'
          Value = Null
          Component = FormParams
          ComponentItem = 'AccounterName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContracNumber'
          Value = ''
          Component = FormParams
          ComponentItem = 'ContracNumber'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContractTagName'
          Value = Null
          Component = FormParams
          ComponentItem = 'ContractTagName'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'ContractSigningDate'
          Value = Null
          Component = FormParams
          ComponentItem = 'ContractSigningDate'
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'JuridicalName_Basis'
          Value = ''
          Component = FormParams
          ComponentItem = 'JuridicalName_Basis'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'JuridicalShortName_Basis'
          Value = Null
          Component = FormParams
          ComponentItem = 'JuridicalShortName_Basis'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'AccounterName_Basis'
          Value = Null
          Component = FormParams
          ComponentItem = 'AccounterName_Basis'
          DataType = ftString
          ParamType = ptInput
        end>
      ReportName = #1054#1073#1086#1088#1086#1090#1099' '#1080#1079' '#1072#1082#1090#1072' '#1089#1074#1077#1088#1082#1080
      ReportNameParam.Value = #1054#1073#1086#1088#1086#1090#1099' '#1080#1079' '#1072#1082#1090#1072' '#1089#1074#1077#1088#1082#1080
      ReportNameParam.DataType = ftString
    end
    object ExecuteDialog: TExecuteDialog
      Category = 'DSDLib'
      MoveParams = <>
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      ImageIndex = 35
      FormName = 'TReport_JuridicalCollationDialogForm'
      FormNameParam.Value = 'TReport_JuridicalCollationDialogForm'
      FormNameParam.DataType = ftString
      GuiParams = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'AccountId'
          Value = ''
          Component = AccountGuides
          ComponentItem = 'Key'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'AccountName'
          Value = ''
          Component = AccountGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'InfoMoneyId'
          Value = ''
          Component = InfoMoneyGuides
          ComponentItem = 'Key'
          ParamType = ptInput
        end
        item
          Name = 'InfoMoneyName'
          Value = ''
          Component = InfoMoneyGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'JuridicalId'
          Value = ''
          Component = JuridicalGuides
          ComponentItem = 'Key'
          ParamType = ptInput
        end
        item
          Name = 'JuridicalName'
          Value = ''
          Component = JuridicalGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PartnerId'
          Value = ''
          Component = PartnerGuides
          ComponentItem = 'Key'
          ParamType = ptInput
        end
        item
          Name = 'PartnerName'
          Value = ''
          Component = PartnerGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'PaidKindId'
          Value = ''
          Component = PaidKindGuides
          ComponentItem = 'Key'
          ParamType = ptInput
        end
        item
          Name = 'PaidKindName'
          Value = ''
          Component = PaidKindGuides
          ComponentItem = 'TextValue'
          ParamType = ptInput
        end
        item
          Name = 'ContractId'
          Value = ''
          Component = ContractGuides
          ComponentItem = 'Key'
          ParamType = ptInput
        end
        item
          Name = 'ContractName'
          Value = ''
          Component = ContractGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end>
      isShowModal = True
      RefreshDispatcher = RefreshDispatcher
      OpenBeforeShow = True
    end
  end
  inherited MasterDS: TDataSource
    Top = 164
  end
  inherited MasterCDS: TClientDataSet
    IndexFieldNames = 'OperationSort;ItemName;OperDate'
    Top = 132
  end
  inherited spSelect: TdsdStoredProc
    StoredProcName = 'gpReport_JuridicalCollation'
    Params = <
      item
        Name = 'inStartDate'
        Value = 41640d
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'inEndDate'
        Value = 41640d
        Component = deEnd
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'inJuridicalId'
        Value = ''
        Component = JuridicalGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inPartnerId'
        Value = Null
        Component = PartnerGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inContractId'
        Value = ''
        Component = ContractGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inAccountId'
        Value = ''
        Component = AccountGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inPaidKindId'
        Value = ''
        Component = PaidKindGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inInfoMoneyId'
        Value = ''
        Component = InfoMoneyGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inCurrencyId'
        Value = Null
        Component = CurrencyGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inMovementId_Partion'
        Value = Null
        Component = SaleChoiceGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end>
    Left = 184
    Top = 196
  end
  inherited BarManager: TdxBarManager
    Left = 112
    Top = 132
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
          ItemName = 'bbOpenDocument'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPrint'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPrintOfficial'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPrintCurrency'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPrintTurnover'
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
    object bbOpenDocument: TdxBarButton
      Action = actOpenDocument
      Category = 0
    end
    object bbPrintOfficial: TdxBarButton
      Action = actPrintOfficial
      Category = 0
    end
    object bbPrint: TdxBarButton
      Action = actPrint
      Category = 0
    end
    object bbPrintTurnover: TdxBarButton
      Action = actPrintTurnover
      Category = 0
    end
    object bbPrintCurrency: TdxBarButton
      Action = actPrintCurrency
      Category = 0
    end
    object bbExecuteDialog: TdxBarButton
      Action = ExecuteDialog
      Category = 0
    end
  end
  inherited DBViewAddOn: TdsdDBViewAddOn
    OnDblClickActionList = <
      item
        Action = actOpenDocument
      end>
    ActionItemList = <
      item
        Action = actOpenDocument
        ShortCut = 13
      end>
  end
  inherited PeriodChoice: TPeriodChoice
    Left = 24
    Top = 196
  end
  inherited RefreshDispatcher: TRefreshDispatcher
    ComponentList = <
      item
        Component = PeriodChoice
      end
      item
        Component = JuridicalGuides
      end
      item
        Component = PartnerGuides
      end
      item
        Component = AccountGuides
      end
      item
        Component = InfoMoneyGuides
      end
      item
        Component = ContractGuides
      end
      item
        Component = PaidKindGuides
      end
      item
        Component = CurrencyGuides
      end
      item
        Component = SaleChoiceGuides
      end>
    Left = 408
    Top = 72
  end
  object JuridicalGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = edJuridical
    FormNameParam.Value = 'TJuridical_ObjectForm'
    FormNameParam.DataType = ftString
    FormName = 'TJuridical_ObjectForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = JuridicalGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = JuridicalGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ContractId'
        Value = Null
        Component = ContractGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'ContractName'
        Value = Null
        Component = ContractGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'PartnerId'
        Value = Null
        Component = PartnerGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'PartnerName'
        Value = Null
        Component = PartnerGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 392
  end
  object getMovementForm: TdsdStoredProc
    StoredProcName = 'gpGet_Movement_Form'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'inMovementId'
        Value = Null
        Component = MasterCDS
        ComponentItem = 'MovementId'
        ParamType = ptInput
      end
      item
        Name = 'FormName'
        Value = Null
        Component = FormParams
        ComponentItem = 'FormName'
        DataType = ftString
      end>
    PackSize = 1
    Left = 296
    Top = 120
  end
  object FormParams: TdsdFormParams
    Params = <
      item
        Name = 'FormName'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'ContractSigningDate'
        Value = 42005d
        DataType = ftDateTime
        ParamType = ptInputOutput
      end>
    Left = 192
    Top = 144
  end
  object spJuridicalBalance: TdsdStoredProc
    StoredProcName = 'gpReport_JuridicalBalance'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'inOperDate'
        Value = 41640d
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'inJuridicalId'
        Value = ''
        Component = JuridicalGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inPartnerId'
        Value = Null
        Component = PartnerGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inContractId'
        Value = ''
        Component = ContractGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inAccountId'
        Value = ''
        Component = AccountGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inPaidKindId'
        Value = ''
        Component = PaidKindGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inInfoMoneyId'
        Value = ''
        Component = InfoMoneyGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inCurrencyId'
        Value = Null
        Component = CurrencyGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'outStartBalance'
        Value = Null
        Component = FormParams
        ComponentItem = 'StartBalance'
        DataType = ftFloat
      end
      item
        Name = 'outStartBalanceCurrency'
        Value = Null
        Component = FormParams
        ComponentItem = 'StartBalanceCurrency'
        DataType = ftFloat
      end
      item
        Name = 'outJuridicalName'
        Value = Null
        Component = FormParams
        ComponentItem = 'JuridicalName'
        DataType = ftString
      end
      item
        Name = 'outJuridicalShortName'
        Value = Null
        Component = FormParams
        ComponentItem = 'JuridicalShortName'
        DataType = ftString
      end
      item
        Name = 'outPartnerName'
        Value = Null
        Component = FormParams
        ComponentItem = 'PartnerName'
        DataType = ftString
      end
      item
        Name = 'outCurrencyName'
        Value = Null
        Component = FormParams
        ComponentItem = 'CurrencyName'
        DataType = ftString
      end
      item
        Name = 'outInternalCurrencyName'
        Value = Null
        Component = FormParams
        ComponentItem = 'InternalCurrencyName'
        DataType = ftString
      end
      item
        Name = 'outAccounterName'
        Value = Null
        Component = FormParams
        ComponentItem = 'AccounterName'
        DataType = ftString
      end
      item
        Name = 'outContracNumber'
        Value = Null
        Component = FormParams
        ComponentItem = 'ContracNumber'
        DataType = ftString
      end
      item
        Name = 'outContractTagName'
        Value = Null
        Component = FormParams
        ComponentItem = 'ContractTagName'
        DataType = ftString
      end
      item
        Name = 'outContractSigningDate'
        Value = Null
        Component = FormParams
        ComponentItem = 'ContractSigningDate'
        DataType = ftDateTime
      end
      item
        Name = 'outJuridicalName_Basis'
        Value = Null
        Component = FormParams
        ComponentItem = 'JuridicalName_Basis'
        DataType = ftString
      end
      item
        Name = 'outJuridicalShortName_Basis'
        Value = Null
        Component = FormParams
        ComponentItem = 'JuridicalShortName_Basis'
        DataType = ftString
      end
      item
        Name = 'outAccounterName_Basis'
        Value = Null
        Component = FormParams
        ComponentItem = 'AccounterName_Basis'
        DataType = ftString
      end>
    PackSize = 1
    Left = 296
    Top = 240
  end
  object PartnerGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = edPartner
    FormNameParam.Value = 'TPartner_ObjectForm'
    FormNameParam.DataType = ftString
    FormName = 'TPartner_ObjectForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = PartnerGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = PartnerGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'JuridicalId'
        Value = Null
        Component = JuridicalGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'JuridicalName'
        Value = Null
        Component = JuridicalGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ContractId'
        Value = Null
        Component = ContractGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'ContractName'
        Value = Null
        Component = ContractGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'MasterJuridicalId'
        Value = ''
        Component = JuridicalGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'MasterJuridicalName'
        Value = ''
        Component = JuridicalGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 440
    Top = 24
  end
  object AccountGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = edAccount
    FormNameParam.Value = 'TAccount_ObjectForm'
    FormNameParam.DataType = ftString
    FormName = 'TAccount_ObjectForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = AccountGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'TextValueAll'
        Value = ''
        Component = AccountGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 720
    Top = 65528
  end
  object ContractGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = ceContract
    FormNameParam.Value = 'TContractChoiceForm'
    FormNameParam.DataType = ftString
    FormName = 'TContractChoiceForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = ContractGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = ContractGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'JuridicalId'
        Value = ''
        Component = JuridicalGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'JuridicalName'
        Value = ''
        Component = JuridicalGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'InfoMoneyId'
        Value = ''
        Component = InfoMoneyGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'InfoMoneyName'
        Value = ''
        Component = InfoMoneyGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'PaidKindId'
        Value = ''
        Component = PaidKindGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'PaidKindName'
        Value = ''
        Component = PaidKindGuides
        ComponentItem = 'TextValue'
        ParamType = ptInput
      end
      item
        Name = 'MasterJuridicalId'
        Value = ''
        Component = JuridicalGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'MasterJuridicalName'
        Value = ''
        Component = JuridicalGuides
        ComponentItem = 'TextValue'
      end
      item
        Name = 'PartnerId'
        Value = ''
        Component = PartnerGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'PartnerName'
        Value = ''
        Component = PartnerGuides
        ComponentItem = 'TextValue'
        ParamType = ptInput
      end>
    Left = 944
    Top = 65534
  end
  object PaidKindGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = edPaidKind
    FormNameParam.Value = 'TPaidKindForm'
    FormNameParam.DataType = ftString
    FormName = 'TPaidKindForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = PaidKindGuides
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = PaidKindGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 952
    Top = 40
  end
  object InfoMoneyGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = ceInfoMoney
    FormNameParam.Value = 'TInfoMoney_ObjectForm'
    FormNameParam.DataType = ftString
    FormName = 'TInfoMoney_ObjectForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = InfoMoneyGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = InfoMoneyGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 720
    Top = 29
  end
  object CurrencyGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = edCurrency
    FormNameParam.Value = 'TCurrency_ObjectForm'
    FormNameParam.DataType = ftString
    FormName = 'TCurrency_ObjectForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = CurrencyGuides
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = CurrencyGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 1120
    Top = 48
  end
  object SaleChoiceGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = edInvNumberSale
    Key = '0'
    FormNameParam.Value = 'TSaleJournalChoiceForm'
    FormNameParam.DataType = ftString
    FormName = 'TSaleJournalChoiceForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = '0'
        Component = SaleChoiceGuides
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'InvNumber_Full'
        Value = ''
        Component = SaleChoiceGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'PartnerId'
        Value = ''
        Component = PartnerGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'PartnerName'
        Value = ''
        Component = PartnerGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 1172
  end
end
