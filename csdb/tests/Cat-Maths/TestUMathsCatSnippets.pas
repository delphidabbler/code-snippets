unit TestUMathsCatSnippets;

interface

uses
  Types, Math, TestFramework, UMathsCatSnippets;

type
  TestMathsCatSnippets = class(TTestCase)
  private
    procedure StretchRect_A_Except1;
    procedure StretchRect_A_Except2;
    procedure StretchRect_B_Except;
  published
    procedure TestDigitCount;
    procedure TestDigitCount2;
    procedure TestDigitCountR;
    procedure TestDigitSum;
    procedure TestGCD;  // required by LCD
    procedure TestGCD2;
    procedure TestLCD;
    procedure TestIsPrime;
    procedure TestIsPrime2;
    procedure TestMid_Integer;
    procedure TestMid_Int64;
    procedure TestMid_Single;
    procedure TestMid_Double;
    procedure TestMid_Extended;
    procedure TestResizeRect_B; // required by ResizeRect_A
    procedure TestResizeRect_A;
    procedure TestStretchRect_A;  // required by StretchRect_B
    procedure TestStretchRect_B;
    procedure TestMinOfArray_Integer;
    procedure TestMinOfArray_Int64;
    procedure TestMinOfArray_Single;
    procedure TestMinOfArray_Double;
    procedure TestMinOfArray_Extended;
    procedure TestMaxOfArray_Integer;
    procedure TestMaxOfArray_Int64;
    procedure TestMaxOfArray_Single;
    procedure TestMaxOfArray_Double;
    procedure TestMaxOfArray_Extended;
  end;

implementation

uses
  SysUtils;

const
  First100Primes: array[1..100] of Int64 = (
    2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
    73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151,
    157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233,
    239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317,
    331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419,
    421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503,
    509, 521, 523, 541
  );

function RectWidth(const Rect: TRect): Integer;
begin
  Result := Rect.Right - Rect.Left;
end;

function RectHeight(const Rect: TRect): Integer;
begin
  Result := Rect.Bottom - Rect.Top;
end;

{ TestMathsCatSnippets }

procedure TestMathsCatSnippets.StretchRect_A_Except1;
var
  R0, R1: TRect;
begin
  R0 := Rect(10, 40, 50, 100);
  R1 := StretchRect(R0, 1234567890.0, 0.5);
end;

procedure TestMathsCatSnippets.StretchRect_A_Except2;
var
  R0, R1: TRect;
begin
  R0 := Rect(10, 40, 50, 100);
  R1 := StretchRect(R0, 0.5, 1234567890.0);
end;

procedure TestMathsCatSnippets.StretchRect_B_Except;
var
  R0, R1: TRect;
begin
  R0 := Rect(10, 40, 50, 100);
  R1 := StretchRect(R0, 1234567890.0);
end;

procedure TestMathsCatSnippets.TestDigitCount;
begin
  CheckEquals(1, DigitCount(0), 'DigitCount(0)');
  CheckEquals(1, DigitCount(1), 'DigitCount(1)');
  CheckEquals(1, DigitCount(9), 'DigitCount(9)');
  CheckEquals(2, DigitCount(12), 'DigitCount(12)');
  CheckEquals(6, DigitCount(123456), 'DigitCount(123456)');
  CheckEquals(10, DigitCount(1234567890), 'DigitCount(1234567890)');
  CheckEquals(1, DigitCount(-1), 'DigitCount(-1)');
  CheckEquals(5, DigitCount(-12345), 'DigitCount(-12345)');
end;

procedure TestMathsCatSnippets.TestDigitCount2;
begin
  CheckEquals(1, DigitCount2(0), 'DigitCount2(0)');
  CheckEquals(1, DigitCount2(1), 'DigitCount2(1)');
  CheckEquals(1, DigitCount2(9), 'DigitCount2(9)');
  CheckEquals(2, DigitCount2(12), 'DigitCount2(12)');
  CheckEquals(6, DigitCount2(123456), 'DigitCount2(123456)');
  CheckEquals(10, DigitCount2(1234567890), 'DigitCount2(1234567890)');
  CheckEquals(1, DigitCount2(-1), 'DigitCount2(-1)');
  CheckEquals(5, DigitCount2(-12345), 'DigitCount2(-12345)');
