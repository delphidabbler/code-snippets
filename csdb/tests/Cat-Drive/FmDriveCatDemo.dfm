object DriveCatDemoForm: TDriveCatDemoForm
  Left = 0
  Top = 0
  Caption = 'Drive Category Demo'
  ClientHeight = 447
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 13
    Caption = 'Drive root paths'
  end
  object Label2: TLabel
    Left = 104
    Top = 8
    Width = 95
    Height = 13
    Caption = 'Drive display names'
  end
  object Label4: TLabel
    Left = 8
    Top = 319
    Width = 130
    Height = 117
    Caption = 
      'Key to Drive Type:'#13#10'0 = DRIVE_UNKNOWN'#13#10'1 = DRIVE_NO_ROOT_DIR'#13#10'2 ' +
      '= DRIVE_REMOVABLE'#13#10'3 = DRIVE_FIXED'#13#10'4 = DRIVE_REMOTE'#13#10'5 = DRIVE_' +
      'CDROM'#13#10'6 = DRIVE_RAMDISK'#13#10
  end
  object Label3: TLabel
    Left = 307
    Top = 8
    Width = 68
    Height = 13
    Caption = 'Current drive:'
  end
  object lblCurrentDrive: TLabel
    Left = 377
    Top = 8
    Width = 3
    Height = 13
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbDriveRootPaths: TListBox
    Left = 8
    Top = 24
    Width = 78
    Height = 97
    ItemHeight = 13
    TabOrder = 0
  end
  object lbDriveDisplayNames: TListBox
    Left = 104
    Top = 24
    Width = 185
    Height = 97
    ItemHeight = 13
    TabOrder = 1
  end
  object lvDriveNumInfo: TListView
    Left = 8
    Top = 136
    Width = 619
    Height = 177
    Columns = <
      item
        Caption = 'Drive #'
      end
      item
        Caption = 'Valid?'
      end
      item
        Caption = 'Root Path'
        Width = 60
      end
      item
        Caption = 'Display Name'
        Width = 100
      end
      item
        Caption = 'Ready?'
      end
      item
        Caption = 'Drive #'
      end
      item
        Caption = 'Volume'
        Width = 60
      end
      item
        Caption = 'Type'
        Width = 40
      end
      item
        Caption = 'File System'
        Width = 60
      end
      item
        Caption = 'Available'
        Width = 80
      end
      item
        Caption = 'Total'
        Width = 80
      end
      item
        Caption = 'Free'
        Width = 80
      end
      item
        Caption = 'Serial'
        Width = 70
      end>
    TabOrder = 2
    ViewStyle = vsReport
  end
  object gbChangeVolName: TGroupBox
    Left = 200
    Top = 319
    Width = 265
    Height = 120
    Caption = 'Delete && Set Volume Name Test'
    TabOrder = 3
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 76
      Height = 13
      Caption = 'Choose a drive:'
    end
    object Label6: TLabel
      Left = 16
      Top = 54
      Width = 68
      Height = 13
      Caption = 'Volume Name:'
    end
    object lblVolName: TLabel
      Left = 98
      Top = 54
      Width = 3
      Height = 13
    end
    object cbDrives: TComboBox
      Left = 98
      Top = 19
      Width = 63
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cbDrivesChange
    end
    object btnDeleteVolName: TButton
      Left = 17
      Top = 81
      Width = 144
      Height = 25
      Caption = 'Delete Volume Name'
      Enabled = False
      TabOrder = 1
      OnClick = btnDeleteVolNameClick
    end
  end
end
