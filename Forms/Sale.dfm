inherited SaleForm: TSaleForm
  Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103
  ClientHeight = 443
  ClientWidth = 1074
  KeyPreview = True
  PopupMenu = PopupMenu
  ExplicitWidth = 1082
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 13
  object DataPanel: TPanel
    Left = 0
    Top = 0
    Width = 1074
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 4
    ExplicitWidth = 1079
    object edInvNumberPartner: TcxTextEdit
      Left = 8
      Top = 72
      TabOrder = 0
      Width = 121
    end
    object cxLabel5: TcxLabel
      Left = 8
      Top = 54
      Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
    end
    object edPaidKind: TcxButtonEdit
      Left = 156
      Top = 71
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 2
      Width = 121
    end
    object cxLabel6: TcxLabel
      Left = 157
      Top = 54
      Caption = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
    end
    object edContract: TcxButtonEdit
      Left = 616
      Top = 27
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 4
      Width = 113
    end
    object cxLabel9: TcxLabel
      Left = 616
      Top = 4
      Caption = #1044#1086#1075#1086#1074#1086#1088
    end
    object edCar: TcxButtonEdit
      Left = 652
      Top = 71
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 6
      Width = 113
    end
    object cxLabel10: TcxLabel
      Left = 652
      Top = 48
      Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
    end
    object edPersonalDriver: TcxButtonEdit
      Left = 759
      Top = 27
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 8
      Width = 130
    end
    object cxLabel11: TcxLabel
      Left = 759
      Top = 4
      Caption = #1042#1086#1076#1080#1090#1077#1083#1100
    end
    object edRoute: TcxButtonEdit
      Left = 795
      Top = 71
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 10
      Width = 121
    end
    object cxLabel12: TcxLabel
      Left = 795
      Top = 48
      Caption = #1052#1072#1088#1096#1088#1091#1090
    end
    object edRouteSorting: TcxButtonEdit
      Left = 944
      Top = 71
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 12
      Width = 121
    end
    object cxLabel13: TcxLabel
      Left = 944
      Top = 54
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
    end
    object cxLabel14: TcxLabel
      Left = 903
      Top = 4
      Caption = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088
    end
    object edPersonal: TcxButtonEdit
      Left = 903
      Top = 27
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 15
      Width = 130
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 131
    Width = 1074
    Height = 312
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = cxTabSheet2
    Properties.CustomButtons.Buttons = <>
    ExplicitWidth = 1028
    ExplicitHeight = 286
    ClientRectBottom = 312
    ClientRectRight = 1074
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = #1057#1090#1088#1086#1095#1085#1072#1103' '#1095#1072#1089#1090#1100
      ImageIndex = 0
      ExplicitWidth = 1028
      ExplicitHeight = 262
      object cxGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 1074
        Height = 288
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1028
        ExplicitHeight = 262
        object cxGridDBTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSource
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Kind = skSum
              Position = spFooter
              Column = colAmountSumm
            end
            item
              Kind = skSum
              Position = spFooter
            end
            item
              Kind = skSum
              Position = spFooter
              Column = colHeadCount
            end
            item
              Kind = skSum
              Position = spFooter
              Column = colAmount
            end
            item
              Kind = skSum
              Position = spFooter
              Column = colAmountPartner
            end
            item
              Kind = skSum
              Position = spFooter
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              Column = colAmountSumm
            end
            item
              Kind = skSum
            end
            item
              Kind = skSum
              Column = colHeadCount
            end
            item
              Kind = skSum
              Column = colAmount
            end
            item
              Kind = skSum
              Column = colAmountPartner
            end
            item
              Kind = skSum
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.ColumnAutoWidth = True
          object colCode: TcxGridDBColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'GoodsCode'
            HeaderAlignmentHorz = taCenter
            Width = 58
          end
          object colName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'GoodsName'
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
          object colGoodsKindName: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
            DataBinding.FieldName = 'GoodsKindName'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object colPartionGoods: TcxGridDBColumn
            Caption = #1055#1072#1088#1090#1080#1103
            DataBinding.FieldName = 'PartionGoods'
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object colAmount: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086
            DataBinding.FieldName = 'Amount'
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object colAmountPartner: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1091' '#1082#1086#1085#1090#1088'.'
            DataBinding.FieldName = 'AmountPartner'
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object colPrice: TcxGridDBColumn
            Caption = #1062#1077#1085#1072
            DataBinding.FieldName = 'Price'
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object colCountForPrice: TcxGridDBColumn
            Caption = #1050#1086#1083' '#1074' '#1094#1077#1085#1077
            DataBinding.FieldName = 'CountForPrice'
            HeaderAlignmentHorz = taCenter
          end
          object colAmountSumm: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'AmountSumm'
            HeaderAlignmentHorz = taCenter
            Width = 91
          end
          object colHeadCount: TcxGridDBColumn
            Caption = #1050#1086#1083'. '#1075#1086#1083#1086#1074
            DataBinding.FieldName = 'HeadCount'
            HeaderAlignmentHorz = taCenter
          end
          object colAssetName: TcxGridDBColumn
            Caption = #1054#1089#1085'.'#1089#1088#1077#1076#1089#1090#1074#1072' '
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGridLevel: TcxGridLevel
          GridView = cxGridDBTableView
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1055#1088#1086#1074#1086#1076#1082#1080
      ImageIndex = 1
      ExplicitWidth = 1028
      ExplicitHeight = 262
      object cxGridEntry: TcxGrid
        Left = 0
        Top = 0
        Width = 1074
        Height = 288
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1028
        ExplicitHeight = 262
        object cxGridEntryDBTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = EntryDS
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Column = colKreditAmount
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = colDebetAmount
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          object colDebetAccountGroupCode: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1044' '#1043#1088#1091#1087#1087#1072' '#1082#1086#1076
            DataBinding.FieldName = 'DebetAccountGroupCode'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object colDebetAccountGroupName: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1044' '#1043#1088#1091#1087#1087#1072
            DataBinding.FieldName = 'DebetAccountGroupName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 90
          end
          object colDebetAccountDirectionCode: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1044' '#1053#1072#1087#1088#1072#1074#1083' '#1082#1086#1076
            DataBinding.FieldName = 'DebetAccountDirectionCode'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object colDebetAccountDirectionName: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1044' '#1053#1072#1087#1088#1072#1074#1083
            DataBinding.FieldName = 'DebetAccountDirectionName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 90
          end
          object colDebetAccountCode: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1044' '#1082#1086#1076
            DataBinding.FieldName = 'DebetAccountCode'
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object colDebetAccountName: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1044
            DataBinding.FieldName = 'DebetAccountName'
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object colKreditAccountGroupCode: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1050' '#1043#1088#1091#1087#1087#1072' '#1082#1086#1076
            DataBinding.FieldName = 'KreditAccountGroupCode'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object colKreditAccountGroupName: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1050' '#1043#1088#1091#1087#1087#1072
            DataBinding.FieldName = 'KreditAccountGroupName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object colKreditAccountDirectionCode: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1050' '#1053#1072#1087#1088#1072#1074#1083' '#1082#1086#1076
            DataBinding.FieldName = 'KreditAccountDirectionCode'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object colKreditAccountDirectionName: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1050' '#1053#1072#1087#1088#1072#1074#1083
            DataBinding.FieldName = 'KreditAccountDirectionName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object colKreditAccountCode: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1050' '#1082#1086#1076
            DataBinding.FieldName = 'KreditAccountCode'
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object colKreditAccountName: TcxGridDBColumn
            Caption = #1057#1095#1077#1090' '#1050
            DataBinding.FieldName = 'KreditAccountName'
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object colByObjectCode: TcxGridDBColumn
            Caption = #1054#1073'.'#1082#1086#1076
            DataBinding.FieldName = 'ByObjectCode'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object colByObjectName: TcxGridDBColumn
            Caption = #1054#1073#1098#1077#1082#1090' '#1085#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'ByObjectName'
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object colGoodsGroupName: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1072
            DataBinding.FieldName = 'GoodsGroupName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object colGoodsName: TcxGridDBColumn
            Caption = #1058#1086#1074#1072#1088
            DataBinding.FieldName = 'GoodsName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object colGoodsKindName_comlete: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
            DataBinding.FieldName = 'GoodsKindName'
            HeaderAlignmentHorz = taCenter
            Width = 60
          end
          object colAccountOnComplete: TcxGridDBColumn
            Caption = '***'
            DataBinding.FieldName = 'AccountOnComplete'
            HeaderAlignmentHorz = taCenter
            Width = 25
          end
          object colDebetAmount: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1076#1077#1073#1077#1090
            DataBinding.FieldName = 'DebetAmount'
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object colKreditAmount: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1082#1088#1077#1076#1080#1090
            DataBinding.FieldName = 'KreditAmount'
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
        end
        object cxGridEntryLevel: TcxGridLevel
          GridView = cxGridEntryDBTableView
        end
      end
    end
  end
  object cxCurrencyEdit2: TcxCurrencyEdit
    Left = 502
    Top = 72
    TabOrder = 2
    Width = 129
  end
  object edVATPercent: TcxCurrencyEdit
    Left = 423
    Top = 71
    TabOrder = 5
    Width = 65
  end
  object cxLabel7: TcxLabel
    Left = 423
    Top = 48
    Caption = '% '#1053#1044#1057
  end
  object cxLabel8: TcxLabel
    Left = 494
    Top = 49
    Caption = '(-)% '#1057#1082#1080#1076#1082#1080' (+)% '#1053#1072#1094#1077#1085#1082#1080
  end
  object edTo: TcxButtonEdit
    Left = 440
    Top = 27
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 8
    Width = 145
  end
  object cxLabel4: TcxLabel
    Left = 440
    Top = 4
    Caption = #1050#1086#1084#1091
  end
  object cxLabel3: TcxLabel
    Left = 288
    Top = 4
    Caption = #1054#1090' '#1082#1086#1075#1086
  end
  object edFrom: TcxButtonEdit
    Left = 288
    Top = 27
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 9
    Width = 137
  end
  object edOperDate: TcxDateEdit
    Left = 156
    Top = 27
    TabOrder = 12
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 156
    Top = 4
    Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 5
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object edPriceWithVAT: TcxCheckBox
    Left = 288
    Top = 71
    Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057' ('#1076#1072'/'#1085#1077#1090')'
    TabOrder = 14
    Width = 137
  end
  object edInvNumber: TcxTextEdit
    Left = 8
    Top = 27
    TabOrder = 18
    Width = 121
  end
  object dsdFormParams: TdsdFormParams
    Params = <
      item
        Name = 'Id'
        DataType = ftInteger
        ParamType = ptInputOutput
        Value = '0'
      end>
    Left = 176
    Top = 256
  end
  object spSelectMovementItem: TdsdStoredProc
    StoredProcName = 'gpSelect_MovementItem_Sale'
    DataSet = ClientDataSet
    DataSets = <
      item
        DataSet = ClientDataSet
      end>
    Params = <
      item
        Name = 'inMovementId'
        Component = dsdFormParams
        ComponentItem = 'Id'
        DataType = ftInteger
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'inShowAll'
        DataType = ftBoolean
        ParamType = ptInput
        Value = 'False'
      end>
    Left = 88
    Top = 280
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmMain.ImageList
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    UseSystemFont = True
    Left = 136
    Top = 224
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBarManagerBar: TdxBar
      Caption = 'Custom'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 671
      FloatTop = 8
      FloatClientWidth = 51
      FloatClientHeight = 71
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          Visible = True
          ItemName = 'bbPrint'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bbRefresh: TdxBarButton
      Action = actRefresh
      Category = 0
    end
    object bbPrint: TdxBarButton
      Action = actPrint
      Category = 0
    end
  end
  object cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = colAmount
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = colCode
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = colDebetAccountName
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = colName
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = colPrice
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = colAmountSumm
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = Owner
        Properties.Strings = (
          'Height'
          'Left'
          'Top'
          'Width')
      end>
    StorageName = 'cxPropertiesStore'
    Left = 280
    Top = 304
  end
  object ActionList: TActionList
    Images = dmMain.ImageList
    Left = 376
    Top = 216
    object actRefresh: TdsdDataSetRefresh
      Category = 'DSDLib'
      StoredProc = spGet
      StoredProcList = <
        item
          StoredProc = spGet
        end
        item
          StoredProc = spSelectMovementItem
        end
        item
          StoredProc = spSelectMovementContainerItem
        end>
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 4
      ShortCut = 116
    end
    object actUpdateDataSet: TdsdUpdateDataSet
      Category = 'DSDLib'
      StoredProc = spInsertUpdateMovementItem
      StoredProcList = <
        item
          StoredProc = spInsertUpdateMovementItem
        end>
      Caption = 'actUpdateDataSet'
      DataSource = DataSource
    end
    object actPrint: TdsdPrintAction
      Category = 'DSDLib'
      StoredProcList = <>
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 3
      ShortCut = 16464
      ReportName = #1055#1088#1080#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
    end
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 32
    Top = 208
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 104
  end
  object spGet: TdsdStoredProc
    StoredProcName = 'gpGet_Movement_Sale'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'inId'
        Component = dsdFormParams
        ComponentItem = 'Id'
        DataType = ftInteger
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'InvNumber'
        Component = cxLabel4
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Name = 'OperDate'
        Component = edOperDate
        DataType = ftInteger
        ParamType = ptOutput
        Value = ''
      end
      item
        Name = 'StatusCode'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'OperDatePartner'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'InvNumberPartner'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'StatusName'
        ComponentItem = 'TextValue'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'PriceWithVAT'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'VATPercent'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'ChangePercent'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'FromId'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'FromName'
        ComponentItem = 'TextValue'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'ToId'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'PaidKindId'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'ToName'
        ComponentItem = 'TextValue'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'PaidKindName'
        ComponentItem = 'TextValue'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'ContractId'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'ContractName'
        ComponentItem = 'TextValue'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'CarId'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'CarName'
        ComponentItem = 'TextValue'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'PersonalDriverId'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'PersonalDriverName'
        ComponentItem = 'TextValue'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'RouteId'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'RouteName'
        ComponentItem = 'TextValue'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'RouteSortingId'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end
      item
        Name = 'RouteSortingName'
        ComponentItem = 'TextValue'
        DataType = ftInteger
        ParamType = ptOutput
        Value = Null
      end>
    Left = 152
    Top = 128
  end
  object PopupMenu: TPopupMenu
    Images = dmMain.ImageList
    Left = 384
    Top = 312
    object N1: TMenuItem
      Action = actRefresh
    end
  end
  object spSelectMovementContainerItem: TdsdStoredProc
    StoredProcName = 'gpSelect_MovementItemContainer_Movement'
    DataSet = EntryCDS
    DataSets = <
      item
        DataSet = EntryCDS
      end>
    Params = <
      item
        Name = 'inMovementId'
        Component = dsdFormParams
        ComponentItem = 'Id'
        DataType = ftInteger
        ParamType = ptInput
        Value = '0'
      end>
    Left = 560
    Top = 216
  end
  object EntryCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 176
  end
  object EntryDS: TDataSource
    DataSet = EntryCDS
    Left = 440
    Top = 224
  end
  object spInsertUpdateMovementItem: TdsdStoredProc
    StoredProcName = 'gpInsertUpdate_MovementItem_Sale'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'ioId'
        Component = ClientDataSet
        ComponentItem = 'Id'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = 'inMovementId'
        Component = dsdFormParams
        ComponentItem = 'Id'
        DataType = ftInteger
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'inGoodsId'
        Component = ClientDataSet
        ComponentItem = 'GoodsId'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'inAmount'
        Component = ClientDataSet
        ComponentItem = 'Amount'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'inAmountPartner'
        DataType = ftFloat
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'inPrice'
        Component = ClientDataSet
        ComponentItem = 'Price'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'inCountForPrice'
        DataType = ftFloat
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'inLiveWeight'
        DataType = ftFloat
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'inHeadCount'
        DataType = ftFloat
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'inGoodsKindId'
        DataType = ftInteger
        ParamType = ptInput
        Value = '0'
      end>
    Left = 520
    Top = 120
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = ClientDataSet
    BCDToCurrency = False
    Left = 232
    Top = 216
  end
  object InsertUpdateMovement: TdsdStoredProc
    StoredProcName = 'gpInsertUpdate_Movement_Sale'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'ioId'
        Component = dsdFormParams
        ComponentItem = 'Id'
        DataType = ftInteger
        ParamType = ptInputOutput
        Value = '0'
      end
      item
        Name = 'inInvNumber'
        Component = edInvNumber
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'inOperDate'
        Component = edOperDate
        DataType = ftDate
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'inOperDatePartner'
        DataType = ftDate
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'inPriceWithVAT'
        Component = edPriceWithVAT
        DataType = ftBoolean
        ParamType = ptInput
        Value = 'False'
      end
      item
        Name = 'inVATPercent'
        Component = edVATPercent
        DataType = ftFloat
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'inChangePercent'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'inFromId'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'inToId'
        ComponentItem = 'Key'
        DataType = ftInteger
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'inPaidKindId'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'inContractId'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'inCarId'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'inPersonalDriverId'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'inRouteId'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'inRouteSortingId'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    Left = 752
    Top = 112
  end
  object dsdGuidesFrom: TdsdGuides
    LookupControl = edFrom
    FormName = 'TJuridicalForm'
    PositionDataSet = 'GridDataSet'
    Left = 352
  end
  object dsdGuidesTo: TdsdGuides
    LookupControl = edTo
    FormName = 'TUnitForm'
    PositionDataSet = 'GridDataSet'
    Left = 472
    Top = 8
  end
  object dsdGuidesPaidKind: TdsdGuides
    LookupControl = edPaidKind
    FormName = 'TPaidKindForm'
    PositionDataSet = 'ClientDataSet'
    Left = 224
    Top = 48
  end
  object dsdGuidesContract: TdsdGuides
    LookupControl = edContract
    FormName = 'TContractForm'
    PositionDataSet = 'ClientDataSet'
    Left = 680
    Top = 8
  end
  object dsdGuidesCar: TdsdGuides
    LookupControl = edCar
    FormName = 'TCarForm'
    PositionDataSet = 'ClientDataSet'
    Left = 712
    Top = 72
  end
  object dsdGuidesPersonalDriver: TdsdGuides
    LookupControl = edPersonalDriver
    FormName = 'TPersonalForm'
    PositionDataSet = 'ClientDataSet'
    Left = 824
  end
  object dsdGuidesRoute: TdsdGuides
    LookupControl = edRoute
    FormName = 'TRouteForm'
    PositionDataSet = 'ClientDataSet'
    Left = 840
    Top = 64
  end
  object dsdGuidesRouteSorting: TdsdGuides
    LookupControl = edRouteSorting
    FormName = 'TRouteSortingForm'
    PositionDataSet = 'ClientDataSet'
    Left = 984
    Top = 72
  end
  object dsdGuidesPersonal: TdsdGuides
    LookupControl = edPersonal
    FormName = 'TPersonalForm'
    PositionDataSet = 'ClientDataSet'
    Left = 952
  end
end
