{
 * This file was generated from the DelphiDabbler Code Snippets collection.
 *
 * See https://github.com/delphidabsbler/code-snippets/tree/master/LICENSE.md for
 * full license & copyright information.
}

unit UDriveCatSnippets;

interface

uses
  Windows, SysUtils, ShellAPI, Classes;

type
  {$IFDEF UNICODE}
  TCharSet = SysUtils.TSysCharSet;
  {$ELSE}
  TCharSet = set of Char;
  {$ENDIF}

function CurentDrive: Char;

function DeleteVolumeName(ADrive: string): Boolean;

function DiskSpaceInfo(const Drive: string; out AvailBytes, TotalBytes,
  FreeBytes: Int64): Boolean;

function DriveDisplayName(const Drive: string): string;

procedure DriveDisplayNames(const List: Classes.TStrings);

function DriveRootPath(const DriveNum: Byte): string;

function DriveTypeFromPath(const Path: string): Integer;

function FileSystemName(const Drive: string): string;

function GetDriveNumber(const Drive: string): Integer;

function HardDiskSerial(const Drive: string): Windows.DWORD;

function IsDriveReady(const Drive: string): Boolean;

function IsValidDrive(const Drive: string): Boolean;

function IsValidDriveNum(const DriveNum: Byte): Boolean;

procedure ListDrives(const List: Classes.TStrings);

function SetVolumeName(const ADrive, AName: string): Boolean;

function VolumeName(const Drive: string): string;

implementation

function IsCharInSet(const Ch: Char; const Chars: TCharSet): Boolean;
  forward;
procedure MultiSzToStrings(const MultiSz: PChar;
  const Strings: Classes.TStrings);
  forward;

function CurentDrive: Char;
var
  Dir: string; // current drive as string
begin
  GetDir(0, Dir);
  Result := Dir[1];
end;

function DeleteVolumeName(ADrive: string): Boolean;
begin
  Result := Windows.SetVolumeLabel(PChar(ADrive), '');
end;

function DiskSpaceInfo(const Drive: string; out AvailBytes, TotalBytes,
  FreeBytes: Int64): Boolean;
begin
  // We use GetDiskFreeSpaceEx from SysUtils since it deals with OSs that do not
  // support the Windows GetDiskFreeSpaceEx API call
  Result := SysUtils.GetDiskFreeSpaceEx(
    PChar(Drive), AvailBytes, TotalBytes, @FreeBytes
  );
  if not Result then
  begin
    AvailBytes := 0;
    TotalBytes := 0;
    FreeBytes := 0;
  end;
end;

{$WARNINGS OFF}
function DriveDisplayName(const Drive: string): string;
var
  FI: ShellAPI.TSHFileInfo; // info about drive
begin
  if ShellAPI.SHGetFileInfo(
    PChar(Drive),
    0,
    FI,
    SizeOf(FI),
    ShellAPI.SHGFI_DISPLAYNAME
  ) = 0 then
    SysUtils.RaiseLastWin32Error;
  Result := FI.szDisplayName;
end;
{$WARNINGS ON}

procedure DriveDisplayNames(const List: Classes.TStrings);
var
  Drives: Classes.TStringList;  // list of drives
  Idx: Integer;                 // loops thru drives
begin
  // Get list of drives
  Drives := Classes.TStringList.Create;
  try
    ListDrives(Drives);
    // Loop thru drive list getting drive info
    for Idx := 0 to Pred(Drives.Count) do
      List.Add(DriveDisplayName(Drives[Idx]));
  finally
    Drives.Free;
  end;
end;

function DriveRootPath(const DriveNum: Byte): string;
begin
  if DriveNum in [0..25] then
    Result := Char(DriveNum + Ord('A')) + ':\'
  else
    Result := '';
end;

function DriveTypeFromPath(const Path: string): Integer;
var
  Drive: string;  // the drive name
begin
  Drive := SysUtils.ExtractFileDrive(Path) + '\';
  Result := Integer(Windows.GetDriveType(PChar(Drive)));
end;

function FileSystemName(const Drive: string): string;
var
  Unused: Cardinal;                             // unused parameters
  PrevErrorMode: Windows.UINT;                  // stores Windows error mode
  FileSys: array[0..Windows.MAX_PATH] of Char;  // receives name of file system
begin
  // Inhibit system dialog appearing on error
  PrevErrorMode := Windows.SetErrorMode(
    Windows.SEM_FAILCRITICALERRORS
  );
  try
    // Get volume information
    Result := '';
    if Windows.GetVolumeInformation(
      PChar(Drive), nil, 0, @Unused, Unused, Unused, FileSys, Windows.MAX_PATH
    ) then
    Result := FileSys;
  finally
    // Restore old error mode
    Windows.SetErrorMode(PrevErrorMode);
  end;
