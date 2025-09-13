unit TestUStructCatSnippets;

interface

uses
  SysUtils, TestFramework, UStructCatSnippets;

implementation

uses
  Types;

type

  TestMiscStructsCatSnippets = class(TTestCase)
  published
    procedure TestType_TPointF;
    procedure TestType_TRange;
    procedure TestType_TRectF;      // requires TPointF
    procedure TestFunction_PointF;  // requires TPointF
    procedure TestFunction_Range;   // requires TRange
    procedure TestFunction_RectF;   // requires TPointF & TRectF
    procedure TestFunction_Size;
    procedure TestFunction_BoundsF; // requires TRectF & RectF
  end;

  TestTSizeEx = class(TTestCase)
  published
    // Order of tests is important Ctor then implicit ops then equality ops and
    // IsZero method
    procedure TestCtorAndFields;
    procedure TestImplicitOp_TSizeToTSizeEx;
    procedure TestImplicitOp_TSizeExToTSize;
    procedure TestEqualOp;
    procedure TestNotEqualOp;
    procedure TestIsZero;
  end;

  TestTRangeEx = class(TTestCase)
  published
    procedure TestCtorAndFields;
    procedure TestContains;
    procedure TestConstrain;
  end;

  TestTIntegerRange = class(TTestCase)
  private
    procedure TestCtorAndPropsException;
    procedure TestConstrainException;
  published
    procedure TestCtorAndProps;
    procedure TestCreateEmpty;
    procedure TestIsEmpty;
    procedure TestLength;
    procedure TestConstrain;
    procedure TestEqualOp;
    procedure TestNotEqualOp;
    procedure TestLessThanOrEqualOp;
    procedure TestGreaterThanOrEqualOp;
    procedure TestAddOp;
    procedure TestMultiplyOp;
    procedure TestInOp;
    procedure TestImplicitToStringOp;
    procedure TestExplicitToStringOp;
    procedure TestOverlapsWith; // depends upon operator overloads
    procedure TestIsContiguousWith;
    procedure TestIsContinuousWith;
  end;

{ TestMiscStructsCatSnippets }

procedure TestMiscStructsCatSnippets.TestFunction_BoundsF;
var
  R, Expected: TRectF;
const
  Delta = 0.00000001;
begin
  R := BoundsF(10.3, 20.4, 10.5, 20.6);
  Expected := RectF(10.3, 20.4, 10.3+10.5, 20.4+20.6);
  CheckEquals(Expected.Left, R.Left, Delta, 'left');
  CheckEquals(Expected.Top, R.Top, Delta, 'top');
  CheckEquals(Expected.Right, R.Right, Delta, 'right');
  CheckEquals(Expected.Bottom, R.Bottom, Delta, 'bottom');
end;

procedure TestMiscStructsCatSnippets.TestFunction_PointF;
var
  P: TPointF;
const
  Delta = 0.00000001;
begin
  P := PointF(0.0, 0.0);
  CheckEquals(0.0, P.X, Delta, '#1X');
  CheckEquals(0.0, P.Y, Delta, '#1Y');
  P := PointF(42.56, -12.345);
  CheckEquals(42.56, P.X, Delta, '#2X');
  CheckEquals(-12.345, P.Y, Delta, '#2Y');
end;

procedure TestMiscStructsCatSnippets.TestFunction_Range;
var
  R: TRange;
begin
  // Range function orders parameters
  R := Range(42, 56);
  CheckEquals(42, R.Lower, '#1 lower');
  CheckEquals(56, R.Upper, '#1 upper');
  R := Range(56, 42);
  CheckEquals(42, R.Lower, '#2 lower');
  CheckEquals(56, R.Upper, '#2 upper');
end;

procedure TestMiscStructsCatSnippets.TestFunction_RectF;
var
  R: TRectF;
const
  Delta = 0.00000001;
begin
  R := RectF(0.0, -10.8, 34.56, 20.3);
  CheckEquals(0.0, R.Left, Delta, 'left');
  CheckEquals(-10.8, R.Top, Delta, 'top');
  CheckEquals(34.56, R.Right, Delta, 'right');
  CheckEquals(20.3, R.Bottom, Delta, 'bottom');
  CheckEquals(0.0, R.TopLeft.X, Delta, 'topleft.x');
  CheckEquals(-10.8, R.TopLeft.Y, Delta, 'topleft.y');
  CheckEquals(34.56, R.BottomRight.X, Delta, 'bottomright.x');
  CheckEquals(20.3, R.BottomRight.Y, Delta, 'bottomright.y');
end;

procedure TestMiscStructsCatSnippets.TestFunction_Size;
var
  S: TSize;
begin
  S.cx := 42;
  S.cy := 56;
  CheckEquals(42, S.cx, 'cx');
  CheckEquals(56, S.cy, 'cy');
