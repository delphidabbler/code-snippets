unit FmDriveCatDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TDriveCatDemoForm = class(TForm)
    lbDriveRootPaths: TListBox;
    Label1: TLabel;
    lbDriveDisplayNames: TListBox;
    Label2: TLabel;
    lvDriveNumInfo: TListView;
    Label4: TLabel;
    gbChangeVolName: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    lblVolName: TLabel;
    cbDrives: TComboBox;
    btnDeleteVolName: TButton;
    Label3: TLabel;
    lblCurrentDrive: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbDrivesChange(Sender: TObject);
    procedure btnDeleteVolNameClick(Sender: TObject);
  private
    fVolName: string;
  public
    { Public declarations }
  end;

var
  DriveCatDemoForm: TDriveCatDemoForm;

implementation

uses
  UDriveCatSnippets;

{$R *.dfm}

{
* CurrentDrive
  Returns the letter that identifies the current drive.
* DiskSpaceInfo
  Gets total and free space information for a drive.
* DriveDisplayName
  Returns the display name for the drive with the given root path.
* DriveDisplayNames
  Gets list of display names for all the system's drives.
* DriveRootPath
  Returns root drive path for drive with given number.
* DriveTypeFromPath
  Returns type of drive that contains the given (full) path.
* FileSystemName
  Returns name of a drive's file system.
* GetDriveNumber
  Gets the zero based drive number for a local drive.
* HardDiskSerial
  Returns the serial number of the specified disk.
* IsDriveReady
  Checks if a local drive is ready.
* IsValidDrive
  Checks if a drive path represents a valid drive.
* IsValidDriveNum
  Check if a drive number represents a valid drive.
* ListDrives
  Gets list of the system's drive root paths.
* VolumeName
  Returns volume name of a drive.
}

function FloatToFixed(const Value: Extended; const DecimalPlaces: Byte;
  const SeparateThousands: Boolean): string;
const
  // float format specifiers
  cFmtSpec: array[Boolean] of Char = ('f', 'n');
begin
  Result := SysUtils.Format(
    '%.*' + cFmtSpec[SeparateThousands], [DecimalPlaces, Value]
  );
end;

function SizeString(Value: Int64): string;
const
  OneKB = 1024;         // 1 KB
  OneMB = OneKB * 1024; // 1 MB
  OneGB = OneMB * 1024; // 1 GB
begin
  if Value < OneKB then
    Result := IntToStr(Value) + ' bytes'
  else if Value < OneMB then
    Result := FloatToFixed(Value / OneKB, 1, True) + ' KB'
  else if Value < OneGB then
    Result := FloatToFixed(Value / OneMB, 1, True) + ' MB'
  else
    Result := FloatToFixed(Value / OneGB, 1, True) + ' GB';
end;

procedure TDriveCatDemoForm.btnDeleteVolNameClick(Sender: TObject);
var
  Drive: string;
  VolName: string;
begin
  Drive := cbDrives.Items[cbDrives.ItemIndex];
  VolName := lblVolName.Caption;
  if MessageDlg(
    Format(
      'You are about to modify the volume name of drive %s'#10#10
      + 'Are you sure you want to do this?',
      [Drive]
    ),
    mtWarning, [mbYes, mbNo], 0, mbNo) = mrNo then
    Exit;
  if not DeleteVolumeName(Drive) then
  begin
    MessageDlg(
      'DeleteVolumeName failed.'#10#10'You may need admin privileges.',
      mtError, [mbOk], 0
    );
    Exit;
  end;
  MessageDlg(
    Format(
      'Your volume name has been deleted.'#10#10
      + 'VolumeName reports the name as "%s"'#10#10
      + 'When you press OK the name should be restored.',
      [VolumeName(Drive)]
    ),
    mtInformation, [mbOK], 0
  );
  // Do restore
  if SetVolumeName(Drive, VolName) then
    MessageDlg(
      Format(
        'Your volume name has been restored.'#10#10
        + 'VolumeName reports the name as "%s".',
        [VolumeName(Drive)]
      ),
      mtInformation, [mbOK], 0
    )
  else
    MessageDlg(
      'SetVolumeName failed.'#10#10'You may need admin privileges.',
      mtError, [mbOk], 0
    );
end;

procedure TDriveCatDemoForm.cbDrivesChange(Sender: TObject);
begin
  if cbDrives.ItemIndex = -1 then
    lblVolName.Caption := ''
  else
  begin
    fVolName := VolumeName(cbDrives.Items[cbDrives.ItemIndex]);
    lblVolName.Caption := fVolName;
  end;
  btnDeleteVolName.Enabled := lblVolName.Caption <> '';
end;

procedure TDriveCatDemoForm.FormCreate(Sender: TObject);
var
  DriveNum: Byte;
  LI: TListItem;
  RootPath: string;
  AvailBytes, TotalBytes, FreeBytes: Int64;
begin
  ListDrives(cbDrives.Items);
  ListDrives(lbDriveRootPaths.Items);
  lblCurrentDrive.Caption := CurentDrive;
  DriveDisplayNames(lbDriveDisplayNames.Items);
  for DriveNum in [0..25, $EE] do
  begin
    LI := lvDriveNumInfo.Items.Add;
    LI.Caption := IntToHex(DriveNum, 2);
    LI.SubItems.Add(BoolToStr(IsValidDriveNum(DriveNum), True));
    RootPath := DriveRootPath(DriveNum);
    LI.SubItems.Add(RootPath);
    if IsValidDrive(RootPath) then
      LI.SubItems.Add(DriveDisplayName(RootPath))
    else
      LI.SubItems.Add('N/a');
    LI.SubItems.Add(BoolToStr(IsDriveReady(RootPath), True));
    LI.SubItems.Add(IntToStr(GetDriveNumber(RootPath)));
    LI.SubItems.Add(VolumeName(RootPath));
    LI.SubItems.Add(IntToStr(DriveTypeFromPath(RootPath)));
    LI.SubItems.Add(FileSystemName(RootPath));
    if DiskSpaceInfo(RootPath, AvailBytes, TotalBytes, FreeBytes) then
    begin
      LI.SubItems.Add(SizeString(AvailBytes));
      LI.SubItems.Add(SizeString(TotalBytes));
      LI.SubItems.Add(SizeString(FreeBytes));
    end
    else
    begin
      LI.SubItems.Add('N/a');
      LI.SubItems.Add('N/a');
      LI.SubItems.Add('N/a');
    end;
    LI.SubItems.Add(IntToHex(HardDiskSerial(RootPath), 8));
  end;
end;

end.
