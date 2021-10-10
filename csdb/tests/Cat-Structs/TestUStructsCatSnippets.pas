unit TestUStructsCatSnippets;

interface

uses
  TestFramework, UStructsCatSnippets;

type
  // Test methods for routines
  TestStructsCatSnippets = class(TTestCase)
  strict private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
  end;

  // Test methods for TRangeEx advanced record
  TestTRangeEx = class(TTestCase)
  strict private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
  end;

implementation

{ TestStructsCatSnippets }

procedure TestStructsCatSnippets.SetUp;
begin
  inherited;
end;

procedure TestStructsCatSnippets.TearDown;
begin
  inherited;
end;

{ TestTRangeEx }

procedure TestTRangeEx.SetUp;
begin
  inherited;
end;

procedure TestTRangeEx.TearDown;
begin
  inherited;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestStructsCatSnippets.Suite);
  RegisterTest(TestTRangeEx.Suite);
end.

