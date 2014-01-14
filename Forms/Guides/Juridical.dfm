object JuridicalForm: TJuridicalForm
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' <'#1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072'>'
  ClientHeight = 405
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  AddOnFormData.isAlwaysRefresh = False
  AddOnFormData.RefreshAction = actRefresh
  AddOnFormData.ChoiceAction = dsdChoiceGuides
  PixelsPerInch = 96
  TextHeight = 13
  object cxSplitter: TcxSplitter
    Left = 0
    Top = 26
    Width = 8
    Height = 379
  end
  object cxGrid: TcxGrid
    Left = 8
    Top = 26
    Width = 704
    Height = 379
    Align = alClient
    TabOrder = 1
    object cxGridDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = GridDS
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.HeaderHeight = 40
      OptionsView.Indicator = True
      Styles.StyleSheet = dmMain.cxGridTableViewStyleSheet
      object ceCode: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'Code'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object ceName: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'Name'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 99
      end
      object clOKPO: TcxGridDBColumn
        Caption = #1054#1050#1055#1054
        DataBinding.FieldName = 'OKPO'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 50
      end
      object clGLNCode: TcxGridDBColumn
        Caption = #1050#1086#1076' GLN'
        DataBinding.FieldName = 'GLNCode'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Width = 50
      end
      object clJuridicalGroupName: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'JuridicalGroupName'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 89
      end
      object clInfoMoneyGroupCode: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1059#1055' '#1075#1088#1091#1087#1087#1099
        DataBinding.FieldName = 'InfoMoneyGroupCode'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 50
      end
      object clInfoMoneyCode: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1059#1055
        DataBinding.FieldName = 'InfoMoneyCode'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 40
      end
      object clInfoMoneyGroupName: TcxGridDBColumn
        Caption = #1059#1055' '#1075#1088#1091#1087#1087#1072' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'InfoMoneyGroupName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 79
      end
      object clInfoMoneyDestinationCode: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1059#1055' '#1085#1072#1079#1085#1072#1095'.'
        DataBinding.FieldName = 'InfoMoneyDestinationCode'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 50
      end
      object clInfoMoneyDestinationName: TcxGridDBColumn
        Caption = #1059#1055' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077
        DataBinding.FieldName = 'InfoMoneyDestinationName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object clInfoMoneyName: TcxGridDBColumn
        Caption = #1059#1055' '#1089#1090#1072#1090#1100#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'InfoMoneyName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 69
      end
      object clIsCorporate: TcxGridDBColumn
        Caption = #1043#1083#1072#1074#1085#1086#1077' '#1102#1088'.'#1083'.'
        DataBinding.FieldName = 'isCorporate'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Width = 40
      end
      object clPriceListName: TcxGridDBColumn
        Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
        DataBinding.FieldName = 'PriceListName'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Action = PriceListChoiceForm
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = False
        HeaderAlignmentVert = vaCenter
        Width = 150
      end
      object clPriceListPromoName: TcxGridDBColumn
        Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090' ('#1072#1082#1094#1080#1086#1085#1085#1099#1081')'
        DataBinding.FieldName = 'PriceListPromoName'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Action = PriceListPromoChoiceForm
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = False
        Width = 150
      end
      object clStartPromo: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1072#1082#1094#1080#1080
        DataBinding.FieldName = 'StartPromo'
        HeaderAlignmentVert = vaCenter
        Width = 135
      end
      object clEndPromo: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1072#1082#1094#1080#1080
        DataBinding.FieldName = 'EndPromo'
        HeaderAlignmentVert = vaCenter
        Width = 135
      end
      object ceIsErased: TcxGridDBColumn
        Caption = #1059#1076#1072#1083#1077#1085
        DataBinding.FieldName = 'isErased'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 40
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
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
    StorageType = stStream
    Left = 208
    Top = 88
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
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    UseSystemFont = True
    Left = 152
    Top = 88
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBarManagerBar1: TdxBar
      Caption = 'Custom'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 671
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbInsert'
        end
        item
          Visible = True
          ItemName = 'bbEdit'
        end
        item
          Visible = True
          ItemName = 'bbErased'
        end
        item
          Visible = True
          ItemName = 'bbUnErased'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          Visible = True
          ItemName = 'bbGridToExcel'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbChoiceGuides'
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
    object bbInsert: TdxBarButton
      Action = actInsert
      Category = 0
    end
    object bbEdit: TdxBarButton
      Action = actUpdate
      Category = 0
    end
    object bbErased: TdxBarButton
      Action = dsdSetErased
      Category = 0
    end
    object bbUnErased: TdxBarButton
      Action = dsdSetUnErased
      Category = 0
    end
    object bbChoiceGuides: TdxBarButton
      Action = dsdChoiceGuides
      Category = 0
    end
    object bbGridToExcel: TdxBarButton
      Action = dsdGridToExcel
      Category = 0
    end
    object dxBarStatic: TdxBarStatic
      Caption = '     '
      Category = 0
      Hint = '     '
      Visible = ivAlways
    end
  end
  object ActionList: TActionList
    Images = dmMain.ImageList
    Left = 208
    Top = 136
    object actRefresh: TdsdDataSetRefresh
      Category = 'DSDLib'
      StoredProcList = <
        item
        end
        item
          StoredProc = GridStoredProc
        end>
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 4
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object actInsert: TdsdInsertUpdateAction
      Category = 'DSDLib'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 45
      ImageIndex = 0
      FormName = 'TJuridicalEditForm'
      GuiParams = <
        item
          Name = 'Id'
          Value = Null
        end>
      isShowModal = True
      DataSource = GridDS
      DataSetRefresh = actRefresh
    end
    object actUpdate: TdsdInsertUpdateAction
      Category = 'DSDLib'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 115
      ImageIndex = 1
      FormName = 'TJuridicalEditForm'
      GuiParams = <
        item
          Name = 'Id'
          Component = ClientDataSet
          ComponentItem = 'Id'
          ParamType = ptInput
        end>
      isShowModal = True
      ActionType = acUpdate
      DataSource = GridDS
      DataSetRefresh = actRefresh
    end
    object dsdSetErased: TdsdUpdateErased
      Category = 'DSDLib'
      StoredProc = spErasedUnErased
      StoredProcList = <
        item
          StoredProc = spErasedUnErased
        end>
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 2
      ShortCut = 46
      ErasedFieldName = 'isErased'
      DataSource = GridDS
    end
    object dsdSetUnErased: TdsdUpdateErased
      Category = 'DSDLib'
      StoredProc = spErasedUnErased
      StoredProcList = <
        item
          StoredProc = spErasedUnErased
        end>
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 8
      ShortCut = 32776
      ErasedFieldName = 'isErased'
      isSetErased = False
      DataSource = GridDS
    end
    object PriceListPromoChoiceForm: TOpenChoiceForm
      Category = 'DSDLib'
      Caption = 'PriceListPromoChoiceForm'
      FormName = 'TPriceListForm'
      GuiParams = <
        item
          Name = 'Key'
          Component = ClientDataSet
          ComponentItem = 'PriceListPromoId'
        end
        item
          Name = 'TextValue'
          Component = ClientDataSet
          ComponentItem = 'PriceListPromoName'
          DataType = ftString
        end>
      isShowModal = True
    end
    object PriceListChoiceForm: TOpenChoiceForm
      Category = 'DSDLib'
      Caption = 'PriceListChoiceForm'
      FormName = 'TPriceListForm'
      GuiParams = <
        item
          Name = 'Key'
          Component = ClientDataSet
          ComponentItem = 'PriceListId'
        end
        item
          Name = 'TextValue'
          Component = ClientDataSet
          ComponentItem = 'PriceListName'
          DataType = ftString
        end>
      isShowModal = True
    end
    object dsdChoiceGuides: TdsdChoiceGuides
      Category = 'DSDLib'
      Params = <
        item
          Name = 'Key'
          Component = ClientDataSet
          ComponentItem = 'Id'
          DataType = ftString
        end
        item
          Name = 'TextValue'
          Component = ClientDataSet
          ComponentItem = 'Name'
          DataType = ftString
        end
        item
          Name = 'InfoMoneyId'
          Component = ClientDataSet
          ComponentItem = 'InfoMoneyId'
        end
        item
          Name = 'InfoMoneyName'
          Component = ClientDataSet
          ComponentItem = 'InfoMoneyName'
          DataType = ftString
        end>
      Caption = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      ImageIndex = 7
    end
    object actUpdateDataSet: TdsdUpdateDataSet
      Category = 'DSDLib'
      StoredProc = spInsertUpdate
      StoredProcList = <
        item
          StoredProc = spInsertUpdate
        end>
      Caption = 'actUpdateDataSet'
      DataSource = GridDS
    end
    object dsdGridToExcel: TdsdGridToExcel
      Category = 'DSDLib'
      Grid = cxGrid
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      Hint = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      ImageIndex = 6
      ShortCut = 16472
    end
  end
  object dsdUserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn
    Left = 272
    Top = 184
  end
  object GridDS: TDataSource
    DataSet = ClientDataSet
    Left = 272
    Top = 88
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    PacketRecords = 0
    Params = <>
    Left = 272
    Top = 136
  end
  object GridStoredProc: TdsdStoredProc
    StoredProcName = 'gpSelect_Object_Juridical'
    DataSet = ClientDataSet
    DataSets = <
      item
        DataSet = ClientDataSet
      end>
    Params = <>
    Left = 152
    Top = 136
  end
  object spErasedUnErased: TdsdStoredProc
    StoredProcName = 'gpUpdateObjectIsErased'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'inObjectId'
        Component = ClientDataSet
        ComponentItem = 'Id'
        ParamType = ptInput
      end>
    Left = 152
    Top = 184
  end
  object dsdDBViewAddOn: TdsdDBViewAddOn
    ErasedFieldName = 'isErased'
    View = cxGridDBTableView
    OnDblClickActionList = <
      item
        Action = dsdChoiceGuides
      end
      item
        Action = actUpdate
      end>
    ActionItemList = <
      item
        Action = dsdChoiceGuides
        ShortCut = 13
      end
      item
        Action = actUpdate
        ShortCut = 13
      end>
    SortImages = dmMain.SortImageList
    OnlyEditingCellOnEnter = False
    Left = 208
    Top = 184
  end
  object spInsertUpdate: TdsdStoredProc
    StoredProcName = 'gpInsertUpdate_Object_Juridical'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'ioId'
        Component = ClientDataSet
        ComponentItem = 'Id'
        ParamType = ptInputOutput
      end
      item
        Name = 'inCode'
        Component = ClientDataSet
        ComponentItem = 'Code'
        ParamType = ptInput
      end
      item
        Name = 'inName'
        Component = ClientDataSet
        ComponentItem = 'Name'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'inGLNCode'
        Component = ClientDataSet
        ComponentItem = 'GLNCode'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'inisCorporate'
        Component = ClientDataSet
        ComponentItem = 'isCorporate'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'inJuridicalGroupId'
        Component = ClientDataSet
        ComponentItem = 'JuridicalGroupId'
        ParamType = ptInput
      end
      item
        Name = 'inGoodsPropertyId'
        Component = ClientDataSet
        ComponentItem = 'GoodsPropertyId'
        ParamType = ptInput
      end
      item
        Name = 'inInfoMoneyId'
        Component = ClientDataSet
        ComponentItem = 'InfoMoneyId'
        ParamType = ptInput
      end
      item
        Name = 'inPriceListId'
        Component = ClientDataSet
        ComponentItem = 'PriceListId'
        ParamType = ptInput
      end
      item
        Name = 'inPriceListPromoId'
        Component = ClientDataSet
        ComponentItem = 'PriceListPromoId'
        ParamType = ptInput
      end
      item
        Name = 'inStartPromo'
        Component = ClientDataSet
        ComponentItem = 'StartPromo'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'inEndPromo'
        Component = ClientDataSet
        ComponentItem = 'EndPromo'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    Left = 120
    Top = 280
  end
end
