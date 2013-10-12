﻿inherited RateFuelKindEditForm: TRateFuelKindEditForm
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1048#1079#1084#1077#1085#1080#1090#1100' <'#1042#1080#1076' '#1085#1086#1088#1084#1099' '#1090#1086#1087#1083#1080#1074#1072'>'
  ClientHeight = 275
  ClientWidth = 319
  ExplicitWidth = 335
  ExplicitHeight = 310
  PixelsPerInch = 96
  TextHeight = 13
  object edName: TcxTextEdit
    Left = 24
    Top = 76
    TabOrder = 0
    Width = 273
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 57
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object cxButton1: TcxButton
    Left = 40
    Top = 224
    Width = 75
    Height = 25
    Action = dsdInsertUpdateGuides
    Default = True
    TabOrder = 1
  end
  object cxButton2: TcxButton
    Left = 198
    Top = 224
    Width = 75
    Height = 25
    Action = dsdFormClose
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
  end
  object Код: TcxLabel
    Left = 16
    Top = 3
    Caption = #1050#1086#1076
  end
  object ceCode: TcxCurrencyEdit
    Left = 24
    Top = 26
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '0'
    TabOrder = 3
    Width = 273
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 103
    Caption = '% '#1076#1086#1087'.'#1088#1072#1089#1093#1086#1076#1072
  end
  object edTax: TcxTextEdit
    Left = 24
    Top = 126
    TabOrder = 7
    Width = 273
  end
  object ActionList: TActionList
    Left = 232
    Top = 64
    object dsdDataSetRefresh: TdsdDataSetRefresh
      Category = 'DSDLib'
      StoredProc = spGet
      StoredProcList = <
        item
          StoredProc = spGet
        end
        item
        end>
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ShortCut = 116
    end
    object dsdInsertUpdateGuides: TdsdInsertUpdateGuides
      Category = 'DSDLib'
      StoredProc = spInsertUpdate
      StoredProcList = <
        item
          StoredProc = spInsertUpdate
        end>
      Caption = #1054#1082
    end
    object dsdFormClose: TdsdFormClose
      Category = 'DSDLib'
    end
  end
  object spInsertUpdate: TdsdStoredProc
    StoredProcName = 'gpInsertUpdate_Object_RateFuelKind'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'ioId'
        Component = dsdFormParams
        ComponentItem = 'Id'
        ParamType = ptInputOutput
      end
      item
        Name = 'inCode'
        Component = ceCode
        ParamType = ptInput
      end
      item
        Name = 'inName'
        Component = edName
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'inTax'
        Component = edTax
        DataType = ftFloat
        ParamType = ptInput
      end>
    Left = 224
    Top = 112
  end
  object dsdFormParams: TdsdFormParams
    Params = <
      item
        Name = 'Id'
        ParamType = ptInputOutput
      end>
    Left = 240
    Top = 8
  end
  object spGet: TdsdStoredProc
    StoredProcName = 'gpGet_Object_RateFuelKind'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'Id'
        Component = dsdFormParams
        ComponentItem = 'Id'
        ParamType = ptInput
      end
      item
        Name = 'Code'
        Component = ceCode
      end
      item
        Name = 'Name'
        Component = edName
        DataType = ftString
      end
      item
        Name = 'Tax'
        Component = edTax
      end>
    Left = 48
    Top = 120
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
    Left = 136
    Top = 40
  end
  object dsdUserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn
    Left = 120
    Top = 160
  end
end
