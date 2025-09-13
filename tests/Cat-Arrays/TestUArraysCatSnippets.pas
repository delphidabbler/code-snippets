unit TestUArraysCatSnippets;

interface

uses
  TestFramework, UArraysCatSnippets, Types;

type

  TestTArrayUtils = class(TTestCase)
  strict private
    fSA0: TArray<string>;
    fSA1: TArray<string>;
    fSA2: TArray<string>;
    fSA2R: TArray<string>;
    fSAM: TArray<string>;
    fSAN: TArray<string>;
    fSAR: TArray<string>;
    fIA0: TArray<Integer>;
    fIA1: TArray<Integer>;
    fIA2: TArray<Integer>;
    fIA3: TArray<Integer>;
    fIA3R: TArray<Integer>;
    fIAM: TArray<Integer>;
    fIAN: TArray<Integer>;
    fIAP: TArray<Integer>;
    fIAR: TArray<Integer>;
    fIAX: TArray<Integer>;
    fIAY: TArray<Integer>;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestFirst;
    procedure TestLast;
    procedure TestIndexOf;
    procedure TestEqual;
    // TestReverse must come after TestEqual since the test calls TArrayUtils.Equal<T>
    procedure TestReverse;
    procedure TestSameStart;
    procedure TestMax;
    procedure TestMin;
    procedure TestMinMax;
  end;

  TestArraysCatSnippets = class(TTestCase)
  private
    function StringArraysEqual(const L, R: TStringDynArray): Boolean;
    procedure ByteArraysSameStart_AssertionFailure;
    procedure PopByteArray_AssertionFailure;
    procedure ShiftByteArray_AssertionFailure;
  published
    procedure TestByteArraysEqual;
    procedure TestAppendByteArray;    // test requires ByteArraysEqual
    procedure TestArrayToStringList;
    procedure TestByteArraysSameStart;
    procedure TestChopByteArray;      // test requires ByteArraysEqual
    procedure TestCloneByteArray;     // test requires ByteArraysEqual
    procedure TestConcatByteArrays;   // test requires ByteArraysEqual
    procedure TestIndexOfByte;
    procedure TestLastIndexOfByte;
    procedure TestPopByteArray;       // test requires ByteArraysEqual
    procedure TestPushByteArray;      // test requires ByteArraysEqual
    procedure TestReverseByteArray;   // test requires ByteArraysEqual
    procedure TestShiftByteArray;     // test requires ByteArraysEqual
    procedure TestSliceByteArray;     // test requires ByteArraysEqual
    procedure TestStringListToArray;
    procedure TestUnShiftByteArray;   // test requires ByteArraysEqual
  end;

implementation

uses
  SysUtils, Generics.Defaults, Classes;

var
  IntegerCompareFn: TEqualityComparison<Integer>;
  StringCompareFn: TEqualityComparison<string>;
  IntegerComparisonFn: TComparison<Integer>;
  StringComparisonFn: TComparison<string>;

{ TestTArrayUtils }

procedure TestTArrayUtils.SetUp;
begin
  fSA0 := TArray<string>.Create();
  fSA1 := TArray<string>.Create('foo');
  fSA2 := TArray<string>.Create('foo', 'bar');
  fSA2R := TArray<string>.Create('bar', 'foo');
  fSAM := TArray<string>.Create('a', 'stitch', 'in', 'time', 'saves', 'nine');
  fSAN := TArray<string>.Create('a', 'stitch', 'in', 'time', 'saves', 'nine');
  fSAR := TArray<string>.Create('nine', 'saves', 'time', 'in', 'stitch', 'a');
  fIA0 := TArray<Integer>.Create();
  fIA1 := TArray<Integer>.Create(42);
  fIA2 := TArray<Integer>.Create(42, 56);
  fIA3 := TArray<Integer>.Create(56, 42, 102);
  fIA3R := TArray<Integer>.Create(102, 42, 56);
  fIAM := TArray<Integer>.Create(1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37);
  fIAN := TArray<Integer>.Create(1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37);
  fIAR := TArray<Integer>.Create(37, 31, 29, 23, 19, 17, 13, 11, 7, 5, 3, 2, 1);
  fIAP := TArray<Integer>.Create(1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29);
  fIAX := TArray<Integer>.Create(1, 2, 3, 5, 4, 11, 13, 17, 19, 23, 29, 31);
  fIAY := TArray<Integer>.Create(0, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37);
end;

procedure TestTArrayUtils.TearDown;
begin

end;