end;

procedure TestMathsCatSnippets.TestDigitCountR;
begin
  CheckEquals(1, DigitCountR(0), 'DigitCountR(0)');
  CheckEquals(1, DigitCountR(1), 'DigitCountR(1)');
  CheckEquals(1, DigitCountR(9), 'DigitCountR(9)');
  CheckEquals(2, DigitCountR(12), 'DigitCountR(12)');
  CheckEquals(6, DigitCountR(123456), 'DigitCountR(123456)');
  CheckEquals(10, DigitCountR(1234567890), 'DigitCountR(1234567890)');
  CheckEquals(1, DigitCountR(-1), 'DigitCountR(-1)');
  CheckEquals(5, DigitCountR(-12345), 'DigitCountR(-12345)');
end;

procedure TestMathsCatSnippets.TestDigitSum;
begin
  CheckEquals(0, DigitSum(0), 'DigitSum(0)');
  CheckEquals(1, DigitSum(1), 'DigitSum(1)');
  CheckEquals(9, DigitSum(9), 'DigitSum(9)');
  CheckEquals(3, DigitSum(12), 'DigitSum(12)');
  CheckEquals(3, DigitSum(102), 'DigitSum(102)');
  CheckEquals(3, DigitSum(120), 'DigitSum(120)');
  CheckEquals(19, DigitSum(5743), 'DigitSum(5743)');
  CheckEquals(45, DigitSum(987654321), 'DigitSum(987654321)');
  CheckEquals(45, DigitSum(9876543210), 'DigitSum(9876543210)');
  CheckEquals(-19, DigitSum(-5743), 'DigitSum(-5743)');
  CheckEquals(-1, DigitSum(-1), 'DigitSum(-1)');
  CheckEquals(-9, DigitSum(-9), 'DigitSum(-9)');
end;

procedure TestMathsCatSnippets.TestGCD;
begin
  CheckEquals(1, GCD(1,1), 'GCD(1,1)');
  CheckEquals(6, GCD(12,6), 'GCD(12,6)');
  CheckEquals(1, GCD(13,7), 'GCD(13,7)');
  CheckEquals(7, GCD(35,7), 'GCD(35,7)');
  CheckEquals(41, GCD(41,41), 'GCD(41,41)');
  CheckEquals(24, GCD(144,120), 'GCD(144,120)');
  CheckEquals(2, GCD(10, 6), 'GCD(10, 6)');
  CheckEquals(2, GCD(-10, 6), 'GCD(-10, 6)');
  CheckEquals(1, GCD(-10, -9), 'GCD(-10, -9)');
  CheckEquals(5, GCD(-10, -5), 'GCD(-10, -5)');
  CheckEquals(41, GCD(-41, -41), 'GCD(-41, -41)');
  CheckEquals(10, GCD(10, -10), 'GCD(10, -10)');
end;

procedure TestMathsCatSnippets.TestGCD2;
begin
  CheckEquals(1, GCD2(1,1), 'GCD2(1,1)');
  CheckEquals(6, GCD2(12,6), 'GCD2(12,6)');
  CheckEquals(1, GCD2(13,7), 'GCD2(13,7)');
  CheckEquals(7, GCD2(35,7), 'GCD2(35,7)');
  CheckEquals(41, GCD2(41,41), 'GCD2(41,41)');
  CheckEquals(24, GCD2(144,120), 'GCD2(144,120)');
  CheckEquals(2, GCD2(10, 6), 'GCD2(10, 6)');
  CheckEquals(2, GCD2(-10, 6), 'GCD2(-10, 6)');
  CheckEquals(1, GCD2(-10, -9), 'GCD2(-10, -9)');
  CheckEquals(5, GCD2(-10, -5), 'GCD2(-10, -5)');
  CheckEquals(41, GCD2(-41,-41), 'GCD2(-41,-41)');
  CheckEquals(10, GCD2(10, -10), 'GCD2(10, -10)');