end;

procedure TestMiscStructsCatSnippets.TestType_TPointF;
var
  P: TPointF;
const
  Delta = 0.00000001;
begin
  P.X := 0.0;
  P.Y := 0.0;
  CheckEquals(0.0, P.X, Delta, '#1X');
  CheckEquals(0.0, P.Y, Delta, '#1Y');
  P.X := 42.56;
  P.Y := -12.345;
  CheckEquals(42.56, P.X, Delta, '#2X');
  CheckEquals(-12.345, P.Y, Delta, '#2Y');
end;

procedure TestMiscStructsCatSnippets.TestType_TRange;
var
  R: TRange;
begin
  // Test direct field setting
  R.Lower := 42;
  R.Upper := 56;
  CheckEquals(42, R.Lower, '#1 lower');
  CheckEquals(56, R.Upper, '#1 upper');
  R.Lower := 56;
  R.Upper := 42;
  CheckEquals(56, R.Lower, '#2 lower');
  CheckEquals(42, R.Upper, '#2 upper');
end;

procedure TestMiscStructsCatSnippets.TestType_TRectF;
var
  R: TRectF;
  TL, BR: TPointF;
const
  Delta = 0.00000001;
begin
  // Set Left, Right, Top & Bottom fields
  R.Left := 2.2;
  R.Right := 6.6;
  R.Top := 8.8;
  R.Bottom := 16.16;
  TL.X := 2.2;
  TL.Y := 8.8;
  BR.X := 6.6;
  BR.Y := 16.16;
  CheckEquals(2.2, R.Left, Delta, '#1 left');
  CheckEquals(6.6, R.Right, Delta, '#1 right');
  CheckEquals(8.8, R.Top, Delta, '#1 top');
  CheckEquals(16.16, R.Bottom, Delta, '#1 bottom');
  CheckEquals(2.2, R.TopLeft.X, Delta, '#1 topleft.x');
  CheckEquals(8.8, R.TopLeft.Y, Delta, '#1 topleft.y');
  CheckEquals(6.6, R.BottomRight.X, Delta, '#1 bottomright.x');
  CheckEquals(16.16, R.BottomRight.Y, Delta, '#1 bottomright.y');
  // Set TopLeft & BottomRight TPointF properties
  TL.X := 10.11;
  TL.Y := 12.13;
  BR.X := 11.12;
  BR.Y := 13.14;
  R.TopLeft := TL;
  R.BottomRight := BR;
  CheckEquals(10.11, R.Left, Delta, '#2 left');
  CheckEquals(12.13, R.Top, Delta, '#2 top');
  CheckEquals(11.12, R.Right, Delta, '#2 right');
  CheckEquals(13.14, R.Bottom, Delta, '#2 bottom');
end;

{ TestTSizeEx }

procedure TestTSizeEx.TestCtorAndFields;
var
  S: TSizeEx;
begin
  // Test direct field access
  S.CX := 42;
  S.CY := -56;
  CheckEquals(42, S.CX, '#1a');
  CheckEquals(-56, S.CY, '#1b');
  // Text Ctor
  S := TSizeEx.Create(42, -56);
  CheckEquals(42, S.CX, '#2a');
  CheckEquals(-56, S.CY, '#2b');
end;

procedure TestTSizeEx.TestEqualOp;
var
  Sx0, Sx1a, Sx1b, Sx2: TSizeEx;
  S0, S1, S2: TSize;
begin
  // Test with both operands TSizeEx
  Sx0 := TSizeEx.Create(0, 0);
  Sx1a := TSizeEx.Create(42, 56);
  Sx1b := TSizeEx.Create(42, 56);
  Sx2 := TSizeEx.Create(99, 99);
  CheckTrue(Sx1a = Sx1b, '#1a');
  CheckFalse(Sx0 = Sx2, '#1b');
  CheckFalse(Sx1a = Sx2, '#1c');
  // Test with one TSizeEx and one TSize operanc
  S0 := Sx0;
  S1 := Sx1a;
  S2 := Sx2;
  CheckTrue(Sx1a = S1, '#2a');
  CheckFalse(S0 = Sx2, '#2b');
  CheckTrue(S2 = Sx2, '#2c');
end;

procedure TestTSizeEx.TestImplicitOp_TSizeExToTSize;
var
  Src: TSizeEx;
  Dest: TSize;
begin
  Src := TSizeEx.Create(23, -99);
  Dest := Src;
  CheckEquals(23, Dest.cx, 'cx');
  CheckEquals(-99, Dest.cy, 'cy');
end;

procedure TestTSizeEx.TestImplicitOp_TSizeToTSizeEx;
var
  Src: TSize;
  Dest: TSizeEx;
