{
 * This file was generated from the DelphiDabbler Code Snippets Database.
 * The source code is licensed under the MIT license, copyright © 2005-2020,
 * Peter Johnson (https://gravatar.com/delphidabbler) and Contributors. The
 * full license and a list of contributors can be found in the `LICENSE` and
 * `CONTRIBUTORS` files at
 * https://github.com/delphidabbler/code-snippets/tree/master/csdb/collection
}

unit UStringCatSnippets;

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
  SysUtils, StrUtils, Classes, Windows;

function StripAccelChars(const S: string): string;

function ReverseStr(S: string): string;

function ReverseStrR(const S: string): string;

function IsNumeric(Value: string; const AllowFloat: Boolean;
  const TrimWhiteSpace: Boolean = True): Boolean;

function SplitString(const AText, ADelimiter: string): Classes.TStringList;

procedure ParseStr(const StrToParse: string; const Delimiter: Char;
  const Words: Classes.TStringList);

implementation

function StripAccelChars(const S: string): string;
begin
  Result := SysUtils.StringReplace(
    S, '&', SysUtils.EmptyStr, [SysUtils.rfReplaceAll]
  );
end;

function ReverseStr(S: string): string;
begin
  Result := SysUtils.EmptyStr;
  while System.Length(S) > 0 do
  begin
    Result := Result + StrUtils.RightStr(S, 1);
    S := StrUtils.LeftStr(S, Pred(System.Length(S)));
  end;
end;

function ReverseStrR(const S: string): string;
begin
  if SysUtils.AnsiSameText(S, SysUtils.EmptyStr) or (System.Length(S) = 1) then
    Result := S
  else
    Result := StrUtils.RightStr(S, 1)
      + ReverseStrR(StrUtils.LeftStr(S, System.Length(S) - 1))
end;

function IsNumeric(Value: string; const AllowFloat: Boolean;
  const TrimWhiteSpace: Boolean = True): Boolean;
var
  ValueInt: Int64;      // dummy integer value
  ValueFloat: Extended; // dummy float value
begin
  if TrimWhiteSpace then
    Value := SysUtils.Trim(Value);
  // Check for valid integer
  Result := SysUtils.TryStrToInt64(Value, ValueInt);
  if not Result and AllowFloat then
    // Wasn't valid as integer, try float
    Result := SysUtils.TryStrToFloat(Value, ValueFloat);
end;

function SplitString(const AText, ADelimiter: string): Classes.TStringList;
var
  LTxt, LTmp: string;
begin
  Result := TStringList.Create;
  LTxt := AText;
  while Pos(ADelimiter, LTxt) > 0 do
  begin
    LTmp := Copy(LTxt, 1, Pos(ADelimiter, LTxt) - 1);
    Result.Add(LTmp);
    LTxt := SysUtils.StringReplace(LTxt, LTmp + ADelimiter, '', []);
  end;
  if (LTxt <> '') then
    Result.Add(LTxt);
end;

procedure ParseStr(const StrToParse: string; const Delimiter: Char;
  const Words: Classes.TStringList);
var
  TmpInStr: string;
begin
  TmpInStr := StrToParse;
  Words.Clear;
  if Length(TmpInStr) > 0 then
  begin
    while Pos(Delimiter, TmpInStr) > 0 do
    begin
      Words.Append(Copy(TmpInStr, 1, Pos(Delimiter, TmpInStr) - 1));
      Delete(TmpInStr, 1, Pos(Delimiter, TmpInStr));
    end;
    Words.Append(TmpInStr);
  end;
end;

end.

