unit TestUStringCatSnippets;

interface

uses
  TestFramework, UStringCatSnippets;

type
  TestStringCatSnippets = class(TTestCase)
  private
  published
    procedure TestStripAccelChars;
    procedure TestReverseStr;
    procedure TestReverseStrR;
    procedure TestIsNumeric;
    procedure TestSplitString;
    procedure TestParseStr;
  end;

implementation

uses
  Classes;

function IsEqualStringList(const Expected, Actual: TStrings): Boolean;
var
  I: Integer;
begin
  Result := False;
  if Expected.Count <> Actual.Count then
    Exit;
  for I := 0 to Pred(Expected.Count) do
    if Expected[I] <> Actual[I] then
      Exit;
  Result := True;
end;

{ TestStringCatSnippets }

procedure TestStringCatSnippets.TestIsNumeric;
begin
  CheckTrue(IsNumeric('123', False, False), 'Test 1');
  CheckTrue(IsNumeric(' 123 ', False, True), 'Test 2');
  CheckFalse(IsNumeric(' 123 ', False, False), 'Test 3');
  CheckTrue(IsNumeric('123.45', True, False), 'Test 4');
  CheckFalse(IsNumeric('123.45', False, False), 'Test 5');
  CheckTrue(IsNumeric('  -123.45  ', True, True), 'Test 6');
  CheckFalse(IsNumeric('  - 123.45  ', True, False), 'Test 7');
  CheckTrue(IsNumeric('-123.45', True), 'Test 8');
  CheckTrue(IsNumeric('1.23e6', True), 'Test 9');
  CheckTrue(IsNumeric('1e6', True), 'Test 10');
  CheckFalse(IsNumeric('1e6', False), 'Test 11');
  CheckFalse(IsNumeric('1e0.5', True), 'Test 12');
  CheckTrue(IsNumeric('1e', True), 'Test 13');
  CheckFalse(IsNumeric('1.1.1', True), 'Test 14');
  CheckFalse(IsNumeric('1. 0', True), 'Test 15');
  CheckFalse(IsNumeric('1e-6', False), 'Test 16');
  CheckTrue(IsNumeric('1e-6', True), 'Test 17');
  CheckTrue(IsNumeric('$F', True), 'Test 18');
  CheckTrue(IsNumeric('$F', False), 'Test 19');
  CheckTrue(IsNumeric('0x34', False), 'Test 20');
  CheckTrue(IsNumeric('0x34', True), 'Test 21');
  CheckFalse(IsNumeric('F', False), 'Test 22');
  CheckFalse(IsNumeric('$9A7BG', False), 'Test 23');
  CheckFalse(IsNumeric('0x9A7BG', False), 'Test 24');
  CheckFalse(IsNumeric('9A7B', False), 'Test 25');
  CheckFalse(IsNumeric('97Foo', False), 'Test 26');
  CheckFalse(IsNumeric('$97Foo', False), 'Test 27');
  CheckFalse(IsNumeric('FooBar', False), 'Test 28');
  CheckTrue(IsNumeric('1.0', True), 'Test 29');
  CheckFalse(IsNumeric('1.0', False), 'Test 30');
end;

procedure TestStringCatSnippets.TestParseStr;
var
  Result, Expected: TStringList;