begin
  Src := TSizeEx.Create(23, 423);
  Dest := Src;
  CheckEquals(23, Dest.CX, 'CX');
  CheckEquals(423, Dest.CY, 'CY');
end;

procedure TestTSizeEx.TestIsZero;
var
  S: TSizeEx;
begin
  S := TSizeEx.Create(12, 23);
  CheckFalse(S.IsZero, '#1');
  S := TSizeEx.Create(0, 0);
  CheckTrue(S.IsZero, '#2');
  S := TSizeEx.Create(0, 1);
  CheckTrue(S.IsZero, '#3');
  S := TSizeEx.Create(-1, 0);
  CheckTrue(S.IsZero, '#4');
end;

procedure TestTSizeEx.TestNotEqualOp;
var
  Sx0, Sx1a, Sx1b, Sx2: TSizeEx;
  S0, S1, S2: TSize;
begin
  // Test with both operands TSizeEx
  Sx0 := TSizeEx.Create(0, 0);
  Sx1a := TSizeEx.Create(42, 56);
  Sx1b := TSizeEx.Create(42, 56);
  Sx2 := TSizeEx.Create(99, 99);
  CheckFalse(Sx1a <> Sx1b, '#1a');
  CheckTrue(Sx0 <> Sx2, '#1b');
  CheckTrue(Sx1a <> Sx2, '#1c');
  // Test with one TSizeEx and one TSize operanc
  S0 := Sx0;
  S1 := Sx1a;
  S2 := Sx2;
  CheckFalse(Sx1a <> S1, '#2a');
  CheckTrue(S0 <> Sx2, '#2b');
  CheckFalse(S2 <> Sx2, '#2c');
end;

{ TestTRangeEx }

procedure TestTRangeEx.TestConstrain;
var
  R: TRangeEx;
begin
  // Min < Max => expected results
  R := TRangeEx.Create(-42, 56);
  CheckEquals(2, R.Constrain(2), '#1a');
  CheckEquals(-42, R.Constrain(-42), '#1b');
  CheckEquals(56, R.Constrain(56), '#1c');
  CheckEquals(-42, R.Constrain(-99), '#1d');
  CheckEquals(56, R.Constrain(99), '#1e');
  // Min > Max => bonkers results !!!
  R := TRangeEx.Create(56, 42);
  CheckEquals(56, R.Constrain(2), '#2a');   // !!! should be 42
  CheckEquals(56, R.Constrain(42), '#2b');  // !!! should be 42
  CheckEquals(42, R.Constrain(56), '#2c');  // !!! should be 56
  CheckEquals(56, R.Constrain(48), '#2d');  // !!! should be 48
  CheckEquals(56, R.Constrain(40), '#2e');  // !!! should be 42
  CheckEquals(42, R.Constrain(99), '#2f');  // !!! should be 56
  // Min = Max => expected results
  R := TRangeEx.Create(3, 3);
  CheckEquals(3, R.Constrain(2), '#1a');
  CheckEquals(3, R.Constrain(3), '#1b');
  CheckEquals(3, R.Constrain(4), '#1c');
end;

procedure TestTRangeEx.TestContains;
var
  R: TRangeEx;
begin
  // Min < Max => expected results
  R := TRangeEx.Create(-42, 56);
  CheckTrue(R.Contains(2), '#1a');
  CheckTrue(R.Contains(-42), '#1b');
  CheckTrue(R.Contains(56), '#1c');
  CheckFalse(R.Contains(-99), '#1d');
  CheckFalse(R.Contains(57), '#1e');
  // Max > Min => bonkers results !!!
  R := TRangeEx.Create(56, 42);
  CheckFalse(R.Contains(48), '#2a'); // !!! Should be True
  CheckFalse(R.Contains(2), '#2b');
  CheckFalse(R.Contains(99), '#2c');
  CheckFalse(R.Contains(42), '#2b'); // !!! Should be True
  CheckFalse(R.Contains(56), '#2b'); // !!! Should be True
  // Min = Max => expected results
  R := TRangeEx.Create(3, 3);
  CheckFalse(R.Contains(2), '#3a');
  CheckFalse(R.Contains(4), '#3b');
  CheckTrue(R.Contains(3), '#3c');
end;

procedure TestTRangeEx.TestCtorAndFields;
var
  R: TRangeEx;
begin
  // Direct field access: no ordering of range
  R.Min := 42;
  R.Max := 56;
  CheckEquals(42, R.Min, '#1 min');
  CheckEquals(56, R.Max, '#1 max');
  R.Min := 56;
  R.Max := 42;
  CheckEquals(56, R.Min, '#2 min');
  CheckEquals(42, R.Max, '#2 max');
  // Ctor: also no ordering of range
  R := TRangeEx.Create(42, 56);
  CheckEquals(42, R.Min, '#3 min');
  CheckEquals(56, R.Max, '#3 max');
  R := TRangeEx.Create(56, 42);
  CheckEquals(56, R.Min, '#3 min');
  CheckEquals(42, R.Max, '#3 max');