end;

procedure TestMathsCatSnippets.TestIsPrime;
var
  AllValues: array[1..542] of Boolean;
  I, PrimeIdx: Integer;
  Res: Boolean;
begin
  for I := Low(AllValues) to High(AllValues) do
    AllValues[I] := False;
  for PrimeIdx := Low(First100Primes) to High(First100Primes) do
    AllValues[First100Primes[PrimeIdx]] := True;
  for I := Low(AllValues) to High(AllValues) do
  begin
    Res := IsPrime(I);
    CheckEquals(AllValues[I], Res, Format('IsPrime(%d)', [I]));
  end;
end;

procedure TestMathsCatSnippets.TestIsPrime2;
var
  AllValues: array[1..542] of Boolean;
  I, PrimeIdx: Integer;
  Res: Boolean;
begin
  for I := Low(AllValues) to High(AllValues) do
    AllValues[I] := False;
  for PrimeIdx := Low(First100Primes) to High(First100Primes) do
    AllValues[First100Primes[PrimeIdx]] := True;
  for I := Low(AllValues) to High(AllValues) do
  begin
    Res := IsPrime2(I);
    CheckEquals(AllValues[I], Res, Format('IsPrime2(%d)', [I]));
  end;
end;

procedure TestMathsCatSnippets.TestLCD;
begin
  CheckEquals(26, LCD(2, 13), 'LCD(2, 13)');
  CheckEquals(36, LCD(12, 18), 'LCD(12, 18)');
  CheckEquals(36, LCD(-12, 18), 'LCD(-12, 18)');
  CheckEquals(36, LCD(12, -18), 'LCD(12, -18)');
  CheckEquals(36, LCD(-12, -18), 'LCD(-12, -18)');
  CheckEquals(9, LCD(1, 9), 'LCD(1, 9)');
  CheckEquals(208, LCD(16, 52), 'LCD(16, 52)');
  CheckEquals(208, LCD(52, 16), 'LCD(52, 16)');
  CheckEquals(12, LCD(12, 12), 'LCD(12, 12)');
  CheckEquals(60, LCD(12, 15), 'LCD(12, 15)');
  CheckEquals(36, LCD(18, 12), 'LCD(18, 12)');
  CheckEquals(30, LCD(15, 6), 'LCD(15, 6)');
  CheckEquals(30, LCD(15, 10), 'LCD(15, 10)');
  CheckEquals(9, LCD(-9, -9), 'LCD(-9, -9)');
end;

procedure TestMathsCatSnippets.TestMaxOfArray_Double;
var
  A: TDoubleDynArray;
  N: Double;
begin
  A := TDoubleDynArray.Create(3.0, 6.0, 42.3, 2.4, 8.876);
  N := 42.3;
  Check(SameValue(N, MaxOfArray(A)), 'Test 1');
  A := TDoubleDynArray.Create(42.12);
  N := 42.12;
  Check(SameValue(N, MaxOfArray(A)), 'Test 2');
  A := TDoubleDynArray.Create(-3.142, -6.284, -42.7, -8.789);
  N := -3.142;
  Check(SameValue(N, MaxOfArray(A)), 'Test 3');
  A := TDoubleDynArray.Create(6.0, 42.0, 42.0, 6.0);
  N := 42.0;
  Check(SameValue(N, MaxOfArray(A)), 'Test 4');
  A := TDoubleDynArray.Create(52.25, 6.6, 42.42, 8.8);
  N := 52.25;
  Check(SameValue(N, MaxOfArray(A)), 'Test 5');
end;

procedure TestMathsCatSnippets.TestMaxOfArray_Extended;
type
  TExtendedDynArray = array of Extended;
var
  A: TExtendedDynArray;
  N: Extended;
