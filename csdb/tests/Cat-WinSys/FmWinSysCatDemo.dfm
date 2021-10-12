object WinSysCatDemoForm: TWinSysCatDemoForm
  Left = 569
  Top = 384
  BorderStyle = bsDialog
  Caption = 'Windows System Category Demo'
  ClientHeight = 404
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 90
    Height = 13
    Caption = 'Sysem Information'
  end
  object lvSysInfo: TListView
    Left = 8
    Top = 27
    Width = 561
    Height = 193
    Columns = <
      item
        Caption = 'Item'
        Width = 150
      end
      item
        Caption = 'Information'
        Width = 360
      end>
    ColumnClick = False
    TabOrder = 0
    ViewStyle = vsReport
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 226
    Width = 273
    Height = 168
    Caption = 'GetRegistryString'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = True
    object Label2: TLabel
      Left = 9
      Top = 24
      Width = 25
      Height = 13
      Caption = 'HKEY'
    end
    object Label3: TLabel
      Left = 9
      Top = 51
      Width = 39
      Height = 13
      Caption = 'Sub-key'
    end
    object Label4: TLabel
      Left = 9
      Top = 134
      Width = 26
      Height = 13
      Caption = 'Value'
    end
    object Label5: TLabel
      Left = 9
      Top = 78
      Width = 55
      Height = 13
      Caption = 'Value name'
    end
    object Label6: TLabel
      Left = 168
      Top = 107
      Width = 23
      Height = 13
      Hint = 
        'Enter the required parameters for GetRegistryString in controls ' +
        'and click Execute.'#13#10'Parameters are:'#13#10'+ Root key: specifies regis' +
        'try hive (HKEY value).'#13#10'+ Sub-key: required registry key.'#13#10'+ Val' +
        'ue name: name of value within sub key.'#13#10'The required value will ' +
        'appear below the Execute button.'
      BiDiMode = bdLeftToRight
      Caption = 'Hint'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object cbGRSHKEYs: TComboBox
      Left = 80
      Top = 20
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object edGRSSubKey: TEdit
      Left = 80
      Top = 47
      Width = 185
      Height = 21
      TabOrder = 1
      Text = 'Software\Microsoft\CharMap'
    end
    object stGRSValue: TStaticText
      Left = 80
      Top = 132
      Width = 185
      Height = 17
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvNone
      BorderStyle = sbsSunken
      ShowAccelChar = False
      TabOrder = 4
    end
    object edGRSValueName: TEdit
      Left = 80
      Top = 74
      Width = 185
      Height = 21
      TabOrder = 2
      Text = 'Font'
    end
    object btnGRS: TButton
      Left = 80
      Top = 101
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 3
      OnClick = btnGRSClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 296
    Top = 226
    Width = 273
    Height = 111
    Caption = 'GetCurrentVersionRegStr'
    TabOrder = 2
    object Label8: TLabel
      Left = 9
      Top = 78
      Width = 26
      Height = 13
      Caption = 'Value'
    end
    object Label9: TLabel
      Left = 9
      Top = 22
      Width = 55
      Height = 13
      Caption = 'Value name'
    end
    object Label7: TLabel
      Left = 168
      Top = 51
      Width = 23
      Height = 13
      Hint = 
        'Enter required value name to get from the Windows current versio' +
        'n key and click Execute.'#13#10'The required value will appear below t' +
        'he Execute button.'
      Caption = 'Hint'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object stGCVRSValue: TStaticText
      Left = 80
      Top = 76
      Width = 185
      Height = 17
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvNone
      BorderStyle = sbsSunken
      ShowAccelChar = False
      TabOrder = 2
    end
    object edGCVRSValueName: TEdit
      Left = 80
      Top = 18
      Width = 185
      Height = 21
      TabOrder = 0
      Text = 'ProgramFilesDir'
    end
    object btnGCVRS: TButton
      Left = 80
      Top = 45
      Width = 75
      Height = 25
      Caption = 'Execute'
      TabOrder = 1
      OnClick = btnGCVRSClick
    end
  end
end