end;

{ TestTIntegerRange }

procedure TestTIntegerRange.TestAddOp;
var
  L, R, E: TIntegerRange;
begin
  L := TIntegerRange.Create(0, 0);
  R := TIntegerRange.Create(0, 0);
  E := TIntegerRange.Create(0, 0);
  CheckTrue(E = L + R, '#1a');
  CheckTrue(E = R + L, '#1b');
  L := TIntegerRange.Create(1, 4);
  R := TIntegerRange.Create(7, 10);
  E := TIntegerRange.Create(1, 10);
  CheckTrue(E = L + R, '#2a');
  CheckTrue(E = R + L, '#2b');
  L := TIntegerRange.Create(2, 5);
  R := TIntegerRange.Create(4, 10);
  E := TIntegerRange.Create(2, 10);
  CheckTrue(E = L + R, '#3a');
  CheckTrue(E = R + L, '#3b');
  L := TIntegerRange.Create(2, 5);
  R := TIntegerRange.Create(-3, 10);
  E := TIntegerRange.Create(-3, 10);
  CheckTrue(E = L + R, '#4a');
  CheckTrue(E = R + L, '#4b');
  L := TIntegerRange.Create(2, 5);
  R := TIntegerRange.Create(5, 5);
  E := TIntegerRange.Create(2, 5);
  CheckTrue(E = L + R, '#5a');
  CheckTrue(E = R + L, '#5b');
  L := TIntegerRange.Create(2, 5);
  R := TIntegerRange.Create(2, 5);
  E := TIntegerRange.Create(2, 5);
  CheckTrue(E = L + R, '#6a');
  CheckTrue(E = R + L, '#6b');
  L := TIntegerRange.CreateEmpty;
  R := TIntegerRange.CreateEmpty;
  E := TIntegerRange.CreateEmpty;
  CheckTrue(E = L + R, '#9');
  L := TIntegerRange.Create(10, 10);
  R := TIntegerRange.CreateEmpty;
  E := TIntegerRange.Create(10, 10);
  CheckTrue(E = L + R, '#10a');
  CheckTrue(E = R + L, '#10b');
end;

procedure TestTIntegerRange.TestConstrain;
var
  R: TIntegerRange;
begin
  R := TIntegerRange.Create(0, 0);
  CheckEquals(0, R.Constrain(-2), '#1a');
  CheckEquals(0, R.Constrain(4356), '#1b');
  CheckEquals(0, R.Constrain(0), '#1c');
  R := TIntegerRange.Create(-42, 56);
  CheckEquals(-2, R.Constrain(-2), '#2a');
  CheckEquals(56, R.Constrain(4356), '#2b');
  CheckEquals(56, R.Constrain(56), '#2c');
  CheckEquals(-42, R.Constrain(-42), '#2d');
  CheckEquals(-42, R.Constrain(-43), '#2e');
  CheckEquals(56, R.Constrain(57), '#2f');
  CheckEquals(12, R.Constrain(12), '#2g');
  CheckException(TestConstrainException, EInvalidOpException, '#3');
end;

procedure TestTIntegerRange.TestConstrainException;
var
  R: TIntegerRange;
begin
  R := TIntegerRange.CreateEmpty;
  R.Constrain(0);
end;

procedure TestTIntegerRange.TestCreateEmpty;
var
  R: TIntegerRange;
begin
  R := TIntegerRange.CreateEmpty;
  CheckTrue(R.IsEmpty, '#1');
end;

procedure TestTIntegerRange.TestCtorAndProps;
var
  R: TIntegerRange;
begin
  R := TIntegerRange.Create(0, 0);
  CheckEquals(0, R.LowerBound, '#1a');
  CheckEquals(0, R.UpperBound, '#1b');
  R := TIntegerRange.Create(-3, 10);
  CheckEquals(-3, R.LowerBound, '#2a');
  CheckEquals(10, R.UpperBound, '#2b');
  R := TIntegerRange.Create(10, -42);
  CheckEquals(-42, R.LowerBound, '#3a');
  CheckEquals(10, R.UpperBound, '#3b');
  R := TIntegerRange.Create(10, 10);
  CheckEquals(10, R.LowerBound, '#4a');
  CheckEquals(10, R.UpperBound, '#4b');
  R := TIntegerRange.Create(MaxInt, -MaxInt);;
  CheckEquals(-MaxInt, R.LowerBound, '#5a');
  CheckEquals(MaxInt, R.UpperBound, '#5b');
  CheckException(TestCtorAndPropsException, EArgumentException, '#6');
