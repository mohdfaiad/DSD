﻿inherited Report_GoodsMI_SaleReturnInForm: TReport_GoodsMI_SaleReturnInForm
  Caption = #1054#1090#1095#1077#1090' <'#1055#1088#1086#1076#1072#1078#1072' / '#1042#1086#1079#1074#1088#1072#1090' '#1087#1086' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103#1084'> '
  ClientHeight = 387
  ClientWidth = 1461
  AddOnFormData.Params = FormParams
  ExplicitWidth = 1477
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TcxPageControl
    Top = 80
    Width = 1461
    Height = 307
    TabOrder = 3
    ExplicitTop = 80
    ExplicitWidth = 1020
    ExplicitHeight = 307
    ClientRectBottom = 307
    ClientRectRight = 1461
    inherited tsMain: TcxTabSheet
      ExplicitWidth = 1020
      ExplicitHeight = 307
      inherited cxGrid: TcxGrid
        Width = 1461
        Height = 307
        ExplicitWidth = 1020
        ExplicitHeight = 307
        inherited cxGridDBTableView: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.####'
              Kind = skSum
              Column = clSale_Summ
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clSale_Amount_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clSale_Amount_Sh
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clReturn_Amount_Sh
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clReturn_Amount_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clReturn_Summ
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clSale_AmountPartner_Sh
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clSale_AmountPartner_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clReturn_AmountPartner_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clReturn_AmountPartner_Sh
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Return_SummCost
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_SummCost
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_Summ_10200
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_Summ_10300
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_Amount_10500_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_Amount_40200_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Return_Amount_40200_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_SummCost_10500
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_SummCost_40200
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Return_SummCost_40200
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Return_Summ_10300
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.####'
              Kind = skSum
              Column = clSale_Summ
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clSale_Amount_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clSale_Amount_Sh
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clReturn_Amount_Sh
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clReturn_Amount_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clReturn_Summ
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clSale_AmountPartner_Sh
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clSale_AmountPartner_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clReturn_AmountPartner_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clReturn_AmountPartner_Sh
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Return_SummCost
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_SummCost
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_Summ_10200
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_Summ_10300
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_Amount_10500_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_Amount_40200_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Return_Amount_40200_Weight
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_SummCost_10500
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Sale_SummCost_40200
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Return_SummCost_40200
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = Return_Summ_10300
            end>
          OptionsData.CancelOnExit = True
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsView.GroupByBox = True
          Styles.Content = nil
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Header = nil
          object BranchName: TcxGridDBColumn
            Caption = #1060#1080#1083#1080#1072#1083
            DataBinding.FieldName = 'BranchName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object RetailName: TcxGridDBColumn
            Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1089#1077#1090#1100
            DataBinding.FieldName = 'RetailName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object RetailReportName: TcxGridDBColumn
            Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1089#1077#1090#1100' ('#1087#1088#1086#1089#1088#1086#1095#1082#1072')'
            DataBinding.FieldName = 'RetailReportName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object clJuridicalGroupName: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1087#1072' '#1102#1088'.'#1083'.'
            DataBinding.FieldName = 'JuridicalGroupName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object clJuridicalName: TcxGridDBColumn
            Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
            DataBinding.FieldName = 'JuridicalName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object clOKPO: TcxGridDBColumn
            Caption = #1054#1050#1055#1054
            DataBinding.FieldName = 'OKPO'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 55
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
          object colContractNumber: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1075'.'
            DataBinding.FieldName = 'ContractNumber'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 55
          end
          object clContractTagGroupName: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1087#1072' '#1087#1088#1080#1079#1085#1072#1082' '#1076#1086#1075'.'
            DataBinding.FieldName = 'ContractTagGroupName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object clContractTagName: TcxGridDBColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1076#1086#1075'.'
            DataBinding.FieldName = 'ContractTagName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 60
          end
          object AreaName: TcxGridDBColumn
            Caption = #1056#1077#1075#1080#1086#1085
            DataBinding.FieldName = 'AreaName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object Address: TcxGridDBColumn
            Caption = #1040#1076#1088#1077#1089
            DataBinding.FieldName = 'Address'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object RegionName: TcxGridDBColumn
            Caption = #1054#1073#1083#1072#1089#1090#1100
            DataBinding.FieldName = 'RegionName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object ProvinceName: TcxGridDBColumn
            Caption = #1056#1072#1081#1086#1085
            DataBinding.FieldName = 'ProvinceName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object CityKindName: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1085'.'#1087'.'
            DataBinding.FieldName = 'CityKindName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 35
          end
          object CityName: TcxGridDBColumn
            Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
            DataBinding.FieldName = 'CityName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object ProvinceCityName: TcxGridDBColumn
            Caption = #1052#1080#1082#1088#1086#1088#1072#1081#1086#1085
            DataBinding.FieldName = 'ProvinceCityName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object StreetKindName: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1091#1083'./'#1087#1088'.'
            DataBinding.FieldName = 'StreetKindName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 25
          end
          object StreetName: TcxGridDBColumn
            Caption = #1059#1083#1080#1094#1072
            DataBinding.FieldName = 'StreetName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object PartnerName: TcxGridDBColumn
            Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            DataBinding.FieldName = 'PartnerName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object PartnerTagName: TcxGridDBColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1058
            DataBinding.FieldName = 'PartnerTagName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object BranchName_Personal: TcxGridDBColumn
            Caption = #1060#1080#1083#1080#1072#1083' ('#1089#1091#1087#1077#1088#1074#1072#1081#1079#1077#1088')'
            DataBinding.FieldName = 'BranchName_Personal'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object UnitName_Personal: TcxGridDBColumn
            Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' ('#1089#1091#1087#1077#1088#1074#1072#1081#1079#1077#1088')'
            DataBinding.FieldName = 'UnitName_Personal'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object colPersonalName: TcxGridDBColumn
            Caption = #1060#1048#1054' '#1089#1086#1090#1088#1091#1076#1085#1080#1082' ('#1089#1091#1087#1077#1088#1074#1072#1081#1079#1077#1088')'
            DataBinding.FieldName = 'PersonalName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 110
          end
          object UnitName_PersonalTrade: TcxGridDBColumn
            Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' ('#1058#1055')'
            DataBinding.FieldName = 'UnitName_PersonalTrade'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object colPersonalTradeName: TcxGridDBColumn
            Caption = #1060#1048#1054' '#1089#1086#1090#1088#1091#1076#1085#1080#1082' ('#1058#1055')'
            DataBinding.FieldName = 'PersonalTradeName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 110
          end
          object clTradeMarkName: TcxGridDBColumn
            Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1084#1072#1088#1082#1072
            DataBinding.FieldName = 'TradeMarkName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 68
          end
          object GoodsGroupAnalystName: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1087#1072' '#1072#1085#1072#1083#1080#1090#1080#1082#1080
            DataBinding.FieldName = 'GoodsGroupAnalystName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object clGoodsTagName: TcxGridDBColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1090#1086#1074#1072#1088#1072
            DataBinding.FieldName = 'GoodsTagName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object clGoodsGroupStatName: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1087#1072' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
            DataBinding.FieldName = 'GoodsGroupStatName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object clGoodsGroupNameFull: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1072' ('#1074#1089#1077')'
            DataBinding.FieldName = 'GoodsGroupNameFull'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object clGoodsGroupName: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1072
            DataBinding.FieldName = 'GoodsGroupName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object clGoodsCode: TcxGridDBColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'GoodsCode'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 44
          end
          object clGoodsName: TcxGridDBColumn
            Caption = #1058#1086#1074#1072#1088
            DataBinding.FieldName = 'GoodsName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object clGoodsKindName: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
            DataBinding.FieldName = 'GoodsKindName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 56
          end
          object clMeasureName: TcxGridDBColumn
            Caption = #1045#1076'. '#1080#1079#1084'.'
            DataBinding.FieldName = 'MeasureName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 45
          end
          object clSale_Amount_Weight: TcxGridDBColumn
            Caption = #1055#1088#1086#1076', '#1074#1077#1089' ('#1089#1082#1083#1072#1076')'
            DataBinding.FieldName = 'Sale_Amount_Weight'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object clSale_Amount_Sh: TcxGridDBColumn
            Caption = #1055#1088#1086#1076', '#1096#1090' ('#1089#1082#1083#1072#1076')'
            DataBinding.FieldName = 'Sale_Amount_Sh'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object clSale_AmountPartner_Weight: TcxGridDBColumn
            Caption = #1055#1088#1086#1076', '#1074#1077#1089' ('#1087#1086#1082#1091#1087')'
            DataBinding.FieldName = 'Sale_AmountPartner_Weight'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object clSale_AmountPartner_Sh: TcxGridDBColumn
            Caption = #1055#1088#1086#1076', '#1096#1090' ('#1087#1086#1082#1091#1087')'
            DataBinding.FieldName = 'Sale_AmountPartner_Sh'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object Sale_Amount_10500_Weight: TcxGridDBColumn
            Caption = #1057#1082#1080#1076#1082#1072', '#1074#1077#1089' ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
            DataBinding.FieldName = 'Sale_Amount_10500_Weight'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object Sale_Amount_40200_Weight: TcxGridDBColumn
            Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1074#1077#1089' ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
            DataBinding.FieldName = 'Sale_Amount_40200_Weight'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object clSale_Summ: TcxGridDBColumn
            Caption = #1055#1088#1086#1076', '#1075#1088#1085
            DataBinding.FieldName = 'Sale_Summ'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object Sale_Summ_10200: TcxGridDBColumn
            Caption = #1040#1082#1094#1080#1080', '#1075#1088#1085' ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
            DataBinding.FieldName = 'Sale_Summ_10200'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object Sale_Summ_10300: TcxGridDBColumn
            Caption = #1057#1082#1080#1076#1082#1072', '#1075#1088#1085' ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
            DataBinding.FieldName = 'Sale_Summ_10300'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object Sale_SummCost: TcxGridDBColumn
            Caption = #1055#1088#1086#1076' '#1089'/'#1089', '#1075#1088#1085
            DataBinding.FieldName = 'Sale_SummCost'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00;-,0.00; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object Sale_SummCost_10500: TcxGridDBColumn
            Caption = #1057#1082#1080#1076#1082#1072' '#1089'/'#1089', '#1075#1088#1085' ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
            DataBinding.FieldName = 'Sale_SummCost_10500'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object Sale_SummCost_40200: TcxGridDBColumn
            Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1089'/'#1089', '#1075#1088#1085' ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
            DataBinding.FieldName = 'Sale_SummCost_40200'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object clReturn_Amount_Weight: TcxGridDBColumn
            Caption = #1042#1086#1079#1074#1088', '#1074#1077#1089' ('#1089#1082#1083#1072#1076')'
            DataBinding.FieldName = 'Return_Amount_Weight'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object clReturn_Amount_Sh: TcxGridDBColumn
            Caption = #1042#1086#1079#1074#1088', '#1096#1090' ('#1089#1082#1083#1072#1076')'
            DataBinding.FieldName = 'Return_Amount_Sh'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object clReturn_AmountPartner_Weight: TcxGridDBColumn
            Caption = #1042#1086#1079#1074#1088', '#1074#1077#1089' ('#1087#1086#1082#1091#1087')'
            DataBinding.FieldName = 'Return_AmountPartner_Weight'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 75
          end
          object clReturn_AmountPartner_Sh: TcxGridDBColumn
            Caption = #1042#1086#1079#1074#1088', '#1096#1090' ('#1087#1086#1082#1091#1087')'
            DataBinding.FieldName = 'Return_AmountPartner_Sh'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object Return_Amount_40200_Weight: TcxGridDBColumn
            Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1074#1077#1089' ('#1087#1088#1080' '#1074#1086#1079#1074#1088'.)'
            DataBinding.FieldName = 'Return_Amount_40200_Weight'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object clReturn_Summ: TcxGridDBColumn
            Caption = #1042#1086#1079#1074#1088', '#1075#1088#1085
            DataBinding.FieldName = 'Return_Summ'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object Return_Summ_10300: TcxGridDBColumn
            Caption = #1057#1082#1080#1076#1082#1072', '#1075#1088#1085' ('#1087#1088#1080' '#1074#1086#1079#1074#1088'.)'
            DataBinding.FieldName = 'Return_Summ_10300'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
          end
          object Return_SummCost: TcxGridDBColumn
            Caption = #1042#1086#1079#1074#1088' '#1089'/'#1089', '#1075#1088#1085
            DataBinding.FieldName = 'Return_SummCost'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00;-,0.00; '
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object Return_SummCost_40200: TcxGridDBColumn
            Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1089'/'#1089', '#1075#1088#1085' ('#1087#1088#1080' '#1074#1086#1079#1074#1088'.)'
            DataBinding.FieldName = 'Return_SummCost_40200'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.00##;-,0.00##; '
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
          object colInfoMoneyGroupName: TcxGridDBColumn
            Caption = #1059#1055' '#1075#1088#1091#1087#1087#1072' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
            DataBinding.FieldName = 'InfoMoneyGroupName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
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
          object colInfoMoneyName: TcxGridDBColumn
            Caption = #1059#1055' '#1089#1090#1072#1090#1100#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
            DataBinding.FieldName = 'InfoMoneyName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object InfoMoneyName_all: TcxGridDBColumn
            Caption = #1059#1055' '#1089#1090#1072#1090#1100#1103
            DataBinding.FieldName = 'InfoMoneyName_all'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object clReturnPercent: TcxGridDBColumn
            Caption = '% '#1074#1086#1079#1074#1088#1072#1090#1072
            DataBinding.FieldName = 'ReturnPercent'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 55
          end
          object PartnerId: TcxGridDBColumn
            Caption = #1050#1083#1102#1095'-2'
            DataBinding.FieldName = 'PartnerId'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Enabled = False
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Visible = False
            Width = 45
          end
          object colAccountName: TcxGridDBColumn
            Caption = #1057#1095#1077#1090
            DataBinding.FieldName = 'AccountName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 55
          end
          object PartnerCode: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1087#1072#1088#1090#1085#1077#1088#1072
            DataBinding.FieldName = 'PartnerCode'
            Visible = False
          end
        end
      end
    end
  end
  inherited Panel: TPanel
    Width = 1461
    Height = 54
    ExplicitWidth = 1020
    ExplicitHeight = 54
    inherited deStart: TcxDateEdit
      Left = 60
      EditValue = 42005d
      Properties.SaveTime = False
      ExplicitLeft = 60
    end
    inherited deEnd: TcxDateEdit
      Left = 60
      Top = 30
      EditValue = 42005d
      Properties.SaveTime = False
      ExplicitLeft = 60
      ExplicitTop = 30
    end
    inherited cxLabel1: TcxLabel
      Left = 15
      Caption = #1044#1072#1090#1072' '#1089' :'
      ExplicitLeft = 15
      ExplicitWidth = 45
    end
    inherited cxLabel2: TcxLabel
      Left = 8
      Top = 31
      Caption = #1044#1072#1090#1072' '#1087#1086' :'
      ExplicitLeft = 8
      ExplicitTop = 31
      ExplicitWidth = 52
    end
    object cxLabel4: TcxLabel
      Left = 1050
      Top = 6
      Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1086#1074':'
    end
    object edGoodsGroup: TcxButtonEdit
      Left = 1050
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 5
      Width = 170
    end
    object cxLabel3: TcxLabel
      Left = 625
      Top = 6
      Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086':'
    end
    object edJuridical: TcxButtonEdit
      Left = 625
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 7
      Width = 180
    end
    object cxLabel5: TcxLabel
      Left = 820
      Top = 6
      Caption = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099':'
    end
    object edPaidKind: TcxButtonEdit
      Left = 820
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 9
      Width = 80
    end
    object cxLabel7: TcxLabel
      Left = 1235
      Top = 6
      Caption = #1059#1055' '#1089#1090#1072#1090#1100#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103':'
    end
    object edInfoMoney: TcxButtonEdit
      Left = 1235
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 11
      Width = 200
    end
    object edBranch: TcxButtonEdit
      Left = 160
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 12
      Width = 140
    end
    object cxLabel8: TcxLabel
      Left = 160
      Top = 6
      Caption = #1060#1080#1083#1080#1072#1083':'
    end
    object edArea: TcxButtonEdit
      Left = 315
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 14
      Width = 140
    end
    object cxLabel20: TcxLabel
      Left = 315
      Top = 6
      Caption = #1056#1077#1075#1080#1086#1085':'
    end
    object edRetail: TcxButtonEdit
      Left = 470
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 16
      Width = 140
    end
    object cxLabel6: TcxLabel
      Left = 470
      Top = 6
      Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1089#1077#1090#1100':'
    end
    object cxLabel9: TcxLabel
      Left = 915
      Top = 6
      Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1084#1072#1088#1082#1072
    end
    object еdTradeMark: TcxButtonEdit
      Left = 915
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 19
      Width = 120
    end
  end
  object cbPartner: TcxCheckBox [2]
    Left = 76
    Top = 87
    Caption = #1087#1086' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072#1084
    Properties.ReadOnly = False
    TabOrder = 6
    Width = 118
  end
  object cbGoods: TcxCheckBox [3]
    Left = 351
    Top = 87
    Caption = #1087#1086' '#1058#1086#1074#1072#1088#1072#1084
    Properties.ReadOnly = False
    TabOrder = 7
    Width = 88
  end
  object cbTradeMark: TcxCheckBox [4]
    Left = 200
    Top = 87
    Caption = #1087#1086' '#1058#1086#1088#1075#1086#1074#1099#1084' '#1084#1072#1088#1082#1072#1084
    Properties.ReadOnly = False
    TabOrder = 8
    Width = 137
  end
  object cbGoodsKind: TcxCheckBox [5]
    Left = 445
    Top = 87
    Caption = #1087#1086' '#1042#1080#1076#1072#1084
    Properties.ReadOnly = False
    TabOrder = 9
    Width = 78
  end
  inherited cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = GuidesArea
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesBranch
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = cbGoods
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cbGoodsKind
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cbPartner
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cbTradeMark
        Properties.Strings = (
          'Checked')
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
        Component = GuidesGoodsGroup
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesInfoMoney
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesJuridical
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesPaidKind
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesRetail
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesTradeMark
        Properties.Strings = (
          'Key'
          'TextValue')
      end>
  end
  inherited ActionList: TActionList
    Left = 87
    object actPrint_byPartner: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spSelect
      StoredProcList = <
        item
          StoredProc = spSelect
        end>
      Caption = #1055#1088#1086#1076#1072#1078#1072' '#1080' '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
      Hint = #1054#1090#1095#1077#1090' '#1087#1086' '#1102#1088'.'#1083#1080#1094#1072#1084
      ImageIndex = 21
      ShortCut = 16464
      DataSets = <
        item
          DataSet = MasterCDS
          UserName = 'frxDBDMaster'
          IndexFieldNames = 'partnername'
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
        end>
      ReportName = #1055#1088#1086#1076#1072#1078#1072' '#1080' '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
      ReportNameParam.Value = #1055#1088#1086#1076#1072#1078#1072' '#1080' '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
      ReportNameParam.DataType = ftString
    end
    object actPrint_byJuridical: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1102#1088'.'#1083#1080#1094#1072#1084' ('#1080#1090#1086#1075#1080')'
      Hint = #1054#1090#1095#1077#1090' '#1087#1086' '#1102#1088'.'#1083#1080#1094#1072#1084
      ImageIndex = 19
      ShortCut = 16464
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 'juridicalname;partnername'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
        end>
      ReportName = #1055#1088#1086#1076#1072#1078#1072' '#1080' '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086' '#1102#1088#1083#1080#1094#1072#1084
      ReportNameParam.Value = #1055#1088#1086#1076#1072#1078#1072' '#1080' '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086' '#1102#1088#1083#1080#1094#1072#1084
      ReportNameParam.DataType = ftString
    end
    object actPrint: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1090#1086#1074#1072#1088#1072#1084' ('#1080#1090#1086#1075#1080')'
      Hint = #1054#1090#1095#1077#1090' '#1087#1086' '#1090#1086#1074#1072#1088#1072#1084' ('#1080#1090#1086#1075#1080')'
      ImageIndex = 18
      ShortCut = 16464
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 'GoodsGroupName;GoodsName'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
        end>
      ReportName = #1055#1088#1086#1076#1072#1078#1072' '#1080' '#1074#1086#1079#1074#1088#1072#1090
      ReportNameParam.Value = #1055#1088#1086#1076#1072#1078#1072' '#1080' '#1074#1086#1079#1074#1088#1072#1090
      ReportNameParam.DataType = ftString
    end
    object actPrint_byStatGroup: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1075#1088#1091#1087#1087#1077' '#1073#1091#1093#1075'. '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
      Hint = #1054#1090#1095#1077#1090' '#1087#1086' '#1075#1088#1091#1087#1087#1077' '#1073#1091#1093#1075'. '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
      ImageIndex = 20
      ShortCut = 16464
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 'GoodsGroupStatName;GoodsName'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
        end>
      ReportName = #1054#1090#1095#1077#1090' '#1087#1086' '#1075#1088#1091#1087#1087#1077' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
      ReportNameParam.Value = #1054#1090#1095#1077#1090' '#1087#1086' '#1075#1088#1091#1087#1087#1077' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
      ReportNameParam.DataType = ftString
    end
  end
  inherited MasterDS: TDataSource
    Left = 112
    Top = 200
  end
  inherited MasterCDS: TClientDataSet
    Left = 40
    Top = 208
  end
  inherited spSelect: TdsdStoredProc
    StoredProcName = 'gpReport_GoodsMI_SaleReturnIn'
    DataSets = <
      item
        DataSet = MasterCDS
      end
      item
      end
      item
      end>
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
        Name = 'inBranchId'
        Value = Null
        Component = GuidesBranch
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inAreaId'
        Value = Null
        Component = GuidesArea
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inRetailId'
        Value = Null
        Component = GuidesRetail
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inJuridicalId'
        Value = '0'
        Component = GuidesJuridical
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inPaidKindId'
        Value = ''
        Component = GuidesPaidKind
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inTradeMarkId'
        Value = Null
        Component = GuidesTradeMark
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inGoodsGroupId'
        Value = ''
        Component = GuidesGoodsGroup
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inInfoMoneyId'
        Value = ''
        Component = GuidesInfoMoney
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inIsPartner'
        Value = Null
        Component = cbPartner
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'inIsTradeMark'
        Value = Null
        Component = cbTradeMark
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'inIsGoods'
        Value = Null
        Component = cbGoods
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'inIsGoodsKind'
        Value = Null
        Component = cbGoodsKind
        DataType = ftBoolean
        ParamType = ptInput
      end>
    Left = 176
    Top = 200
  end
  inherited BarManager: TdxBarManager
    Left = 200
    Top = 208
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
          ItemName = 'bbRefresh'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPartner'
        end
        item
          Visible = True
          ItemName = 'bbTradeMark'
        end
        item
          Visible = True
          ItemName = 'bbGoods'
        end
        item
          Visible = True
          ItemName = 'bbGoodsKind'
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
          ItemName = 'bbPrint_byJuridical'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPrint_byStatGroup'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPrint_byPartner'
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
    object bbPrint: TdxBarButton
      Action = actPrint
      Category = 0
    end
    object bbPrint_byJuridical: TdxBarButton
      Action = actPrint_byJuridical
      Category = 0
    end
    object bbPrint_byStatGroup: TdxBarButton
      Action = actPrint_byStatGroup
      Category = 0
    end
    object bbPartner: TdxBarControlContainerItem
      Caption = #1087#1086' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072#1084
      Category = 0
      Hint = #1087#1086' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072#1084
      Visible = ivAlways
      Control = cbPartner
    end
    object bbGoods: TdxBarControlContainerItem
      Caption = #1087#1086' '#1058#1086#1074#1072#1088#1072#1084
      Category = 0
      Hint = #1087#1086' '#1058#1086#1074#1072#1088#1072#1084
      Visible = ivAlways
      Control = cbGoods
    end
    object bbPrint_byPartner: TdxBarButton
      Action = actPrint_byPartner
      Category = 0
    end
    object bbTradeMark: TdxBarControlContainerItem
      Caption = #1087#1086' '#1058#1086#1088#1075#1086#1074#1099#1084' '#1084#1072#1088#1082#1072#1084
      Category = 0
      Hint = #1087#1086' '#1058#1086#1088#1075#1086#1074#1099#1084' '#1084#1072#1088#1082#1072#1084
      Visible = ivAlways
      Control = cbTradeMark
    end
    object bbGoodsKind: TdxBarControlContainerItem
      Caption = #1087#1086' '#1042#1080#1076#1072#1084
      Category = 0
      Hint = #1087#1086' '#1042#1080#1076#1072#1084
      Visible = ivAlways
      Control = cbGoodsKind
    end
  end
  inherited DBViewAddOn: TdsdDBViewAddOn
    Left = 320
    Top = 232
  end
  inherited PopupMenu: TPopupMenu
    Left = 144
  end
  inherited PeriodChoice: TPeriodChoice
    Left = 112
    Top = 128
  end
  inherited RefreshDispatcher: TRefreshDispatcher
    ComponentList = <
      item
        Component = PeriodChoice
      end
      item
        Component = GuidesBranch
      end
      item
        Component = GuidesArea
      end
      item
        Component = GuidesRetail
      end
      item
        Component = GuidesJuridical
      end
      item
        Component = GuidesPaidKind
      end
      item
        Component = GuidesTradeMark
      end
      item
        Component = GuidesGoodsGroup
      end
      item
        Component = GuidesInfoMoney
      end>
    Left = 184
    Top = 136
  end
  object GuidesGoodsGroup: TdsdGuides
    KeyField = 'Id'
    LookupControl = edGoodsGroup
    FormNameParam.Value = 'TGoodsGroup_ObjectForm'
    FormNameParam.DataType = ftString
    FormName = 'TGoodsGroup_ObjectForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesGoodsGroup
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesGoodsGroup
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 1144
    Top = 8
  end
  object FormParams: TdsdFormParams
    Params = <>
    Left = 328
    Top = 170
  end
  object GuidesJuridical: TdsdGuides
    KeyField = 'Id'
    LookupControl = edJuridical
    Key = '0'
    FormNameParam.Name = 'TJuridical_ObjectForm'
    FormNameParam.Value = 'TJuridical_ObjectForm'
    FormNameParam.DataType = ftString
    FormName = 'TJuridical_ObjectForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = '0'
        Component = GuidesJuridical
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesJuridical
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 728
    Top = 8
  end
  object GuidesInfoMoney: TdsdGuides
    KeyField = 'Id'
    LookupControl = edInfoMoney
    FormNameParam.Value = 'TInfoMoney_ObjectDescForm'
    FormNameParam.DataType = ftString
    FormName = 'TInfoMoney_ObjectDescForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesInfoMoney
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesInfoMoney
        ComponentItem = 'TextValue'
        DataType = ftString
      end
      item
        Name = 'inDescCode'
        Value = 'zc_Object_Juridical'
        DataType = ftString
      end>
    Left = 1368
    Top = 65533
  end
  object GuidesPaidKind: TdsdGuides
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
        Component = GuidesPaidKind
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesPaidKind
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 840
    Top = 32
  end
  object GuidesBranch: TdsdGuides
    KeyField = 'Id'
    LookupControl = edBranch
    FormNameParam.Value = 'TBranch_ObjectForm'
    FormNameParam.DataType = ftString
    FormName = 'TBranch_ObjectForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesBranch
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesBranch
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 216
  end
  object GuidesArea: TdsdGuides
    KeyField = 'Id'
    LookupControl = edArea
    FormNameParam.Value = 'TAreaForm'
    FormNameParam.DataType = ftString
    FormName = 'TAreaForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesArea
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesArea
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 384
    Top = 5
  end
  object GuidesRetail: TdsdGuides
    KeyField = 'Id'
    LookupControl = edRetail
    FormNameParam.Value = 'TRetailForm'
    FormNameParam.DataType = ftString
    FormName = 'TRetailForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesRetail
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesRetail
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 544
    Top = 13
  end
  object GuidesTradeMark: TdsdGuides
    KeyField = 'Id'
    LookupControl = еdTradeMark
    FormNameParam.Value = 'TTradeMarkForm'
    FormNameParam.DataType = ftString
    FormName = 'TTradeMarkForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesTradeMark
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesTradeMark
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 960
    Top = 26
  end
end