begin
  A := TExtendedDynArray.Create(3.0, 6.0, 42.3, 2.4, 8.876);
  N := 42.3;
  Check(SameValue(N, MaxOfArray(A)), 'Test 1');
  A := TExtendedDynArray.Create(42.12);
  N := 42.12;
  Check(SameValue(N, MaxOfArray(A)), 'Test 2');
  A := TExtendedDynArray.Create(-3.142, -6.284, -42.7, -8.789);
  N := -3.142;
  Check(SameValue(N, MaxOfArray(A)), 'Test 3');
  A := TExtendedDynArray.Create(6.0, 42.0, 42.0, 6.0);
  N := 42.0;
  Check(SameValue(N, MaxOfArray(A)), 'Test 4');
  A := TExtendedDynArray.Create(52.25, 6.6, 42.42, 8.8);
  N := 52.25;
  Check(SameValue(N, MaxOfArray(A)), 'Test 5');
end;

procedure TestMathsCatSnippets.TestMaxOfArray_Int64;
var
  A: TInt64DynArray;
begin
  A := TInt64DynArray.Create(3, 6, 42, 2, 8);
  CheckEquals(42, MaxOfArray(A), 'Test 1');
  A := TInt64DynArray.Create(420);
  CheckEquals(420, MaxOfArray(A), 'Test 2');
  A := TInt64DynArray.Create(-3, -6, -2, -8);
  CheckEquals(-2, MaxOfArray(A), 'Test 3');
  A := TInt64DynArray.Create(6, 42, 42, 6);
  CheckEquals(42, MaxOfArray(A), 'Test 4');
  A := TInt64DynArray.Create(56, 6, 42, 8);
  CheckEquals(56, MaxOfArray(A), 'Test 5');
end;

procedure TestMathsCatSnippets.TestMaxOfArray_Integer;
var
  A: TIntegerDynArray;
begin
  A := TIntegerDynArray.Create(3, 6, 42, 2, 8);
  CheckEquals(42, MaxOfArray(A), 'Test 1');
  A := TIntegerDynArray.Create(420);
  CheckEquals(420, MaxOfArray(A), 'Test 2');
  A := TIntegerDynArray.Create(-3, -6, -2, -8);
  CheckEquals(-2, MaxOfArray(A), 'Test 3');
  A := TIntegerDynArray.Create(6, 42, 42, 6);
  CheckEquals(42, MaxOfArray(A), 'Test 4');
  A := TIntegerDynArray.Create(56, 6, 42, 8);
  CheckEquals(56, MaxOfArray(A), 'Test 5');
end;

procedure TestMathsCatSnippets.TestMaxOfArray_Single;
var
  A: TSingleDynArray;
  N: Single;
begin
  A := TSingleDynArray.Create(3.0, 6.0, 42.3, 2.4, 8.876);
  N := 42.3;
  Check(SameValue(N, MaxOfArray(A)), 'Test 1');
  A := TSingleDynArray.Create(42.12);
  N := 42.12;
  Check(SameValue(N, MaxOfArray(A)), 'Test 2');
  A := TSingleDynArray.Create(-3.142, -6.284, -42.7, -8.789);
  N := -3.142;
  Check(SameValue(N, MaxOfArray(A)), 'Test 3');
  A := TSingleDynArray.Create(6.0, 42.0, 42.0, 6.0);
  N := 42.0;
  Check(SameValue(N, MaxOfArray(A)), 'Test 4');
  A := TSingleDynArray.Create(52.25, 6.6, 42.42, 8.8);
  N := 52.25;
  Check(SameValue(N, MaxOfArray(A)), 'Test 5');
end;

procedure TestMathsCatSnippets.TestMid_Double;
var
  A, B, C, D, E: Double;
begin
  A := 0.0; B := MaxDouble; C := -MaxDouble; D := 42.5623143; E := -42.5623152;
  Check(SameValue(A, Mid(A, B, C)), 'Mid(A, B, C)');
  Check(SameValue(A, Mid(B, A, C)), 'Mid(B, A, C)');
  Check(SameValue(A, Mid(A, C, B)), 'Mid(A, C, B)');
  Check(SameValue(A, Mid(B, C, A)), 'Mid(B, C, A)');
  Check(SameValue(D, Mid(A, B, D)), 'Mid(A, B, D)');
  Check(SameValue(E, Mid(A, C, E)), 'Mid(A, C, E)');
  Check(SameValue(D, Mid(D, D, D)), 'Mid(D, D, D)');
  Check(SameValue(D, Mid(D, D, E)), 'Mid(D, D, E)');
  Check(SameValue(D, Mid(D, E, D)), 'Mid(D, E, D)');
  Check(SameValue(D, Mid(E, D, D)), 'Mid(E, D, D)');
  Check(SameValue(E, Mid(D, E, E)), 'Mid(D, E, E)');
  Check(SameValue(E, Mid(E, D, E)), 'Mid(E, D, E)');
  Check(SameValue(E, Mid(E, E, D)), 'Mid(E, E, D)');
