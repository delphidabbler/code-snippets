unit FmWinSysCatDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TWinSysCatDemoForm = class(TForm)
    lvSysInfo: TListView;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    cbGRSHKEYs: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edGRSSubKey: TEdit;
    Label4: TLabel;
    stGRSValue: TStaticText;
    edGRSValueName: TEdit;
    Label5: TLabel;
    btnGRS: TButton;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    stGCVRSValue: TStaticText;
    edGCVRSValueName: TEdit;
    btnGCVRS: TButton;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnGRSClick(Sender: TObject);
    procedure btnGCVRSClick(Sender: TObject);
  end;

var
  WinSysCatDemoForm: TWinSysCatDemoForm;

implementation

uses
  UWinSysCatSnippets;

{$R *.dfm}

{
* CommonFilesFolder
  Returns the Windows common file directory.
* ComputerName
  Returns the name of the computer.
* GetCurrentVersionRegStr #
  Gets a string value from a subkey of the Windows current version registry key.
* GetRegistryString
  Gets a value from the registry from a specified root and sub key.
* IsMediaCenterOS
  Returns true if the operating system includes Windows Media Center.
* IsRemoteSession
  Checks if the program is running under Windows Terminal Server as a remote
  client session.
* IsTabletOS
  Returns true if the operating system is a Windows Tablet edition.
* IsVista
  Returns true if the operating system is Windows Vista or later.
* IsWin9x
  Returns true if the operating system is on the Windows 9x platform.
* IsWindows7
  Returns true if the operating system is Windows 7.
* IsWinNT
  Returns true if the operating system is on the Windows NT platform.
* IsWow64
  Returns true if the process is running as a 32 bit process under WOW64 on 64
  bit Windows.
* ProgramFilesFolder
  Returns the Windows program files directory.
* SystemFolder
  Returns the Windows system directory.
* TempFolder
  Returns the Windows temporary directory.
* UserName
  Returns the name of the currently logged on user.
* WindowsFolder
  Returns the Windows directory.
* WindowsProductID
  Returns the Windows product ID.
}

procedure TWinSysCatDemoForm.btnGCVRSClick(Sender: TObject);
begin
  stGCVRSValue.Caption := GetCurrentVersionRegStr(edGCVRSValueName.Text);
end;

procedure TWinSysCatDemoForm.btnGRSClick(Sender: TObject);
begin
  stGRSValue.Caption := GetRegistryString(
    HKEY(cbGRSHKEYs.Items.Objects[cbGRSHKEYs.ItemIndex]),
    edGRSSubKey.Text,
    edGRSValueName.Text
  );
end;

procedure TWinSysCatDemoForm.FormCreate(Sender: TObject);

  procedure AddItem(const Item, Info: string); overload;
  var
    LI: TListItem;
  begin
    LI := lvSysInfo.Items.Add;
    LI.Caption := Item;
    LI.SubItems.Add(Info);
  end;

  procedure AddItem(const Item: string; const Flag: Boolean); overload;
  begin
    AddItem(Item, BoolToStr(Flag, True));
  end;

  procedure InitHKEYsCombo;
  begin
    cbGRSHKEYs.Items.AddObject(
      'HKEY_CLASSES_ROOT', TObject(HKEY_CLASSES_ROOT)
    );
    cbGRSHKEYs.Items.AddObject(
      'HKEY_CURRENT_USER', TObject(HKEY_CURRENT_USER)
    );
    cbGRSHKEYs.Items.AddObject(
      'HKEY_LOCAL_MACHINE', TObject(HKEY_LOCAL_MACHINE)
    );
    cbGRSHKEYs.Items.AddObject(
      'HKEY_USERS', TObject(HKEY_USERS)
    );
    cbGRSHKEYs.Items.AddObject(
      'HKEY_PERFORMANCE_DATA', TObject(HKEY_PERFORMANCE_DATA)
    );
    cbGRSHKEYs.Items.AddObject(
      'HKEY_CURRENT_CONFIG', TObject(HKEY_CURRENT_CONFIG)
    );
    cbGRSHKEYs.Items.AddObject(
      'HKEY_DYN_DATA', TObject(HKEY_DYN_DATA)
    );
    cbGRSHKEYs.ItemIndex := 1;
  end;

begin
  InitHKEYsCombo;
  lvSysInfo.Items.BeginUpdate;
  try
    AddItem('Computer Name', ComputerName);
    AddItem('User Name', UserName);
    AddItem('Windows Product ID', WindowsProductID);
    AddItem('Program Files Folder', ProgramFilesFolder);
    AddItem('Common Files Folder', CommonFilesFolder);
    AddItem('Windows Folder', WindowsFolder);
    AddItem('System Folder', SystemFolder);
    AddItem('Temp Folder', TempFolder);
    AddItem('Media Centre OS?', IsMediaCenterOS);
    AddItem('Remote Session?', IsRemoteSession);
    AddItem('Tablet OS?', IsTabletOS);
    AddItem('Windows Vista?', IsVista);
    AddItem('Windows 9x platform?', IsWin9x);
    AddItem('Windows 7?', IsWindows7);
    AddItem('Windows NT platform?', IsWinNT);
    AddItem('Using WOW 64?', IsWow64);

  finally
    lvSysInfo.Items.EndUpdate;
  end;
end;

end.
