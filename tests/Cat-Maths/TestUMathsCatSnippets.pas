unit TestUMathsCatSnippets;

interface

uses
  Types, Math, SysUtils, TestFramework, UMathsCatSnippets;

type
  TestMathsCatSnippets = class(TTestCase)
  private
    procedure StretchRect_A_Except1;
    procedure StretchRect_A_Except2;
    procedure StretchRect_B_Except;
    procedure TestArithMean_Integer_Except;
    procedure TestArithMean_Cardinal_Except;
    procedure TestArithMean_Double_Except;
    procedure TestWeightedArithMean_Double_Except1;
    procedure TestWeightedArithMean_Double_Except2;
    procedure TestWeightedArithMean_Double_Except3;
    procedure TestWeightedArithMean_Double_Except4;
    procedure TestDigitSumBase_Except;
    procedure TestDigitsOf_ArgExcept;
    procedure TestPowNZN_EOverflow;
    procedure TestDigitPowerSum_EOverflow;
    procedure TestDigitPowerSum_EArgumentException;
    function EqualArrays(const Left, Right: TBytes): Boolean;
    function ReverseArray(const A: TBytes): TBytes;
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
    procedure TestPowNZN;   // required by DigitPowerSum
    procedure TestPowNZZ;
    procedure TestPowN;
    procedure TestArraySum_Single;
    procedure TestArraySum_Double;
    procedure TestArraySum_Extended;
    procedure TestArraySum_Integer;
    procedure TestArraySum_Int64;
    procedure TestArraySum_Cardinal;
    procedure TestArraySum_UInt64;
    procedure TestSumOfLogs_Single;
    procedure TestSumOfLogs_Double;
    procedure TestSumOfLogs_Extended;
    procedure TestSumOfLogs_Integer;
    procedure TestSumOfLogs_Cardinal;
    procedure TestSumOfLogs_Int64;
    procedure TestSumOfLogs_UInt64;
    procedure TestArithMean_Integer;
    procedure TestArithMean_Cardinal;
    procedure TestArithMean_Double;
    procedure TestWeightedArithMean_Integer;
    procedure TestWeightedArithMean_Cardinal;
    procedure TestWeightedArithMean_Double;
    procedure TestDigitCountBase; // required by DigitsOf, IsNarcissistic
    procedure TestDigitSumBase;
    procedure TestDigitsOf;
    procedure TestDigitPowerSum;  // required by IsNarcissistic
    procedure TestIsPalindromic;
    procedure TestIsNarcissistic;
  end;