end;

function GetDriveNumber(const Drive: string): Integer;
var
  DriveLetter: Char;  // drive letter
begin
  Result := -1;
  if Drive <> '' then
  begin
    DriveLetter := UpCase(Drive[1]);
    if IsCharInSet(DriveLetter, ['A'..'Z']) then
      Result := Ord(DriveLetter) - Ord('A');
  end;
end;

function HardDiskSerial(const Drive: string): Windows.DWORD;
var
  Unused: Windows.DWORD;        // unused parameters
  PrevErrorMode: Windows.UINT;  // stores Windows error mode
begin
  // Inhibit system dialog appearing on error
  PrevErrorMode := Windows.SetErrorMode(
    Windows.SEM_FAILCRITICALERRORS
  );
  try
    Result := 0;
    Windows.GetVolumeInformation(
      PChar(Drive), nil, 0, @Result, Unused, Unused, nil, 0
    );
  finally
    // Restore old error mode
    Windows.SetErrorMode(PrevErrorMode);
  end;
end;

function IsCharInSet(const Ch: Char; const Chars: TCharSet): Boolean;
begin
  {$IFDEF UNICODE}
  Result := SysUtils.CharInSet(Ch, Chars);
  {$ELSE}
  Result := Ch in Chars;
  {$ENDIF}
end;

function IsDriveReady(const Drive: string): Boolean;
var
  ErrorMode: Word;    // current error mode
  DriveNum: Integer;  // zero based number of drive
begin
  Result := False;
  // Get zero based drive number
  DriveNum := GetDriveNumber(Drive);
  if DriveNum = -1 then
    Exit;
  ErrorMode := Windows.SetErrorMode(Windows.SEM_FAILCRITICALERRORS);
  try
    // DiskSize requires 1 based drive numbers
    // returns -1 for invalid drives
    if SysUtils.DiskSize(DriveNum + 1) <> -1 then
      Result := True;
  finally
    Windows.SetErrorMode(ErrorMode);
  end;
end;

function IsValidDrive(const Drive: string): Boolean;
begin
  Result := DriveTypeFromPath(Drive) <> 1;
end;

function IsValidDriveNum(const DriveNum: Byte): Boolean;
begin
  if DriveNum in [0..25] then
    Result := Windows.GetLogicalDrives and (1 shl DriveNum) <> 0
  else
    Result := False;
end;

procedure ListDrives(const List: Classes.TStrings);
var
  Drives: PChar;    // buffer for list of drives
  BufSize: Integer; // size of drive buffer
begin
  // Get buffer size and allocate it
  BufSize := Windows.GetLogicalDriveStrings(0, nil);
  GetMem(Drives, BufSize * SizeOf(Char));
  try
    // Get #0 delimited drives list and convert to string list
    if Windows.GetLogicalDriveStrings(BufSize, Drives) = 0 then
      SysUtils.RaiseLastOSError;
    MultiSzToStrings(Drives, List);
  finally
    FreeMem(Drives);
  end;
end;

procedure MultiSzToStrings(const MultiSz: PChar;
  const Strings: Classes.TStrings);
var
  P: PChar;   // pointer to strings in buffer
begin
  // Do nothing in MultiSz is nil
  if not Assigned(MultiSz) then
    Exit;
  // Scan thru #0 delimited strings until #0#0 found
  P := MultiSz;
  while P^ <> #0 do
  begin
    // add string to list
    Strings.Add(P);
    // move pointer to start of next string if any
    Inc(P, SysUtils.StrLen(P) + 1);
  end;
end;

function SetVolumeName(const ADrive, AName: string): Boolean;
begin
  Result := Windows.SetVolumeLabel(PChar(ADrive), PChar(AName));
end;

function VolumeName(const Drive: string): string;
var
  Unused: Cardinal;                             // unused parameters
  PrevErrorMode: Windows.UINT;                  // stores Windows error mode
  VolName: array[0..Windows.MAX_PATH] of Char;  // receives volume name
begin
  // Inhibit system dialog appearing on error
  PrevErrorMode := Windows.SetErrorMode(
    Windows.SEM_FAILCRITICALERRORS
  );
  try
    // Get volume information
    Result := '';
    if Windows.GetVolumeInformation(
      PChar(Drive), VolName, Windows.MAX_PATH, @Unused, Unused, Unused, nil, 0
    ) then
    Result := VolName;
  finally
    // Restore old error mode
    Windows.SetErrorMode(PrevErrorMode);
  end;
end;

end.