end;

procedure TestMathsCatSnippets.TestMid_Extended;
var
  A, B, C, D, E: Extended;
begin
  A := 0.0; B := MaxExtended; C := -MaxExtended; D := 42.56231; E := -42.56231;
  Check(SameValue(A, Mid(A, B, C)), 'Mid(A, B, C)');
  Check(SameValue(A, Mid(B, A, C)), 'Mid(B, A, C)');
  Check(SameValue(A, Mid(A, C, B)), 'Mid(A, C, B)');
  Check(SameValue(A, Mid(B, C, A)), 'Mid(B, C, A)');
  Check(SameValue(D, Mid(A, B, D)), 'Mid(A, B, D)');
  Check(SameValue(E, Mid(A, C, E)), 'Mid(A, C, E)');
  Check(SameValue(D, Mid(D, D, D)), 'Mid(D, D, D)');
  Check(SameValue(D, Mid(D, D, E)), 'Mid(D, D, E)');
  Check(SameValue(D, Mid(D, E, D)), 'Mid(D, E, D)');
  Check(SameValue(D, Mid(E, D, D)), 'Mid(E, D, D)');
  Check(SameValue(E, Mid(D, E, E)), 'Mid(D, E, E)');
  Check(SameValue(E, Mid(E, D, E)), 'Mid(E, D, E)');
  Check(SameValue(E, Mid(E, E, D)), 'Mid(E, E, D)');
end;

procedure TestMathsCatSnippets.TestMid_Int64;
var
  A, B, C, D, E: Int64;
begin
  A := 0; B := High(Int64); C := Low(Int64); D := 42; E := -42;
  CheckEquals(A, Mid(A, B, C), 'Mid(A, B, C)');
  CheckEquals(A, Mid(B, A, C), 'Mid(B, A, C)');
  CheckEquals(A, Mid(A, C, B), 'Mid(A, C, B)');
  CheckEquals(A, Mid(B, C, A), 'Mid(B, C, A)');
  CheckEquals(D, Mid(A, B, D), 'Mid(A, B, D)');
  CheckEquals(E, Mid(A, C, E), 'Mid(A, C, E)');
  CheckEquals(D, Mid(D, D, D), 'Mid(D, D, D)');
  CheckEquals(D, Mid(D, D, E), 'Mid(D, D, E)');
  CheckEquals(D, Mid(D, E, D), 'Mid(D, E, D)');
  CheckEquals(D, Mid(E, D, D), 'Mid(E, D, D)');
  CheckEquals(E, Mid(D, E, E), 'Mid(D, E, E)');
  CheckEquals(E, Mid(E, D, E), 'Mid(E, D, E)');
  CheckEquals(E, Mid(E, E, D), 'Mid(E, E, D)');
end;

procedure TestMathsCatSnippets.TestMid_Integer;
var
  A, B, C, D, E: Integer;
begin
  A := 0; B := High(Integer); C := Low(Integer); D := 42; E := -42;
  CheckEquals(A, Mid(A, B, C), 'Mid(A, B, C)');
  CheckEquals(A, Mid(B, A, C), 'Mid(B, A, C)');
  CheckEquals(A, Mid(A, C, B), 'Mid(A, C, B)');
  CheckEquals(A, Mid(B, C, A), 'Mid(B, C, A)');
  CheckEquals(D, Mid(A, B, D), 'Mid(A, B, D)');
  CheckEquals(E, Mid(A, C, E), 'Mid(A, C, E)');
  CheckEquals(D, Mid(D, D, D), 'Mid(D, D, D)');
  CheckEquals(D, Mid(D, D, E), 'Mid(D, D, E)');
  CheckEquals(D, Mid(D, E, D), 'Mid(D, E, D)');
  CheckEquals(D, Mid(E, D, D), 'Mid(E, D, D)');
  CheckEquals(E, Mid(D, E, E), 'Mid(D, E, E)');
  CheckEquals(E, Mid(E, D, E), 'Mid(E, D, E)');
  CheckEquals(E, Mid(E, E, D), 'Mid(E, E, D)');