end;

procedure TestTIntegerRange.TestCtorAndPropsException;
var
  R: TIntegerRange;
begin
  R := TIntegerRange.Create(Low(Integer), 0);
end;

procedure TestTIntegerRange.TestEqualOp;
var
  L, R: TIntegerRange;
begin
  L := TIntegerRange.Create(0, 0);
  R := TIntegerRange.Create(0, 0);
  CheckTrue(L = R, '#1a');
  CheckTrue(R = L, '#1b');
  L := TIntegerRange.Create(-3, 11);
  R := TIntegerRange.Create(-3, 10);
  CheckFalse(L = R, '#2a');
  CheckFalse(R = L, '#2b');
  L := TIntegerRange.Create(-43, 9);
  R := TIntegerRange.Create(10, -42);
  CheckFalse(L = R, '#3a');
  CheckFalse(R = L, '#3b');
  L := TIntegerRange.Create(10, 10);
  R := TIntegerRange.Create(10, 10);
  CheckTrue(L = R, '#4a');
  CheckTrue(R = L, '#4b');
  CheckTrue(R = R, '#5');
  L := TIntegerRange.CreateEmpty;
  R := TIntegerRange.CreateEmpty;
  CheckTrue(L = R, '#6');
  L := TIntegerRange.Create(10, 10);
  R := TIntegerRange.CreateEmpty;
  CheckFalse(L = R, '#6');
end;

procedure TestTIntegerRange.TestExplicitToStringOp;
var
  R: TIntegerRange;
begin
  R := TIntegerRange.CreateEmpty;
  CheckEquals('[]', string(R));
  R := TIntegerRange.Create(0, 0);
  CheckEquals('[0..0]', string(R));
  R := TIntegerRange.Create(-42, 56);
  CheckEquals('[-42..56]', string(R));
end;

procedure TestTIntegerRange.TestGreaterThanOrEqualOp;
var
  L, R: TIntegerRange;
begin
  L := TIntegerRange.Create(0, 0);
  R := TIntegerRange.Create(0, 0);
  CheckTrue(L >= R, '#1a');
  CheckTrue(R >= L, '#1b');
  L := TIntegerRange.Create(0, 1);
  R := TIntegerRange.Create(0, 0);
  CheckTrue(L >= R, '#2a');
  CheckFalse(R >= L, '#2b');
  L := TIntegerRange.Create(-3, 12);
  R := TIntegerRange.Create(-5, 18);
  CheckFalse(L >= R, '#3a');
  CheckTrue(R >= L, '#3b');
  L := TIntegerRange.Create(-5, 17);
  R := TIntegerRange.Create(-5, 18);
  CheckFalse(L >= R, '#4a');
  CheckTrue(R >= L, '#4b');
  L := TIntegerRange.Create(-4, 18);
  R := TIntegerRange.Create(-5, 18);
  CheckFalse(L >= R, '#5a');
  CheckTrue(R >= L, '#5b');
  L := TIntegerRange.Create(-5, 18);
  R := TIntegerRange.Create(-5, 18);
  CheckTrue(L >= R, '#6a');
  CheckTrue(R >= L, '#6b');
  L := TIntegerRange.Create(-5, 2);
  R := TIntegerRange.Create(4, 18);
  CheckFalse(L >= R, '#7a');
  CheckFalse(R >= L, '#7b');
  L := TIntegerRange.Create(1, 1);
  R := TIntegerRange.Create(4, 18);
  CheckFalse(L >= R, '#8a');
  CheckFalse(R >= L, '#8b');
  L := TIntegerRange.CreateEmpty;
  R := TIntegerRange.CreateEmpty;
  Checktrue(L >= R, '#9');
  L := TIntegerRange.Create(10, 10);
  R := TIntegerRange.CreateEmpty;
  CheckTrue(L >= R, '#10a');
  CheckFalse(R >= L, '#10b');
end;

procedure TestTIntegerRange.TestImplicitToStringOp;
var
  R: TIntegerRange;
begin
  R := TIntegerRange.CreateEmpty;
  CheckEquals('[]', R);
  R := TIntegerRange.Create(0, 0);
  CheckEquals('[0..0]', R);
  R := TIntegerRange.Create(-42, 56);
  CheckEquals('[-42..56]', R);
end;

procedure TestTIntegerRange.TestInOp;
var
  R: TIntegerRange;