procedure TestTArrayUtils.TestEqual;
begin
  CheckTrue(
    TArrayUtils.Equal<Integer>(fIAM, fIAN, IntegerCompareFn), 'Test 1'
  );
  CheckFalse(
    TArrayUtils.Equal<Integer>(fIAM, fIAP, IntegerCompareFn), 'Test 2'
  );
  CheckFalse(
    TArrayUtils.Equal<Integer>(fIAM, fIAX, IntegerCompareFn), 'Test 3'
  );
  CheckFalse(
    TArrayUtils.Equal<Integer>(fIAM, fIAY, IntegerCompareFn), 'Test 4'
  );
  CheckFalse(
    TArrayUtils.Equal<Integer>(fIAM, fIA0, IntegerCompareFn), 'Test 5'
  );
  CheckTrue(
    TArrayUtils.Equal<Integer>(fIA0, fIA0, IntegerCompareFn), 'Test 6'
  );
  CheckTrue(
    TArrayUtils.Equal<string>(fSAM, fSAN, StringCompareFn), 'Test 7'
  );
  CheckFalse(
    TArrayUtils.Equal<string>(fSA1, fSA2, StringCompareFn), 'Test 8'
  );
end;

procedure TestTArrayUtils.TestFirst;
begin
  CheckEquals('foo', TArrayUtils.First<string>(fSA1), 'Test 1');
  CheckEquals('foo', TArrayUtils.First<string>(fSA2), 'Test 2');
  CheckEquals('a', TArrayUtils.First<string>(fSAN), 'Test 3');
  CheckEquals(42, TArrayUtils.First<Integer>(fIA1), 'Test 4');
  CheckEquals(42, TArrayUtils.First<Integer>(fIA2), 'Test 5');
  CheckEquals(1, TArrayUtils.First<Integer>(fIAN), 'Test 6');
end;

procedure TestTArrayUtils.TestIndexOf;
begin
  CheckEquals(
    -1, TArrayUtils.IndexOf<string>('foo', fSA0, StringCompareFn), 'Test 1'
  );
  CheckEquals(
    0, TArrayUtils.IndexOf<string>('foo', fSA1, StringCompareFn), 'Test 2'
  );
  CheckEquals(
    0, TArrayUtils.IndexOf<string>('foo', fSA2, StringCompareFn), 'Test 3'
  );
  CheckEquals(
    -1, TArrayUtils.IndexOf<string>('foo', fSAN, StringCompareFn), 'Test 4'
  );
  CheckEquals(
    5, TArrayUtils.IndexOf<string>('nine', fSAN, StringCompareFn), 'Test 5'
  );
  CheckEquals(
   -1, TArrayUtils.IndexOf<Integer>(42, fIA0, IntegerCompareFn), 'Test 6'
  );
  CheckEquals(
   0, TArrayUtils.IndexOf<Integer>(42, fIA1, IntegerCompareFn), 'Test 7'
  );
  CheckEquals(
   1, TArrayUtils.IndexOf<Integer>(56, fIA2, IntegerCompareFn), 'Test 8'
  );
  CheckEquals(
   7, TArrayUtils.IndexOf<Integer>(17, fIAN, IntegerCompareFn), 'Test 9'
  );
  CheckEquals(
   -1, TArrayUtils.IndexOf<Integer>(42, fIAN, IntegerCompareFn), 'Test 10'
  );
end;

procedure TestTArrayUtils.TestLast;
begin
  CheckEquals('foo', TArrayUtils.Last<string>(fSA1), 'Test 1');
  CheckEquals('bar', TArrayUtils.Last<string>(fSA2), 'Test 2');
  CheckEquals('nine', TArrayUtils.Last<string>(fSAN), 'Test 3');
  CheckEquals(42, TArrayUtils.Last<Integer>(fIA1), 'Test 4');
  CheckEquals(56, TArrayUtils.Last<Integer>(fIA2), 'Test 5');
  CheckEquals(37, TArrayUtils.Last<Integer>(fIAN), 'Test 6');
end;

procedure TestTArrayUtils.TestMax;
begin
  CheckEquals(42, TArrayUtils.Max<Integer>(fIA1, IntegerComparisonFn), 'Test 1');
  CheckEquals(56, TArrayUtils.Max<Integer>(fIA2, IntegerComparisonFn), 'Test 2');
  CheckEquals(102, TArrayUtils.Max<Integer>(fIA3, IntegerComparisonFn), 'Test 3');
  CheckEquals(37, TArrayUtils.Max<Integer>(fIAY, IntegerComparisonFn), 'Test 4');
  CheckEquals(37, TArrayUtils.Max<Integer>(fIAR, IntegerComparisonFn), 'Test 5');
  CheckEquals('foo', TArrayUtils.Max<string>(fSA1, StringComparisonFn), 'Test 6');
  CheckEquals('foo', TArrayUtils.Max<string>(fSA2, StringComparisonFn), 'Test 7');
  CheckEquals('foo', TArrayUtils.Max<string>(fSA2R, StringComparisonFn), 'Test 8');
  CheckEquals('time', TArrayUtils.Max<string>(fSAM, StringComparisonFn), 'Test 9');
  CheckEquals('time', TArrayUtils.Max<string>(fSAR, StringComparisonFn), 'Test 10');
end;