implementation

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

  PosExtendedArray: array[0..4] of Extended = (
    1.234, 4256.12345, 7000000000.0, PI, 0.000006758493
  );

  PosDoubleArray: array[0..4] of Double = (
    1.234, 4256.12345, 7000000000.0, PI, 0.000006758493
  );

  PosSingleArray: array[0..4] of Single = (
    1.234, 4256.12345, 7000000000.0, PI, 0.000006758493
  );

  LnPosExtendedArray: array[0..4] of Extended = (
    // Sourced by entering PosExtendedArray values into Windows Calculator
    0.21026092548319607136082943601527,
    8.3561140367098338229057764041835,
    22.669175986001724461267275835602,
    1.1447298858494001741553183317696,
    -11.904710621755846032803428450819
  );

  LnPosDoubleArray: array[0..4] of Double = (
    // Sourced by entering PosExtendedArray values into Windows Calculator
    0.21026092548319607136082943601527,
    8.3561140367098338229057764041835,
    22.669175986001724461267275835602,
    1.1447298858494001741553183317696,
    -11.904710621755846032803428450819
  );

  LnPosSingleArray: array[0..4] of Single = (
    // Sourced by entering PosExtendedArray values into Windows Calculator
    0.21026092548319607136082943601527,
    8.3561140367098338229057764041835,
    22.669175986001724461267275835602,
    1.1447298858494001741553183317696,
    -11.904710621755846032803428450819
  );

  PosUInt64Array: array[0..3] of UInt64 = (
    1, 4256, 782937294729473, 18446744073709551615 {High(UInt64)}
  );

  LnPosUInt64Array: array[0..3] of Extended = (
    0.0,
    8.3560850310214803122005407826219,
    34.294073725352958690377297588172,
    44.361419555836499802648645664699
  );

  PosInt64Array: array[0..3] of UInt64 = (
    1, 4256, 782937294729473, 9223372036854775807 {High(Int64)}
  );

  LnPosInt64Array: array[0..3] of Extended = (
    0.0,
    8.3560850310214803122005407826219,
    34.294073725352958690377297588172,
    43.668272375276554493177203434617
  );

  PosCardinalArray: array[0..3] of Cardinal = (
    1, 4256, 30392847, 4294967295 {High(Cardinal)}
  );

  LnPosCardinalArray: array[0..3] of Extended = (
    0.0,
    8.3560850310214803122005407826219,
    17.229717842637359251929684335162,
    22.180709777685419257670453203439
  );

  PosIntegerArray: array[0..3] of Integer = (
    1, 4256, 738473, 2147483647 {High(Integer)}
  );

  LnPosIntegerArray: array[0..3] of Extended = (
    0.0,
    8.3560850310214803122005407826219,
    13.512339819689414368459751325714,
    21.487562596892643304518036290109
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

function TestMathsCatSnippets.EqualArrays(const Left, Right: TBytes): Boolean;
var
  Idx: Integer;
begin
  Result := True;
  if Length(Left) <> Length(Right) then
    Exit(False);
  for Idx := Low(Left) to High(Left) do
    if Left[Idx] <> Right[Idx] then
      Exit(False);
end;

function TestMathsCatSnippets.ReverseArray(const A: TBytes): TBytes;
var
  I: Integer;
begin
  SetLength(Result, Length(A));
  for I := 0 to High(A) do
    Result[High(A)-I] := A[I];
end;

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

procedure TestMathsCatSnippets.TestArithMean_Cardinal;
const
  A0: array[0..1] of Cardinal = (0, 0);
  A1: array[0..0] of Cardinal = (56);
  A4: array[0..3] of Cardinal = (12, 78, 0, 3);
  E0 = 0.0;
  E1 = 56.0;
  E4 = (12.+78.+0.0+3.0)/4.0;
begin
  CheckTrue(Math.SameValue(E0, ArithMean(A0)), 'A0');
  CheckTrue(Math.SameValue(E1, ArithMean(A1)), 'A1');
  CheckTrue(Math.SameValue(E4, ArithMean(A4)), 'A4');
  CheckException(
    TestArithMean_Cardinal_Except, EArgumentException, 'Exception'
  );
end;

procedure TestMathsCatSnippets.TestArithMean_Cardinal_Except;
var
  A: array of Cardinal;
begin
  SetLength(A, 0);
  ArithMean(A);
end;

procedure TestMathsCatSnippets.TestArithMean_Double;
const
  A0: array[0..1] of Double = (0.0, 0.0);
  A1: array[0..0] of Double = (-PI);
  A4: array[0..3] of Double = (12.42, -56.47, 0.0, 3.0);
  E0 = 0.0;
  E1 = -PI;
  E4 = (12.42-56.47+3.0)/4.0;
begin
  CheckTrue(Math.SameValue(E0, ArithMean(A0)), 'A0');
  CheckTrue(Math.SameValue(E1, ArithMean(A1)), 'A1');
  CheckTrue(Math.SameValue(E4, ArithMean(A4)), 'A4');
  CheckException(
    TestArithMean_Double_Except, EArgumentException, 'Exception'
  );
end;

procedure TestMathsCatSnippets.TestArithMean_Double_Except;
var
  A: array of Double;
begin
  SetLength(A, 0);
  ArithMean(A);
end;

procedure TestMathsCatSnippets.TestArithMean_Integer;
const
  A0: array[0..1] of Integer = (0, 0);
  A1: array[0..0] of Integer = (-56);
  A4: array[0..3] of Integer = (12, -42, 0, 3);
  E0 = 0.0;
  E1 = -56.0;
  E4 = (12.0-42.0+3.0)/4.0;
begin
  CheckTrue(Math.SameValue(E0, ArithMean(A0)), 'A0');
  CheckTrue(Math.SameValue(E1, ArithMean(A1)), 'A1');
  CheckTrue(Math.SameValue(E4, ArithMean(A4)), 'A4');
  CheckException(
    TestArithMean_Integer_Except, EArgumentException, 'Exception'
  );
end;

procedure TestMathsCatSnippets.TestArithMean_Integer_Except;
var
  A: array of Integer;
begin
  SetLength(A, 0);
  ArithMean(A);
end;

procedure TestMathsCatSnippets.TestArraySum_Cardinal;
const
  A: array[0..3] of Cardinal = (12, 78, 0, 3);
  Expected: Cardinal = 93;
begin
  CheckEquals(Expected, ArraySum(A));
end;

procedure TestMathsCatSnippets.TestArraySum_Double;
const
  A: array[0..3] of Double = (93849367.8695, 0.003, 10294834.9473984, -98374.8593847);
  Expected: Double = 104045827.9605137;
begin
  CheckTrue(SameValue(Expected, ArraySum(A)));
end;

procedure TestMathsCatSnippets.TestArraySum_Extended;
const
  A: array[0..3] of Extended = (93849367.8695, 0.003, 10294834.9473984, -98374.8593847);
  Expected: Extended = 104045827.9605137;
begin
  CheckTrue(SameValue(Expected, ArraySum(A)));
end;

procedure TestMathsCatSnippets.TestArraySum_Int64;
const
  A: array[0..3] of Int64 = (-3849374778, +3849374780, 0, -8);
  Expected: Int64 = -6;
begin
  CheckEquals(Expected, ArraySum(A));
end;

procedure TestMathsCatSnippets.TestArraySum_Integer;
const
  A: array[0..3] of Integer = (-(MaxInt-5), MaxInt, 0, -671);
  Expected: Integer = -666;
begin
  CheckEquals(Expected, ArraySum(A));
end;

procedure TestMathsCatSnippets.TestArraySum_Single;
const
  A: array[0..3] of Single = (93849367.8695, 0.003, 10294834.9473984, -98374.8593847);
  Expected: Single = 104045827.9605137;
begin
  CheckTrue(SameValue(Expected, ArraySum(A)));
end;

procedure TestMathsCatSnippets.TestArraySum_UInt64;
const
  A: array[0..3] of UInt64 = (9223372036854775808, 2, 90, 100);
  Expected: UInt64 = 9223372036854776000;
begin
  CheckEquals(Expected, ArraySum(A));
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

procedure TestMathsCatSnippets.TestDigitCountBase;
begin
  CheckEquals(1, DigitCountBase(0, 10), '0 base 10');
  CheckEquals(1, DigitCountBase(1, 10), '1 base 10');
  CheckEquals(2, DigitCountBase(9, 8), '9 base 8');
  CheckEquals(2, DigitCountBase(-9, 8), '9 base 8');
  CheckEquals(2, DigitCountBase(9, 7), '9 base 7');
  CheckEquals(1, DigitCountBase(9, 16), '9 base 16');
  CheckEquals(2, DigitCountBase(12, 10), '12 base 10');
  CheckEquals(4, DigitCountBase(12, 2), '12 base 2');
  CheckEquals(5, DigitCountBase(123456, 16), '123456 base 16');
  CheckEquals(11, DigitCountBase(1234567890, 8), '1234567890 base 8');
  CheckEquals(2, DigitCountBase(256, 255), '256 base 255');
  CheckEquals(9, DigitCountBase(-429981696, 12), '-429981696 base 12');
  CheckEquals(8, DigitCountBase($FFFFFFFF, 16), '$FFFFFFFF base 16');
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

procedure TestMathsCatSnippets.TestDigitPowerSum;
begin
  CheckEquals(35, DigitPowerSum(135, 10, 2), '#1');
  CheckEquals(0, DigitPowerSum(0, 8, 5), '#2');
  CheckEquals(3, DigitPowerSum(510, 10, 0), '#3');
  CheckEquals(30, DigitPowerSum($FF, 16, 1), '#4');
  CheckEquals(12613, DigitPowerSum(1685237180, 10, 4), '#5');
  CheckEquals(77907, DigitPowerSum(1685237180 {6472ADBC hex}, 16, 4), '#6');
  CheckEquals(6740, DigitPowerSum(1685237180 {14434526674 oct}, 8, 4), '#7');
  CheckEquals(-6740, DigitPowerSum(-1685237180 {14434526674 oct}, 8, 4), '#8');
  CheckEquals(17, DigitPowerSum(1685237180 {1100100011100101010110110111100 bin}, 2, 4), '#9');
  CheckEquals(2409140909625644483, DigitPowerSum(MaxInt {C87E66B7 base 15}, 15, 16), '#10');
  CheckException(TestDigitPowerSum_EArgumentException, EArgumentException, 'EArgumentException');
  CheckException(TestDigitPowerSum_EOverflow, EOverflow, 'EOverflow');
  // EOverflow can also be raised by PowNZN, not tested here
end;

procedure TestMathsCatSnippets.TestDigitPowerSum_EArgumentException;
begin
  DigitPowerSum(42, 1, 2); // Base = 1 => EArgumentException
end;

procedure TestMathsCatSnippets.TestDigitPowerSum_EOverflow;
begin
  DigitPowerSum(88888888, 10, 20); // overflows High(Int64) by 1
end;

procedure TestMathsCatSnippets.TestDigitsOf;
var
  E: TBytes;
begin
  E := TBytes.Create(0);
  CheckTrue(EqualArrays(E, DigitsOf(0, 10)), '0, base 10');
  CheckTrue(EqualArrays(E, DigitsOf(0, 16)), '0, base 16');
  E := ReverseArray(TBytes.Create(3, 6, 5, 7, 0, 4, 2, 1, 0));
  CheckTrue(EqualArrays(E, DigitsOf(365704210, 10)), '365704210, base 10');
  E := ReverseArray(TBytes.Create(1, 5, $C, $C, 3, 4, 1, 2));
  CheckTrue(EqualArrays(E, DigitsOf(365704210, 16)), '365704210, base 16');
  E := ReverseArray(TBytes.Create({0,0,0}1, 0,1,0,1, 1,1,0,0, 1,1,0,0, 0,0,1,1, 0,1,0,0, 0,0,0,1, 0,0,1,0));
  CheckTrue(EqualArrays(E, DigitsOf(365704210, 2)), '365704210, base 2');
  E := TBytes.Create(7);
  CheckTrue(EqualArrays(E, DigitsOf(7, 8)), '7, base 8');
  E := ReverseArray(TBytes.Create(1,3));
  CheckTrue(EqualArrays(E, DigitsOf(7, 4)), '7, base 4');
  E := ReverseArray(TBytes.Create(1,6));
  CheckTrue(EqualArrays(E, DigitsOf(16, 10)), '16, base 10');
  E := ReverseArray(TBytes.Create(1,0));
  CheckTrue(EqualArrays(E, DigitsOf(16, 16)), '16, base 16');
  E := TBytes.Create(16);
  CheckTrue(EqualArrays(E, DigitsOf(16, 32)), '16, base 32');
  E := ReverseArray(TBytes.Create(1,5));
  CheckTrue(EqualArrays(E, DigitsOf(15, 10)), '15, base 10');
  E := TBytes.Create(15);
  CheckTrue(EqualArrays(E, DigitsOf(15, 16)), '15, base 16');
  E := TBytes.Create(3);
  CheckTrue(EqualArrays(E, DigitsOf(3, 10)), '3, base 10');
  E := ReverseArray(TBytes.Create(1,0));
  CheckTrue(EqualArrays(E, DigitsOf(3, 3)), '3, base 3');
  E := ReverseArray(TBytes.Create(1,1));
  CheckTrue(EqualArrays(E, DigitsOf(3, 2)), '3, base 2');
  E := ReverseArray(TBytes.Create(1,254));
  CheckTrue(EqualArrays(E, DigitsOf(509, 255)), '509, base 255');
  E := ReverseArray(TBytes.Create(4,2,9,4,9,6,7,2,9,5));
  CheckTrue(EqualArrays(E, DigitsOf(4294967295, 10)), 'High(Cardinal), base 10');
  E := TBytes.Create($f,$f,$f,$f,$f,$f,$f,$f);
  CheckTrue(EqualArrays(E, DigitsOf($FFFFFFFF, 16)), 'High(Cardinal), base 16');
  E := ReverseArray(TBytes.Create(4,7,6,8,7,3,6,2));
  CheckTrue(EqualArrays(E, DigitsOf(-47687362, 10)), '-47687362, base 10');
  E := TBytes.Create(1,1);
  CheckTrue(EqualArrays(E, DigitsOf(-17, 16)), '-17, base 16');
  CheckException(TestDigitsOf_ArgExcept, EArgumentException, 'Argument Exception');
end;

procedure TestMathsCatSnippets.TestDigitsOf_ArgExcept;
begin
  DigitsOf(2345, 0);
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

procedure TestMathsCatSnippets.TestDigitSumBase;
begin
  CheckEquals(6, DigitSumBase(123, 10), '123 base 10');
  CheckEquals(18, DigitSumBase(123, 16), '123 base 16 (7B)');
  CheckEquals(6, DigitSumBase(123, 2), '123 base 2 (0111 1011)');
  CheckEquals(7, DigitSumBase(1785, 255), '1785 base 255 (70)');
  CheckEquals(17, DigitSumBase(512, 100), '512 base 100 (5,12)');
  CheckEquals(0, DigitSumBase(0, 32), '0 base 32');
  CheckEquals(8*$f, DigitSumBase($FFFFFFFF, 16), '$FFFFFFFF base 16');
  CheckEquals(-45, DigitSumBase(-9876543210, 10), '-9876543210 base 10');
  CheckException(TestDigitSumBase_Except, EArgumentException, 'Err: base 1');
end;

procedure TestMathsCatSnippets.TestDigitSumBase_Except;
begin
  DigitSumBase(42, 1);
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

procedure TestMathsCatSnippets.TestIsNarcissistic;
const
  NarcNumsBase10: array[1..25] of Integer = (
    // Source: https://rosettacode.org/wiki/Narcissistic_decimal_number
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 153, 370, 371, 407, 1634, 8208, 9474, 54748,
    92727, 93084, 548834, 1741725, 4210818, 9800817, 9926315
  );
  // Following all sourced from https://en.wikipedia.org/wiki/Narcissistic_number
  // and bases converted to decimal
  NarcNumsBase2: array[1..2] of Integer = (0, 1);
  NarcNumsBase3: array[1..6] of Integer = (0, 1, 2, 5, 8, 17);
  NarcNumsBase4: array[1..12] of Integer = (
    0, 1, 2, 3, 28, 29, 35, 43, 55, 62, 83, 243
  );
  NarcNumsBase5: array[1..16] of Integer = (
    0, 1, 2, 3, 4, 13, 18, 28, 118, 289, 353, 419, 4890, 4891, 9113, 1874374
  );
  NarcNumsBase6: array[1..18] of Integer = (
    0, 1, 2, 3, 4, 5, 99, 190, 2292, 2293, 2324, 3432, 3433, 6197, 36140,
    269458, 391907, 10067135
  );
  NarcNumsBase7: array[1..28] of Integer = (
    0, 1, 2, 3, 4, 5, 6, 10, 25, 32, 45, 133, 134, 152, 250, 3190, 3222, 3612,
    3613, 4183, 9286, 35411, 191334, 193393, 376889, 535069, 794376, 8094840
  );
  NarcNumsBase8: array[1..23] of Integer = (
    0, 1, 2, 3, 4, 5, 6, 7, 20, 52, 92, 133, 307, 432, 433, 16819, 17864, 17865,
    24583, 25639, 212419, 906298, 906426
  );
  NarcNumsBase13: array[1..26] of Integer = (
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 17, 45, 85, 98, 136, 160, 793,
    794, 854, 1968, 8194, 62481, 167544
  );
  NarcNumsBase16: array[1..51] of Integer = (
    $0, $1, $2, $3, $4, $5, $6, $7, $8, $9, $A, $B, $C, $D, $E, $F, $156, $173,
    $208, $248, $285, $4A5, $5B0, $5B1, $60B, $64B, $8C0, $8C1, $99A, $AA9,
    $AC3, $CA8, $E69, $EA0, $EA1, $B8D2, $13579, $2B702, $2B722, $5A07C, $5A47C,
    $C00E0, $C00E1, $C04E0, $C04E1, $C60E7, $C64E7, $C80E0, $C80E1, $C84E0,
    $C84E1
  );
var
  X: Integer;
  Base: Byte;
begin
  // Base 2
  for X in NarcNumsBase2 do
    CheckTrue(IsNarcissistic(X, 2), Format('%d base 2', [X]));
  // Base 3
  for X in NarcNumsBase3 do
    CheckTrue(IsNarcissistic(X, 3), Format('%d base 3', [X]));
  // Base 4
  for X in NarcNumsBase4 do
    CheckTrue(IsNarcissistic(X, 4), Format('%d base 4', [X]));
  // Base 5
  for X in NarcNumsBase5 do
    CheckTrue(IsNarcissistic(X, 5), Format('%d base 5', [X]));
  // Base 6
  for X in NarcNumsBase6 do
    CheckTrue(IsNarcissistic(X, 6), Format('%d base 6', [X]));
  // Base 7
  for X in NarcNumsBase7 do
    CheckTrue(IsNarcissistic(X, 7), Format('%d base 7', [X]));
  // Base 8
  for X in NarcNumsBase8 do
    CheckTrue(IsNarcissistic(X, 8), Format('%d base 8', [X]));
  // Base 10
  for X in NarcNumsBase10 do
    // uses default base
    CheckTrue(IsNarcissistic(X), Format('%d base 10', [X]));
  // Base 13
  for X in NarcNumsBase13 do
    CheckTrue(IsNarcissistic(X, 13), Format('%d base 13', [X]));
  // Base 16
  for X in NarcNumsBase16 do
    CheckTrue(IsNarcissistic(X, 16), Format('%d base 16', [X]));
  // Check some known falsities
  CheckFalse(IsNarcissistic($C04E2, 16), 'False #1');
  CheckFalse(IsNarcissistic(906299, 8), 'False #2');
  CheckFalse(IsNarcissistic(501), 'False #3');
  CheckFalse(IsNarcissistic(2, 2), 'False #4');
  // Bases 2..255: All single digits in the base are narcissistic
  for Base := 2 to 255 do
    for X := 0 to Base - 1 do
      CheckTrue(IsNarcissistic(X, Base), Format('Single digit%d base: %d', [X, Base]));
end;

procedure TestMathsCatSnippets.TestIsPalindromic;
const
  // All palindromic numbers base 10 less than 200
  // Source: https://oeis.org/A002113
  PalBase10LessThan256: set of Byte = [
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 22, 33, 44, 55, 66, 77, 88, 99, 101, 111,
    121, 131, 141, 151, 161, 171, 181, 191, 202, 212, 222, 232, 242, 252
  ];
  // All palindromic numbers base 2 less than 200 decimal
  // Source: https://oeis.org/A006995
  PalBase2LessThan256: set of Byte = [
    0, 1, 3, 5, 7, 9, 15, 17, 21, 27, 31, 33, 45, 51, 63, 65, 73, 85, 93, 99,
    107, 119, 127, 129, 153, 165, 189, 195, 219, 231, 255
  ];
  // Bases for which 105 decimal is palindromic
  // Source: https://en.wikipedia.org/wiki/Palindromic_number#Other_bases
  Pal105Bases: set of Byte = [4, 8, 14, 20, 34, 104];
var
  X, B: Byte;
begin
  CheckTrue(IsPalindromic(243999, 8), '734437 octal');
  CheckTrue(IsPalindromic(30495, 8), '73437 octal');
  CheckFalse(IsPalindromic(30943, 8), '74337 octal');
  CheckTrue(IsPalindromic($FFFFFFFF, 16), 'FFFFFFFF hex');
  CheckTrue(IsPalindromic($FFFFFFFF, 2), '11111111111111111111111111111111 bin');
  CheckTrue(IsPalindromic($FFF11FFF, 16), 'FFF11FFF hex');
  CheckFalse(IsPalindromic($FFF11FFF, 2), '11111111111100010001111111111111 bin');
  CheckTrue(IsPalindromic(341, 2), '101010101 bin');
  CheckTrue(IsPalindromic(2081023, 128), '127|1|127 base 128');
  CheckFalse(IsPalindromic(2081024, 128), '127|2|0 base 128');
  CheckTrue(IsPalindromic(145787541), '145787541 base 10 (default)');
  CheckTrue(IsPalindromic(1, 25), '1 base 25');
  CheckFalse(IsPalindromic(66, 4), '1002 base 4');
  CheckTrue(IsPalindromic(66, 21), '33 base 21');
  for B in Pal105Bases do
    CheckTrue(IsPalindromic(105, B), Format('105 in base %d', [B]));
  for X := 0 to 255 do
  begin
    if X in PalBase10LessThan256 then
      CheckTrue(IsPalindromic(X), Format('%d in base 10', [X]))
    else
      CheckFalse(IsPalindromic(X), Format('%d in base 10', [X]));
    if X in PalBase2LessThan256 then
      CheckTrue(IsPalindromic(X, 2), Format('%d in base 2', [X]))
    else
      CheckFalse(IsPalindromic(X, 2), Format('%d in base 2', [X]));
  end;
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

procedure TestMathsCatSnippets.TestPowN;
begin
  CheckEquals(0,          PowN(0, 2),     'PowN(0,2)');
  CheckEquals(1,          PowN(42, 0),    'PowN(42,0)');
  CheckEquals(1,          PowN(0, 0),     'PowN(0,0)');
  CheckEquals(1,          PowN(1, 1),     'PowN(1,1)');
  CheckEquals(-1,         PowN(-1, 1),    'PowN(-1,1)');
  CheckEquals(1,          PowN(1, 5),     'PowN(1,5)');
  CheckEquals(4,          PowN(2, 2),     'PowN(2,2)');
  CheckEquals(4,          PowN(-2, 2),    'PowN(-2,2)');
  CheckEquals(100,        PowN(10, 2),    'PowN(10,2)');
  CheckEquals(10000,      PowN(10, 4),    'PowN(10,2)');
  CheckEquals(1.0,        PowN(0, 0),     'PowN(0, 0)');
  CheckEquals(1/2,        PowN(2, -1),    'PowN(2, -1)');
  CheckEquals(1/1000,     PowN(10, -3),   'PowN(10, -3)');
  CheckEquals(-1000,      PowN(-10, 3),   'PowN(-10, 3)');
  CheckEquals(-1/1000,    PowN(-10, -3),  'PowN(-10, -3)');
  CheckEquals(4,          PowN(2, 2),     'PowN(2,2)');
  CheckEquals(4,          PowN(-2, 2),    'PowN(-2,2)');
  CheckEquals(1/27,       PowN(3, -3),    'PowN(3, -3)');
  CheckEquals(1/3,        PowN(3, -1),    'PowN(3, -1)');
  CheckEquals(-1,         PowN(-1, -3),   'PowN(-1, -3)');
  CheckEquals(4294967296, PowN(2, 32),    'PowN(2, 32');
  // Floats
  CheckEquals(Math.Power(45.3672, 3.0), PowN(45.3672, 3), 'PowN(45.3672, 12)');
  CheckEquals(Math.Power(-0.87659, -7), PowN(-0.87659, -7), 'PowN(-0.87659, -7)');
  CheckEquals(Math.Power(45.3672, -3.0), PowN(45.3672, -3), 'PowN(45.3672, -3)');
  CheckEquals(Math.Power(-0.87659, -7), PowN(-0.87659, -7), 'PowN(-0.87659, -7)');
  CheckEquals(Math.Power(-0.87659, 3), PowN(-0.87659, 3), 'PowN(-0.87659, 3)');
end;

procedure TestMathsCatSnippets.TestPowNZN;
begin
  CheckEquals(0,      PowNZN(0, 2),   'PowNZN(0,2)');
  CheckEquals(1,      PowNZN(42, 0),  'PowNZN(42,0)');
  CheckEquals(1,      PowNZN(0, 0),   'PowNZN(0,0)');
  CheckEquals(1,      PowNZN(1, 1),   'PowNZN(1,1)');
  CheckEquals(-1,     PowNZN(-1, 1),  'PowNZN(-1,1)');
  CheckEquals(1,      PowNZN(1, 5),   'PowNZN(1,5)');
  CheckEquals(4,      PowNZN(2, 2),   'PowNZN(2,2)');
  CheckEquals(4,      PowNZN(-2, 2),  'PowNZN(-2,2)');
  CheckEquals(100,    PowNZN(10, 2),  'PowNZN(10,2)');
  CheckEquals(10000,  PowNZN(10, 4),  'PowNZN(10,2)');
  CheckEquals(-1000,  PowNZN(-10, 3), 'PowNZN(-10,3)');
  CheckEquals(10000,  PowNZN(-10, 4), 'PowNZN(-10,4)');
  CheckException(TestPowNZN_EOverflow, EOverflow, 'EOverflow');
end;

procedure TestMathsCatSnippets.TestPowNZN_EOverflow;
begin
  PowNZN(2, 63);
end;

procedure TestMathsCatSnippets.TestPowNZZ;
begin
  CheckEquals(0,          PowNZZ(0, 2),     'PowNZZ(0,2)');
  CheckEquals(1,          PowNZZ(42, 0),    'PowNZZ(42,0)');
  CheckEquals(1,          PowNZZ(0, 0),     'PowNZZ(0,0)');
  CheckEquals(1,          PowNZZ(1, 1),     'PowNZZ(1,1)');
  CheckEquals(-1,         PowNZZ(-1, 1),    'PowNZZ(-1,1)');
  CheckEquals(1,          PowNZZ(1, 5),     'PowNZZ(1,5)');
  CheckEquals(4,          PowNZZ(2, 2),     'PowNZZ(2,2)');
  CheckEquals(4,          PowNZZ(-2, 2),    'PowNZZ(-2,2)');
  CheckEquals(100,        PowNZZ(10, 2),    'PowNZZ(10,2)');
  CheckEquals(10000,      PowNZZ(10, 4),    'PowNZZ(10,2)');
  CheckEquals(1.0,        PowNZZ(0, 0),     'PowNZZ(0, 0)');
  CheckEquals(1/2,        PowNZZ(2, -1),    'PowNZZ(2, -1)');
  CheckEquals(1/1000,     PowNZZ(10, -3),   'PowNZZ(10, -3)');
  CheckEquals(-1000,      PowNZZ(-10, 3),   'PowNZZ(-10, 3)');
  CheckEquals(-1/1000,    PowNZZ(-10, -3),  'PowNZZ(-10, -3)');
  CheckEquals(4,          PowNZZ(2, 2),     'PowNZZ(2,2)');
  CheckEquals(4,          PowNZZ(-2, 2),    'PowNZZ(-2,2)');
  CheckEquals(1/27,       PowNZZ(3, -3),    'PowNZZ(3, -3)');
  CheckEquals(1/3,        PowNZZ(3, -1),    'PowNZZ(3, -1)');
  CheckEquals(-1,         PowNZZ(-1, -3),   'PowNZZ(-1, -3)');
  CheckEquals(4294967296, PowNZZ(2, 32),    'PowNZZ(2, 32');
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

procedure TestMathsCatSnippets.TestSumOfLogs_Cardinal;
var
  Res, Expected: Extended;
  BoolRes: Boolean;
begin
  Expected := ArraySum(LnPosCardinalArray); // SumOfArray result cast to Extended
  Res := SumOfLogs(PosCardinalArray);
  BoolRes := SameValue(Expected, Res);
  CheckTrue(BoolRes, 'Normal');
end;

procedure TestMathsCatSnippets.TestSumOfLogs_Double;
var
  Res, Expected: Double;
  BoolRes: Boolean;
begin
  Expected := ArraySum(LnPosDoubleArray);
  Res := SumOfLogs(PosDoubleArray);
  BoolRes := SameValue(Expected, Res);
  CheckTrue(BoolRes, 'SumOfLogs_Double');
end;

procedure TestMathsCatSnippets.TestSumOfLogs_Extended;
var
  Res, Expected: Extended;
  BoolRes: Boolean;
begin
  Expected := ArraySum(LnPosExtendedArray);
  Res := SumOfLogs(PosExtendedArray);
  BoolRes := SameValue(Expected, Res);
  CheckTrue(BoolRes, 'SumOfLogs_Extended');
end;

procedure TestMathsCatSnippets.TestSumOfLogs_Int64;
var
  Res, Expected: Extended;
  BoolRes: Boolean;
begin
  Expected := ArraySum(LnPosInt64Array); // SumOfArray result cast to Extended
  Res := SumOfLogs(PosInt64Array);
  BoolRes := SameValue(Expected, Res);
  CheckTrue(BoolRes, 'SumOfLogs_Int64');
end;

procedure TestMathsCatSnippets.TestSumOfLogs_Integer;
var
  Res, Expected: Extended;
  BoolRes: Boolean;
begin
  Expected := ArraySum(LnPosIntegerArray); // SumOfArray result cast to Extended
  Res := SumOfLogs(PosIntegerArray);
  BoolRes := SameValue(Expected, Res);
  CheckTrue(BoolRes, 'SumOfLogs_Integer');
end;

procedure TestMathsCatSnippets.TestSumOfLogs_Single;
var
  Res, Expected: Single;
  BoolRes: Boolean;
begin
  Expected := ArraySum(LnPosSingleArray);
  Res := SumOfLogs(PosSingleArray);
  BoolRes := SameValue(Expected, Res);
  CheckTrue(BoolRes, 'SumOfLogs_Single');
end;

procedure TestMathsCatSnippets.TestSumOfLogs_UInt64;
var
  Res, Expected: Extended;
  BoolRes: Boolean;
begin
  Expected := ArraySum(LnPosUInt64Array); // SumOfArray result cast to Extended
  Res := SumOfLogs(PosUInt64Array);
  BoolRes := SameValue(Expected, Res);
  CheckTrue(BoolRes, 'SumOfLogs_UInt64');
end;

procedure TestMathsCatSnippets.TestWeightedArithMean_Cardinal;
const
  A: array[1..3] of Cardinal = (12, 6, 3);
  W: array[0..2] of Double = (0.5, 0.25, 0.75);
  E = 6.5;
begin
  CheckTrue(Math.SameValue(E, WeightedArithMean(A, W)));
end;

procedure TestMathsCatSnippets.TestWeightedArithMean_Double;
const
  A1: array[1..1] of Double = (42.456);
  W1: array[3..3] of Double = (1.7);
  E1 = 42.456;
  A2: array[1..5] of Double = (23.5, -3.9987, 66.0, 0.0, 47.6864);
  W2: array[1..5] of Double = (7.6, 0.0, 12.7, 4.5, 3.2);
  E2 = 41.7642;   // from online calculator: accurate to 4 decimal places
  FudgeFactor2 = 10000;
  A3: array[1..3] of Double = (0.0, 0.0, 0.0);
  W3: array[1..3] of Double = (23.5, 99.7, 27.898);
begin
  CheckTrue(Math.SameValue(E1, WeightedArithMean(A1, W1)), 'A1');
  // E2 is accurate to 4DP - so round of both values multiplied by 10,000
  CheckEquals(Round(E2 * FudgeFactor2), Round(WeightedArithMean(A2, W2) * FudgeFactor2), 'A2');
  CheckTrue(Math.IsZero(WeightedArithMean(A3, W3)), 'A3');

  CheckException(TestWeightedArithMean_Double_Except1, EArgumentException, 'Except 1');
  CheckException(TestWeightedArithMean_Double_Except2, EArgumentException, 'Except 2');
  CheckException(TestWeightedArithMean_Double_Except3, EArgumentException, 'Except 3');
  CheckException(TestWeightedArithMean_Double_Except4, EArgumentException, 'Except 4');
end;

procedure TestMathsCatSnippets.TestWeightedArithMean_Double_Except1;
var
  A, W: array of Double;
begin
  // Empty array error
  SetLength(A, 0);
  SetLength(W, 0);
  WeightedArithMean(A, W);
end;

procedure TestMathsCatSnippets.TestWeightedArithMean_Double_Except2;
const
  A: array[1..3] of Double = (1.0, 2.0, PI);
  W: array[1..2] of Double = (0.5, 0.7);
begin
  // Different size A & W arrays
  WeightedArithMean(A, W);
end;

procedure TestMathsCatSnippets.TestWeightedArithMean_Double_Except3;
const
  A: array[1..4] of Double = (1.0, 2.0, PI, -67.948);
  W: array[1..4] of Double = (0.5, 0, -42.0, 0.7);
begin
  // W array contains -ve value
  WeightedArithMean(A, W);
end;

procedure TestMathsCatSnippets.TestWeightedArithMean_Double_Except4;
const
  A: array[1..3] of Double = (1.0, 2.0, PI);
  W: array[1..3] of Double = (0.0, 0.0, 0.0);
begin
  // W array sums to 0
  WeightedArithMean(A, W);
end;

procedure TestMathsCatSnippets.TestWeightedArithMean_Integer;
const
  A: array[1..3] of Integer = (12, -6, 3);
  W: array[0..2] of Double = (0.5, 0.25, 0.75);
  E = 4.5;
begin
  CheckTrue(Math.SameValue(E, WeightedArithMean(A, W)));
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestMathsCatSnippets.Suite);

end.
