inherited DefaultsKeyForm: TDefaultsKeyForm
  Caption = #1050#1083#1102#1095#1080' '#1076#1077#1092#1086#1083#1090#1086#1074
  ExplicitWidth = 583
  ExplicitHeight = 335
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TcxPageControl
    inherited tsMain: TcxTabSheet
      ExplicitWidth = 575
      ExplicitHeight = 282
      inherited cxGrid: TcxGrid
        inherited cxGridDBTableView: TcxGridDBTableView
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Header = nil
          object colKey: TcxGridDBColumn
            Caption = #1050#1083#1102#1095
          end
          object colFormClassName: TcxGridDBColumn
            Caption = #1050#1083#1072#1089#1089' '#1092#1086#1088#1084#1099
            DataBinding.FieldName = 'FormClassName'
          end
          object colDescName: TcxGridDBColumn
            Caption = #1044#1045#1057#1050
            DataBinding.FieldName = 'DescName'
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object InsertUpdateKey: TdsdUpdateDataSet
      Category = 'DSDLib'
      StoredProc = spInsertUpdateKey
      StoredProcList = <
        item
          StoredProc = spInsertUpdateKey
        end>
      DataSource = MasterDS
    end
    object OpenFormsForm: TOpenChoiceForm
      Category = 'DSDLib'
      Caption = 'OpenFormsForm'
      FormName = 'TFormsForm'
      GuiParams = <
        item
          Name = 'TextValue'
          Component = MasterCDS
          ComponentItem = 'FormClassName'
          DataType = ftString
          ParamType = ptInput
        end>
      isShowModal = False
    end
    object OpenUnionDescForm: TOpenChoiceForm
      Category = 'DSDLib'
      Caption = 'OpenUnionDescForm'
      FormName = 'TUnionDescForm'
      GuiParams = <
        item
          Name = 'Key'
          Component = MasterCDS
          ComponentItem = 'DescName'
          DataType = ftString
          ParamType = ptInput
        end>
      isShowModal = False
    end
  end
  inherited spSelect: TdsdStoredProc
    StoredProcName = 'gpSelect_DefaultKey'
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      26
      0)
  end
  object DefaultKey: TDefaultKey
    Params = <
      item
        Name = 'FormClassName'
        Component = MasterCDS
        ComponentItem = 'FormClassName'
        DataType = ftString
      end
      item
        Name = 'DescName'
        Component = MasterCDS
        ComponentItem = 'DescName'
        DataType = ftString
        ParamType = ptInput
      end>
    Left = 208
    Top = 72
  end
  object spInsertUpdateKey: TdsdStoredProc
    StoredProcName = 'gpInsertUpdate_DefaultKey'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'inkey'
        Value = ''
        Component = DefaultKey
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'inkeydata'
        Value = ''
        Component = DefaultKey
        ComponentItem = 'JSONKey'
        DataType = ftBlob
        ParamType = ptInput
      end>
    Left = 360
    Top = 160
  end
end
