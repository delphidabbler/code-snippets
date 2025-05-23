{
 * This file was generated from the DelphiDabbler Code Snippets collection.
 *
 * See https://github.com/delphidabsbler/code-snippets/tree/master/LICENSE.md for
 * full license & copyright information.
}

unit UHexCatSnippets;

interface

uses
  SysUtils;

type
  {$IFDEF UNICODE}
  TDynByteArray = SysUtils.TBytes;
  {$ELSE}
  TDynByteArray = array of Byte;
  {$ENDIF}

function AddHexPrefix(const HexStr: string): string;

function BufToHex(const Buf; const Size: Cardinal): string;

function BytesToHex(const Bytes: array of Byte): string;

function ByteToHex(const B: Byte): string;

function HexByteSize(HexStr: string): Cardinal;

procedure HexToBuf(HexStr: string; var Buf);

function HexToBytes(HexStr: string): TDynByteArray;

function HexToInt(const HexStr: string): Integer;

function HexToInt64(const HexStr: string): Int64;

function HexToInt64Def(const HexStr: string; const Default: Int64): Int64;

function HexToIntDef(const HexStr: string; const Default: Integer): Integer;

function LongWordToHex(const LW: LongWord): string;

function QuadWordToHex(const QW: UInt64): string;

function StripHexPrefix(const HexStr: string): string;

function TryHexToBuf(HexStr: string; var Buf): Boolean;

function TryHexToBytes(HexStr: string; out Bytes: TDynByteArray): Boolean;

function TryHexToInt(const HexStr: string; out Value: Integer): Boolean;

function TryHexToInt64(const HexStr: string; out Value: Int64): Boolean;

function WordToHex(const W: Word): string;

implementation

function AddHexPrefix(const HexStr: string): string;
begin
  Result := SysUtils.HexDisplayPrefix + StripHexPrefix(HexStr);
end;

function BufToHex(const Buf; const Size: Cardinal): string;
const
  // maps nibbles to hex digits
  cHexDigits: array[$0..$F] of Char = (
    '0', '1', '2', '3', '4', '5', '6', '7',
    '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
  );
var
  I: Cardinal;  // loops thru output string
  PB: ^Byte;    // addresses each byte in buffer
begin
  PB := @Buf;
//  Result := '';
  SetLength(Result, 2 * Size);
  I := 1;
  while I <= 2 * Size do
  begin
    Result[I] := cHexDigits[PB^ shr 4];
    Result[I + 1] := cHexDigits[PB^ and $0F];
    Inc(PB);
    Inc(I, 2);
  end;
end;

function BytesToHex(const Bytes: array of Byte): string;
begin
  Result := BufToHex(Bytes, Length(Bytes));
end;

function ByteToHex(const B: Byte): string;
begin
  Result := SysUtils.IntToHex(B, 2 * SizeOf(B));
end;

function HexByteSize(HexStr: string): Cardinal;
begin
  HexStr := StripHexPrefix(HexStr);
  Result := (Length(HexStr) div 2) + (Length(HexStr) mod 2);
end;

procedure HexToBuf(HexStr: string; var Buf);
{$IFDEF FPC}
const
{$ELSE}
resourcestring
{$ENDIF}
  sHexConvertError = '''%s'' is not a valid hexadecimal string';
begin
  if not TryHexToBuf(HexStr, Buf) then
    raise SysUtils.EConvertError.CreateFmt(sHexConvertError, [HexStr]);
end;

function HexToBytes(HexStr: string): TDynByteArray;
{$IFDEF FPC}
const
{$ELSE}
resourcestring
{$ENDIF}
  sHexConvertError = '''%s'' is not a valid hexadecimal string';
begin
  if not TryHexToBytes(HexStr, Result) then
    raise SysUtils.EConvertError.CreateFmt(sHexConvertError, [HexStr]);
end;

function HexToInt(const HexStr: string): Integer;
{$IFDEF FPC}
const
{$ELSE}
resourcestring
{$ENDIF}
  sHexConvertError = '''%s'' is not a valid hexadecimal value';
begin
  if not TryHexToInt(HexStr, Result) then
    raise SysUtils.EConvertError.CreateFmt(sHexConvertError, [HexStr]);
end;

function HexToInt64(const HexStr: string): Int64;
{$IFDEF FPC}
const
{$ELSE}
resourcestring
{$ENDIF}
  sHexConvertError = '''%s'' is not a valid hexadecimal value';
begin
  if not TryHexToInt64(HexStr, Result) then
    raise SysUtils.EConvertError.CreateFmt(sHexConvertError, [HexStr]);
end;

function HexToInt64Def(const HexStr: string; const Default: Int64): Int64;
begin
  if not TryHexToInt64(HexStr, Result) then
    Result := Default;
end;

function HexToIntDef(const HexStr: string; const Default: Integer): Integer;
begin
  if not TryHexToInt(HexStr, Result) then
    Result := Default;
end;

function LongWordToHex(const LW: LongWord): string;
begin
  Result := SysUtils.IntToHex(Integer(LW), 2 * SizeOf(LW));
end;

function QuadWordToHex(const QW: UInt64): string;
begin
  Result := SysUtils.IntToHex(Int64(QW), 2 * SizeOf(QW));
end;

function StripHexPrefix(const HexStr: string): string;
begin
  if Pos('$', HexStr) = 1 then
    Result := Copy(HexStr, 2, Length(HexStr) - 1)
  else if Pos('0x', SysUtils.LowerCase(HexStr)) = 1 then
    Result := Copy(HexStr, 3, Length(HexStr) - 2)
  else
    Result := HexStr;
end;

function TryHexToBuf(HexStr: string; var Buf): Boolean;
var
  I: Integer;       // loops through characters of string
  PB: ^Byte;        // references each byte in buffer
  ByteVal: Integer; // a byte value from hex string
begin
  Result := False;
  HexStr := StripHexPrefix(HexStr);
  if HexStr = '' then
    Exit;
  if Odd(Length(HexStr)) then
    HexStr := '0' + HexStr;
  I := 1;
  PB := @Buf;
  while I <= Length(HexStr) do
  begin
    if not TryHexToInt(HexStr[I] + HexStr[I + 1], ByteVal) then
      Exit;
    PB^ := Byte(ByteVal);
    Inc(I, 2);
    Inc(PB);
  end;
  Result := True;
end;

function TryHexToBytes(HexStr: string; out Bytes: TDynByteArray): Boolean;
begin
  SetLength(Bytes, HexByteSize(HexStr));
  Result := TryHexToBuf(HexStr, Bytes[0]);
end;

function TryHexToInt(const HexStr: string; out Value: Integer): Boolean;
var
  E: Integer; // error code
begin
  Val(AddHexPrefix(HexStr), Value, E);
  Result := E = 0;
end;

function TryHexToInt64(const HexStr: string; out Value: Int64): Boolean;
var
  E: Integer; // error code
begin
  Val(AddHexPrefix(HexStr), Value, E);
  Result := E = 0;
end;

function WordToHex(const W: Word): string;
begin
  Result := SysUtils.IntToHex(W, 2 * SizeOf(W));
end;

end.