begin
  R := TIntegerRange.Create(0, 0);
  CheckTrue(0 in R, '#1');
  CheckFalse(-2 in R, '#2');
  R := TIntegerRange.Create(-42, 56);
  CheckTrue(0 in R, '#3');
  CheckTrue(-2 in R, '#4');
  CheckTrue(-42 in R, '#5');
  CheckTrue(56 in R, '#6');
  CheckFalse(-43 in R, '#7');
  CheckFalse(57 in R, '#8');
  R := TIntegerRange.Create(999, 999);
  CheckTrue(999 in R, '#9');
  CheckFalse(998 in R, '#10');
  R := TIntegerRange.CreateEmpty;
  CheckFalse(0 in R, '#11');
  CheckFalse(High(Integer) in R, '#12');
  CheckFalse(Low(Integer) in R, '#13');
end;

procedure TestTIntegerRange.TestIsContiguousWith;
var
  R, S: TIntegerRange;
begin
  R := TIntegerRange.Create(4, 7);
  S := TIntegerRange.Create(8, 12);
  CheckTrue(R.IsContiguousWith(S), '#1a');
  CheckTrue(S.IsContiguousWith(R), '#1b');
  R := TIntegerRange.Create(4, 7);
  S := TIntegerRange.Create(7, 12);
  CheckFalse(R.IsContiguousWith(S), '#2a');
  CheckFalse(S.IsContiguousWith(R), '#2b');
  R := TIntegerRange.Create(1, 3);
  S := TIntegerRange.Create(7, 12);
  CheckFalse(R.IsContiguousWith(S), '#3a');
  CheckFalse(S.IsContiguousWith(R), '#3b');
  R := TIntegerRange.CreateEmpty;
  S := TIntegerRange.Create(7, 12);
  CheckFalse(R.IsContiguousWith(S), '#4a');
  CheckFalse(S.IsContiguousWith(R), '#4b');
  R := TIntegerRange.CreateEmpty;
  S := TIntegerRange.CreateEmpty;
  CheckFalse(R.IsContiguousWith(S), '#5a');
  CheckFalse(S.IsContiguousWith(R), '#5b');
  R := TIntegerRange.Create(0, 0);
  S := TIntegerRange.Create(-1, -1);
  CheckTrue(R.IsContiguousWith(S), '#6a');
  CheckTrue(S.IsContiguousWith(R), '#6b');
  R := TIntegerRange.Create(1, 3);
  S := TIntegerRange.Create(-3, 5);
  CheckFalse(R.IsContiguousWith(S), '#7a');
  CheckFalse(S.IsContiguousWith(R), '#7b');
end;

procedure TestTIntegerRange.TestIsContinuousWith;
var
  R, S: TIntegerRange;
begin
  R := TIntegerRange.Create(4, 7);
  S := TIntegerRange.Create(8, 12);
  CheckTrue(R.IsContinuousWith(S), '#1a');
  CheckTrue(S.IsContinuousWith(R), '#1b');
  R := TIntegerRange.Create(4, 7);
  S := TIntegerRange.Create(7, 12);
  CheckTrue(R.IsContinuousWith(S), '#2a');
  CheckTrue(S.IsContinuousWith(R), '#2b');
  R := TIntegerRange.Create(1, 3);
  S := TIntegerRange.Create(7, 12);
  CheckFalse(R.IsContinuousWith(S), '#3a');
  CheckFalse(S.IsContinuousWith(R), '#3b');
  R := TIntegerRange.CreateEmpty;
  S := TIntegerRange.Create(7, 12);
  CheckTrue(R.IsContinuousWith(S), '#4a');
  CheckTrue(S.IsContinuousWith(R), '#4b');
  R := TIntegerRange.CreateEmpty;
  S := TIntegerRange.CreateEmpty;
  CheckTrue(R.IsContinuousWith(S), '#5a');
  CheckTrue(S.IsContinuousWith(R), '#5b');
  R := TIntegerRange.Create(0, 0);
  S := TIntegerRange.Create(-1, -1);
  CheckTrue(R.IsContinuousWith(S), '#6a');
  CheckTrue(S.IsContinuousWith(R), '#6b');
  R := TIntegerRange.Create(1, 3);
  S := TIntegerRange.Create(-3, 5);
  CheckTrue(R.IsContinuousWith(S), '#7a');
  CheckTrue(S.IsContinuousWith(R), '#7b');
end;

procedure TestTIntegerRange.TestIsEmpty;
var
  R: TIntegerRange;
begin
  R := TIntegerRange.Create(0, 0);
  CheckFalse(R.IsEmpty, '#1');
  R := TIntegerRange.Create(-3, 10);
  CheckFalse(R.IsEmpty, '#2');
  R := TIntegerRange.Create(10, -42);
  CheckFalse(R.IsEmpty, '#3');
  R := TIntegerRange.Create(10, 10);
  CheckFalse(R.IsEmpty, '#4');
  R := TIntegerRange.CreateEmpty;
  CheckTrue(R.IsEmpty, '#5');
