{
 * This unit was generated automatically. It incorporates a selection of source
 * code taken from the Code Snippets Database at
 * https://github.com/delphidabbler/code-snippets.
 * 
 * The unit is copyright � 2005-2025 by Peter Johnson & Contributors and is
 * licensed under the MIT License (https://opensource.org/licenses/MIT).
 * 
 * Generated on : Fri, 17 Jan 2025 09:42:43 GMT.
 * Generated by : DelphiDabbler CodeSnip Release 4.24.0.
 * 
 * The latest version of CodeSnip is available from the CodeSnip GitHub project
 * at https://github.com/delphidabbler/codesnip.
}

unit UArraysCatSnippets;

interface

uses
  SysUtils, Classes, Types, Generics.Defaults;

{
  Dynamic array of bytes.
  Ensures TBytes is available on non-Unicode compilers that don't define it in
  SysUtils.
}
type
  {$IFDEF UNICODE}
  TBytes = SysUtils.TBytes;
  {$ELSE}
  TBytes = array of Byte;
  {$ENDIF}

{
  A method-only advanced record that provides utility methods for working with
  generic dynamic arrays.
}
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

    // Creates and returns a new array that is the reverse of the given array.
    class function Reverse<T>(const A: array of T): TArray<T>; static;

    // Returns the maximum value of array A, which must not be be empty. The
    // given comparer must return -ve if its 1st argument is less than the 2nd
    // argument, +ve if the reverse holds and zero if both arguments are equal.
    class function Max<T>(const A: array of T; const Comparer: TComparison<T>):
      T; static;

    // Returns the minimum value of array A, which must not be be empty. The
    // given comparer must return -ve if its 1st argument is less than the 2nd
    // argument, +ve if the reverse holds and zero if both arguments are equal.
    class function Min<T>(const A: array of T; const Comparer: TComparison<T>):
      T; static;

    // Finds the minimum and maximum value of array A, which must not be empty.
    // The minimum and maximum are returned via the MinValue and MaxValue
    // parameters respectively. The given comparer must return -ve if its 1st
    // argument is less than the 2nd argument, +ve if the reverse holds and zero
    // if both arguments are equal.
    class procedure MinMax<T>(const A: array of T;
      const Comparer: TComparison<T>; out MinValue, MaxValue: T); static;
  end;

{
  Appends array of bytes B2 to the end of byte array B1.
}
procedure AppendByteArray(var B1: TBytes; const B2: array of Byte);

{
  Copies the elements of string array Strings to string list SL, replacing any
  existing contents of SL.
}
procedure ArrayToStringList(const Strings: array of string;
  const SL: Classes.TStrings);

{
  Checks if two byte arrays are equal.
  The arrays are equal if they have the same number of elements and elements at
  the same position in the array are equal.
}
function ByteArraysEqual(const B1, B2: array of Byte): Boolean;

{
  Checks if two byte arrays B1 and B2 are equal for the first Count elements.
  False is returned if any array has less than Count elements.
  Count must be >= 1.
}
function ByteArraysSameStart(const B1, B2: array of Byte; const Count: Integer):
  Boolean;

{
  Deletes a sequence of bytes from byte array B starting at index Start with
  length Len.
  If either Start or Len are less than 0 they are taken as zero. If Start is
  beyond the end of the array or if Len is 0 then the whole array is returned
  unchanged. If the sequence of bytes to be chopped extends beyond the end of
  the array it is truncated from Start.
}
function ChopByteArray(const B: array of Byte; Start, Len: Integer):
  TBytes;

{
  Makes a copy of an array of bytes.
}
function CloneByteArray(const B: array of Byte): TBytes;

{
  Concatenates two byte arrays B1 and B2 and returns the resulting array.
  The result is the contents of B1 followed by the contents of B2.
}
function ConcatByteArrays(const B1, B2: array of Byte): TBytes;

{
  Returns the index of the first occurrence of byte B in byte array A, or -1 if
  B is not in A.
}
function IndexOfByte(const B: Byte; const A: array of Byte): Integer;

{
  Returns the index of the last occurrence of byte B in byte array A, or -1 if B
  is not in A.
}
function LastIndexOfByte(const B: Byte; const A: array of Byte): Integer;

{
  Removes the last element of byte array A and returns the element. The length
  of A shrinks by one.
  A must not be empty.
}
function PopByteArray(var A: TBytes): Byte;

{
  Pushes byte B onto the end of byte array A. The length of A grows by one.
}
procedure PushByteArray(const B: Byte; var A: TBytes);

{
  Returns a copy of a given byte array with the order of the bytes reversed.
}
function ReverseByteArray(const A: array of Byte): TBytes;

{
  Removes the first element of byte array A and returns the element. The length
  of A shrinks by one.
  A must not be empty.
}
function ShiftByteArray(var A: TBytes): Byte;

{
  Slices a range of bytes from byte array B, starting at index Start with length
  Len, and returns the result.
  If either Start or Len are less than 0, they are taken as 0. If Start is
  beyond the end of the array or if Len is 0 then an empty array is returned. If
  the sequence of bytes to be sliced extends beyond the end of the array it is
  truncated from Start.
}
function SliceByteArray(const B: array of Byte; Start, Len: Integer):
  TBytes;

{
  Creates and returns a dynamic string array containing all the strings from the
  given string list.
}
function StringListToArray(const SL: Classes.TStrings): Types.TStringDynArray;

{
  Inserts byte B at the beginning of byte array A. The length of A grows by one.
}
procedure UnShiftByteArray(const B: Byte; var A: TBytes);

implementation

{
  Appends array of bytes B2 to the end of byte array B1.
}
procedure AppendByteArray(var B1: TBytes; const B2: array of Byte);
var
  OldB1Len: Integer;
begin
  if Length(B2) = 0 then
    Exit;
  OldB1Len := Length(B1);
  SetLength(B1, OldB1Len + Length(B2));
  Move(B2[0], B1[OldB1Len], Length(B2));
end;

{
  Copies the elements of string array Strings to string list SL, replacing any
  existing contents of SL.
}
procedure ArrayToStringList(const Strings: array of string;
  const SL: Classes.TStrings);
var
  Idx: Integer; // loops thru each string in array
begin
  SL.Clear;
  for Idx := 0 to Pred(Length(Strings)) do
    SL.Add(Strings[Idx]);
end;

{
  Checks if two byte arrays are equal.
  The arrays are equal if they have the same number of elements and elements at
  the same position in the array are equal.
}
function ByteArraysEqual(const B1, B2: array of Byte): Boolean;
var
  I: Integer;
begin
  Result := Length(B1) = Length(B2);
  if Result then
  begin
    for I := 0 to High(B1) do
    begin
      if B1[I] <> B2[I] then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

{
  Checks if two byte arrays B1 and B2 are equal for the first Count elements.
  False is returned if any array has less than Count elements.
  Count must be >= 1.
}
function ByteArraysSameStart(const B1, B2: array of Byte; const Count: Integer):
  Boolean;
var
  I: Integer;
begin
  Assert(Count > 0, 'Count must be >= 1');
  Result := False;
  if (Length(B1) < Count) or (Length(B2) < Count) then
    Exit;
  for I := 0 to Pred(Count) do
    if B1[I] <> B2[I] then
      Exit;
  Result := True;
end;

{
  Deletes a sequence of bytes from byte array B starting at index Start with
  length Len.
  If either Start or Len are less than 0 they are taken as zero. If Start is
  beyond the end of the array or if Len is 0 then the whole array is returned
  unchanged. If the sequence of bytes to be chopped extends beyond the end of
  the array it is truncated from Start.
}
function ChopByteArray(const B: array of Byte; Start, Len: Integer):
  TBytes;
var
  First, Last: TBytes;
begin
  if Start < 0 then
    Start := 0;
  if Len < 0 then
    Len := 0
  else if Start >= Length(B) then
    Len := 0
  else if Start + Len > Length(B) then
    Len := Length(B) - Start;
  First := SliceByteArray(B, 0, Start);
  Last := SliceByteArray(B, Start + Len, Length(B));
  Result := ConcatByteArrays(First, Last);
end;

{
  Makes a copy of an array of bytes.
}
function CloneByteArray(const B: array of Byte): TBytes;
begin
  SetLength(Result, Length(B));
  if Length(B) > 0 then
    Move(B[0], Result[0], Length(B));
end;

{
  Concatenates two byte arrays B1 and B2 and returns the resulting array.
  The result is the contents of B1 followed by the contents of B2.
}
function ConcatByteArrays(const B1, B2: array of Byte): TBytes;
begin
  Result := CloneByteArray(B1);
  AppendByteArray(Result, B2);
end;

{
  Returns the index of the first occurrence of byte B in byte array A, or -1 if
  B is not in A.
}
function IndexOfByte(const B: Byte; const A: array of Byte): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Pred(Length(A)) do
  begin
    if A[I] = B then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

{
  Returns the index of the last occurrence of byte B in byte array A, or -1 if B
  is not in A.
}
function LastIndexOfByte(const B: Byte; const A: array of Byte): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := Pred(Length(A)) downto 0 do
  begin
    if A[I] = B then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

{
  Removes the last element of byte array A and returns the element. The length
  of A shrinks by one.
  A must not be empty.
}
function PopByteArray(var A: TBytes): Byte;
begin
  Assert(Length(A) > 0, 'A must be a non-empty array');
  Result := A[Pred(Length(A))];
  SetLength(A, Length(A) - 1);
end;

{
  Pushes byte B onto the end of byte array A. The length of A grows by one.
}
procedure PushByteArray(const B: Byte; var A: TBytes);
begin
  SetLength(A, Length(A) + 1);
  A[Pred(Length(A))] := B;
end;

{
  Returns a copy of a given byte array with the order of the bytes reversed.
}
function ReverseByteArray(const A: array of Byte): TBytes;
var
  I: Integer;
begin
  SetLength(Result, Length(A));
  for I := 0 to High(A) do
    Result[High(A)-I] := A[I];
end;

{
  Removes the first element of byte array A and returns the element. The length
  of A shrinks by one.
  A must not be empty.
}
function ShiftByteArray(var A: TBytes): Byte;
begin
  Assert(Length(A) > 0, 'A must be a non-empty array');
  Result := A[0];
  Move(A[1], A[0], Length(A) - 1);
  SetLength(A, Length(A) - 1);
end;

{
  Slices a range of bytes from byte array B, starting at index Start with length
  Len, and returns the result.
  If either Start or Len are less than 0, they are taken as 0. If Start is
  beyond the end of the array or if Len is 0 then an empty array is returned. If
  the sequence of bytes to be sliced extends beyond the end of the array it is
  truncated from Start.
}
function SliceByteArray(const B: array of Byte; Start, Len: Integer):
  TBytes;
begin
  if Start < 0 then
    Start := 0;
  if Len < 0 then
    Len := 0
  else if Start >= Length(B) then
    Len := 0
  else if Start + Len > Length(B) then
    Len := Length(B) - Start;
  SetLength(Result, Len);
  if Len > 0 then
    Move(B[Start], Result[0], Len);
end;

{
  Creates and returns a dynamic string array containing all the strings from the
  given string list.
}
function StringListToArray(const SL: Classes.TStrings): Types.TStringDynArray;
var
  Idx: Integer; // loops thru each string in SL
begin
  SetLength(Result, SL.Count);
  for Idx := 0 to Pred(SL.Count) do
    Result[Idx] := SL[Idx];
end;

{
  Inserts byte B at the beginning of byte array A. The length of A grows by one.
}
procedure UnShiftByteArray(const B: Byte; var A: TBytes);
begin
  SetLength(A, Length(A) + 1);
  Move(A[0], A[1], Length(A) - 1);
  A[0] := B;
end;

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

class function TArrayUtils.Max<T>(const A: array of T;
  const Comparer: TComparison<T>): T;
var
  Idx: Integer;
begin
  Assert(System.Length(A) > 0);
  Result := A[0];
  for Idx := 1 to Pred(System.Length(A)) do
    if Comparer(A[Idx], Result) > 0 then
      Result := A[Idx];
end;

class function TArrayUtils.Min<T>(const A: array of T;
  const Comparer: TComparison<T>): T;
var
  Idx: Integer;
begin
  Assert(System.Length(A) > 0);
  Result := A[0];
  for Idx := 1 to Pred(System.Length(A)) do
    if Comparer(A[Idx], Result) < 0 then
      Result := A[Idx];
end;

class procedure TArrayUtils.MinMax<T>(const A: array of T;
  const Comparer: TComparison<T>; out MinValue, MaxValue: T);
var
  Idx: Integer;
begin
  Assert(System.Length(A) > 0);
  MinValue := A[0];
  MaxValue := A[0];
  for Idx := 1 to Pred(System.Length(A)) do
  begin
    if Comparer(A[Idx], MinValue) < 0 then
      MinValue := A[Idx]
    else if Comparer(A[Idx], MaxValue) > 0 then
      MaxValue := A[Idx];
  end;
end;

class function TArrayUtils.Reverse<T>(const A: array of T): TArray<T>;
var
  I: Integer;
begin
  SetLength(Result, Length(A));
  for I := 0 to High(A) do
    Result[High(A)-I] := A[I];
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

end.