begin
  Result := nil;
  Expected := nil;
  try
    Expected := TStringList.Create;
    Result := TStringList.Create;
    ParseStr('foo|bar|raboof', '|', Result);
    Expected.Clear;
    Expected.Add('foo');
    Expected.Add('bar');
    Expected.Add('raboof');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 1');
    ParseStr('foo##bar', '#', Result);
    Expected.Clear;
    Expected.Add('foo');
    Expected.Add('');
    Expected.Add('bar');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 2');
    ParseStr('|foo|bar|', '|', Result);
    Expected.Clear;
    Expected.Add('');
    Expected.Add('foo');
    Expected.Add('bar');
    Expected.Add('');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 3');
    ParseStr('bar', '|', Result);
    Expected.Clear;
    Expected.Add('bar');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 4');
    ParseStr('#', '#', Result);
    Expected.Clear;
    Expected.Add('');
    Expected.Add('');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 5');
    ParseStr('', '|', Result);
    Expected.Clear;
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 6');
    ParseStr('foo|bar|||', '|', Result);
    Expected.Clear;
    Expected.Add('foo');
    Expected.Add('bar');
    Expected.Add('');
    Expected.Add('');
    Expected.Add('');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 7');
    ParseStr('|||foo|bar', '|', Result);
    Expected.Clear;
    Expected.Add('');
    Expected.Add('');
    Expected.Add('');
    Expected.Add('foo');
    Expected.Add('bar');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 8');
  finally
    Result.Free;
    Expected.Free;
  end;
end;

procedure TestStringCatSnippets.TestReverseStr;
begin
  CheckEquals('derf', ReverseStr('fred'), 'Test 1');
  CheckEquals('aderf', ReverseStr('freda'), 'Test 2');
  CheckEquals('x', ReverseStr('x'), 'Test 3');
  CheckEquals('', ReverseStr(''), 'Test 4');
  CheckEquals('a b√', ReverseStr('√b a'), 'Test 5');
end;

procedure TestStringCatSnippets.TestReverseStrR;
begin
  CheckEquals('derf', ReverseStrR('fred'), 'Test 1');
  CheckEquals('aderf', ReverseStrR('freda'), 'Test 2');
  CheckEquals('x', ReverseStrR('x'), 'Test 3');
  CheckEquals('', ReverseStrR(''), 'Test 4');
  CheckEquals('a b√', ReverseStrR('√b a'), 'Test 5');
end;

procedure TestStringCatSnippets.TestSplitString;
var
  Result, Expected: TStringList;
begin
  Expected := TStringList.Create;
  try
    Result := SplitString('foo|bar|raboof', '|');
    Expected.Clear;
    Expected.Add('foo');
    Expected.Add('bar');
    Expected.Add('raboof');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 1');
    Result := SplitString('foo####bar', '##');
    Expected.Clear;
    Expected.Add('foo');
    Expected.Add('');
    Expected.Add('bar');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 2');
    Result := SplitString('|foo|bar|', '|');
    Expected.Clear;
    Expected.Add('');
    Expected.Add('foo');
    Expected.Add('bar');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 3');
    Result := SplitString('bar', '|');
    Expected.Clear;
    Expected.Add('bar');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 4');
    Result := SplitString('<sep>', '<sep>');
    Expected.Clear;
    Expected.Add('');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 5');
    Result := SplitString('', '<sep>');
    Expected.Clear;
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 6');
    Result := SplitString('foo|bar|||', '|');
    Expected.Clear;
    Expected.Add('foo');
    Expected.Add('bar');
    Expected.Add('');
    Expected.Add('');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 7');
    Result := SplitString('|||foo|bar', '|');
    Expected.Clear;
    Expected.Add('');
    Expected.Add('');
    Expected.Add('');
    Expected.Add('foo');
    Expected.Add('bar');
    CheckTrue(IsEqualStringList(Expected, Result), 'Test 8');
  finally
    Expected.Free;
  end;
end;

procedure TestStringCatSnippets.TestStripAccelChars;
begin
  CheckEquals('foo', StripAccelChars('&foo'), 'Test 1');
  CheckEquals('foo', StripAccelChars('f&oo'), 'Test 2');
  CheckEquals('foo', StripAccelChars('foo&'), 'Test 3');
  CheckEquals('foo', StripAccelChars('&fo&o'), 'Test 4');
  CheckEquals('foo', StripAccelChars('foo'), 'Test 5');
  CheckEquals('', StripAccelChars('&'), 'Test 6');
  CheckEquals('', StripAccelChars('&&&'), 'Test 7');
  CheckEquals('', StripAccelChars(''), 'Test 8');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestStringCatSnippets.Suite);

end.