end;

procedure TestMathsCatSnippets.TestMid_Single;
var
  A, B, C, D, E: Single;
begin
  A := 0.0; B := MaxSingle; C := -MaxSingle; D := 42.56231; E := -42.56231;
  Check(SameValue(A, Mid(A, B, C)), 'Mid(A, B, C)');
  Check(SameValue(A, Mid(B, A, C)), 'Mid(B, A, C)');
  Check(SameValue(A, Mid(A, C, B)), 'Mid(A, C, B)');
  Check(SameValue(A, Mid(B, C, A)), 'Mid(B, C, A)');
  Check(SameValue(D, Mid(A, B, D)), 'Mid(A, B, D)');
  Check(SameValue(E, Mid(A, C, E)), 'Mid(A, C, E)');
  Check(SameValue(D, Mid(D, D, D)), 'Mid(D, D, D)');
  Check(SameValue(D, Mid(D, D, E)), 'Mid(D, D, E)');
  Check(SameValue(D, Mid(D, E, D)), 'Mid(D, E, D)');
  Check(SameValue(D, Mid(E, D, D)), 'Mid(E, D, D)');
  Check(SameValue(E, Mid(D, E, E)), 'Mid(D, E, E)');
  Check(SameValue(E, Mid(E, D, E)), 'Mid(E, D, E)');
  Check(SameValue(E, Mid(E, E, D)), 'Mid(E, E, D)');
end;

procedure TestMathsCatSnippets.TestMinOfArray_Double;
var
  A: TDoubleDynArray;
  N: Double;
begin
  A := TDoubleDynArray.Create(3.0, 6.0, 42.3, 2.4, 8.876);
  N := 2.4;
  Check(SameValue(N, MinOfArray(A)), 'Test 1');
  A := TDoubleDynArray.Create(42.12);
  N := 42.12;
  Check(SameValue(N, MinOfArray(A)), 'Test 2');
  A := TDoubleDynArray.Create(3.142, 6.284, 42.7, 2.2, -8.789);
  N := -8.789;
  Check(SameValue(N, MinOfArray(A)), 'Test 3');
  A := TDoubleDynArray.Create(6.0, 42.0, 42.0, 6.0);
  N := 6.0;
  Check(SameValue(N, MinOfArray(A)), 'Test 4');
  A := TDoubleDynArray.Create(2.2, 6.6, 42.42, 8.8);
  N := 2.2;
  Check(SameValue(N, MinOfArray(A)), 'Test 5');
end;

procedure TestMathsCatSnippets.TestMinOfArray_Extended;
type
  TExtendedDynArray = array of Extended;
var
  A: TExtendedDynArray;
  N: Extended;
begin
  A := TExtendedDynArray.Create(3.0, 6.0, 42.3, 2.4, 8.876);
  N := 2.4;
  Check(SameValue(N, MinOfArray(A)), 'Test 1');
  A := TExtendedDynArray.Create(42.12);
  N := 42.12;
  Check(SameValue(N, MinOfArray(A)), 'Test 2');
  A := TExtendedDynArray.Create(3.142, 6.284, 42.7, 2.2, -8.789);
  N := -8.789;
  Check(SameValue(N, MinOfArray(A)), 'Test 3');
  A := TExtendedDynArray.Create(6.0, 42.0, 42.0, 6.0);
  N := 6.0;
  Check(SameValue(N, MinOfArray(A)), 'Test 4');
  A := TExtendedDynArray.Create(2.2, 6.6, 42.42, 8.8);
  N := 2.2;
  Check(SameValue(N, MinOfArray(A)), 'Test 5');