procedure TestTArrayUtils.TestMin;
begin
  CheckEquals(42, TArrayUtils.Min<Integer>(fIA1, IntegerComparisonFn), 'Test 1');
  CheckEquals(42, TArrayUtils.Min<Integer>(fIA2, IntegerComparisonFn), 'Test 2');
  CheckEquals(42, TArrayUtils.Min<Integer>(fIA3, IntegerComparisonFn), 'Test 3');
  CheckEquals(0, TArrayUtils.Min<Integer>(fIAY, IntegerComparisonFn), 'Test 4');
  CheckEquals(1, TArrayUtils.Min<Integer>(fIAR, IntegerComparisonFn), 'Test 5');
  CheckEquals('foo', TArrayUtils.Min<string>(fSA1, StringComparisonFn), 'Test 6');
  CheckEquals('bar', TArrayUtils.Min<string>(fSA2, StringComparisonFn), 'Test 7');
  CheckEquals('bar', TArrayUtils.Min<string>(fSA2R, StringComparisonFn), 'Test 8');
  CheckEquals('a', TArrayUtils.Min<string>(fSAM, StringComparisonFn), 'Test 9');
  CheckEquals('a', TArrayUtils.Min<string>(fSAR, StringComparisonFn), 'Test 10');

end;

procedure TestTArrayUtils.TestMinMax;
var
  MinInt, MaxInt: Integer;
  MinStr, MaxStr: string;
begin
  TArrayUtils.MinMax<Integer>(fIA1, IntegerComparisonFn, MinInt, MaxInt);
  CheckEquals(42, MinInt, 'Test 1 min');
  CheckEquals(42, MaxInt, 'Test 1 max');
  TArrayUtils.MinMax<Integer>(fIA2, IntegerComparisonFn, MinInt, MaxInt);
  CheckEquals(42, MinInt, 'Test 2 min');
  CheckEquals(56, MaxInt, 'Test 2 max');
  TArrayUtils.MinMax<Integer>(fIA3, IntegerComparisonFn, MinInt, MaxInt);
  CheckEquals(42, MinInt, 'Test 3 min');
  CheckEquals(102, MaxInt, 'Test 3 max');
  TArrayUtils.MinMax<Integer>(fIAY, IntegerComparisonFn, MinInt, MaxInt);
  CheckEquals(0, MinInt, 'Test 4 min');
  CheckEquals(37, MaxInt, 'Test 4 max');
  TArrayUtils.MinMax<Integer>(fIAR, IntegerComparisonFn, MinInt, MaxInt);
  CheckEquals(1, MinInt, 'Test 5 min');
  CheckEquals(37, MaxInt, 'Test 5 max');
  TArrayUtils.MinMax<string>(fSA1, StringComparisonFn, MinStr, MaxStr);
  CheckEquals('foo', MinStr, 'Test 6 min');
  CheckEquals('foo', MaxStr, 'Test 6 max');
  TArrayUtils.MinMax<string>(fSA2, StringComparisonFn, MinStr, MaxStr);
  CheckEquals('bar', MinStr, 'Test 7 min');
  CheckEquals('foo', MaxStr, 'Test 7 max');
  TArrayUtils.MinMax<string>(fSA2R, StringComparisonFn, MinStr, MaxStr);
  CheckEquals('bar', MinStr, 'Test 8 min');
  CheckEquals('foo', MaxStr, 'Test 8 max');
  TArrayUtils.MinMax<string>(fSAM, StringComparisonFn, MinStr, MaxStr);
  CheckEquals('a', MinStr, 'Test 9 min');
  CheckEquals('time', MaxStr, 'Test 9 max');
  TArrayUtils.MinMax<string>(fSAR, StringComparisonFn, MinStr, MaxStr);
  CheckEquals('a', MinStr, 'Test 10 min');
  CheckEquals('time', MaxStr, 'Test 10 max');
end;

procedure TestTArrayUtils.TestReverse;
var
  RS: TArray<string>;
  RI: TArray<Integer>;
begin
  RS := TArrayUtils.Reverse<string>(fSAM);
  CheckTrue(TArrayUtils.Equal<string>(fSAR, RS, StringCompareFn), 'Test 1');
  RI := TArrayUtils.Reverse<Integer>(fIAM);
  CheckTrue(TArrayUtils.Equal<Integer>(fIAR, RI, IntegerCompareFn), 'Test 2');
  RS := TArrayUtils.Reverse<string>(fSA2);
  CheckTrue(TArrayUtils.Equal<string>(fSA2R, RS, StringCompareFn), 'Test 3');
  RI := TArrayUtils.Reverse<Integer>(fIA0);
  CheckTrue(TArrayUtils.Equal<Integer>(fIA0, RI, IntegerCompareFn), 'Test 4');
  RI := TArrayUtils.Reverse<Integer>(fIA1);
  CheckTrue(TArrayUtils.Equal<Integer>(fIA1, RI, IntegerCompareFn), 'Test 5');
  RI := TArrayUtils.Reverse<Integer>(fIA3);
  CheckTrue(TArrayUtils.Equal<Integer>(fIA3R, RI, IntegerCompareFn), 'Test 6');
