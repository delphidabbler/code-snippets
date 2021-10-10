unit UStructsCatSnippets;

{$IFNDEF FPC}
  {$IFDEF CONDITIONALEXPRESSIONS}
    {$IF CompilerVersion >= 24.00}
      {$LEGACYIFEND ON}
    {$IFEND}
    {$IF CompilerVersion >= 14.00}
      {$WARN SYMBOL_PLATFORM OFF}
      {$WARN SYMBOL_LIBRARY OFF}
      {$WARN SYMBOL_DEPRECATED OFF}
    {$IFEND}
    {$IF CompilerVersion >= 15.00}
      {$WARN UNSAFE_TYPE OFF}
      {$WARN UNSAFE_CAST OFF}
      {$WARN UNSAFE_CODE OFF}
    {$IFEND}
    {$IF CompilerVersion >= 20.00}
      {$WARN IMPLICIT_STRING_CAST_LOSS OFF}
      {$WARN CVT_NARROWING_STRING_LOST OFF}
      {$WARN WIDECHAR_REDUCED OFF}
      {$WARN EXPLICIT_STRING_CAST OFF}
      {$WARN SUSPICIOUS_TYPECAST OFF}
      {$WARN CVT_ACHAR_TO_WCHAR OFF}
      {$WARN IMPLICIT_STRING_CAST OFF}
      {$WARN CVT_WIDENING_STRING_LOST OFF}
      {$WARN CVT_WCHAR_TO_ACHAR OFF}
      {$WARN EXPLICIT_STRING_CAST_LOSS OFF}
    {$IFEND}
  {$ENDIF}
{$ENDIF}

interface

uses
  Math;

type
  TRange = record
    Lower: Integer;  // lower bound of range
    Upper: Integer;  // upper bound of range
  end;

type
  TRangeEx = record
    // Minimum and maximum bounds of range.
    Min, Max: Integer;
    // Constructs record with given minimum and maximum bounds.
    constructor Create(AMin, AMax: Integer);
    // Checks if the given value is contained within the range.
    function Contains(const Value: Integer): Boolean;
    // Adjusts the given value to lie within the range, and returns it. If the
    // value is less than Min, Min is returned. If the value is greater than Max
    // then max is returned. If the value is in the range it is returned
    // unchanged.
    function Constrain(const Value: Integer): Integer;
  end;

function Range(const A, B: Integer): TRange;

implementation

function Range(const A, B: Integer): TRange;
begin
  if A <= B then
  begin
    Result.Lower := A;
    Result.Upper := B;
  end
  else
  begin
    Result.Lower := B;
    Result.Upper := A;
  end;
end;

function TRangeEx.Constrain(const Value: Integer): Integer;
begin
  if Value < Min then
    Result := Min
  else if Value > Max then
    Result := Max
  else
    Result := Value;
end;

function TRangeEx.Contains(const Value: Integer): Boolean;
begin
  Result := Math.InRange(Value, Min, Max);
end;

constructor TRangeEx.Create(AMin, AMax: Integer);
begin
  Min := AMin;
  Max := AMax;
end;

end.

