unit TestUArraysCatSnippets;

interface

uses
  TestFramework, UArraysCatSnippets;

type

  TestTArrayUtils = class(TTestCase)
  strict private
    fSA0: TArray<string>;
    fSA1: TArray<string>;
    fSA2: TArray<string>;
    fSAM: TArray<string>;
    fSAN: TArray<string>;
    fIA0: TArray<Integer>;
    fIA1: TArray<Integer>;
    fIA2: TArray<Integer>;
    fIAM: TArray<Integer>;
    fIAN: TArray<Integer>;
    fIAP: TArray<Integer>;
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
    procedure TestSameStart;
  end;

  TestArraysCatSnippets = class(TTestCase)

  end;

implementation

uses
  SysUtils, Generics.Defaults;

var
  IntegerCompareFn: TEqualityComparison<Integer>;
  StringCompareFn: TEqualityComparison<string>;

{ TestTArrayUtils }

procedure TestTArrayUtils.SetUp;
begin
  fSA0 := TArray<string>.Create();
  fSA1 := TArray<string>.Create('foo');
  fSA2 := TArray<string>.Create('foo', 'bar');
  fSAM := TArray<string>.Create('a', 'stitch', 'in', 'time', 'saves', 'nine');
  fSAN := TArray<string>.Create('a', 'stitch', 'in', 'time', 'saves', 'nine');
  fIA0 := TArray<Integer>.Create();
  fIA1 := TArray<Integer>.Create(42);
  fIA2 := TArray<Integer>.Create(42, 56);
  fIAM := TArray<Integer>.Create(1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37);
  fIAN := TArray<Integer>.Create(1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37);
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

initialization

IntegerCompareFn := function (const Left, Right: Integer): Boolean
  begin
    Result := Left = Right;
  end;

StringCompareFn := function (const Left, Right: string): Boolean
  begin
    Result := SameStr(Left, Right);
  end;

  // Register any test cases with the test runner
RegisterTest(TestTArrayUtils.Suite);
RegisterTest(TestArraysCatSnippets.Suite);

end.