end;

procedure TestMathsCatSnippets.TestMinOfArray_Int64;
var
  A: TInt64DynArray;
begin
  A := TInt64DynArray.Create(3, 6, 42, 2, 8);
  CheckEquals(2, MinOfArray(A), 'Test 1');
  A := TInt64DynArray.Create(42);
  CheckEquals(42, MinOfArray(A), 'Test 2');
  A := TInt64DynArray.Create(3, 6, 42, 2, -8);
  CheckEquals(-8, MinOfArray(A), 'Test 3');
  A := TInt64DynArray.Create(6, 42, 42, 6);
  CheckEquals(6, MinOfArray(A), 'Test 4');
  A := TInt64DynArray.Create(2, 6, 42, 8);
  CheckEquals(2, MinOfArray(A), 'Test 5');
end;

procedure TestMathsCatSnippets.TestMinOfArray_Integer;
var
  A: TIntegerDynArray;
begin
  A := TIntegerDynArray.Create(3, 6, 42, 2, 8);
  CheckEquals(2, MinOfArray(A), 'Test 1');
  A := TIntegerDynArray.Create(42);
  CheckEquals(42, MinOfArray(A), 'Test 2');
  A := TIntegerDynArray.Create(3, 6, 42, 2, -8);
  CheckEquals(-8, MinOfArray(A), 'Test 3');
  A := TIntegerDynArray.Create(6, 42, 42, 6);
  CheckEquals(6, MinOfArray(A), 'Test 4');
  A := TIntegerDynArray.Create(2, 6, 42, 8);
  CheckEquals(2, MinOfArray(A), 'Test 5');
end;

procedure TestMathsCatSnippets.TestMinOfArray_Single;
var
  A: TSingleDynArray;
  N: Single;
begin
  A := TSingleDynArray.Create(3.0, 6.0, 42.3, 2.4, 8.876);
  N := 2.4;
  Check(SameValue(N, MinOfArray(A)), 'Test 1');
  A := TSingleDynArray.Create(42.12);
  N := 42.12;
  Check(SameValue(N, MinOfArray(A)), 'Test 2');
  A := TSingleDynArray.Create(3.142, 6.284, 42.7, 2.2, -8.789);
  N := -8.789;
  Check(SameValue(N, MinOfArray(A)), 'Test 3');
  A := TSingleDynArray.Create(6.0, 42.0, 42.0, 6.0);
  N := 6.0;
  Check(SameValue(N, MinOfArray(A)), 'Test 4');
  A := TSingleDynArray.Create(2.2, 6.6, 42.42, 8.8);
  N := 2.2;
  Check(SameValue(N, MinOfArray(A)), 'Test 5');
end;

procedure TestMathsCatSnippets.TestResizeRect_A;
var
  R: Types.TRect;
  S: Types.TSize;
begin
  R := Rect(12, 24, 36, 48);
  S.cx := 20; S.cy := 30;
  R := ResizeRect(R, S);
  CheckEquals(12, R.Left, '1: R.Left');
  CheckEquals(12 + 20, R.Right, '1: R.Right');
  CheckEquals(20, RectWidth(R), '1: RectWidth');
  CheckEquals(24, R.Top, '1: R.Top');
  CheckEquals(24 + 30, R.Bottom, '1: R.Bottom');
  CheckEquals(30, RectHeight(R), '1: RectHeight');
  R := Rect(12, 24, 36, 48);
  S.cx := 0;
  S.cy := 0;
  R := ResizeRect(R, S);
  CheckEquals(12, R.Left, '2: R.Left');
  CheckEquals(12 + 0, R.Right, '2: R.Right');
  CheckEquals(0, RectWidth(R), '2: RectWidth');
  CheckEquals(24, R.Top, '2: R.Top');
  CheckEquals(24 + 0, R.Bottom, '2: R.Bottom');
  CheckEquals(0, RectHeight(R), '2: RectHeight');
  R := Rect(12, 24, 36, 48);
  S.cx := -3;
  S.cy := -4;
  R := ResizeRect(R, S);
  CheckEquals(12, R.Left, '3: R.Left');
  CheckEquals(12 - 3, R.Right, '3: R.Right');
  CheckEquals(-3, RectWidth(R), '3: RectWidth');
  CheckEquals(24, R.Top, '3: R.Top');
  CheckEquals(24 - 4, R.Bottom, '3: R.Bottom');
  CheckEquals(-4, RectHeight(R), '3: RectHeight');