end;

procedure TestTArrayUtils.TestSameStart;
begin
  CheckTrue(
    TArrayUtils.SameStart<string>(fSA1, fSA2, 1, StringCompareFn), 'Test 1'
  );
  CheckFalse(
    TArrayUtils.SameStart<string>(fSA1, fSA2, 2, StringCompareFn), 'Test 2'
  );
  CheckTrue(
    TArrayUtils.SameStart<string>(fSA1, fSA2, 1, StringCompareFn), 'Test 3'
  );
  CheckTrue(
    TArrayUtils.SameStart<string>(fSAM, fSAN, 5, StringCompareFn), 'Test 4'
  );
  CheckTrue(
    TArrayUtils.SameStart<string>(fSAM, fSAN, 6, StringCompareFn), 'Test 5'
  );
  CheckFalse(
    TArrayUtils.SameStart<string>(fSAM, fSAN, 7, StringCompareFn), 'Test 6'
  );
  CheckTrue(
    TArrayUtils.SameStart<Integer>(fIAN, fIAP, 11, IntegerCompareFn), 'Test 7'
  );
  CheckFalse(
    TArrayUtils.SameStart<Integer>(fIAN, fIAP, 12, IntegerCompareFn), 'Test 8'
  );
  CheckTrue(
    TArrayUtils.SameStart<Integer>(fIAP, fIAX, 4, IntegerCompareFn), 'Test 9'
  );
  CheckFalse(
    TArrayUtils.SameStart<Integer>(fIAP, fIAX, 5, IntegerCompareFn), 'Test 10'
  );
  CheckTrue(
    TArrayUtils.SameStart<Integer>(fIAM, fIAN, 1, IntegerCompareFn), 'Test 11'
  );
  CheckFalse(
    TArrayUtils.SameStart<Integer>(fIAX, fIAY, 1, IntegerCompareFn), 'Test 12'
  );
  CheckFalse(
    TArrayUtils.SameStart<Integer>(fIA0, fIA0, 1, IntegerCompareFn), 'Test 13'
  );
  CheckFalse(
    TArrayUtils.SameStart<Integer>(fIA0, fIAM, 2, IntegerCompareFn), 'Test 14'
  );
end;

{ TestArraysCatSnippets }

procedure TestArraysCatSnippets.ByteArraysSameStart_AssertionFailure;
const
  A1: array[1..3] of Byte = (1, 2, 3);
  A2: array[11..15] of Byte = (1, 2, 3, 4, 5);
begin
  ByteArraysSameStart(A1, A2, 0);
end;

procedure TestArraysCatSnippets.PopByteArray_AssertionFailure;
var
  A: TBytes;
begin
  // Attempt to pop empty array
  SetLength(A, 0);
  PopByteArray(A);
end;

procedure TestArraysCatSnippets.ShiftByteArray_AssertionFailure;
var
  A: TBytes;
begin
  // Attempt to shift empty array
  SetLength(A, 0);
  ShiftByteArray(A);
end;

function TestArraysCatSnippets.StringArraysEqual(const L, R: TStringDynArray):
  Boolean;
var
  I: Integer;
begin
  Result := Length(L) = Length(R);
  if Result then
  begin
    for I := 0 to High(L) do
    begin
      if L[I] <> R[I] then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

procedure TestArraysCatSnippets.TestAppendByteArray;
var
  B1, B2, E: TBytes;
begin
  B1 := TBytes.Create(42, 56);
  B2 := TBytes.Create(99, 199, 201);
  E := TBytes.Create(42, 56, 99, 199, 201);
  AppendByteArray(B1, B2);
  CheckTrue(ByteArraysEqual(E, B1), '#1');

  SetLength(B1, 0);
  B2 := TBytes.Create(1, 2, 3, 4, 5);
  E := TBytes.Create(1, 2, 3, 4, 5);
  AppendByteArray(B1, B2);
  CheckTrue(ByteArraysEqual(E, B1), '#2');

  SetLength(B1, 0);
  SetLength(B2, 0);
  SetLength(E, 0);
  AppendByteArray(B1, B2);
  CheckTrue(ByteArraysEqual(E, B1), '#3');

  SetLength(B1, 0);
  B2 := TBytes.Create(12, 89);
  E := TBytes.Create(12, 89);
  AppendByteArray(B1, B2);
  CheckTrue(ByteArraysEqual(E, B1), '#4');

  B1 := TBytes.Create(1, 2, 3);
  SetLength(B2, 0);
  E := TBytes.Create(1, 2, 3);
  AppendByteArray(B1, B2);
  CheckTrue(ByteArraysEqual(E, B1), '#5');
end;

procedure TestArraysCatSnippets.TestArrayToStringList;
const
  S1: array[0..0] of string = ('single elem');
  S3: array[1..3] of string = ('one', 'two', 'three');
