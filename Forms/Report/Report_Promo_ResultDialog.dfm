inherited Report_Promo_ResultDialogForm: TReport_Promo_ResultDialogForm
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
  ClientHeight = 187
  ClientWidth = 418
  ExplicitWidth = 424
  ExplicitHeight = 212
  PixelsPerInch = 96
  TextHeight = 13
  inherited bbOk: TcxButton
    Left = 114
    Top = 149
    ExplicitLeft = 114
    ExplicitTop = 149
  end
  inherited bbCancel: TcxButton
    Left = 258
    Top = 149
    ExplicitLeft = 258
    ExplicitTop = 149
  end
  object cxLabel1: TcxLabel [2]
    Left = 26
    Top = 9
    Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072':'
  end
  object deStart: TcxDateEdit [3]
    Left = 117
    Top = 8
    EditValue = 42736d
    Properties.ShowTime = False
    TabOrder = 3
    Width = 83
  end
  object cxLabel2: TcxLabel [4]
    Left = 208
    Top = 9
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072':'
  end
  object deEnd: TcxDateEdit [5]
    Left = 319
    Top = 8
    EditValue = 42736d
    Properties.ShowTime = False
    TabOrder = 5
    Width = 82
  end
  object cxLabel17: TcxLabel [6]
    Left = 23
    Top = 71
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
  end
  object edUnit: TcxButtonEdit [7]
    Left = 111
    Top = 70
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 290
  end
  object cxLabel3: TcxLabel [8]
    Left = 26
    Top = 112
    Caption = #1058#1086#1088#1075'. '#1089#1077#1090#1100':'
  end
  object ceRetail: TcxButtonEdit [9]
    Left = 111
    Top = 111
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    TabOrder = 9
    Width = 290
  end
  object cbPromo: TcxCheckBox [10]
    Left = 26
    Top = 35
    Caption = #1087#1086#1082#1072#1079#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1040#1082#1094#1080#1080
    TabOrder = 10
    Width = 144
  end
  object cbTender: TcxCheckBox [11]
    Left = 208
    Top = 35
    Caption = #1087#1086#1082#1072#1079#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1058#1077#1085#1076#1077#1088#1099
    TabOrder = 11
    Width = 161
  end
  inherited UserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn
    Left = 128
    Top = 153
  end
  inherited cxPropertiesStore: TcxPropertiesStore
    Left = 101
    Top = 153
  end
  inherited ActionList: TActionList
    Left = 156
    Top = 152
  end
  inherited FormParams: TdsdFormParams
    Params = <
      item
        Name = 'StartDate'
        Value = 'NULL'
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'EndDate'
        Value = 'NULL'
        Component = deEnd
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'UnitId'
        Value = Null
        Component = UnitGuides
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'UnitName'
        Value = Null
        Component = UnitGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'RetailId'
        Value = Null
        Component = GuidesRetail
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'RetailName'
        Value = Null
        Component = GuidesRetail
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'isPromo'
        Value = Null
        Component = cbPromo
        DataType = ftBoolean
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'isTender'
        Value = Null
        Component = cbTender
        DataType = ftBoolean
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 37
    Top = 145
  end
  object UnitGuides: TdsdGuides
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
        Component = UnitGuides
        ComponentItem = 'Key'
        DataType = ftString
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
    Left = 369
    Top = 57
  end
  object PeriodChoice: TPeriodChoice
    DateStart = deStart
    DateEnd = deEnd
    Left = 232
    Top = 65
  end
  object GuidesRetail: TdsdGuides
    KeyField = 'Id'
    LookupControl = ceRetail
    FormNameParam.Value = 'TRetailForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
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
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesRetail
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 196
    Top = 97
  end
end
