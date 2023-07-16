{
 * This file was generated from the DelphiDabbler Code Snippets Database.
 * The source code is licensed under the MIT license, copyright © 2005-2021,
 * Peter Johnson (https://gravatar.com/delphidabbler) and Contributors. The
 * full license and a list of contributors can be found in the `LICENSE` and
 * `CONTRIBUTORS` files at
 * https://github.com/delphidabbler/code-snippets/tree/master/csdb/collection
}

unit UArraysCatSnippets;

{$UNDEF Generics}
{$IFNDEF FPC}
  {$IFDEF CONDITIONALEXPRESSIONS}
    {$IF CompilerVersion >= 14.00}
      {$WARN SYMBOL_PLATFORM OFF}
      {$WARN SYMBOL_DEPRECATED OFF}
      {$WARN SYMBOL_LIBRARY OFF}
    {$IFEND}
    {$IF CompilerVersion >= 15.00}
      {$WARN UNSAFE_TYPE OFF}
      {$WARN UNSAFE_CAST OFF}
      {$WARN UNSAFE_CODE OFF}
    {$IFEND}
    {$IF CompilerVersion >= 20.00}
      {$WARN EXPLICIT_STRING_CAST OFF}
      {$WARN IMPLICIT_STRING_CAST OFF}
      {$DEFINE Generics}
    {$IFEND}
  {$ENDIF}
{$ENDIF}

interface

{$IFDEF Generics}
uses
  Generics.Defaults;
{$ENDIF}

{$IFDEF Generics}
type
  TArrayUtils = record
  public
    // Returns first element of given array, which must not be empty.
    class function First<T>(const A: array of T): T; static;
    // Returns last element of given array, which must not be empty.
    class function Last<T>(const A: array of T): T; static;
    // Returns index of given item in given array or -1 if element no in array.
    // Given equality comparer is used to compare array elements with Elem.
    class function IndexOf<T>(const Item: T; const A: array of T;
      const EqualityComparer: Generics.Defaults.TEqualityComparison<T>):
      Integer; static;
    // Checks if two given arrays have the same contents, in same order. Given
    // equality comparer is used to compare array elements.
    class function Equal<T>(const Left, Right: array of T;
      const EqualityComparer: Generics.Defaults.TEqualityComparison<T>):
      Boolean; static;
    // Checks if the first Count elements of the given arrays are the same.
    // Given equality comparer is used to compare array elements.
    class function SameStart<T>(const Left, Right: array of T;
      const Count: Integer;
      const EqualityComparer: Generics.Defaults.TEqualityComparison<T>):
      Boolean; static;
  end;
{$ENDIF Generics}

implementation

{$IFDEF Generics}

class function TArrayUtils.Equal<T>(const Left, Right: array of T;
  const EqualityComparer: Generics.Defaults.TEqualityComparison<T>): Boolean;
var
  I: Integer;
begin
  Result := Length(Left) = Length(Right);
  if Result then
  begin
    for I := 0 to High(Left) do
      if not EqualityComparer(Left[I], Right[I]) then
        Exit(False);
  end
end;

class function TArrayUtils.First<T>(const A: array of T): T;
begin
  Assert(Length(A) > 0);
  Result := A[0];
end;

class function TArrayUtils.IndexOf<T>(const Item: T; const A: array of T;
  const EqualityComparer: Generics.Defaults.TEqualityComparison<T>): Integer;
var
  Idx: Integer;
begin
  for Idx := Low(A) to High(A) do
    if EqualityComparer(A[Idx], Item) then
      Exit(Idx);
  Result := -1;
end;

class function TArrayUtils.Last<T>(const A: array of T): T;
begin
  Assert(Length(A) > 0);
  Result := A[Pred(Length(A))];
end;

class function TArrayUtils.SameStart<T>(const Left, Right: array of T;
  const Count: Integer;
  const EqualityComparer: Generics.Defaults.TEqualityComparison<T>): Boolean;
var
  I: Integer;
begin
  Assert(Count > 0, 'Count must be >= 1');
  if (Length(Left) < Count) or (Length(Right) < Count) then
    Exit(False);
  for I := 0 to Pred(Count) do
    if not EqualityComparer(Left[I], Right[I]) then
      Exit(False);
  Result := True;
end;

{$ENDIF Generics}

end.