end;

procedure TestTIntegerRange.TestLength;
var
  R: TIntegerRange;
begin
  R := TIntegerRange.Create(0, 0);
  CheckEquals(1, R.Length, '#1');
  R := TIntegerRange.Create(-3, 10);
  CheckEquals(14, R.Length, '#2');
  R := TIntegerRange.Create(10, -42);
  CheckEquals(53, R.Length, '#3');
  R := TIntegerRange.Create(10, 10);
  CheckEquals(1, R.Length, '#4');
  R := TIntegerRange.Create(12, 11);
  CheckEquals(2, R.Length, '#5');
  R := TIntegerRange.CreateEmpty;
  CheckEquals(0, R.Length, '#6');
  R := TIntegerRange.Create(-MaxInt, MaxInt);
  CheckEquals(High(Cardinal), R.Length, '#7');
end;

procedure TestTIntegerRange.TestLessThanOrEqualOp;
var
  L, R: TIntegerRange;
begin
  L := TIntegerRange.Create(0, 0);
  R := TIntegerRange.Create(0, 0);
  CheckTrue(L <= R, '#1a');
  CheckTrue(R <= L, '#1b');
  L := TIntegerRange.Create(0, 0);
  R := TIntegerRange.Create(0, 1);
  CheckTrue(L <= R, '#2a');
  CheckFalse(R <= L, '#2b');
  L := TIntegerRange.Create(-3, 12);
  R := TIntegerRange.Create(-5, 18);
  CheckTrue(L <= R, '#3a');
  CheckFalse(R <= L, '#3b');
  L := TIntegerRange.Create(-5, 17);
  R := TIntegerRange.Create(-5, 18);
  CheckTrue(L <= R, '#4a');
  CheckFalse(R <= L, '#4b');
  L := TIntegerRange.Create(-4, 18);
  R := TIntegerRange.Create(-5, 18);
  CheckTrue(L <= R, '#5a');
  CheckFalse(R <= L, '#5b');
  L := TIntegerRange.Create(-5, 18);
  R := TIntegerRange.Create(-5, 18);
  CheckTrue(L <= R, '#6a');
  CheckTrue(R <= L, '#6b');
  L := TIntegerRange.Create(-5, 2);
  R := TIntegerRange.Create(4, 18);
  CheckFalse(L <= R, '#7a');
  CheckFalse(R <= L, '#7b');
  L := TIntegerRange.Create(1, 1);
  R := TIntegerRange.Create(4, 18);
  CheckFalse(L <= R, '#8a');
  CheckFalse(R <= L, '#8b');
  L := TIntegerRange.CreateEmpty;
  R := TIntegerRange.CreateEmpty;
  CheckTrue(L <= R, '#9');
  L := TIntegerRange.Create(10, 10);
  R := TIntegerRange.CreateEmpty;
  CheckFalse(L <= R, '#10a');
  CheckTrue(R <= L, '#10b');
end;

procedure TestTIntegerRange.TestMultiplyOp;
var
  L, R, E: TIntegerRange;
begin
  L := TIntegerRange.Create(0, 0);
  R := TIntegerRange.Create(0, 0);
  E := TIntegerRange.Create(0, 0);
  CheckTrue(E = L * R, '#1a');
  CheckTrue(E = R * L, '#1b');
  L := TIntegerRange.Create(4, 4);
  R := TIntegerRange.Create(4, 4);
  E := TIntegerRange.Create(4, 4);
  CheckTrue(E = L * R, '#2a');
  CheckTrue(E = R * L, '#2b');
  L := TIntegerRange.Create(3, 3);
  R := TIntegerRange.Create(4, 4);
  E := TIntegerRange.CreateEmpty;
  CheckTrue(E = L * R, '#3a');
  CheckTrue(E = R * L, '#3b');
  L := TIntegerRange.Create(-9, 0);
  R := TIntegerRange.Create(1, 9);
  E := TIntegerRange.CreateEmpty;
  CheckTrue(E = L * R, '#4a');
  CheckTrue(E = R * L, '#4b');
  L := TIntegerRange.Create(1, 10);
  R := TIntegerRange.Create(5, 12);
  E := TIntegerRange.Create(5, 10);
  CheckTrue(E = L * R, '#5a');
  CheckTrue(E = R * L, '#5b');
  L := TIntegerRange.Create(1, 10);
  R := TIntegerRange.Create(4, 4);
  E := TIntegerRange.Create(4, 4);
  CheckTrue(E = L * R, '#6a');
  CheckTrue(E = R * L, '#6b');
  L := TIntegerRange.Create(1, 10);
  R := TIntegerRange.Create(1, 9);
  E := TIntegerRange.Create(1, 9);
  CheckTrue(E = L * R, '#7a');
  CheckTrue(E = R * L, '#7b');
  L := TIntegerRange.Create(1, 10);
  R := TIntegerRange.Create(2, 10);
  E := TIntegerRange.Create(2, 10);
  CheckTrue(E = L * R, '#8a');
  CheckTrue(E = R * L, '#8b');
  L := TIntegerRange.Create(1, 10);
  R := TIntegerRange.Create(4, 6);
  E := TIntegerRange.Create(4, 6);
  CheckTrue(E = L * R, '#9a');
  CheckTrue(E = R * L, '#9b');
  L := TIntegerRange.Create(1, 10);
  R := TIntegerRange.Create(1, 10);
  E := TIntegerRange.Create(1, 10);
  CheckTrue(E = L * R, '#10a');
  CheckTrue(E = R * L, '#10b');
  L := TIntegerRange.Create(0, 10);
  R := TIntegerRange.Create(10, 20);
  E := TIntegerRange.Create(10, 10);
  CheckTrue(E = L * R, '#11a');
  CheckTrue(E = R * L, '#11b');
  L := TIntegerRange.CreateEmpty;
  R := TIntegerRange.CreateEmpty;
  E := TIntegerRange.CreateEmpty;
  CheckTrue(E = L * R, '#12');
  L := TIntegerRange.CreateEmpty;
  R := TIntegerRange.Create(10, 20);
  E := TIntegerRange.CreateEmpty;
  CheckTrue(E = L * R, '#13a');
  CheckTrue(E = R * L, '#13b');
