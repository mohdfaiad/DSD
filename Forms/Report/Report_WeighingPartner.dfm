object Report_WeighingPartnerForm: TReport_WeighingPartnerForm
  Left = 0
  Top = 0
  Caption = #1054#1090#1095#1077#1090' <'#1055#1086' '#1082#1086#1084#1087#1083#1077#1082#1090#1086#1074#1097#1080#1082#1072#1084'>'
  ClientHeight = 669
  ClientWidth = 945
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  AddOnFormData.RefreshAction = actRefresh
  AddOnFormData.isSingle = False
  AddOnFormData.ExecuteDialogAction = ExecuteDialog
  AddOnFormData.Params = FormParams
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid: TcxGrid
    Left = 0
    Top = 80
    Width = 945
    Height = 589
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1344
    object cxGridDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = MasterDS
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.####'
          Kind = skSum
          Column = TotalCount
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountMI
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountMovement
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = TotalCountKg
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.####'
          Kind = skSum
          Column = TotalCount
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountMI
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountMovement
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = TotalCountKg
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end
        item
          Format = ',0.####'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      Images = dmMain.SortImageList
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupSummaryLayout = gslAlignWithColumns
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      Styles.StyleSheet = dmMain.cxGridTableViewStyleSheet
      object OperDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'OperDate'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 50
      end
      object PersonalName: TcxGridDBColumn
        Caption = #1060#1048#1054
        DataBinding.FieldName = 'PersonalName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 169
      end
      object PositionName: TcxGridDBColumn
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'PositionName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 180
      end
      object TotalCount: TcxGridDBColumn
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        DataBinding.FieldName = 'TotalCount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 102
      end
      object TotalCountKg: TcxGridDBColumn
        Caption = #1042#1077#1089
        DataBinding.FieldName = 'TotalCountKg'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 65
      end
      object CountMI: TcxGridDBColumn
        Caption = #1050#1086#1083'. '#1089#1090#1088#1086#1082
        DataBinding.FieldName = 'CountMI'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 96
      end
      object CountMovement: TcxGridDBColumn
        Caption = #1050#1086#1083'. '#1076#1086#1082'.'
        DataBinding.FieldName = 'CountMovement'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 96
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object cbinIsDay: TcxCheckBox
    Left = 301
    Top = 87
    Caption = #1087#1086' '#1076#1085#1103#1084' '
    Properties.ReadOnly = False
    TabOrder = 5
    Width = 102
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 945
    Height = 54
    Align = alTop
    TabOrder = 6
    ExplicitTop = -6
    object deStart: TcxDateEdit
      Left = 60
      Top = 5
      EditValue = 42005d
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 85
    end
    object deEnd: TcxDateEdit
      Left = 60
      Top = 30
      EditValue = 42005d
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 85
    end
    object edUnitGroup: TcxButtonEdit
      Left = 242
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 203
    end
    object cxLabel3: TcxLabel
      Left = 171
      Top = 6
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082':'
    end
    object edLocation: TcxButtonEdit
      Left = 242
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 4
      Width = 203
    end
    object cxLabel4: TcxLabel
      Left = 171
      Top = 29
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
    end
    object cxLabel5: TcxLabel
      Left = 13
      Top = 6
      Caption = #1044#1072#1090#1072' '#1089' :'
    end
    object cxLabel6: TcxLabel
      Left = 6
      Top = 31
      Caption = #1044#1072#1090#1072' '#1087#1086' :'
    end
  end
  object MasterDS: TDataSource
    DataSet = MasterCDS
    Left = 48
    Top = 248
  end
  object MasterCDS: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 88
    Top = 200
  end
  object cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = cbinIsDay
        Properties.Strings = (
          'Checked')
      end
      item
        Component = PositionGuides
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = PersonalGuides
        Properties.Strings = (
          'Key'
          'TextValue')
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
    StorageType = stStream
    Left = 312
    Top = 232
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmMain.ImageList
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    UseSystemFont = True
    Left = 128
    Top = 264
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBarManagerBar1: TdxBar
      Caption = 'Custom'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 2
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 671
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
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
          ItemName = 'bbGoodsKind'
        end
        item
          Visible = True
          ItemName = 'bbPartionGoods'
        end
        item
          Visible = True
          ItemName = 'bbAmount'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPrintBy_Goods'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPrint2'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPrint3'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbToExcel'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
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
    object bbToExcel: TdxBarButton
      Action = actExportToExcel
      Category = 0
    end
    object bbDialogForm: TdxBarButton
      Action = ExecuteDialog
      Category = 0
    end
    object bbPrintBy_Goods: TdxBarButton
      Action = actPrint
      Category = 0
    end
    object dxBarStatic: TdxBarStatic
      Caption = '   '
      Category = 0
      Hint = '   '
      Visible = ivAlways
    end
    object bbGoodsKind: TdxBarControlContainerItem
      Caption = #1087#1086' '#1042#1080#1076#1072#1084
      Category = 0
      Hint = #1087#1086' '#1042#1080#1076#1072#1084
      Visible = ivAlways
    end
    object bbPartionGoods: TdxBarControlContainerItem
      Caption = #1087#1086' '#1055#1072#1088#1090#1080#1103#1084
      Category = 0
      Hint = #1087#1086' '#1055#1072#1088#1090#1080#1103#1084
      Visible = ivAlways
    end
    object bbAmount: TdxBarControlContainerItem
      Caption = #1090#1086#1083#1100#1082#1086' '#1050#1086#1083'-'#1074#1086
      Category = 0
      Hint = #1090#1086#1083#1100#1082#1086' '#1050#1086#1083'-'#1074#1086
      Visible = ivAlways
      Control = cbinIsDay
    end
    object bbPrint2: TdxBarButton
      Action = actPrint_GP
      Category = 0
    end
    object bbPrint3: TdxBarButton
      Action = actPrint_Remains
      Category = 0
    end
  end
  object ActionList: TActionList
    Images = dmMain.ImageList
    Left = 256
    Top = 232
    object actRefresh: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spReport
      StoredProcList = <
        item
          StoredProc = spReport
        end>
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 4
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object actExportToExcel: TdsdGridToExcel
      Category = 'DSDLib'
      MoveParams = <>
      Grid = cxGrid
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      Hint = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      ImageIndex = 6
      ShortCut = 16472
    end
    object ExecuteDialog: TExecuteDialog
      Category = 'DSDLib'
      MoveParams = <>
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      ImageIndex = 35
      FormName = 'TReport_MotionGoodsDialogForm'
      FormNameParam.Value = 'TReport_MotionGoodsDialogForm'
      FormNameParam.DataType = ftString
      GuiParams = <
        item
          Name = 'StartDate'
          Value = 41640d
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'EndDate'
          Value = 41640d
          DataType = ftDateTime
          ParamType = ptInput
        end
        item
          Name = 'GoodsId'
          Value = ''
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'GoodsName'
          Value = ''
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'GoodsGroupId'
          Value = ''
          ParamType = ptInput
        end
        item
          Name = 'GoodsGroupName'
          Value = ''
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'UnitGroupId'
          Value = ''
          Component = PersonalGuides
          ComponentItem = 'Key'
          ParamType = ptInput
        end
        item
          Name = 'UnitGroupName'
          Value = ''
          Component = PersonalGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'LocationId'
          Value = ''
          Component = PositionGuides
          ComponentItem = 'Key'
          ParamType = ptInput
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = PositionGuides
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'AccountGroupId'
          Value = Null
          ParamType = ptInput
        end
        item
          Name = 'AccountGroupName'
          Value = Null
          ParamType = ptInput
        end
        item
          Name = 'isInfoMoney'
          Value = Null
          DataType = ftBoolean
          ParamType = ptInput
        end
        item
          Name = 'UnitGroupId_by'
          Value = Null
          ParamType = ptInput
        end
        item
          Name = 'UnitGroupName_by'
          Value = Null
          DataType = ftString
          ParamType = ptInput
        end
        item
          Name = 'LocationId_by'
          Value = Null
          ParamType = ptInput
        end
        item
          Name = 'LocationName_by'
          Value = Null
          DataType = ftString
          ParamType = ptInput
        end>
      isShowModal = True
      OpenBeforeShow = True
    end
    object actPrint: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1076#1083#1103' '#1074#1089#1077#1093')'
      Hint = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1076#1083#1103' '#1074#1089#1077#1093')'
      ImageIndex = 3
      ShortCut = 16464
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 
            'GoodsGroupNameFull;GoodsGroupName;GoodsName;GoodsKindName;Partio' +
            'nGoodsName;AssetToName;InfoMoneyName_all;InfoMoneyName_all_Detai' +
            'l'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 41640d
          DataType = ftDateTime
        end
        item
          Name = 'EndDate'
          Value = 41640d
          DataType = ftDateTime
        end
        item
          Name = 'UnitGroupName'
          Value = Null
          Component = PersonalGuides
          ComponentItem = 'TextValue'
          DataType = ftString
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = PositionGuides
          ComponentItem = 'TextValue'
          DataType = ftString
        end
        item
          Name = 'GoodsGroupName'
          Value = Null
          DataType = ftString
        end
        item
          Name = 'GoodsName'
          Value = Null
        end
        item
          Name = 'isGoodsKind'
          Value = Null
          DataType = ftBoolean
        end
        item
          Name = 'isPartionGoods'
          Value = Null
          DataType = ftBoolean
        end
        item
          Name = 'isAmount'
          Value = Null
          Component = cbinIsDay
          DataType = ftBoolean
        end
        item
          Name = 'isInfoMoney'
          Value = Null
          DataType = ftBoolean
        end>
      ReportName = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1076#1083#1103' '#1074#1089#1077#1093')'
      ReportNameParam.Value = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1076#1083#1103' '#1074#1089#1077#1093')'
      ReportNameParam.DataType = ftString
    end
    object SaleJournal: TdsdOpenForm
      Category = 'DSDLib'
      MoveParams = <>
      Caption = 'SaleJournal'
      FormName = 'TMovementGoodsJournalForm'
      FormNameParam.Value = 'TMovementGoodsJournalForm'
      FormNameParam.DataType = ftString
      GuiParams = <
        item
          Name = 'StartDate'
          Value = 41640d
          DataType = ftDateTime
        end
        item
          Name = 'EndDate'
          Value = 41640d
          DataType = ftDateTime
        end
        item
          Name = 'GoodsKindId'
          Value = 0
          Component = MasterCDS
          ComponentItem = 'GoodsKindId'
        end
        item
          Name = 'GoodsKindName'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'GoodsKindName'
          DataType = ftString
        end
        item
          Name = 'GoodsId'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'GoodsId'
        end
        item
          Name = 'GoodsName'
          Value = ''
          Component = MasterCDS
          ComponentItem = 'GoodsName'
          DataType = ftString
        end
        item
          Name = 'PartionGoodsId'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'PartionGoodsId'
        end
        item
          Name = 'PartionGoodsName'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'PartionGoodsName'
          DataType = ftString
        end
        item
          Name = 'LocationId'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'LocationId'
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = MasterCDS
          ComponentItem = 'LocationName'
          DataType = ftString
        end
        item
          Name = 'AccountGroupId'
          Value = Null
        end
        item
          Name = 'AccountGroupName'
          Value = Null
          DataType = ftString
        end
        item
          Name = 'InfoMoneyId'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'InfoMoneyId_Detail'
        end
        item
          Name = 'InfoMoneyName'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'InfoMoneyName_Detail'
          DataType = ftString
        end
        item
          Name = 'UnitGroupId'
          Value = Null
          Component = PersonalGuides
          ComponentItem = 'Key'
        end
        item
          Name = 'UnitGroupName'
          Value = Null
          Component = PersonalGuides
          ComponentItem = 'TextValue'
          DataType = ftString
        end
        item
          Name = 'DescSet'
          Value = Null
          Component = FormParams
          ComponentItem = 'SaleDesc'
          DataType = ftString
        end>
      isShowModal = False
    end
    object actIsInfoMoney: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spReport
      StoredProcList = <
        item
          StoredProc = spReport
        end>
      Caption = #1044#1077#1090#1072#1083#1100#1085#1086' '#1087#1086' '#1059#1055' '#1089#1090#1072#1090#1100#1103#1084
      Hint = #1044#1077#1090#1072#1083#1100#1085#1086' '#1087#1086' '#1059#1055' '#1089#1090#1072#1090#1100#1103#1084
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object actPrint_GP: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1094#1077#1093')'
      Hint = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1094#1077#1093')'
      ImageIndex = 18
      ShortCut = 16464
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 
            'GoodsGroupNameFull;GoodsGroupName;GoodsName;GoodsKindName;Partio' +
            'nGoodsName;AssetToName;InfoMoneyName_all;InfoMoneyName_all_Detai' +
            'l'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 42005d
          DataType = ftDateTime
        end
        item
          Name = 'EndDate'
          Value = 42005d
          DataType = ftDateTime
        end
        item
          Name = 'UnitGroupName'
          Value = ''
          Component = PersonalGuides
          ComponentItem = 'TextValue'
          DataType = ftString
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = PositionGuides
          ComponentItem = 'TextValue'
          DataType = ftString
        end
        item
          Name = 'GoodsGroupName'
          Value = ''
          DataType = ftString
        end
        item
          Name = 'GoodsName'
          Value = ''
        end
        item
          Name = 'isGoodsKind'
          Value = 'False'
          DataType = ftBoolean
        end
        item
          Name = 'isPartionGoods'
          Value = 'False'
          DataType = ftBoolean
        end
        item
          Name = 'isAmount'
          Value = 'False'
          Component = cbinIsDay
          DataType = ftBoolean
        end
        item
          Name = 'isInfoMoney'
          Value = 'False'
          DataType = ftBoolean
        end
        item
          Name = 'UnitGroupName_by'
          Value = Null
          DataType = ftString
        end
        item
          Name = 'LocationName_by'
          Value = Null
          DataType = ftString
        end>
      ReportName = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1094#1077#1093')'
      ReportNameParam.Value = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1094#1077#1093')'
      ReportNameParam.DataType = ftString
    end
    object actPrint_Remains: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1086#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1076#1072#1090#1091')'
      Hint = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1086#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1076#1072#1090#1091')'
      ImageIndex = 19
      ShortCut = 16464
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 
            'GoodsGroupNameFull;GoodsGroupName;GoodsName;GoodsKindName;Partio' +
            'nGoodsName;AssetToName;InfoMoneyName_all;InfoMoneyName_all_Detai' +
            'l'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 42005d
          DataType = ftDateTime
        end
        item
          Name = 'EndDate'
          Value = 42005d
          DataType = ftDateTime
        end
        item
          Name = 'UnitGroupName'
          Value = ''
          Component = PersonalGuides
          ComponentItem = 'TextValue'
          DataType = ftString
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = PositionGuides
          ComponentItem = 'TextValue'
          DataType = ftString
        end
        item
          Name = 'GoodsGroupName'
          Value = ''
          DataType = ftString
        end
        item
          Name = 'GoodsName'
          Value = ''
        end
        item
          Name = 'isGoodsKind'
          Value = 'False'
          DataType = ftBoolean
        end
        item
          Name = 'isPartionGoods'
          Value = 'False'
          DataType = ftBoolean
        end
        item
          Name = 'isAmount'
          Value = 'False'
          Component = cbinIsDay
          DataType = ftBoolean
        end
        item
          Name = 'isInfoMoney'
          Value = 'False'
          DataType = ftBoolean
        end>
      ReportName = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1086#1089#1090#1072#1090#1086#1082')'
      ReportNameParam.Value = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1086#1089#1090#1072#1090#1086#1082')'
      ReportNameParam.DataType = ftString
    end
  end
  object spReport: TdsdStoredProc
    StoredProcName = 'gpReport_WeighingPartner'
    DataSet = MasterCDS
    DataSets = <
      item
        DataSet = MasterCDS
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
        Name = 'inPersonalId'
        Value = Null
        Component = PersonalGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inPositionId'
        Value = ''
        Component = PositionGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inIsDay'
        Value = Null
        Component = cbinIsDay
        DataType = ftBoolean
        ParamType = ptInput
      end>
    PackSize = 1
    Left = 256
    Top = 176
  end
  object DBViewAddOn: TdsdDBViewAddOn
    ErasedFieldName = 'isErased'
    View = cxGridDBTableView
    OnDblClickActionList = <>
    ActionItemList = <>
    SortImages = dmMain.SortImageList
    OnlyEditingCellOnEnter = False
    ColorRuleList = <>
    ColumnAddOnList = <
      item
        Action = SaleJournal
        onExitColumn.Active = False
        onExitColumn.AfterEmptyValue = False
      end>
    ColumnEnterList = <>
    SummaryItemList = <>
    Left = 456
    Top = 392
  end
  object dsdUserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn
    Left = 344
    Top = 288
  end
  object PositionGuides: TdsdGuides
    KeyField = 'Id'
    FormNameParam.Value = 'TPositionForm'
    FormNameParam.DataType = ftString
    FormName = 'TPositionForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = PositionGuides
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = PositionGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 368
    Top = 16
  end
  object PeriodChoice: TPeriodChoice
    Left = 176
    Top = 176
  end
  object PersonalGuides: TdsdGuides
    KeyField = 'Id'
    FormNameParam.Value = 'TPersonal_ObjectForm'
    FormNameParam.DataType = ftString
    FormName = 'TPersonal_ObjectForm'
    PositionDataSet = 'ClientDataSet'
    ParentDataSet = 'TreeDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = PersonalGuides
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = PersonalGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 304
  end
  object RefreshDispatcher: TRefreshDispatcher
    IdParam.Value = Null
    RefreshAction = actRefresh
    ShowDialogAction = ExecuteDialog
    ComponentList = <
      item
        Component = PeriodChoice
      end
      item
      end
      item
        Component = PersonalGuides
      end
      item
        Component = PositionGuides
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    Left = 144
    Top = 344
  end
  object FormParams: TdsdFormParams
    Params = <
      item
        Name = 'IncomeDesc'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'ReturnOutDesc'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'SaleDesc'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'ReturnInDesc'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'MoneyDesc'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'ServiceDesc'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'SendDebtDesc'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'OtherDesc'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'SaleRealDesc'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'ReturnInRealDesc'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'TransferDebtDesc'
        Value = Null
        DataType = ftString
      end>
    Left = 424
    Top = 224
  end
  object spGetDescSets: TdsdStoredProc
    StoredProcName = 'gpGetDescSets'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'IncomeDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'IncomeDesc'
        DataType = ftString
      end
      item
        Name = 'ReturnOutDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ReturnOutDesc'
        DataType = ftString
      end
      item
        Name = 'SaleDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'SaleDesc'
        DataType = ftString
      end
      item
        Name = 'ReturnInDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ReturnInDesc'
        DataType = ftString
      end
      item
        Name = 'MoneyDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'MoneyDesc'
        DataType = ftString
      end
      item
        Name = 'ServiceDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ServiceDesc'
        DataType = ftString
      end
      item
        Name = 'SendDebtDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'SendDebtDesc'
        DataType = ftString
      end
      item
        Name = 'OtherDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'OtherDesc'
        DataType = ftString
      end
      item
        Name = 'SaleRealDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'SaleRealDesc'
        DataType = ftString
      end
      item
        Name = 'ReturnInRealDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ReturnInRealDesc'
        DataType = ftString
      end
      item
        Name = 'TransferDebtDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'TransferDebtDesc'
        DataType = ftString
      end
      item
        Name = 'PriceCorrectiveDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'PriceCorrectiveDesc'
        DataType = ftString
      end
      item
        Name = 'ServiceRealDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ServiceRealDesc'
        DataType = ftString
      end
      item
        Name = 'ChangeCurrencyDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ChangeCurrencyDesc'
        DataType = ftString
      end>
    PackSize = 1
    Left = 528
    Top = 272
  end
end
