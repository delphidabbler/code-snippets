{
 * This file was generated from the DelphiDabbler Code Snippets Database.
 * The source code is licensed under the MIT license, copyright © 2005-2021,
 * Peter Johnson (https://gravatar.com/delphidabbler) and Contributors. The
 * full license and a list of contributors can be found in the `LICENSE` and
 * `CONTRIBUTORS` files at
 * https://github.com/delphidabbler/code-snippets/tree/master/csdb/collection
}

unit UWinSysCatSnippets;

{$IFNDEF FPC}
  {$IFDEF CONDITIONALEXPRESSIONS}
    {$IF CompilerVersion >= 14.00}
      {$WARN SYMBOL_PLATFORM OFF}
      {$WARN SYMBOL_DEPRECATED OFF}
      {$WARN SYMBOL_LIBRARY OFF}
    {$IFEND}
    {$IF CompilerVersion >= 15.00}
      {$WARN UNSAFE_TYPE OFF}
      {$WARN UNSAFE_CAST OFF}
      {$WARN UNSAFE_CODE OFF}
    {$IFEND}
    {$IF CompilerVersion >= 20.00}
      {$WARN EXPLICIT_STRING_CAST OFF}
      {$WARN IMPLICIT_STRING_CAST OFF}
    {$IFEND}
  {$ENDIF}
{$ENDIF}

interface

uses
  Windows, SysUtils, Registry;

function CommonFilesFolder: string;

function ComputerName: string;

function GetCurrentVersionRegStr(const ValName: string): string;

function GetRegistryString(const RootKey: Windows.HKEY;
  const SubKey, Name: string): string;

function IsMediaCenterOS: Boolean;

function IsRemoteSession: Boolean;

function IsTabletOS: Boolean;

function IsVista: Boolean;

function IsWin9x: Boolean;

function IsWindows7: Boolean;

function IsWinNT: Boolean;

function IsWow64: Boolean;

function ProgramFilesFolder: string;

function SystemFolder: string;

function TempFolder: string;

function UserName: string;

function WindowsFolder: string;

function WindowsProductID: string;

implementation

function CommonFilesFolder: string;
begin
  Result := GetCurrentVersionRegStr('CommonFilesDir');
end;

function ComputerName: string;
var
  AComputerName: array[0..Windows.MAX_PATH] of Char; // buffer for computer name
  Size: Windows.DWORD;                               // size of name buffer
begin
  Size := Windows.MAX_PATH;
  if Windows.GetComputerName(AComputerName, Size) then
    Result := AComputerName
  else
    Result := '';
end;

function GetCurrentVersionRegStr(const ValName: string): string;
const
  cWdwCurrentVer = '\Software\Microsoft\Windows\CurrentVersion';
begin
  Result := GetRegistryString(
    Windows.HKEY_LOCAL_MACHINE,
    cWdwCurrentVer,
    ValName
  );
end;

function GetRegistryString(const RootKey: Windows.HKEY;
  const SubKey, Name: string): string;
var
  Reg: Registry.TRegistry;          // registry access object
  ValueInfo: Registry.TRegDataInfo; // info about registry value
begin
  Result := '';
  // Open registry at required root key
  Reg := Registry.TRegistry.Create;
  try
    Reg.RootKey := RootKey;
    // Open registry key and check value exists
    if Reg.OpenKeyReadOnly(SubKey)
      and Reg.ValueExists(Name) then
    begin
      // Check if registry value is string or integer
      Reg.GetDataInfo(Name, ValueInfo);
      case ValueInfo.RegData of
        Registry.rdString, Registry.rdExpandString:
          // string value: just return it
          Result := Reg.ReadString(Name);
        Registry.rdInteger:
          // integer value: convert to string
          Result := SysUtils.IntToStr(Reg.ReadInteger(Name));
        else
          // unsupported value: raise exception
          raise SysUtils.Exception.Create(
            'Unsupported registry type'
          );
      end;
    end;
  finally
    // Close registry
    Reg.Free;
  end;
end;

function IsMediaCenterOS: Boolean;
const
  SM_MEDIACENTER = 87; // metrics flag not defined in Windows unit
begin
  Result := Windows.GetSystemMetrics(SM_MEDIACENTER) <> 0;
end;

function IsRemoteSession: Boolean;
const
  SM_REMOTESESSION = $1000; // value to pass to GetSystemMetrics
begin
  Result := Windows.GetSystemMetrics(SM_REMOTESESSION) <> 0;
end;

function IsTabletOS: Boolean;
const
  SM_TABLETPC = 86; // metrics flag not defined in Windows unit
begin
  Result := Windows.GetSystemMetrics(SM_TABLETPC) <> 0;
end;

function IsVista: Boolean;
var
  PFunction: Pointer; // pointer to GetProductInfo function if exists
begin
  // Try to load GetProductInfo from Kernel32: present if Vista
  PFunction := Windows.GetProcAddress(
    Windows.GetModuleHandle('kernel32.dll'), 'GetProductInfo'
  );
  Result := Assigned(PFunction);
end;

function IsWin9x: Boolean;
begin
  Result := SysUtils.Win32Platform = Windows.VER_PLATFORM_WIN32_WINDOWS;
end;

function IsWindows7: Boolean;
var
  PFunction: Pointer; // points to PowerCreateRequest function if exists
begin
  // Try to load PowerCreateRequest from Kernel32:
  // present if Windows 7 or Server 2008 R2
  PFunction := Windows.GetProcAddress(
    Windows.GetModuleHandle('kernel32.dll'), 'PowerCreateRequest'
  );
  Result := Assigned(PFunction);
end;

function IsWinNT: Boolean;
begin
  Result := (SysUtils.Win32Platform = Windows.VER_PLATFORM_WIN32_NT);
end;

function IsWow64: Boolean;
type
  TIsWow64Process = function( // Type of IsWow64Process API fn
    Handle: Windows.THandle; var Res: Windows.BOOL
  ): Windows.BOOL; stdcall;
var
  IsWow64Result: Windows.BOOL;      // Result from IsWow64Process
  IsWow64Process: TIsWow64Process;  // IsWow64Process fn reference
begin
  // Try to load required function from kernel32
  IsWow64Process := Windows.GetProcAddress(
    Windows.GetModuleHandle('kernel32.dll'), 'IsWow64Process'
  );
  if Assigned(IsWow64Process) then
  begin
    // Function is implemented: call it
    if not IsWow64Process(
      Windows.GetCurrentProcess, IsWow64Result
    ) then
      raise SysUtils.Exception.Create('IsWow64: bad process handle');
    // Return result of function
    Result := IsWow64Result;
  end
  else
    // Function not implemented: can't be running on Wow64
    Result := False;
end;

function ProgramFilesFolder: string;
begin
  Result := GetCurrentVersionRegStr('ProgramFilesDir');
end;

function SystemFolder: string;
begin
  SetLength(Result, Windows.MAX_PATH);
  SetLength(
    Result, Windows.GetSystemDirectory(PChar(Result), Windows.MAX_PATH)
  );
end;

function TempFolder: string;
begin
  SetLength(Result, Windows.MAX_PATH);
  SetLength(
    Result, Windows.GetTempPath(Windows.MAX_PATH, PChar(Result))
  );
end;

function UserName: string;
var
  AUserName: array[0..Windows.MAX_PATH] of Char; // buffer for user name
  Size: Windows.DWORD;                           // size of name buffer
begin
  Size := Windows.MAX_PATH;
  if Windows.GetUserName(AUserName, Size) then
    Result := AUserName
  else
    Result := '';
end;

function WindowsFolder: string;
begin
  SetLength(Result, Windows.MAX_PATH);
  SetLength(
    Result, Windows.GetWindowsDirectory(PChar(Result), Windows.MAX_PATH)
  );
end;

function WindowsProductID: string;
const
  // Registry keys for Win 9x/NT
  cRegKey: array[Boolean] of string = (
    'Software\Microsoft\Windows\CurrentVersion',
    'Software\Microsoft\Windows NT\CurrentVersion'
  );
  // Registry key name
  cName = 'ProductID';
begin
  Result := GetRegistryString(
    Windows.HKEY_LOCAL_MACHINE, cRegKey[IsWinNT], cName
  );
end;

end.
