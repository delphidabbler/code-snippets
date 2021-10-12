{
 * This file was generated from the DelphiDabbler Code Snippets Database.
 * The source code is licensed under the MIT license, copyright © 2005-2020,
 * Peter Johnson (https://gravatar.com/delphidabbler) and Contributors. The
 * full license and a list of contributors can be found in the `LICENSE` and
 * `CONTRIBUTORS` files at
 * https://github.com/delphidabbler/code-snippets/tree/master/csdb/collection
}

unit UMathsCatSnippets;

interface

uses
  SysUtils, Math, Types, Windows;

type
  {Encapsulates a point with double precision floating point coordinates.}
  TPointF = record
    X, Y: Double;  // x and y coordinates
  end;

type
  {Encapsulates a rectangle with double precision floating point size and
  position.}
  TRectF = record
    case Integer of
      0: (Left, Top, Right, Bottom: Double);
      1: (TopLeft, BottomRight: TPointF);
  end;

type
  {Record that represents the size, i.e. the width and height, of something.
  This is an extended version of the TSize record that features equality and
  inequality operator overloading, a test for zero size and a constructor.
  TSizeEx is assignment compatible and comparible with the Delphi RTL's TSize
  record.}
  TSizeEx = record
  public
    // Width
    CX: Integer;
    // Height
    CY: Integer;
    // Constructs record with two given CX and CY field values
    constructor Create(ACX, ACY: Integer);
    // Enables TSize to be assigned to and compared with TSizeEx
    class operator Implicit(S: Types.TSize): TSizeEx;
    // Enables TSizeEx to be assigned to and compared with TSize
    class operator Implicit(S: TSizeEx): Types.TSize;
    // Tests for equality of TSizeEx records. Also works if one record is TSize.
    class operator Equal(S1, S2: TSizeEx): Boolean;
    // Tests for inequality of TSizeEx records. Also works if one record is
    // TSize.
    class operator NotEqual(S1, S2: TSizeEx): Boolean;
    // Tests if a TSizeEx instance is zero (i.e. one of fields is zero)
    function IsZero: Boolean;
  end;

function AllDigitsDifferent(N: Int64): Boolean;
  {Checks if all the digits of the given integer are different to each other.}

function AllDigitsSame(N: Int64): Boolean;
  {Checks if all the digits of the given integer are the same.}

function BoundsF(ALeft, ATop, AWidth, AHeight: Double): TRectF;
  {Constructs and returns a TRectF record with the given top-left coordinate,
  width and height.}

procedure DecimalToFraction(Decimal: Extended; out FractionNumerator: Extended;
  out FractionDenominator: Extended; const AccuracyFactor: Extended);
  {Converts the given decimal to a fraction. The numerator and denominator are
  passed out as floating point numbers in FractionNumerator and
  FractionDenominator respectively.
  AccuracyFactor determines how accurate the conversion is to be.}

function DigitCount(AInteger: Int64): Integer;
  {Counts the number of digits in the given integer.}

function DigitCount2(const AValue: Int64): Integer;
  {Counts the number of digits in the given integer.}

function DigitCountR(AValue: Int64): Integer;
  {Counts the number of digits in the given integer using recursion.}

function DigitSum(AValue: Int64): Integer;
  {Returns the sum of the digits from the given integer, using recursion.}

function DistanceBetweenPoints(const P1, P2: TPointF): Extended; overload;
  {Calculates the distance between two given points with double precision
  floating point valued coordinates.}

function DistanceBetweenPoints(const P1, P2: Types.TPoint): Extended; overload;
  {Calculates the distance between two points with integer valued co-ordinates.}

function Factorial(N: Byte): Int64;
  {Calculates the factorial of the given number.}

function GCD(A, B: Integer): Integer;
  {Determines the greatest common divisor of two given integers.}

function GCD2(const A, B: Integer): Integer;
  {Determines the greatest common divisor of two given integers.}

function IsPrime(N: Integer): Boolean;
  {Checks if the given number is prime.}

function IsPrime2(Val: Integer): Boolean;
  {Checks if the given number is prime.}

function IsRectNormal(const R: Windows.TRect): Boolean;
  {Checks if the given rectangle is normalized, i.e. Left <= Right and Top <=
  Bottom.}

function LCD(A, B: Integer): Integer;
  {Returns the least common divisor of two given integers.}

function MaxOfArray(const A: array of Double): Double; overload;
  {Returns the maximum value contained in the given array of double precision
  floating point values.
  The array must not be empty.}

function MaxOfArray(const A: array of Extended): Extended; overload;
  {Returns the maximum value contained in the given array of extended precision
  floating point values.
  The array must not be empty.}

function MaxOfArray(const A: array of Int64): Int64; overload;
  {Returns the maximum value contained in the given array of 64 bit integer
  values.
  The array must not be empty.}

function MaxOfArray(const A: array of Integer): Integer; overload;
  {Returns the maximum value contained in the given array of integer values.
  The array must not be empty.}

function MaxOfArray(const A: array of Single): Single; overload;
  {Returns the maximum value contained in the given array of single precision
  floating point values.
  The array must not be empty.}

function Mid(const A, B, C: Double): Double; overload;
  {Returns the middle of three double precision floating point values.}

function Mid(const A, B, C: Extended): Extended; overload;
  {Returns the middle of three extended precision floating point values.}

function Mid(const A, B, C: Int64): Int64; overload;
  {Returns the middle of three 64 bit integer values.}

function Mid(const A, B, C: Integer): Integer; overload;
  {Returns the middle of three integer values.}

function Mid(const A, B, C: Single): Single; overload;
  {Returns the middle of three single precision floating point values.}

procedure MinMidMax(const A, B, C: Double; out Min, Mid, Max: Double); overload;
  {Finds the minimum, middle and maximum values of three double precision
  floating point numbers, A, B and C and returns them in Min, Mid and Max
  respectively.}

procedure MinMidMax(const A, B, C: Extended; out Min, Mid, Max: Extended);
  overload;
  {Finds the minimum, middle and maximum values of three extended precision
  floating point numbers, A, B and C and returns them in Min, Mid and Max
  respectively.}

procedure MinMidMax(const A, B, C: Int64; out Min, Mid, Max: Int64); overload;
  {Finds the minimum, middle and maximum values of three 64 bit integers, A, B
  and C and returns them in Min, Mid and Max respectively.}

procedure MinMidMax(const A, B, C: Integer; out Min, Mid, Max: Integer);
  overload;
  {Finds the minimum, middle and maximum values of three integers, A, B and C
  and returns them in Min, Mid and Max respectively.}

procedure MinMidMax(const A, B, C: Single; out Min, Mid, Max: Single); overload;
  {Finds the minimum, middle and maximum values of three single precision
  floating point numbers, A, B and C and returns them in Min, Mid and Max
  respectively.}

function MinOfArray(const A: array of Double): Double; overload;
  {Returns the minimum value contained in the given array of double precision
  floating point values.
  The array must not be empty.}

function MinOfArray(const A: array of Extended): Extended; overload;
  {Returns the minimum value contained in the given array of extended precision
  floating point values.
  The array must not be empty.}

function MinOfArray(const A: array of Int64): Int64; overload;
  {Returns the minimum value contained in the given array of 64 bit integer
  values.
  The array must not be empty.}

function MinOfArray(const A: array of Integer): Integer; overload;
  {Returns the minimum value contained in the given array of integer values.
  The array must not be empty.}

function MinOfArray(const A: array of Single): Single; overload;
  {Returns the minimum value contained in the given array of single precision
  floating point values.
  The array must not be empty.}

function MoveRectToOrigin(const R: Types.TRect): Types.TRect;
  {Translates the give rectangle to the origin.
  The top and left co-ordinates are set to zero and the bottom and right
  co-ordinates are adjusted accordingly.}

procedure NormaliseFractionSign(var Num, Denom: Integer);
  {Normalises the sign of the fraction with numerator Num and denominator Denom
  so that Num takes the sign of the fraction and Denom is non-negative.}

function NormalizeRect(const R: Windows.TRect): Windows.TRect;
  {Normalises the given rectangle so that Left <= Right and Top <= Bottom.}

function PointF(const AX, AY: Double): TPointF;
  {Constructs and returns a TPointF record with the given x & y coordinates.}

function Pow(const Base: Int64; const Exponent: Byte): Int64;
  {Raises integer value Base to non-negative integer power Exponent and returns
  the result.}

function RectArea(const R: Windows.TRect): Int64;
  {Returns the area of the given rectangle.}

function RectF(const ALeft, ATop, ARight, ABottom: Double): TRectF;
  {Constructs and returns a TRectF record with the given left, top, right &
  bottom coordinates.}

function RectHeight(const R: Windows.TRect): Integer;
  {Returns the height of the given rectangle.
  The return value is always non-negative even if the rectangle is not
  normalized.}

function RectSize(const R: Windows.TRect): Windows.TSize;
  {Returns the size of the given rectangle.
  The returned dimensions are always non-negative even if the rectangle is not
  normalized.}

function RectWidth(const R: Windows.TRect): Integer;
  {Returns the width of the given rectangle.
  The return value is always non-negative even if the rectangle is not
  normalized.}

function RepeatedDigits(N: Int64): Boolean;
  {Checks if the given integer contains only a single repeated digit.}

function ResizeRect(const R: Types.TRect; const NewSize: Types.TSize):
  Types.TRect; overload;
  {Resizes rectangle R to size NewSize, leaving the top-left position unchanged.
  Returns the resized rectangle.}

function ResizeRect(const R: Types.TRect; const NewWidth, NewHeight: LongInt):
  Types.TRect; overload;
  {Resizes rectangle R to the width and height given by NewWidth and NewHeight,
  leaving the top-left position unchanged.
  Returns the resized rectangle.}

function ReverseNumber(AValue: Int64): Int64;
  {Reverses the digits of the given integer and returns the resulting value.
  The given integer should be greater than zero: the function always returns
  zero for negative integers.}

function ReverseNumberR(AValue: Int64): Int64;
  {Reverses the digits of the given integer, which must be non-negative, and
  returns the resulting value.
  Uses recursion.}

function SAR(Value: LongInt; Shift: Byte): LongInt;
  {Performs an arithmetic right shift operation on the given value and returns
  the result. Value is shifted right by Shift bits.
  Shift must be in the range 0..31 and is adjusted if it is not.}

function ScaleRect(const ARect: Types.TRect; AScaling: Double): Types.TRect;
  {Scales the given rectangle by the given scale factor and returns the scaled
  rectangle.}

function SignOfFloat(const Value: Extended): Integer;
  {Returns the sign of the given floating point value. Returns -1 if the value
  is positive, 0 if zero or +1 if negative.}

function SignOfInt(const Value: Int64): Integer;
  {Returns the sign of the given integer. Returns -1 if the integer is positive,
  0 if zero or +1 if negative.}

function Size(const ACX, ACY: Integer): Types.TSize;
  {Constructs and returns a TSize record with the given dimensions.}

function StretchRect(const R: Types.TRect; const ScalingX, ScalingY: Double):
  Types.TRect; overload;
  {Stretches rectangle R by the given scaling factors and returns the result.
  The rectangle's width is scaled by ScalingX and its height by ScalingY.
  The top left corner of the rectangle is not changed.}

function StretchRect(const R: Types.TRect; const Scaling: Double):
  Types.TRect; overload;
  {Stretches the rectangle R by scale factor Scaling and returns the result.
  Both width and height are stretched by the same scale factor.
  The top left corner is not changed.}

function ZoomRatio(const DestWidth, DestHeight, SrcWidth, SrcHeight: Integer):
  Double; overload;
  {Calculates and returns the largest scaling that can be applied to a rectangle
  of width SrcWidth and height SrcHeight to fit it, without changing the aspect
  ratio, within a second rectangle of width DestWidth and height DestHeight.}

function ZoomRatio(const DestSize, SrcSize: Types.TSize): Double; overload;
  {Calculates and returns the largest scaling that can be applied to a rectangle
  of size SrcSize to fit it, without changing the aspect ratio, within a second
  rectangle of size DestSize.}

function ZoomRatio(const DestRect, SrcRect: Types.TRect): Double; overload;
  {Calculates and returns the largest scaling that can be applied to rectangle
  SrcRect to fit it, without changing the aspect ratio, within rectangle
  DestRect.}

implementation

procedure ExchangeInt(var I1, I2: Integer);
  forward;

function AllDigitsDifferent(N: Int64): Boolean;
  {Checks if all the digits of the given integer are different to each other.}
var
  UsedDigits: array[0..9] of Boolean; // records which digits have been used
  I: 0..9;  // loops through elements of UsedDigits
  M: 0..9;  // modulus after dividing by 10
begin
  N := Abs(N);
  Result := False;
  for I := 0 to 9 do
    UsedDigits[I] := False;
  while N > 0 do
  begin
    M := N mod 10;
    if UsedDigits[M] then
      Exit;
    UsedDigits[M] := True;
    N := N div 10;
  end;
  Result := True; // if we get here all digits are unique
end;

function AllDigitsSame(N: Int64): Boolean;
  {Checks if all the digits of the given integer are the same.}
var
  D: 0..9;  // sample digit from N
begin
  N := Abs(N);
  D := N mod 10;
  Result := False;
  while N > 0 do
  begin
    if N mod 10 <> D then
      Exit;
    N := N div 10;
  end;
  Result := True;
end;

function BoundsF(ALeft, ATop, AWidth, AHeight: Double): TRectF;
  {Constructs and returns a TRectF record with the given top-left coordinate,
  width and height.}
begin
  Result.Left := ALeft;
  Result.Top := ATop;
  Result.Right := ALeft + AWidth;
  Result.Bottom :=  ATop + AHeight;
end;

procedure DecimalToFraction(Decimal: Extended; out FractionNumerator: Extended;
  out FractionDenominator: Extended; const AccuracyFactor: Extended);
  {Converts the given decimal to a fraction. The numerator and denominator are
  passed out as floating point numbers in FractionNumerator and
  FractionDenominator respectively.
  AccuracyFactor determines how accurate the conversion is to be.}
var
  DecimalSign: Extended;
  Z: Extended;
  PreviousDenominator: Extended;
  ScratchValue: Extended;
{$IFDEF FPC}
const
{$ELSE}
resourcestring
{$ENDIF}
  sTooSmall = 'Decimal too small to convert to fraction';
  sTooLarge = 'Decimal too large to convert to fraction';
const
  LargestDecimal: Extended = 1.0E+19;
  SmallestDecimal: Extended = 1.0E-19;
begin
  if Decimal < 0.0 then
    DecimalSign := -1.0
  else
    DecimalSign := 1.0;
  Decimal := Abs(Decimal);
  if Math.SameValue(Decimal, Int(Decimal)) then
  begin
    FractionNumerator := Decimal * DecimalSign;
    FractionDenominator := 1.0;
    Exit;
  end;
  if (Decimal < SmallestDecimal) then // X = 0 already taken care of
    raise SysUtils.EConvertError.Create(sTooSmall);
  if (Decimal > LargestDecimal) then
    raise SysUtils.EConvertError.Create(sTooLarge);
  Z := Decimal;
  PreviousDenominator := 0.0;
  FractionDenominator := 1.0;
  repeat
    Z := 1.0 / (Z - Int(Z));
    ScratchValue := FractionDenominator;
    FractionDenominator := FractionDenominator * Int(Z) + PreviousDenominator;
    PreviousDenominator := ScratchValue;
    FractionNumerator := Int(Decimal * FractionDenominator + 0.5) // Rounding
  until
    (
      Abs(
        Decimal - (FractionNumerator / FractionDenominator)
      ) < AccuracyFactor
    )
    or (Z = Int(Z));
  FractionNumerator := DecimalSign * FractionNumerator;
end;

function DigitCount(AInteger: Int64): Integer;
  {Counts the number of digits in the given integer.}
begin
  if AInteger <> 0 then
  begin
    Result := 0;
    AInteger := Abs(AInteger);
    while AInteger > 0 do
    begin
      AInteger := AInteger div 10;
      Inc(Result);
    end;
  end
  else
    Result := 1;
end;

function DigitCount2(const AValue: Int64): Integer;
  {Counts the number of digits in the given integer.}
begin
  if AValue <> 0 then
    Result := Math.Floor(Math.Log10(Abs(AValue))) + 1
  else
    Result := 1;
end;

function DigitCountR(AValue: Int64): Integer;
  {Counts the number of digits in the given integer using recursion.}
begin
  if AValue mod 10 = AValue then
    Result := 1
  else
    Result := 1 + DigitCountR(AValue div 10)
end;

function DigitSum(AValue: Int64): Integer;
  {Returns the sum of the digits from the given integer, using recursion.}
begin
  if AValue mod 10 = AValue then
    Result := AValue
  else
    Result := (AValue mod 10) + DigitSum(AValue div 10)
end;

function DistanceBetweenPoints(const P1, P2: TPointF): Extended; overload;
  {Calculates the distance between two given points with double precision
  floating point valued coordinates.}
begin
  Result := Math.Hypot(P1.X - P2.X, P1.Y - P2.Y);
end;

function DistanceBetweenPoints(const P1, P2: Types.TPoint): Extended; overload;
  {Calculates the distance between two points with integer valued co-ordinates.}
begin
  Result := Math.Hypot(P1.X - P2.X, P1.Y - P2.Y);
end;

procedure ExchangeInt(var I1, I2: Integer);
  {Exchanges the values of two given integers.}
var
  Temp: Integer;  // temporary value used when exchanging values
begin
  Temp := I1;
  I1 := I2;
  I2 := Temp;
end;

function Factorial(N: Byte): Int64;
  {Calculates the factorial of the given number.}
var
  K: Integer; // loop control
begin
  Result := 1;
  if (N = 0) or (N = 1) then
    Exit;
  for K := 2 to N do
    Result := Result * K;
end;

function GCD(A, B: Integer): Integer;
  {Determines the greatest common divisor of two given integers.}
var
  Temp: Integer; // used in swapping A & B
begin
  while B <> 0 do
  begin
    Temp := B;
    B := A mod Temp;
    A := Temp;
  end;
  Result := Abs(A);
end;

function GCD2(const A, B: Integer): Integer;
  {Determines the greatest common divisor of two given integers.}
begin
  if B = 0 then
    Result := Abs(A)
  else
    Result := GCD2(B, A mod B);
end;

function IsPrime(N: Integer): Boolean;
  {Checks if the given number is prime.}
var
  Max: Integer;     // max divisor
  Divisor: Integer; // different divisors to try
begin
  Result := False;
  if N < 2 then
    Exit; // not a prime
  Result := True;
  if N = 2 then
    Exit; // 2 is prime
  if N mod 2 = 0 then
    Result := False; // even numbers > 2 are not prime
  Max := Trunc(Sqrt(N)) + 1;
  Divisor := 3;
  // test odd numbers
  while (Max > Divisor) and Result do
  begin
    if (N mod Divisor) = 0 then
      Result := False;
    Inc(Divisor, 2); // next odd number
  end;
end;

function IsPrime2(Val: Integer): Boolean;
  {Checks if the given number is prime.}
var
  X: Integer; // index
begin
  Result := (Val > 1);
  if Result then
  begin
    for X := (Val div 2) downto 2 do
    begin
      Result := Result and ((Val mod X) <> 0);
      if not Result then
    	Break;
    end;
  end;
end;

function IsRectNormal(const R: Windows.TRect): Boolean;
  {Checks if the given rectangle is normalized, i.e. Left <= Right and Top <=
  Bottom.}
begin
  Result := (R.Left <= R.Right) and (R.Top <= R.Bottom);
end;

function LCD(A, B: Integer): Integer;
  {Returns the least common divisor of two given integers.}
begin
  Result := Abs((A * B)) div GCD(A, B);
end;

function MaxOfArray(const A: array of Double): Double; overload;
  {Returns the maximum value contained in the given array of double precision
  floating point values.
  The array must not be empty.}
var
  Idx: Integer;
begin
  Assert(Length(A) > 0);
  Result := A[Low(A)];
  for Idx := Succ(Low(A)) to High(A) do
    if A[Idx] > Result then
      Result := A[Idx];
end;

function MaxOfArray(const A: array of Extended): Extended; overload;
  {Returns the maximum value contained in the given array of extended precision
  floating point values.
  The array must not be empty.}
var
  Idx: Integer;
begin
  Assert(Length(A) > 0);
  Result := A[Low(A)];
  for Idx := Succ(Low(A)) to High(A) do
    if A[Idx] > Result then
      Result := A[Idx];
end;

function MaxOfArray(const A: array of Int64): Int64; overload;
  {Returns the maximum value contained in the given array of 64 bit integer
  values.
  The array must not be empty.}
var
  Idx: Integer;
begin
  Assert(Length(A) > 0);
  Result := A[Low(A)];
  for Idx := Succ(Low(A)) to High(A) do
    if A[Idx] > Result then
      Result := A[Idx];
end;

function MaxOfArray(const A: array of Integer): Integer; overload;
  {Returns the maximum value contained in the given array of integer values.
  The array must not be empty.}
var
  Idx: Integer;
begin
  Assert(Length(A) > 0);
  Result := A[Low(A)];
  for Idx := Succ(Low(A)) to High(A) do
    if A[Idx] > Result then
      Result := A[Idx];
end;

function MaxOfArray(const A: array of Single): Single; overload;
  {Returns the maximum value contained in the given array of single precision
  floating point values.
  The array must not be empty.}
var
  Idx: Integer;
begin
  Assert(Length(A) > 0);
  Result := A[Low(A)];
  for Idx := Succ(Low(A)) to High(A) do
    if A[Idx] > Result then
      Result := A[Idx];
end;

function Mid(const A, B, C: Double): Double; overload;
  {Returns the middle of three double precision floating point values.}
begin
  Result := Math.Min(
    Math.Min(
      Math.Max(A, B), Math.Max(B, C)
    ),
    Math.Max(A, C)
  );
end;

function Mid(const A, B, C: Extended): Extended; overload;
  {Returns the middle of three extended precision floating point values.}
begin
  Result := Math.Min(
    Math.Min(
      Math.Max(A, B), Math.Max(B, C)
    ),
    Math.Max(A, C)
  );
end;

function Mid(const A, B, C: Int64): Int64; overload;
  {Returns the middle of three 64 bit integer values.}
begin
  Result := Math.Min(
    Math.Min(
      Math.Max(A, B), Math.Max(B, C)
    ),
    Math.Max(A, C)
  );
end;

function Mid(const A, B, C: Integer): Integer; overload;
  {Returns the middle of three integer values.}
begin
  Result := Math.Min(
    Math.Min(
      Math.Max(A, B), Math.Max(B, C)
    ),
    Math.Max(A, C)
  );
end;

function Mid(const A, B, C: Single): Single; overload;
  {Returns the middle of three single precision floating point values.}
begin
  Result := Math.Min(
    Math.Min(
      Math.Max(A, B), Math.Max(B, C)
    ),
    Math.Max(A, C)
  );
end;

procedure MinMidMax(const A, B, C: Double; out Min, Mid, Max: Double); overload;
  {Finds the minimum, middle and maximum values of three double precision
  floating point numbers, A, B and C and returns them in Min, Mid and Max
  respectively.}
var
  Temp: Double;
begin
  if A > B then
  begin
    Max := A;
    Min := B;
  end
  else
  begin
    Max := B;
    Min := A;
  end;
  if C > Max then
  begin
    Mid := Max;
    Max := C;
    if Mid < Min then
    begin
      Temp := Mid;
      Mid := Min;
      Min := Temp;
    end;
  end
  else
  begin
    Mid := Min;
    Min := C;
    if Mid < Min then
    begin
      Temp := Mid;
      Mid := Min;
      Min := Temp;
    end;
  end;
end;

procedure MinMidMax(const A, B, C: Extended; out Min, Mid, Max: Extended);
  overload;
  {Finds the minimum, middle and maximum values of three extended precision
  floating point numbers, A, B and C and returns them in Min, Mid and Max
  respectively.}
var
  Temp: Extended;
begin
  if A > B then
  begin
    Max := A;
    Min := B;
  end
  else
  begin
    Max := B;
    Min := A;
  end;
  if C > Max then
  begin
    Mid := Max;
    Max := C;
    if Mid < Min then
    begin
      Temp := Mid;
      Mid := Min;
      Min := Temp;
    end;
  end
  else
  begin
    Mid := Min;
    Min := C;
    if Mid < Min then
    begin
      Temp := Mid;
      Mid := Min;
      Min := Temp;
    end;
  end;
end;

procedure MinMidMax(const A, B, C: Int64; out Min, Mid, Max: Int64); overload;
  {Finds the minimum, middle and maximum values of three 64 bit integers, A, B
  and C and returns them in Min, Mid and Max respectively.}
var
  Temp: Int64;
begin
  if A > B then
  begin
    Max := A;
    Min := B;
  end
  else
  begin
    Max := B;
    Min := A;
  end;
  if C > Max then
  begin
    Mid := Max;
    Max := C;
    if Mid < Min then
    begin
      Temp := Mid;
      Mid := Min;
      Min := Temp;
    end;
  end
  else
  begin
    Mid := Min;
    Min := C;
    if Mid < Min then
    begin
      Temp := Mid;
      Mid := Min;
      Min := Temp;
    end;
  end;
end;

procedure MinMidMax(const A, B, C: Integer; out Min, Mid, Max: Integer);
  overload;
  {Finds the minimum, middle and maximum values of three integers, A, B and C
  and returns them in Min, Mid and Max respectively.}
var
  Temp: Integer;
begin
  if A > B then
  begin
    Max := A;
    Min := B;
  end
  else
  begin
    Max := B;
    Min := A;
  end;
  if C > Max then
  begin
    Mid := Max;
    Max := C;
    if Mid < Min then
    begin
      Temp := Mid;
      Mid := Min;
      Min := Temp;
    end;
  end
  else
  begin
    Mid := Min;
    Min := C;
    if Mid < Min then
    begin
      Temp := Mid;
      Mid := Min;
      Min := Temp;
    end;
  end;
end;

procedure MinMidMax(const A, B, C: Single; out Min, Mid, Max: Single); overload;
  {Finds the minimum, middle and maximum values of three single precision
  floating point numbers, A, B and C and returns them in Min, Mid and Max
  respectively.}
var
  Temp: Single;
begin
  if A > B then
  begin
    Max := A;
    Min := B;
  end
  else
  begin
    Max := B;
    Min := A;
  end;
  if C > Max then
  begin
    Mid := Max;
    Max := C;
    if Mid < Min then
    begin
      Temp := Mid;
      Mid := Min;
      Min := Temp;
    end;
  end
  else
  begin
    Mid := Min;
    Min := C;
    if Mid < Min then
    begin
      Temp := Mid;
      Mid := Min;
      Min := Temp;
    end;
  end;
end;

function MinOfArray(const A: array of Double): Double; overload;
  {Returns the minimum value contained in the given array of double precision
  floating point values.
  The array must not be empty.}
var
  Idx: Integer;
begin
  Assert(Length(A) > 0);
  Result := A[Low(A)];
  for Idx := Succ(Low(A)) to High(A) do
    if A[Idx] < Result then
      Result := A[Idx];
end;

function MinOfArray(const A: array of Extended): Extended; overload;
  {Returns the minimum value contained in the given array of extended precision
  floating point values.
  The array must not be empty.}
var
  Idx: Integer;
begin
  Assert(Length(A) > 0);
  Result := A[Low(A)];
  for Idx := Succ(Low(A)) to High(A) do
    if A[Idx] < Result then
      Result := A[Idx];
end;

function MinOfArray(const A: array of Int64): Int64; overload;
  {Returns the minimum value contained in the given array of 64 bit integer
  values.
  The array must not be empty.}
var
  Idx: Integer;
begin
  Assert(Length(A) > 0);
  Result := A[Low(A)];
  for Idx := Succ(Low(A)) to High(A) do
    if A[Idx] < Result then
      Result := A[Idx];
end;

function MinOfArray(const A: array of Integer): Integer; overload;
  {Returns the minimum value contained in the given array of integer values.
  The array must not be empty.}
var
  Idx: Integer;
begin
  Assert(Length(A) > 0);
  Result := A[Low(A)];
  for Idx := Succ(Low(A)) to High(A) do
    if A[Idx] < Result then
      Result := A[Idx];
end;

function MinOfArray(const A: array of Single): Single; overload;
  {Returns the minimum value contained in the given array of single precision
  floating point values.
  The array must not be empty.}
var
  Idx: Integer;
begin
  Assert(Length(A) > 0);
  Result := A[Low(A)];
  for Idx := Succ(Low(A)) to High(A) do
    if A[Idx] < Result then
      Result := A[Idx];
end;

function MoveRectToOrigin(const R: Types.TRect): Types.TRect;
  {Translates the give rectangle to the origin.
  The top and left co-ordinates are set to zero and the bottom and right
  co-ordinates are adjusted accordingly.}
begin
  Result := R;
  Types.OffsetRect(Result, -R.Left, -R.Top);
end;

procedure NormaliseFractionSign(var Num, Denom: Integer);
  {Normalises the sign of the fraction with numerator Num and denominator Denom
  so that Num takes the sign of the fraction and Denom is non-negative.}
begin
  if Denom < 0 then
  begin
    Num := -Num;
    Denom := -Denom;
  end;
end;

function NormalizeRect(const R: Windows.TRect): Windows.TRect;
  {Normalises the given rectangle so that Left <= Right and Top <= Bottom.}
begin
  Result := R;
  if Result.Left > Result.Right then
    ExchangeInt(Result.Left, Result.Right);
  if Result.Top > Result.Bottom then
    ExchangeInt(Result.Top, Result.Bottom);
end;

function PointF(const AX, AY: Double): TPointF;
  {Constructs and returns a TPointF record with the given x & y coordinates.}
begin
  Result.X := AX;
  Result.Y := AY;
end;

function Pow(const Base: Int64; const Exponent: Byte): Int64;
  {Raises integer value Base to non-negative integer power Exponent and returns
  the result.}
var
  I: Byte;
begin
  Result := 1;
  for I := 1 to Exponent do
    Result := Result * Base;
end;

function RectArea(const R: Windows.TRect): Int64;
  {Returns the area of the given rectangle.}
begin
  Result := Abs((R.Right - R.Left) * (R.Bottom - R.Top));
end;

function RectF(const ALeft, ATop, ARight, ABottom: Double): TRectF;
  {Constructs and returns a TRectF record with the given left, top, right &
  bottom coordinates.}
begin
  Result.Left := ALeft;
  Result.Top := ATop;
  Result.Right := ARight;
  Result.Bottom := ABottom;
end;

function RectHeight(const R: Windows.TRect): Integer;
  {Returns the height of the given rectangle.
  The return value is always non-negative even if the rectangle is not
  normalized.}
begin
  Result := R.Bottom - R.Top;
  if Result < 0 then
    Result := -Result;
end;

function RectSize(const R: Windows.TRect): Windows.TSize;
  {Returns the size of the given rectangle.
  The returned dimensions are always non-negative even if the rectangle is not
  normalized.}
begin
  Result.cx := RectWidth(R);
  Result.cy := RectHeight(R);
end;

function RectWidth(const R: Windows.TRect): Integer;
  {Returns the width of the given rectangle.
  The return value is always non-negative even if the rectangle is not
  normalized.}
begin
  Result := R.Right - R.Left;
  if Result < 0 then
    Result := -Result;
end;

function RepeatedDigits(N: Int64): Boolean;
  {Checks if the given integer contains only a single repeated digit.}
begin
  N := Abs(N);
  if N > 0 then
    Result :=
      N = SysUtils.StrToInt64(
        StringOfChar(
          Char(48 + N mod 10),
          Succ(Math.Floor(Math.Log10(N)))
        )
      )
  else
    Result := True;
end;

function ResizeRect(const R: Types.TRect; const NewSize: Types.TSize):
  Types.TRect; overload;
  {Resizes rectangle R to size NewSize, leaving the top-left position unchanged.
  Returns the resized rectangle.}
begin
  Result := ResizeRect(R, NewSize.CX, NewSize.CY);
end;

function ResizeRect(const R: Types.TRect; const NewWidth, NewHeight: LongInt):
  Types.TRect; overload;
  {Resizes rectangle R to the width and height given by NewWidth and NewHeight,
  leaving the top-left position unchanged.
  Returns the resized rectangle.}
begin
  Result := Types.Bounds(R.Left, R.Top, NewWidth, NewHeight);
end;

function ReverseNumber(AValue: Int64): Int64;
  {Reverses the digits of the given integer and returns the resulting value.
  The given integer should be greater than zero: the function always returns
  zero for negative integers.}
begin
  Result := 0;
  while AValue > 0 do
  begin
    Result := (Result * 10) + (AValue mod 10);
    AValue := AValue div 10;
  end;
end;

function ReverseNumberR(AValue: Int64): Int64;
  {Reverses the digits of the given integer, which must be non-negative, and
  returns the resulting value.
  Uses recursion.}
begin
  Assert(AValue >= 0);
  if AValue mod 10 = AValue then
    Result := AValue
  else
    Result := ((AValue mod 10) * Trunc(IntPower(10, Trunc(Log10(AValue)))))
      + ReverseNumberR(AValue div 10)
end;

function SAR(Value: LongInt; Shift: Byte): LongInt;
  {Performs an arithmetic right shift operation on the given value and returns
  the result. Value is shifted right by Shift bits.
  Shift must be in the range 0..31 and is adjusted if it is not.}
begin
  Shift := Shift and 31;
  if Shift = 0 then
  begin
    Result := Value;
    Exit;
  end;
  Result := LongInt(LongWord(Value) shr Shift);
  if Value < 0 then
    Result := LongInt(LongWord(Result) or ($FFFFFFFF shl (32 - Shift)));
end;

function ScaleRect(const ARect: Types.TRect; AScaling: Double): Types.TRect;
  {Scales the given rectangle by the given scale factor and returns the scaled
  rectangle.}
begin
  Result.Left := System.Round(ARect.Left * AScaling);
  Result.Top := System.Round(ARect.Top * AScaling);
  Result.Right := System.Round(ARect.Right * AScaling);
  Result.Bottom := System.Round(ARect.Bottom * AScaling);
end;

function SignOfFloat(const Value: Extended): Integer;
  {Returns the sign of the given floating point value. Returns -1 if the value
  is positive, 0 if zero or +1 if negative.}
begin
  if Value < 0.0 then
    Result := -1
  else if Value = 0.0 then
    Result := 0
  else
    Result := 1;
end;

function SignOfInt(const Value: Int64): Integer;
  {Returns the sign of the given integer. Returns -1 if the integer is positive,
  0 if zero or +1 if negative.}
begin
  if Value < 0 then
    Result := -1
  else if Value = 0 then
    Result := 0
  else
    Result := 1;
end;

function Size(const ACX, ACY: Integer): Types.TSize;
  {Constructs and returns a TSize record with the given dimensions.}
begin
  Result.cx := ACX;
  Result.cy := ACY;
end;

function StretchRect(const R: Types.TRect; const ScalingX, ScalingY: Double):
  Types.TRect; overload;
  {Stretches rectangle R by the given scaling factors and returns the result.
  The rectangle's width is scaled by ScalingX and its height by ScalingY.
  The top left corner of the rectangle is not changed.}
{$IFDEF FPC}
const
{$ELSE}
resourcestring
{$ENDIF}
  sErrorMsg = 'StretchRect(): Rectangle bottom or right out of bounds.';
var
  NewW, NewH: Double;  // stretched width and height of rectangle
begin
  NewW := (R.Right - R.Left) * ScalingX;
  NewH := (R.Bottom - R.Top) * ScalingY;
  if (Abs(NewW + R.Left) > High(LongInt))
    or (Abs(NewH + R.Top) > High(LongInt)) then
    raise SysUtils.EOverflow.Create(sErrorMsg);
  Result := Types.Bounds(R.Left, R.Top, System.Round(NewW), System.Round(NewH));
end;

function StretchRect(const R: Types.TRect; const Scaling: Double):
  Types.TRect; overload;
  {Stretches the rectangle R by scale factor Scaling and returns the result.
  Both width and height are stretched by the same scale factor.
  The top left corner is not changed.}
begin
  Result := StretchRect(R, Scaling, Scaling);
end;

function ZoomRatio(const DestWidth, DestHeight, SrcWidth, SrcHeight: Integer):
  Double; overload;
  {Calculates and returns the largest scaling that can be applied to a rectangle
  of width SrcWidth and height SrcHeight to fit it, without changing the aspect
  ratio, within a second rectangle of width DestWidth and height DestHeight.}
begin
  Result := Math.Min(DestWidth / SrcWidth, DestHeight / SrcHeight);
end;

function ZoomRatio(const DestSize, SrcSize: Types.TSize): Double; overload;
  {Calculates and returns the largest scaling that can be applied to a rectangle
  of size SrcSize to fit it, without changing the aspect ratio, within a second
  rectangle of size DestSize.}
begin
  Result := ZoomRatio(DestSize.cx, DestSize.cy, SrcSize.cx, SrcSize.cy);
end;

function ZoomRatio(const DestRect, SrcRect: Types.TRect): Double; overload;
  {Calculates and returns the largest scaling that can be applied to rectangle
  SrcRect to fit it, without changing the aspect ratio, within rectangle
  DestRect.}
begin
  Result := ZoomRatio(RectSize(DestRect), RectSize(SrcRect));
end;

constructor TSizeEx.Create(ACX, ACY: Integer);
begin
  CX := ACX;
  CY := ACY;
end;

class operator TSizeEx.Equal(S1, S2: TSizeEx): Boolean;
begin
  // zero records are special: can be zero when only one of CX or CY is zero
  if S1.IsZero and S2.IsZero then
  begin
    Result := True;
    Exit;
  end;
  Result := (S1.CX = S1.CX) and (S1.CY = S2.CY);
end;

class operator TSizeEx.Implicit(S: Types.TSize): TSizeEx;
begin
  Result.CX := S.cx;
  Result.CY := S.cy;
end;

class operator TSizeEx.Implicit(S: TSizeEx): Types.TSize;
begin
  Result.cx := S.CX;
  Result.cy := S.CY;
end;

function TSizeEx.IsZero: Boolean;
begin
  Result := (CX = 0) or (CY = 0);
end;

class operator TSizeEx.NotEqual(S1, S2: TSizeEx): Boolean;
begin
  Result := not (S1 = S2);
end;

end.
