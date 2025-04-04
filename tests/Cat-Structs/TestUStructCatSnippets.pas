unit TestUStructCatSnippets;

interface

uses
  SysUtils, TestFramework, UStructCatSnippets;

implementation

type
  TestTIntegerRange = class(TTestCase)
  private
    procedure TestCtorAndPropsException;
    procedure TestConstrainException;
  public
    procedure SetUp; override;
    procedure TearDown; override;
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

{ TestTIntegerRange }

procedure TestTIntegerRange.SetUp;
begin
  inherited;

end;

procedure TestTIntegerRange.TearDown;
begin
  inherited;

end;

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

//procedure TestTIntegerRange.TestGreaterThanOp;
//var
//  L, R: TIntegerRange;
//begin
//  L := TIntegerRange.Create(0, 0);
//  R := TIntegerRange.Create(0, 0);
//  CheckFalse(L > R, '#1a');
//  CheckFalse(R > L, '#1b');
//  L := TIntegerRange.Create(0, 1);
//  R := TIntegerRange.Create(0, 0);
//  CheckTrue(L > R, '#2a');
//  CheckFalse(R > L, '#2b');
//  L := TIntegerRange.Create(-3, 12);
//  R := TIntegerRange.Create(-5, 18);
//  CheckFalse(L > R, '#3a');
//  CheckTrue(R > L, '#3b');
//  L := TIntegerRange.Create(-5, 17);
//  R := TIntegerRange.Create(-5, 18);
//  CheckFalse(L > R, '#4a');
//  CheckTrue(R > L, '#4b');
//  L := TIntegerRange.Create(-4, 18);
//  R := TIntegerRange.Create(-5, 18);
//  CheckFalse(L > R, '#5a');
//  CheckTrue(R > L, '#5b');
//  L := TIntegerRange.Create(-5, 18);
//  R := TIntegerRange.Create(-5, 18);
//  CheckFalse(L > R, '#6a');
//  CheckFalse(R > L, '#6b');
//  L := TIntegerRange.Create(-5, 2);
//  R := TIntegerRange.Create(4, 18);
//  CheckFalse(L > R, '#7a');
//  CheckFalse(R > L, '#7b');
//  L := TIntegerRange.Create(1, 1);
//  R := TIntegerRange.Create(4, 18);
//  CheckFalse(L > R, '#8a');
//  CheckFalse(R > L, '#8b');
//  L := TIntegerRange.CreateEmpty;
//  R := TIntegerRange.CreateEmpty;
//  CheckFalse(L > R, '#9');
//  L := TIntegerRange.Create(10, 10);
//  R := TIntegerRange.CreateEmpty;
//  CheckTrue(L > R, '#10a');
//  CheckFalse(R > L, '#10b');
//end;

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

//procedure TestTIntegerRange.TestLessThanOp;
//var
//  L, R: TIntegerRange;
//begin
//  L := TIntegerRange.Create(0, 0);
//  R := TIntegerRange.Create(0, 0);
//  CheckFalse(L < R, '#1a');
//  CheckFalse(R < L, '#1b');
//  L := TIntegerRange.Create(0, 0);
//  R := TIntegerRange.Create(0, 1);
//  CheckTrue(L < R, '#2a');
//  CheckFalse(R < L, '#2b');
//  L := TIntegerRange.Create(-3, 12);
//  R := TIntegerRange.Create(-5, 18);
//  CheckTrue(L < R, '#3a');
//  CheckFalse(R < L, '#3b');
//  L := TIntegerRange.Create(-5, 17);
//  R := TIntegerRange.Create(-5, 18);
//  CheckTrue(L < R, '#4a');
//  CheckFalse(R < L, '#4b');
//  L := TIntegerRange.Create(-4, 18);
//  R := TIntegerRange.Create(-5, 18);
//  CheckTrue(L < R, '#5a');
//  CheckFalse(R < L, '#5b');
//  L := TIntegerRange.Create(-5, 18);
//  R := TIntegerRange.Create(-5, 18);
//  CheckFalse(L < R, '#6a');
//  CheckFalse(R < L, '#6b');
//  L := TIntegerRange.Create(-5, 2);
//  R := TIntegerRange.Create(4, 18);
//  CheckFalse(L < R, '#7a');
//  CheckFalse(R < L, '#7b');
//  L := TIntegerRange.Create(1, 1);
//  R := TIntegerRange.Create(4, 18);
//  CheckFalse(L < R, '#8a');
//  CheckFalse(R < L, '#8b');
//  L := TIntegerRange.CreateEmpty;
//  R := TIntegerRange.CreateEmpty;
//  CheckFalse(L < R, '#9');
//  L := TIntegerRange.Create(10, 10);
//  R := TIntegerRange.CreateEmpty;
//  CheckFalse(L < R, '#10a');
//  CheckTrue(R < L, '#10b');
//end;

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

end.
