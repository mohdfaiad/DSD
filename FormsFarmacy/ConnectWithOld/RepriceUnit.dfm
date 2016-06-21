object RepriceUnitForm: TRepriceUnitForm
  Left = 0
  Top = 0
  Caption = #1055#1077#1088#1077#1086#1094#1077#1085#1082#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
  ClientHeight = 540
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AllGoodsPriceGrid: TcxGrid
    Left = 0
    Top = 249
    Width = 890
    Height = 291
    Align = alClient
    TabOrder = 0
    object AllGoodsPriceGridTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsResult
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '+,0.00 '#1075#1088#1085'; -,0.00 '#1075#1088#1085'; ;'
          Kind = skSum
          FieldName = 'RealSummReprice'
          Column = colMinExpirationDate
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '+,0.00 '#1075#1088#1085'; -,0.00 '#1075#1088#1085'; ;'
          Kind = skSum
          FieldName = 'RealSummReprice'
          Column = colSumReprice
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      object colUnitName: TcxGridDBColumn
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        DataBinding.FieldName = 'UnitName'
        Visible = False
        GroupIndex = 0
        Options.Editing = False
        Width = 154
      end
      object colReprice: TcxGridDBColumn
        AlternateCaption = #1055#1077#1088#1077#1086#1094#1077#1085#1080#1090#1100
        Caption = #1055#1077#1088#1077#1086#1094#1077#1085#1080#1090#1100
        DataBinding.FieldName = 'Reprice'
        PropertiesClassName = 'TcxCheckBoxProperties'
        HeaderHint = #1055#1077#1088#1077#1086#1094#1077#1085#1080#1090#1100
        Width = 22
      end
      object colGoodsCode: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'Code'
        Options.Editing = False
        Width = 54
      end
      object colGoodsName: TcxGridDBColumn
        Caption = #1058#1086#1074#1072#1088
        DataBinding.FieldName = 'GoodsName'
        Options.Editing = False
        Width = 289
      end
      object colRemainsCount: TcxGridDBColumn
        Caption = #1054#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'RemainsCount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.####;-,0.####; ;'
        Options.Editing = False
      end
      object colRemainsCount_to: TcxGridDBColumn
        Caption = #1054#1089#1090'. '#1074' '#1072#1087#1090'. ('#1074#1099#1073#1086#1088')'
        DataBinding.FieldName = 'RemainsCount_to'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.####;-,0.####; ;'
        Options.Editing = False
        Width = 70
      end
      object colOldPrice: TcxGridDBColumn
        Caption = #1058#1077#1082#1091#1097#1072#1103' '#1094#1077#1085#1072
        DataBinding.FieldName = 'LastPrice'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00'
        Options.Editing = False
        Width = 82
      end
      object colLastPrice_to: TcxGridDBColumn
        Caption = #1062#1077#1085#1072' '#1074' '#1072#1087#1090'. ('#1074#1099#1073#1086#1088')'
        DataBinding.FieldName = 'LastPrice_to'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00; ;'
        Options.Editing = False
        Width = 80
      end
      object colPriceDiff_to: TcxGridDBColumn
        Caption = '% '#1086#1090#1082#1083'. '#1086#1090' '#1072#1087#1090'. ('#1074#1099#1073#1086#1088')'
        DataBinding.FieldName = 'PriceDiff_to'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '+0.0%;-0.0%; ;'
        Options.Editing = False
        Width = 55
      end
      object colNewPrice: TcxGridDBColumn
        Caption = #1053#1086#1074#1072#1103' '#1094#1077#1085#1072
        DataBinding.FieldName = 'NewPrice'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00'
        Options.Editing = False
        Width = 74
      end
      object colMidPriceSale: TcxGridDBColumn
        Caption = #1057#1088'.'#1094#1077#1085#1072' '#1088#1077#1072#1083#1080#1079'. '#1086#1089#1090#1072#1090#1082#1072
        DataBinding.FieldName = 'MidPriceSale'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00'
        Options.Editing = False
        Width = 80
      end
      object colMidPriceDiff: TcxGridDBColumn
        Caption = '% '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1086#1090' '#1089#1088'.'#1094#1077#1085#1099
        DataBinding.FieldName = 'MidPriceDiff'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '+0.0%;-0.0%; ;'
        Options.Editing = False
        Width = 70
      end
      object colPercent: TcxGridDBColumn
        Caption = '% '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        DataBinding.FieldName = 'PriceDiff'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '+0.0%;-0.0%; ;'
        Options.Editing = False
        Width = 78
      end
      object colMinMarginPercent: TcxGridDBColumn
        Caption = #1052#1080#1085'. % '#1088#1072#1079#1085#1080#1094#1099
        DataBinding.FieldName = 'MinMarginPercent'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##'
      end
      object colNDS: TcxGridDBColumn
        Caption = #1053#1044#1057
        DataBinding.FieldName = 'NDS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '0.## %'
        Options.Editing = False
        Width = 43
      end
      object colExpirationDate: TcxGridDBColumn
        Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'ExpirationDate'
        Options.Editing = False
        Width = 96
      end
      object colIsOneJuridical: TcxGridDBColumn
        Caption = #1054#1076#1080#1085' '#1087#1086#1089#1090'.'
        DataBinding.FieldName = 'isOneJuridical'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Options.Editing = False
        Width = 40
      end
      object colisPriceFix: TcxGridDBColumn
        Caption = #1060#1080#1082#1089'. '#1094#1077#1085#1072
        DataBinding.FieldName = 'isPriceFix'
        PropertiesClassName = 'TcxCheckBoxProperties'
        HeaderHint = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1094#1077#1085#1072
        Options.Editing = False
        Width = 40
      end
      object colisIncome: TcxGridDBColumn
        Caption = #1055#1088#1080#1093#1086#1076' '#1089#1077#1075#1086#1076#1085#1103
        DataBinding.FieldName = 'isIncome'
        HeaderHint = #1055#1088#1080#1093#1086#1076' '#1089#1077#1075#1086#1076#1085#1103
        Options.Editing = False
        Width = 60
      end
      object colisTop: TcxGridDBColumn
        Caption = #1058#1086#1087
        DataBinding.FieldName = 'isTop'
        Options.Editing = False
        Width = 28
      end
      object colisPromo: TcxGridDBColumn
        Caption = #1040#1082#1094#1080#1103
        DataBinding.FieldName = 'isPromo'
        Options.Editing = False
        Width = 43
      end
      object colJuridicalName: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'JuridicalName'
        Options.Editing = False
        Width = 103
      end
      object colContractName: TcxGridDBColumn
        Caption = #1044#1086#1075#1086#1074#1086#1088
        DataBinding.FieldName = 'ContractName'
        Width = 60
      end
      object colJuridical_Price: TcxGridDBColumn
        Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072' '#1089' '#1053#1044#1057
        DataBinding.FieldName = 'Juridical_Price'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00'
        Options.Editing = False
        Width = 94
      end
      object colMarginPercent: TcxGridDBColumn
        Caption = '% '#1085#1072#1094#1077#1085#1082#1080' '#1087#1086' '#1090#1086#1095#1082#1077
        DataBinding.FieldName = 'MarginPercent'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##'
        Options.Editing = False
        Width = 92
      end
      object colJuridical_GoodsName: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072' '#1091' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        DataBinding.FieldName = 'Juridical_GoodsName'
        Options.Editing = False
        Width = 187
      end
      object colProducerName: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'ProducerName'
        Options.Editing = False
        Width = 103
      end
      object colSumReprice: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080
        DataBinding.FieldName = 'SumReprice'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.####;-,0.####; ;'
        Options.Editing = False
        Width = 127
      end
      object colMinExpirationDate: TcxGridDBColumn
        Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080' '#1086#1089#1090#1072#1090#1082#1072
        DataBinding.FieldName = 'MinExpirationDate'
        Options.Editing = False
        Width = 118
      end
      object MinExpirationDate_to: TcxGridDBColumn
        Caption = #1057#1088#1086#1082' '#1075#1086#1076'. '#1086#1089#1090'. '#1074' '#1072#1087#1090'. ('#1074#1099#1073#1086#1088')'
        DataBinding.FieldName = 'MinExpirationDate_to'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object colUnitId: TcxGridDBColumn
        DataBinding.FieldName = 'UnitId'
        Visible = False
        VisibleForCustomization = False
      end
      object colGoodsId: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        Visible = False
        VisibleForCustomization = False
      end
      object colJuridicalId: TcxGridDBColumn
        DataBinding.FieldName = 'JuridicalId'
        Visible = False
        VisibleForCustomization = False
        Width = 60
      end
      object colId: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        Visible = False
        VisibleForCustomization = False
        Width = 55
      end
    end
    object AllGoodsPriceGridLevel: TcxGridLevel
      GridView = AllGoodsPriceGridTableView
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 890
    Height = 241
    Align = alTop
    TabOrder = 1
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 888
      Height = 239
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 0
      object CheckListBox: TCheckListBox
        Left = 1
        Top = 1
        Width = 886
        Height = 211
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
      object Panel5: TPanel
        Left = 1
        Top = 212
        Width = 886
        Height = 26
        Align = alBottom
        TabOrder = 1
        object lblProggres1: TLabel
          Left = 348
          Top = 0
          Width = 22
          Height = 13
          Alignment = taCenter
          Caption = '0 / 0'
        end
        object lblProggres2: TLabel
          Left = 442
          Top = 0
          Width = 22
          Height = 13
          Alignment = taCenter
          Caption = '0 / 0'
        end
        object SpeedButton1: TSpeedButton
          Left = 622
          Top = 0
          Width = 80
          Height = 25
          Action = dsdGridToExcel1
        end
        object btnSelectNewPrice: TButton
          Left = 220
          Top = 0
          Width = 84
          Height = 25
          Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
          TabOrder = 0
          OnClick = btnSelectNewPriceClick
        end
        object ProgressBar1: TProgressBar
          Left = 314
          Top = 13
          Width = 81
          Height = 10
          TabOrder = 1
        end
        object ProgressBar2: TProgressBar
          Left = 402
          Top = 13
          Width = 93
          Height = 10
          TabOrder = 2
        end
        object cePercentDifference: TcxCurrencyEdit
          Left = 92
          Top = 3
          EditValue = 30.000000000000000000
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0.'
          TabOrder = 3
          Width = 29
        end
        object cxLabel1: TcxLabel
          Left = 0
          Top = 4
          Caption = '% '#1088#1072#1079#1085#1080#1094#1099' '#1094#1077#1085#1099
        end
        object btnReprice: TButton
          Left = 723
          Top = 0
          Width = 112
          Height = 25
          Caption = #1055#1077#1088#1077#1086#1094#1077#1085#1080#1090#1100'  >>>'
          TabOrder = 5
          OnClick = btnRepriceClick
        end
        object chbVAT20: TcxCheckBox
          Left = 127
          Top = 3
          Caption = #1053#1044#1057' 20%'
          TabOrder = 6
          Width = 82
        end
        object btnRepriceSelYes: TButton
          Left = 510
          Top = 0
          Width = 35
          Height = 25
          Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1090#1086#1074#1072#1088#1099' '#1076#1083#1103' '#1055#1077#1088#1077#1086#1094#1077#1085#1082#1080
          Caption = '+'
          TabOrder = 7
          OnClick = btnRepriceSelYesClick
        end
        object btnRepriceSelNo: TButton
          Left = 570
          Top = 0
          Width = 35
          Height = 25
          Hint = #1059#1073#1088#1072#1090#1100' '#1086#1090#1084#1077#1090#1082#1091' '#1090#1086#1074#1072#1088#1099' '#1076#1083#1103' '#1055#1077#1088#1077#1086#1094#1077#1085#1082#1080
          Caption = '-'
          TabOrder = 8
          OnClick = btnRepriceSelNoClick
        end
        object edUnit: TcxButtonEdit
          Left = 841
          Top = 3
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          TabOrder = 9
          Width = 147
        end
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 241
    Width = 890
    Height = 8
    AlignSplitter = salTop
    Control = Panel1
  end
  object GetUnitsList: TdsdStoredProc
    StoredProcName = 'gpSelect_Object_UnitForReprice'
    DataSet = UnitsCDS
    DataSets = <
      item
        DataSet = UnitsCDS
      end>
    Params = <>
    PackSize = 1
    Left = 24
    Top = 8
  end
  object dsdDBViewAddOn1: TdsdDBViewAddOn
    ErasedFieldName = 'isErased'
    View = AllGoodsPriceGridTableView
    OnDblClickActionList = <>
    ActionItemList = <>
    OnlyEditingCellOnEnter = False
    ColorRuleList = <>
    ColumnAddOnList = <>
    ColumnEnterList = <>
    SummaryItemList = <>
    Left = 576
    Top = 384
  end
  object spSelect_AllGoodsPrice: TdsdStoredProc
    StoredProcName = 'gpSelect_AllGoodsPrice'
    DataSet = AllGoodsPriceCDS
    DataSets = <
      item
        DataSet = AllGoodsPriceCDS
      end>
    Params = <
      item
        Name = 'inUnitId'
        Value = Null
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inUnitId_to'
        Value = Null
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inMinPercent'
        Value = Null
        Component = cePercentDifference
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inVAT20'
        Value = Null
        Component = chbVAT20
        DataType = ftBoolean
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    PackSize = 1
    Left = 48
    Top = 408
  end
  object AllGoodsPriceCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 360
  end
  object dsResult: TDataSource
    DataSet = cdsResult
    Left = 216
    Top = 360
  end
  object FormParams: TdsdFormParams
    Params = <
      item
        Name = 'UnitId'
        Value = ''
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'UnitName'
        Value = ''
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 24
    Top = 464
  end
  object ActionList1: TActionList
    Images = dmMain.ImageList
    Left = 88
    Top = 464
    object actRefresh: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      PostDataSetAfterExecute = True
      StoredProc = spSelect_AllGoodsPrice
      StoredProcList = <
        item
          StoredProc = spSelect_AllGoodsPrice
        end>
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object dsdGridToExcel1: TdsdGridToExcel
      MoveParams = <>
      Grid = AllGoodsPriceGrid
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072
      Hint = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      ImageIndex = 6
      ShortCut = 16472
    end
  end
  object cdsResult: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftInteger
      end
      item
        Name = 'Code'
        DataType = ftInteger
      end
      item
        Name = 'GoodsName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LastPrice'
        DataType = ftCurrency
      end
      item
        Name = 'RemainsCount'
        DataType = ftCurrency
      end
      item
        Name = 'RemainsCount_to'
        DataType = ftCurrency
      end
      item
        Name = 'NDS'
        DataType = ftCurrency
      end
      item
        Name = 'ExpirationDate'
        DataType = ftDate
      end
      item
        Name = 'NewPrice'
        DataType = ftCurrency
      end
      item
        Name = 'MinMarginPercent'
        DataType = ftCurrency
      end
      item
        Name = 'PriceDiff'
        DataType = ftCurrency
      end
      item
        Name = 'Reprice'
        DataType = ftBoolean
      end
      item
        Name = 'UnitId'
        DataType = ftInteger
      end
      item
        Name = 'UnitName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'JuridicalName'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Juridical_Price'
        DataType = ftCurrency
      end
      item
        Name = 'Juridical_GoodsName'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'MarginPercent'
        DataType = ftCurrency
      end
      item
        Name = 'ProducerName'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SumReprice'
        DataType = ftCurrency
      end
      item
        Name = 'MinExpirationDate'
        DataType = ftDate
      end
      item
        Name = 'isOneJuridical'
        DataType = ftBoolean
      end
      item
        Name = 'JuridicalId'
        DataType = ftInteger
      end
      item
        Name = 'isPriceFix'
        DataType = ftBoolean
      end
      item
        Name = 'isIncome'
        DataType = ftBoolean
      end
      item
        Name = 'isTop'
        DataType = ftBoolean
      end
      item
        Name = 'isPromo'
        DataType = ftBoolean
      end
      item
        Name = 'MidPriceSale'
        DataType = ftCurrency
      end
      item
        Name = 'MidPriceDiff'
        DataType = ftCurrency
      end
      item
        Name = 'ContractName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LastPrice_to'
        DataType = ftCurrency
      end
      item
        Name = 'PriceDiff_to'
        DataType = ftCurrency
      end
      item
        Name = 'MinExpirationDate_to'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsResultCalcFields
    Left = 168
    Top = 360
    Data = {
      070400009619E0BD010000001800000021000000000003000000070402496404
      0001000000000004436F6465040001000000000009476F6F64734E616D650200
      49000000010005574944544802000200FF00094C617374507269636508000400
      0000010007535542545950450200490006004D6F6E6579000C52656D61696E73
      436F756E74080004000000010007535542545950450200490006004D6F6E6579
      000F52656D61696E73436F756E745F746F080004000000010007535542545950
      450200490006004D6F6E657900034E4453080004000000010007535542545950
      450200490006004D6F6E6579000E45787069726174696F6E4461746504000600
      00000000084E6577507269636508000400000001000753554254595045020049
      0006004D6F6E657900104D696E4D617267696E50657263656E74080004000000
      010007535542545950450200490006004D6F6E65790009507269636544696666
      080004000000010007535542545950450200490006004D6F6E65790007526570
      72696365020003000000000006556E69744964040001000000000008556E6974
      4E616D65020049000000010005574944544802000200FF000D4A757269646963
      616C4E616D6501004900000001000557494454480200020064000F4A75726964
      6963616C5F507269636508000400000001000753554254595045020049000600
      4D6F6E657900134A757269646963616C5F476F6F64734E616D65010049000000
      010005574944544802000200FA000D4D617267696E50657263656E7408000400
      0000010007535542545950450200490006004D6F6E6579000C50726F64756365
      724E616D6501004900000001000557494454480200020064000A53756D526570
      72696365080004000000010007535542545950450200490006004D6F6E657900
      114D696E45787069726174696F6E4461746504000600000000000E69734F6E65
      4A757269646963616C02000300000000000B4A757269646963616C4964040001
      00000000000A697350726963654669780200030000000000086973496E636F6D
      650200030000000000056973546F70020003000000000007697350726F6D6F02
      000300000000000C4D6964507269636553616C65080004000000010007535542
      545950450200490006004D6F6E6579000C4D6964507269636544696666080004
      000000010007535542545950450200490006004D6F6E6579000C436F6E747261
      63744E616D6501004900000001000557494454480200020032000C4C61737450
      726963655F746F080004000000010007535542545950450200490006004D6F6E
      6579000C5072696365446966665F746F08000400000001000753554254595045
      0200490006004D6F6E657900144D696E45787069726174696F6E446174655F74
      6F04000600000000000000}
    object cdsResultId: TIntegerField
      FieldName = 'Id'
    end
    object cdsResultCode: TIntegerField
      FieldName = 'Code'
    end
    object cdsResultGoodsName: TStringField
      FieldName = 'GoodsName'
      Size = 255
    end
    object cdsResultLastPrice: TCurrencyField
      FieldName = 'LastPrice'
    end
    object cdsResultRemainsCount: TCurrencyField
      FieldName = 'RemainsCount'
    end
    object cdsResultRemainsCount_to: TCurrencyField
      FieldName = 'RemainsCount_to'
    end
    object cdsResultNDS: TCurrencyField
      FieldName = 'NDS'
    end
    object cdsResultExpirationDate: TDateField
      FieldName = 'ExpirationDate'
    end
    object cdsResultNewPrice: TCurrencyField
      FieldName = 'NewPrice'
    end
    object cdsResultMarginPercent: TCurrencyField
      FieldName = 'MarginPercent'
    end
    object cdsResultPriceDiff: TCurrencyField
      FieldName = 'PriceDiff'
    end
    object cdsResultLastPrice_to: TFloatField
      FieldName = 'LastPrice_to'
    end
    object cdsResultPriceDiff_to: TFloatField
      FieldName = 'PriceDiff_to'
    end
    object cdsResultReprice: TBooleanField
      FieldName = 'Reprice'
    end
    object cdsResultUnitId: TIntegerField
      FieldName = 'UnitId'
    end
    object cdsResultUnitName: TStringField
      FieldName = 'UnitName'
      Size = 255
    end
    object cdsResultJuridicalName: TStringField
      FieldName = 'JuridicalName'
      Size = 100
    end
    object cdsResultJuridical_Price: TCurrencyField
      FieldName = 'Juridical_Price'
    end
    object cdsResultJuridical_GoodsName: TStringField
      FieldName = 'Juridical_GoodsName'
      Size = 250
    end
    object cdsResultProducerName: TStringField
      FieldName = 'ProducerName'
      Size = 100
    end
    object cdsResultSumReprice: TCurrencyField
      FieldName = 'SumReprice'
    end
    object cdsResultMinExpirationDate: TDateField
      FieldName = 'MinExpirationDate'
    end
    object cdsResultRealSummReprice: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'RealSummReprice'
      Calculated = True
    end
    object cdsResultMinMarginPercent: TCurrencyField
      FieldName = 'MinMarginPercent'
    end
    object cdsResultisOneJuridical: TBooleanField
      FieldName = 'isOneJuridical'
    end
    object cdsResultJuridicalId: TIntegerField
      FieldName = 'JuridicalId'
    end
    object cdsResultisPriceFix: TBooleanField
      FieldName = 'isPriceFix'
    end
    object cdsResultisIncome: TBooleanField
      FieldName = 'isIncome'
    end
    object cdsResultisTop: TBooleanField
      FieldName = 'isTop'
    end
    object cdsResultisPromo: TBooleanField
      FieldName = 'isPromo'
    end
    object cdsResultMidPriceSale: TCurrencyField
      FieldName = 'MidPriceSale'
    end
    object cdsResultMidPriceDiff: TCurrencyField
      FieldName = 'MidPriceDiff'
    end
    object cdsResultContractName: TStringField
      FieldName = 'ContractName'
      Size = 50
    end
    object cdsResultMinExpirationDate_to: TDateField
      FieldName = 'MinExpirationDate_to'
    end
  end
  object UnitsCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 8
  end
  object spInsertUpdate_MovementItem_Reprice: TdsdStoredProc
    StoredProcName = 'gpInsertUpdate_MovementItem_Reprice'
    DataSets = <>
    OutputType = otMultiExecute
    Params = <
      item
        Name = 'ioID'
        Value = '0'
        ParamType = ptInputOutput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inGoodsId'
        Value = Null
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inUnitId'
        Value = Null
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inUnitId_Forwarding'
        Value = Null
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inJuridicalId'
        Value = Null
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inExpirationDate'
        Value = 'NULL'
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inMinExpirationDate'
        Value = 'NULL'
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inAmount'
        Value = Null
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inPriceOld'
        Value = Null
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inPriceNew'
        Value = Null
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inJuridical_Price'
        Value = Null
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inGUID'
        Value = Null
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    PackSize = 100
    Left = 664
    Top = 96
  end
  object cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = Owner
        Properties.Strings = (
          'Height'
          'Left'
          'Top'
          'Width')
      end>
    StorageName = 'cxPropertiesStore'
    StorageType = stRegistry
    Left = 360
    Top = 328
  end
  object dsdUserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn
    Left = 352
    Top = 384
  end
  object GuidesUnit: TdsdGuides
    KeyField = 'Id'
    LookupControl = edUnit
    FormNameParam.Value = 'TUnit_ObjectForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TUnit_ObjectForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesUnit
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesUnit
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 872
    Top = 232
  end
end