end;

procedure TestMathsCatSnippets.TestResizeRect_B;
var
  R: Types.TRect;
  W, H: Integer;
begin
  R := Rect(12, 24, 36, 48);
  W := 20; H := 30;
  R := ResizeRect(R, W, H);
  CheckEquals(12, R.Left, '1: R.Left');
  CheckEquals(12 + 20, R.Right, '1: R.Right');
  CheckEquals(20, RectWidth(R), '1: RectWidth');
  CheckEquals(24, R.Top, '1: R.Top');
  CheckEquals(24 + 30, R.Bottom, '1: R.Bottom');
  CheckEquals(30, RectHeight(R), '1: RectHeight');
  R := Rect(12, 24, 36, 48);
  W := 0;
  H := 0;
  R := ResizeRect(R, W, H);
  CheckEquals(12, R.Left, '2: R.Left');
  CheckEquals(12 + 0, R.Right, '2: R.Right');
  CheckEquals(0, RectWidth(R), '2: RectWidth');
  CheckEquals(24, R.Top, '2: R.Top');
  CheckEquals(24 + 0, R.Bottom, '2: R.Bottom');
  CheckEquals(0, RectHeight(R), '2: RectHeight');
  R := Rect(12, 24, 36, 48);
  W := -3;
  H := -4;
  R := ResizeRect(R, W, H);
  CheckEquals(12, R.Left, '3: R.Left');
  CheckEquals(12 - 3, R.Right, '3: R.Right');
  CheckEquals(-3, RectWidth(R), '3: RectWidth');
  CheckEquals(24, R.Top, '3: R.Top');
  CheckEquals(24 - 4, R.Bottom, '3: R.Bottom');
  CheckEquals(-4, RectHeight(R), '3: RectHeight');
end;

procedure TestMathsCatSnippets.TestStretchRect_A;
var
  R0, R1, R2: TRect;
begin
  R0 := Rect(10, 40, 50, 100);
  R1 := StretchRect(R0, 1.5, 0.5);
  CheckEquals(10, R1.Left, 'R1.Left');
  CheckEquals(70, R1.Right, 'R1.Right');
  CheckEquals(40, R1.Top, 'R1.Top');
  CheckEquals(70, R1.Bottom, '1: R1.Bottom');
  R2 := StretchRect(R0, -1.5, -0.5);
  CheckEquals(10, R2.Left, 'R2.Left');
  CheckEquals(-50, R2.Right, '2: R2.Right');
  CheckEquals(40, R2.Top, 'R2.Top');
  CheckEquals(10, R2.Bottom, '2: R2.Bottom');
  CheckException(StretchRect_A_Except1, EOverflow, 'Large X scaling');
  CheckException(StretchRect_A_Except2, EOverflow, 'Large Y scaling');
end;

procedure TestMathsCatSnippets.TestStretchRect_B;
var
  R0, R1, R2: TRect;
begin
  R0 := Rect(10, 40, 50, 100);
  R1 := StretchRect(R0, 0.5);
  CheckEquals(10, R1.Left, 'R1.Left');
  CheckEquals(30, R1.Right, '1: R1.Right');
  CheckEquals(40, R1.Top, 'R1.Top');
  CheckEquals(70, R1.Bottom, '1: R1.Bottom');
  R2 := StretchRect(R0, -0.5);
  CheckEquals(10, R2.Left, 'R2.Left');
  CheckEquals(-10, R2.Right, '2: R2.Right');
  CheckEquals(40, R2.Top, 'R2.Top');
  CheckEquals(10, R2.Bottom, '2: R2.Bottom');
  CheckException(StretchRect_B_Except, EOverflow, 'Large scaling');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestMathsCatSnippets.Suite);

end.