var
  S0: array of string;
  SL: TStringList;
  Expected: string;
begin
  SetLength(S0, 0);
  SL := TStringList.Create;
  try
    SL.LineBreak := sLineBreak;
    ArrayToStringList(S1, SL);
    Expected := 'single elem';
    CheckEquals(Expected, Trim(SL.Text), '#1a');
    CheckEquals(1, SL.Count, '#1b');

    ArrayToStringList(S3, SL);
    Expected := 'one' + sLineBreak + 'two' + sLineBreak + 'three';
    CheckEquals(Expected, Trim(SL.Text), '#2a');
    CheckEquals(3, SL.Count, '#2b');

    ArrayToStringList(S0, SL);
    Expected := '';
    CheckEquals(Expected, Trim(SL.Text), '#3a');
    CheckEquals(0, SL.Count, '#3b');
  finally
    SL.Free;
  end;
end;

procedure TestArraysCatSnippets.TestByteArraysEqual;
var
  A0L, A0R: TBytes;
  A1L, A1Req, A1Rneq: TBytes;
  ANL, ANReq, ANRneq1, ANRneq2, ANRneq3, ANRneq4: TBytes;
  AMR: TBytes;
begin
  SetLength(A0L, 0);
  SetLength(A0R, 0);
  A1L := TBytes.Create(42);
  A1Req := TBytes.Create(42);
  A1Rneq := TBytes.Create(56);
  ANL := TBytes.Create(27,98,128,46,35,0,1);
  ANReq := TBytes.Create(27,98,128,46,35,0,1);
  ANRneq1 := TBytes.Create(27,98,128,46,35,0,7);
  ANRneq2 := TBytes.Create(26,98,128,46,35,0,1);
  ANRneq3 := TBytes.Create(27,98,67,46,35,0,1);
  ANRneq4 := TBytes.Create(27,17,67,46,35,12,1);
  AMR := TBytes.Create(27,98,128,35,0,1);

  CheckTrue(ByteArraysEqual(A0L, A0R), '#1');
  CheckTrue(ByteArraysEqual(A1L, A1Req), '#2');
  CheckFalse(ByteArraysEqual(A1L, A1Rneq), '#3');
  CheckTrue(ByteArraysEqual(ANL, ANReq), '#4');
  CheckFalse(ByteArraysEqual(A1L, ANRneq1), '#5');
  CheckFalse(ByteArraysEqual(A1L, ANRneq2), '#6');
  CheckFalse(ByteArraysEqual(A1L, ANRneq3), '#7');
  CheckFalse(ByteArraysEqual(A1L, ANRneq4), '#8');
  CheckFalse(ByteArraysEqual(A1L, AMR), '#9');
  CheckFalse(ByteArraysEqual(A0L, A1L), '#10');
end;

procedure TestArraysCatSnippets.TestByteArraysSameStart;
const
  A1: array[1..3] of Byte = (1, 2, 3);
  A2: array[11..15] of Byte = (1, 2, 3, 4, 5);
  A3: array[0..3] of Byte = (2, 3, 4, 5);
  A4: array[0..0] of Byte = (2);
var
  A0: array of Byte;
begin
  SetLength(A0, 0);
  CheckTrue(ByteArraysSameStart(A1, A2, 2), '#1a');
  CheckTrue(ByteArraysSameStart(A1, A2, 3), '#1b');
  CheckFalse(ByteArraysSameStart(A1, A2, 4), '#1c');
  CheckFalse(ByteArraysSameStart(A1, A2, 12), '#1d');
  CheckTrue(ByteArraysSameStart(A3, A4, 1), '#2a');
  CheckFalse(ByteArraysSameStart(A3, A4, 2), '#2b');
  CheckFalse(ByteArraysSameStart(A1, A3, 1), '#3a');
  CheckFalse(ByteArraysSameStart(A1, A3, 2), '#3b');
  CheckFalse(ByteArraysSameStart(A1, A3, 12), '#3c');
  CheckTrue(ByteArraysSameStart(A2, A2, 1), '#4a');
  CheckTrue(ByteArraysSameStart(A2, A2, 5), '#4b');
  CheckFalse(ByteArraysSameStart(A2, A2, 6), '#4c');
  CheckFalse(ByteArraysSameStart(A0, A0, 1), '#5');
  CheckException(ByteArraysSameStart_AssertionFailure, EAssertionFailed, 'Assert failed');
end;

procedure TestArraysCatSnippets.TestChopByteArray;
var
  A, R, E: TBytes;