end;

procedure TestTIntegerRange.TestNotEqualOp;
var
  L, R: TIntegerRange;
begin
  L := TIntegerRange.Create(0, 0);
  R := TIntegerRange.Create(0, 0);
  CheckFalse(L <> R, '#1a');
  CheckFalse(R <> L, '#1b');
  L := TIntegerRange.Create(-3, 11);
  R := TIntegerRange.Create(-3, 10);
  CheckTrue(L <> R, '#2a');
  CheckTrue(R <> L, '#2b');
  L := TIntegerRange.Create(-43, 9);
  R := TIntegerRange.Create(10, -42);
  CheckTrue(L <> R, '#3a');
  CheckTrue(R <> L, '#3b');
  L := TIntegerRange.Create(10, 10);
  R := TIntegerRange.Create(10, 10);
  CheckFalse(L <> R, '#4a');
  CheckFalse(R <> L, '#4b');
  CheckFalse(R <> R, '#5');
  L := TIntegerRange.CreateEmpty;
  R := TIntegerRange.CreateEmpty;
  CheckFalse(L <> R, '#6');
  L := TIntegerRange.Create(10, 10);
  R := TIntegerRange.CreateEmpty;
  CheckTrue(L <> R, '#6');
end;

procedure TestTIntegerRange.TestOverlapsWith;
var
  A, B: TIntegerRange;
begin
  A := TIntegerRange.Create(1, 4);
  B := TIntegerRange.Create(3, 10);
  CheckTrue(A.OverlapsWith(B), '#1a');
  CheckTrue(B.OverlapsWith(A), '#1b');
  A := TIntegerRange.Create(1, 4);
  B := TIntegerRange.Create(4, 10);
  CheckTrue(A.OverlapsWith(B), '#2a');
  CheckTrue(B.OverlapsWith(A), '#2b');
  A := TIntegerRange.CreateEmpty;
  B := TIntegerRange.CreateEmpty;
  CheckFalse(A.OverlapsWith(B), '#3');
  A := TIntegerRange.CreateEmpty;
  B := TIntegerRange.Create(4, 10);
  CheckFalse(A.OverlapsWith(B), '#4a');
  CheckFalse(B.OverlapsWith(A), '#4b');
  A := TIntegerRange.Create(-MaxInt, MaxInt);
  B := TIntegerRange.Create(4, 10);
  CheckTrue(A.OverlapsWith(B), '#5a');
  CheckTrue(B.OverlapsWith(A), '#5b');
  A := TIntegerRange.Create(1, 3);
  B := TIntegerRange.Create(4, 10);
  CheckFalse(A.OverlapsWith(B), '#6a');
  CheckFalse(B.OverlapsWith(A), '#6b');
  A := TIntegerRange.Create(-MaxInt, MaxInt);
  B := TIntegerRange.Create(-MaxInt, MaxInt);
  CheckTrue(A.OverlapsWith(B), '#7');
end;

initialization

  // Register any test cases with the test runner
  RegisterTest(TestTIntegerRange.Suite);
  RegisterTest(TestTRangeEx.Suite);
  RegisterTest(TestTSizeEx.Suite);
  RegisterTest(TestMiscStructsCatSnippets.Suite);

end.