begin
  // test zero length array => always returns empty array
  SetLength(A, 0);
  SetLength(E, 0);
  R := ChopByteArray(A, 0, 0);
  CheckTrue(ByteArraysEqual(E, R), '#1a');
  R := ChopByteArray(A, -3, -3);
  CheckTrue(ByteArraysEqual(E, R), '#1b');
  R := ChopByteArray(A, 2, 29);
  CheckTrue(ByteArraysEqual(E, R), '#1c');

  // test normal cases
  A := TBytes.Create(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  R := ChopByteArray(A, 2, 4);
  E := TBytes.Create(1, 2, 7, 8, 9, 10);
  CheckTrue(ByteArraysEqual(E, R), '#2a');
  R := ChopByteArray(A, 0, 2);
  E := TBytes.Create(3, 4, 5, 6, 7, 8, 9, 10);
  CheckTrue(ByteArraysEqual(E, R), '#2b');
  R := ChopByteArray(A, 9, 1);
  E := TBytes.Create(1, 2, 3, 4, 5, 6, 7, 8, 9);
  CheckTrue(ByteArraysEqual(E, R), '#2c');
  R := ChopByteArray(A, 0, 10);
  SetLength(E, 0);
  CheckTrue(ByteArraysEqual(E, R), '#2d');
  R := ChopByteArray(A, 0, 1);
  E := TBytes.Create(2, 3, 4, 5, 6, 7, 8, 9, 10);
  CheckTrue(ByteArraysEqual(E, R), '#2e');

  // test parameter out of bounds cases
  // length = 0 => return whole array
  A := TBytes.Create(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  R := ChopByteArray(A, 3, 0);
  E := TBytes.Create(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  CheckTrue(ByteArraysEqual(E, R), '#3a');
  // start < 0 => start = 0
  R := ChopByteArray(A, -12, 2);
  E := TBytes.Create(3, 4, 5, 6, 7, 8, 9, 10);
  CheckTrue(ByteArraysEqual(E, R), '#3b');
  // length < 0 => length = 0 => return whole array
  R := ChopByteArray(A, 3, -12);
  E := TBytes.Create(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  CheckTrue(ByteArraysEqual(E, R), '#3c');
  // start > length of array => return whole array
  R := ChopByteArray(A, 11, 4);
  E := TBytes.Create(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  CheckTrue(ByteArraysEqual(E, R), '#3d');
  // length goes beyond end of array => chop from start to end
  R := ChopByteArray(A, 7, 100);
  E := TBytes.Create(1, 2, 3, 4, 5, 6, 7);
  CheckTrue(ByteArraysEqual(E, R), '#3e');
end;

procedure TestArraysCatSnippets.TestCloneByteArray;
var
  B0, B1, B6, R: TBytes;
begin
  SetLength(B0, 0);
  B1 := TBytes.Create(42);
  B6 := TBytes.Create(1, 1, 2, 3, 5, 8);
  R := CloneByteArray(B0);
  CheckTrue(ByteArraysEqual(B0, R), '#1');
  R := CloneByteArray(B1);
  CheckTrue(ByteArraysEqual(B1, R), '#2');
  R := CloneByteArray(B6);
  CheckTrue(ByteArraysEqual(B6, R), '#3');
end;

procedure TestArraysCatSnippets.TestConcatByteArrays;
var
  B1, B2, R, E: TBytes;
begin
  B1 := TBytes.Create(42, 56);
  B2 := TBytes.Create(99, 199, 201);
  E := TBytes.Create(42, 56, 99, 199, 201);
  R := ConcatByteArrays(B1, B2);
  CheckTrue(ByteArraysEqual(E, R), '#1');

  SetLength(B1, 0);
  B2 := TBytes.Create(1, 2, 3, 4, 5);
  E := TBytes.Create(1, 2, 3, 4, 5);
  R := ConcatByteArrays(B1, B2);
  CheckTrue(ByteArraysEqual(E, R), '#2');

  SetLength(B1, 0);
  SetLength(B2, 0);
  SetLength(E, 0);
  R := ConcatByteArrays(B1, B2);
  CheckTrue(ByteArraysEqual(E, R), '#3');

  SetLength(B1, 0);
  B2 := TBytes.Create(12, 89);
  E := TBytes.Create(12, 89);
  R := ConcatByteArrays(B1, B2);
  CheckTrue(ByteArraysEqual(E, R), '#4');

  B1 := TBytes.Create(1, 2, 3);
  SetLength(B2, 0);
  E := TBytes.Create(1, 2, 3);
  R := ConcatByteArrays(B1, B2);
  CheckTrue(ByteArraysEqual(E, R), '#5');
end;

procedure TestArraysCatSnippets.TestIndexOfByte;
var
  B0, B1, B6: TBytes;
begin
  SetLength(B0, 0);
  B1 := TBytes.Create(3);
  B6 := TBytes.Create(1, 1, 2, 3, 5, 8);
  CheckEquals(-1, IndexOfByte(3, B0), '#3a');
  CheckEquals(0, IndexOfByte(3, B1), '#3b');
  CheckEquals(3, IndexOfByte(3, B6), '#3c');
  CheckEquals(-1, IndexOfByte(1, B0), '#1a');
  CheckEquals(-1, IndexOfByte(1, B1), '#1b');
  CheckEquals(0, IndexOfByte(1, B6), '#1c');
  CheckEquals(-1, IndexOfByte(8, B0), '#8a');
  CheckEquals(-1, IndexOfByte(8, B1), '#8b');
  CheckEquals(5, IndexOfByte(8, B6), '#8c');
end;

procedure TestArraysCatSnippets.TestLastIndexOfByte;
var
  B0, B2, B6: TBytes;
begin
  SetLength(B0, 0);
  B2 := TBytes.Create(3, 3);
  B6 := TBytes.Create(1, 1, 2, 3, 5, 8);
  CheckEquals(-1, LastIndexOfByte(3, B0), '#3a');
  CheckEquals(1, LastIndexOfByte(3, B2), '#3b');
  CheckEquals(3, LastIndexOfByte(3, B6), '#3c');
  CheckEquals(-1, LastIndexOfByte(1, B0), '#1a');
  CheckEquals(-1, LastIndexOfByte(1, B2), '#1b');
  CheckEquals(1, LastIndexOfByte(1, B6), '#1c');
  CheckEquals(-1, LastIndexOfByte(8, B0), '#8a');
  CheckEquals(-1, LastIndexOfByte(8, B2), '#8b');
  CheckEquals(5, LastIndexOfByte(8, B6), '#8c');
end;

procedure TestArraysCatSnippets.TestPopByteArray;
var
  A, E: TBytes;
  R: Byte;
begin
  // pop value from end of multi-value array
  A := TBytes.Create(1, 2, 3);
  E := TBytes.Create(1, 2);
  R := PopByteArray(A);
  CheckTrue(ByteArraysEqual(E, A), '#1a');
  CheckEquals(2, Length(A), '#1b');
  CheckEquals(3, R, '#1c');
  // pop value from end of single value array
  A := TBytes.Create(1);
  SetLength(E, 0);
  R := PopByteArray(A);
  CheckTrue(ByteArraysEqual(E, A), '#2a');
  CheckEquals(0, Length(A), '#2b');
  CheckEquals(1, R, '#2c');
  // check assertion failure for empty array
  CheckException(PopByteArray_AssertionFailure, EAssertionFailed, 'Assert');
end;

procedure TestArraysCatSnippets.TestPushByteArray;
var
  A, E: TBytes;
begin
  // push value to end of non-empty array
  A := TBytes.Create(1, 2, 3);
  E := TBytes.Create(1, 2, 3, 42);
  PushByteArray(42, A);
  CheckTrue(ByteArraysEqual(E, A), '#1a');
  CheckEquals(4, Length(A), '#1b');
  // push value to end of empty array
  SetLength(A, 0);
  E := TBytes.Create(56);
  PushByteArray(56, A);
  CheckTrue(ByteArraysEqual(E, A), '#2a');
  CheckEquals(1, Length(A), '#2b');
end;

procedure TestArraysCatSnippets.TestReverseByteArray;
var
  A0, A1, A2, A6, A7, A4Sym, A5Sym: TBytes;
  R0, R1, R2, R6, R7: TBytes;
begin
  SetLength(A0, 0);
  SetLength(R0, 0);
  A1 := TBytes.Create(42);
  R1 := TBytes.Create(42);
  A2 := TBytes.Create(42,56);
  R2 := TBytes.Create(56,42);
  A6 := TBytes.Create(1, 1, 2, 3, 5, 8);
  R6 := TBytes.Create(8, 5, 3, 2, 1, 1);
  A7 := TBytes.Create(0, 1, 1, 2, 3, 5, 8);
  R7 := TBytes.Create(8, 5, 3, 2, 1, 1, 0);
  A4Sym := TBytes.Create(3, 5, 5, 3);
  A5Sym := TBytes.Create(3, 5, 8, 5, 3);
  CheckTrue(ByteArraysEqual(R0, ReverseByteArray(A0)), '#0');
  CheckTrue(ByteArraysEqual(R1, ReverseByteArray(A1)), '#1');
  CheckTrue(ByteArraysEqual(R2, ReverseByteArray(A2)), '#2');
  CheckTrue(ByteArraysEqual(R6, ReverseByteArray(A6)), '#6');
  CheckTrue(ByteArraysEqual(R7, ReverseByteArray(A7)), '#7');
  CheckTrue(ByteArraysEqual(A4Sym, ReverseByteArray(A4Sym)), '#4 sym');
  CheckTrue(ByteArraysEqual(A5Sym, ReverseByteArray(A5Sym)), '#5 sym');
end;

procedure TestArraysCatSnippets.TestShiftByteArray;
var
  A, E: TBytes;
  R: Byte;
begin
  // pop value from start of multi-value array
  A := TBytes.Create(1, 2, 3);
  E := TBytes.Create(2, 3);
  R := ShiftByteArray(A);
  CheckTrue(ByteArraysEqual(E, A), '#1a');
  CheckEquals(2, Length(A), '#1b');
  CheckEquals(1, R, '#1c');
  // pop value from start of single value array
  A := TBytes.Create(42);
  SetLength(E, 0);
  R := ShiftByteArray(A);
  CheckTrue(ByteArraysEqual(E, A), '#2a');
  CheckEquals(0, Length(A), '#2b');
  CheckEquals(42, R, '#2c');
  // check assertion failure for empty array
  CheckException(ShiftByteArray_AssertionFailure, EAssertionFailed, 'Assert');
end;

procedure TestArraysCatSnippets.TestSliceByteArray;
var
  A, R, E: TBytes;
begin
  // test zero length array => always returns empty array
  SetLength(A, 0);
  SetLength(E, 0);
  R := SliceByteArray(A, 0, 0);
  CheckTrue(ByteArraysEqual(E, R), '#1a');
  R := SliceByteArray(A, -3, -3);
  CheckTrue(ByteArraysEqual(E, R), '#1b');
  R := SliceByteArray(A, 2, 29);
  CheckTrue(ByteArraysEqual(E, R), '#1c');

  // test normal cases
  A := TBytes.Create(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  R := SliceByteArray(A, 3, 5);
  E := TBytes.Create(4, 5, 6, 7, 8);
  CheckTrue(ByteArraysEqual(E, R), '#2a');
  R := SliceByteArray(A, 0, 1);
  E := TBytes.Create(1);
  CheckTrue(ByteArraysEqual(E, R), '#2b');
  R := SliceByteArray(A, 7, 3);
  E := TBytes.Create(8, 9, 10);
  CheckTrue(ByteArraysEqual(E, R), '#2c');
  R := SliceByteArray(A, 0, 10);
  E := TBytes.Create(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  CheckTrue(ByteArraysEqual(E, R), '#2d');

  // test parameter out of bounds cases
  // length = 0 => return empty array
  A := TBytes.Create(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  R := SliceByteArray(A, 3, 0);
  SetLength(E, 0);
  CheckTrue(ByteArraysEqual(E, R), '#3a');
  // start < 0 => start = 0
  R := SliceByteArray(A, -12, 2);
  E := TBytes.Create(1, 2);
  CheckTrue(ByteArraysEqual(E, R), '#3b');
  // length < 0 => length = 0 => return empty array
  R := SliceByteArray(A, 3, -12);
  SetLength(E, 0);
  CheckTrue(ByteArraysEqual(E, R), '#3c');
  // start > length of array => return empty array
  R := SliceByteArray(A, 11, 4);
  SetLength(E, 0);
  CheckTrue(ByteArraysEqual(E, R), '#3d');
  // length goes beyond end of array => return from start to end of array
  R := SliceByteArray(A, 8, 100);
  E := TBytes.Create(9, 10);
  CheckTrue(ByteArraysEqual(E, R), '#3e');
end;

procedure TestArraysCatSnippets.TestStringListToArray;
var
  SL: TStringList;
  A, E: TStringDynArray;
begin
  SL := TStringList.Create;
  try
    SL.Clear;
    SetLength(E, 0);
    A := StringListToArray(SL);
    CheckTrue(StringArraysEqual(E, A), '#1');

    SL.Clear;
    SL.Add('one');
    A := StringListToArray(SL);
    E := TStringDynArray.Create('one');
    CheckTrue(StringArraysEqual(E, A), '#2');

    SL.Clear;
    SL.Add('one');
    SL.Add('two');
    SL.Add('three');
    A := StringListToArray(SL);
    E := TStringDynArray.Create('one', 'two', 'three');
    CheckTrue(StringArraysEqual(E, A), '#3');
  finally
    SL.Free;
  end;
end;

procedure TestArraysCatSnippets.TestUnShiftByteArray;
var
  A, E: TBytes;
begin
  // push value to start of non-empty array
  A := TBytes.Create(1, 2, 3);
  E := TBytes.Create(42, 1, 2, 3);
  UnShiftByteArray(42, A);
  CheckTrue(ByteArraysEqual(E, A), '#1a');
  CheckEquals(4, Length(A), '#1b');
  // push value to start of empty array
  SetLength(A, 0);
  E := TBytes.Create(56);
  UnShiftByteArray(56, A);
  CheckTrue(ByteArraysEqual(E, A), '#2a');
  CheckEquals(1, Length(A), '#2b');
end;

initialization

IntegerCompareFn := function (const Left, Right: Integer): Boolean
  begin
    Result := Left = Right;
  end;

StringCompareFn := function (const Left, Right: string): Boolean
  begin
    Result := SameStr(Left, Right);
  end;

IntegerComparisonFn := function (const Left, Right: Integer): Integer
  begin
    Result := Left - Right;
  end;

StringComparisonFn := function (const Left, Right: string): Integer
  begin
    Result := CompareStr(Left, Right);
  end;


  // Register any test cases with the test runner
RegisterTest(TestTArrayUtils.Suite);
RegisterTest(TestArraysCatSnippets.Suite);

end.

