{
 * This file was generated from the DelphiDabbler Code Snippets collection.
 *
 * See https://github.com/delphidabsbler/code-snippets/tree/master/LICENSE.md for
 * full license & copyright information.
}

unit UDateCatSnippets;

{$IFNDEF FPC}
  {$IFDEF CONDITIONALEXPRESSIONS}
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
  SysUtils, Windows;

function AddDays(const DateTime: TDateTime; const Days: Integer): TDateTime;
  {Adds the number of days, Days, to the given date, DateTime and returns the
  result.
  To subtract days, pass a negative value for Days.}

function AdjustedTimeZoneBias: Integer;
  {Gets the bias of the local time zone relative to UTC (GMT), adjusted for
  daylight saving or standard time as appropriate.}

function DateDay(const ADate: TDateTime): Word;
  {Extracts the day of the month from a specified date.}

function DateMonth(const ADate: TDateTime): Word;
  {Extracts the month from a specified date.}

function DateMonthEnd(const DT: TDateTime): TDateTime;
  {Returns the last day of the month containing the given date.}

function DateMonthStart(const DT: TDateTime): TDateTime;
  {Returns the first day of the month containing the given date.}

function DateQuarter(const D: TDateTime): Byte;
  {Returns the number of the quarter containing a given date.}

function DateQuarterEnd(const D: TDateTime): TDateTime;
  {Gets the date of the last day of the quarter containing a given date.}

function DateQuarterStart(const D: TDateTime): TDateTime;
  {Gets the date of the first day of the quarter containing a given date.}

function DateTimeToUnixDate(const ADate: TDateTime): Longint;
  {Converts the given Delphi TDateTime value to a Unix date.
  Does not check for range errors.}

function DateTimeToWinFileTime(DT: TDateTime): Windows.TFileTime;
  {Converts given TDateTime value DT into a Windows FILETIME structure and
  returns it.
  Raises an exception if DT is not valid or can't be converted.}

function DateYear(const ADate: TDateTime): Word;
  {Extracts the year from a specified date.}

function DateYearEnd(const DT: TDateTime): TDateTime;
  {Returns the last day of the year containing the specified date.}

function DateYearStart(const DT: TDateTime): TDateTime;
  {Returns the first day of the year containing the specified date.}

function DayOfYear(const DT: TDateTime): Integer;
  {Returns the day of the year for the given date.}

function DaysInMonth(const ADateTime: TDateTime): Byte;
  {Gets number of days in month specified by a given date. Allows for leap
  days.}

function DiffDays(const DT1, DT2: TDateTime): Integer;
  {Returns the whole number of days separating two given dates.}

function GMTToLocalTime(GMTTime: TDateTime): TDateTime;
  {Converts the given TDateTime value GMTTime from GMT (UTC) to local time.
  Raises an exception if GMTTime is not valid or can't be converted.}

function Is24HourTimeFormat: Boolean;
  {Checks if the 24 hour time format is being used by the current thread.}

function IsDaylightSaving: Boolean;
  {Checks if current local time is daylight saving time.}

function IsFriday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Friday.}

function IsLeapYear(const ADateTime: TDateTime): Boolean;
  {Checks if a specified date falls in a leap year.}

function IsMonday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Monday.}

function IsSaturday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Saturday.}

function IsSunday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Sunday.}

function IsThursday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Thursday.}

function IsTuesday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Tuesday.}

function IsValidDate(const DateString: string): Boolean;
  {Checks if a string represents a valid date in the current locale.}

function IsValidTime(const TimeString: string): Boolean;
  {Checks if a string represents a valid time in the current locale.}

function IsWednesday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Wednesday.}

function IsWeekday(const DT: TDateTime): Boolean;
  {Checks if the given date is a weekday.}

function IsWeekend(const DT: TDateTime): Boolean;
  {Checks if the given date is a weekend.}

function LongDayName(const ADateTime: TDateTime): string;
  {Gets the long name of the day specified by a date.}

function LongMonthName(const ADateTime: TDateTime): string;
  {Gets the long name of the month specified by a date.}

function MSecToDateTime(const MSecs: Int64): TDateTime;
  {Converts the given number of milliseconds to a TDateTime value.}

function RFC2822Date(const LocalDate: TDateTime; const IsDST: Boolean): string;
  {Returns the RFC 2822 representation of the date (in local time) specified in
  the LocalTime parameter. The IsDST parameter indicates whether LocalTime is in
  daylight saving time or not.}

function SecondsToTime(const ASeconds: Cardinal): TDateTime;
  {Converts a number of seconds into a TDateTime value.}

function ShortDayName(const ADateTime: TDateTime): string;
  {Gets the short name of the day specified by a date.}

function ShortMonthName(const ADateTime: TDateTime): string;
  {Gets the short name of the month specified by a date.}

function SQLDate(const Date: TDateTime): string;
  {Formats a date in SQL format.}

function SQLDateToDateTime(const SQLDate: string): TDateTime;
  {Converts a date in SQL format into a TDateTime.}

function TimeHour(const Time: TDateTime): Word;
  {Extracts the hour from a specified time.}

function TimeMin(const Time: TDateTime): Word;
  {Extracts the minute from a specified time.}

function TimeSec(const Time: TDateTime): Word;
  {Extracts the second from a specified time.}

function TimeZoneBias: Integer;
  {<p>Gets the bias of the local time zone relative to UTC (GMT).</p><p>Does not
  adjust for daylight saving time.</p>}

function TimeZoneName: string;
  {Returns a string containing the local time zone name or '' if the name is
  unknown.}

function UnixDateToDateTime(const USec: Longint): TDateTime;
  {Converts a Unix date to a Delphi TDateTime.
  Does not check for range errors.}

function WesternEaster(const Year: Word): TDateTime;
  {Returns the date of Easter Sunday for the given year in the Gregorian
  calendar as used by Western Christian Churches.}

function WinFileTimeToDateTime(FT: Windows.TFileTime): TDateTime;
  {Converts the given Windows FILETIME structure FT into a Delphi TDateTime
  value and returns it.
  Raises an exception if FT is not valid or can't be converted.}

function WinFileTimeToDOSFileTime(FT: Windows.TFileTime): Integer;
  {Converts the given Windows FILETIME structure FT to a DOS file time and
  returns it.
  Raises an exception if FT is not a valid value or can't be converted.}

function WinFileTimeToStr(FT: Windows.TFileTime): string;
  {Converts the given Windows FILETIME structure FT to a string.
  Raises an exception if FT is not a valid value.}

implementation

function AddDays(const DateTime: TDateTime; const Days: Integer): TDateTime;
  {Adds the number of days, Days, to the given date, DateTime and returns the
  result.
  To subtract days, pass a negative value for Days.}
begin
  Result := DateTime + Days;
end;

function AdjustedTimeZoneBias: Integer;
  {Gets the bias of the local time zone relative to UTC (GMT), adjusted for
  daylight saving or standard time as appropriate.}
var
  TZI: Windows.TTimeZoneInformation;  // info about time zone
begin
  Result := 0;  // keeps compiler quiet
  case Windows.GetTimeZoneInformation(TZI) of
    Windows.TIME_ZONE_ID_INVALID: SysUtils.RaiseLastOSError;
    Windows.TIME_ZONE_ID_STANDARD: Result := TZI.Bias + TZI.StandardBias;
    Windows.TIME_ZONE_ID_DAYLIGHT: Result := TZI.Bias + TZI.DaylightBias;
    Windows.TIME_ZONE_ID_UNKNOWN: Result := TZI.Bias;
  end;
end;

function DateDay(const ADate: TDateTime): Word;
  {Extracts the day of the month from a specified date.}
var
  Year, Month: Word;  // unused dummy values required by DecodeDate
begin
  SysUtils.DecodeDate(ADate, Year, Month, Result);
end;

function DateMonth(const ADate: TDateTime): Word;
  {Extracts the month from a specified date.}
var
  Year, Day: Word;  // unused dummy values required by DecodeDate
begin
  SysUtils.DecodeDate(ADate, Year, Result, Day);
end;

function DateMonthEnd(const DT: TDateTime): TDateTime;
  {Returns the last day of the month containing the given date.}
var
  Day, Month, Year: Word;
  LastDay: Byte;
begin
  SysUtils.DecodeDate(DT, Year, Month, Day);
  LastDay := DaysInMonth(DT);
  Result := SysUtils.EncodeDate(Year, Month, LastDay);
end;

function DateMonthStart(const DT: TDateTime): TDateTime;
  {Returns the first day of the month containing the given date.}
var
  Day, Month, Year: Word;
begin
  SysUtils.DecodeDate(DT, Year, Month, Day);
  Result := SysUtils.EncodeDate(Year, Month, 1);
end;

function DateQuarter(const D: TDateTime): Byte;
  {Returns the number of the quarter containing a given date.}
var
  Year, Month, Day: Word; // year, month and date components of D
begin
  SysUtils.DecodeDate(D, Year, Month, Day);
  Result := 4 - ((12 - Month) div 3);
end;

function DateQuarterEnd(const D: TDateTime): TDateTime;
  {Gets the date of the last day of the quarter containing a given date.}
var
  Year, Month, Day, Quarter: Word;
begin
  SysUtils.DecodeDate(D, Year, Month, Day);
  Quarter := 4 - ((12 - Month) div 3);
  // get 1st day of following quarter
  Month := 0;
  SysUtils.IncAMonth(Year, Month, Day, Quarter * 3 + 1);
  // required date is day before 1st day of following quarter
  Result := SysUtils.EncodeDate(Year, Month, 1) - 1.0;
end;

function DateQuarterStart(const D: TDateTime): TDateTime;
  {Gets the date of the first day of the quarter containing a given date.}
var
  Year, Month, Day, Quarter: Word;
begin
  SysUtils.DecodeDate(D, Year, Month, Day);
  Quarter := 4 - ((12 - Month) div 3);
  Month := 0;
  SysUtils.IncAMonth(Year, Month, Day, (Quarter * 3) - 2);
  Result := SysUtils.EncodeDate(Year, Month, 1);
end;

function DateTimeToUnixDate(const ADate: TDateTime): Longint;
  {Converts the given Delphi TDateTime value to a Unix date.
  Does not check for range errors.}
const
  cUnixStartDate: TDateTime = 25569.0; // 1970/01/01
begin
  Result := Round((ADate - cUnixStartDate) * 86400);
end;

function DateTimeToWinFileTime(DT: TDateTime): Windows.TFileTime;
  {Converts given TDateTime value DT into a Windows FILETIME structure and
  returns it.
  Raises an exception if DT is not valid or can't be converted.}
var
  ST: Windows.TSystemTime;
begin
  SysUtils.DateTimeToSystemTime(DT, ST);
  SysUtils.Win32Check(Windows.SystemTimeToFileTime(ST, Result));
end;

function DateYear(const ADate: TDateTime): Word;
  {Extracts the year from a specified date.}
var
  Month, Day: Word;  // unused dummy values required by DecodeDate
begin
  SysUtils.DecodeDate(ADate, Result, Month, Day);
end;

function DateYearEnd(const DT: TDateTime): TDateTime;
  {Returns the last day of the year containing the specified date.}
var
  Year, Month, Day: Word;
begin
  SysUtils.DecodeDate(DT, Year, Month, Day);
  Result := SysUtils.EncodeDate(Year, 12, 31);
end;

function DateYearStart(const DT: TDateTime): TDateTime;
  {Returns the first day of the year containing the specified date.}
var
  Year, Month, Day: Word;
begin
  SysUtils.DecodeDate(DT, Year, Month, Day);
  Result := SysUtils.EncodeDate(Year, 1, 1);
end;

function DayOfYear(const DT: TDateTime): Integer;
  {Returns the day of the year for the given date.}
begin
  Result := Trunc(DT - DateYearStart(DT)) + 1;
end;

function DaysInMonth(const ADateTime: TDateTime): Byte;
  {Gets number of days in month specified by a given date. Allows for leap
  days.}
const
  cDaysPerMonth: array[1..12] of Byte =  // array of days in months
    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  cMonthFeb = 2;            // month number of February
  cDaysInLeapYearFeb = 29;  // number of days in February in leap year
var
  Month: Word;  // month component of specified date
begin
  Month := DateMonth(ADateTime);
  Result := cDaysPerMonth[Month];
  if (Month = cMonthFeb) and IsLeapYear(ADateTime) then
    Result := cDaysInLeapYearFeb;
end;

function DiffDays(const DT1, DT2: TDateTime): Integer;
  {Returns the whole number of days separating two given dates.}
begin
  Result := Trunc(DT1 - DT2);
end;

function GMTToLocalTime(GMTTime: TDateTime): TDateTime;
  {Converts the given TDateTime value GMTTime from GMT (UTC) to local time.
  Raises an exception if GMTTime is not valid or can't be converted.}
var
  GMTST: Windows.TSystemTime;
  LocalST: Windows.TSystemTime;
begin
  SysUtils.DateTimeToSystemTime(GMTTime, GMTST);
  SysUtils.Win32Check(
    Windows.SystemTimeToTzSpecificLocalTime(
      nil, GMTST, LocalST
    )
  );
  Result := SysUtils.SystemTimeToDateTime(LocalST);
end;

function Is24HourTimeFormat: Boolean;
  {Checks if the 24 hour time format is being used by the current thread.}
var
  DefaultLCID: Windows.LCID;  // thread's default locale
begin
  DefaultLCID := Windows.GetThreadLocale;
  Result := 0 <> SysUtils.StrToIntDef(
    SysUtils.GetLocaleStr(DefaultLCID, Windows.LOCALE_ITIME, '0'),
    0
  );
end;

function IsDaylightSaving: Boolean;
  {Checks if current local time is daylight saving time.}
var
  Dummy: Windows.TTimeZoneInformation; // info about time zone
begin
  Result := False;
  case Windows.GetTimeZoneInformation(Dummy) of
    Windows.TIME_ZONE_ID_INVALID: SysUtils.RaiseLastOSError;
    Windows.TIME_ZONE_ID_DAYLIGHT: Result := True;
  end;
end;

function IsFriday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Friday.}
begin
  Result := SysUtils.DayOfWeek(DT) = 6;
end;

function IsLeapYear(const ADateTime: TDateTime): Boolean;
  {Checks if a specified date falls in a leap year.}
begin
  Result := SysUtils.IsLeapYear(DateYear(ADateTime));
end;

function IsMonday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Monday.}
begin
  Result := SysUtils.DayOfWeek(DT) = 2;
end;

function IsSaturday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Saturday.}
begin
  Result := SysUtils.DayOfWeek(DT) = 7;
end;

function IsSunday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Sunday.}
begin
  Result := SysUtils.DayOfWeek(DT) = 1;
end;

function IsThursday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Thursday.}
begin
  Result := SysUtils.DayOfWeek(DT) = 5;
end;

function IsTuesday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Tuesday.}
begin
  Result := SysUtils.DayOfWeek(DT) = 3;
end;

function IsValidDate(const DateString: string): Boolean;
  {Checks if a string represents a valid date in the current locale.}
var
  DT: TDateTime; // unused date time value
begin
  Result := SysUtils.TryStrToDate(DateString, DT);
end;

function IsValidTime(const TimeString: string): Boolean;
  {Checks if a string represents a valid time in the current locale.}
var
  DT: TDateTime; // unused date time value
begin
  Result := SysUtils.TryStrToTime(TimeString, DT);
end;

function IsWednesday(const DT: TDateTime): Boolean;
  {Checks if the given date is a Wednesday.}
begin
  Result := SysUtils.DayOfWeek(DT) = 4;
end;

function IsWeekday(const DT: TDateTime): Boolean;
  {Checks if the given date is a weekday.}
begin
  Result := SysUtils.DayOfWeek(DT) in [2..6];
end;

function IsWeekend(const DT: TDateTime): Boolean;
  {Checks if the given date is a weekend.}
begin
  Result := SysUtils.DayOfWeek(DT) in [1, 7];
end;

function LongDayName(const ADateTime: TDateTime): string;
  {Gets the long name of the day specified by a date.}
begin
  Result := SysUtils.LongDayNames[SysUtils.DayOfWeek(ADateTime)];
end;

function LongMonthName(const ADateTime: TDateTime): string;
  {Gets the long name of the month specified by a date.}
begin
  Result := SysUtils.LongMonthNames[DateMonth(ADateTime)]
end;

function MSecToDateTime(const MSecs: Int64): TDateTime;
  {Converts the given number of milliseconds to a TDateTime value.}
begin
  Result := MSecs / SysUtils.MSecsPerDay;
end;

function RFC2822Date(const LocalDate: TDateTime; const IsDST: Boolean): string;
  {Returns the RFC 2822 representation of the date (in local time) specified in
  the LocalTime parameter. The IsDST parameter indicates whether LocalTime is in
  daylight saving time or not.}
const
  // Days of week and months of year: must be in English for RFC882
  Days: array[1..7] of string = (
    'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'
  );
  Months: array[1..12] of string = (
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  );
var
  Day, Month, Year: Word;             // parts of LocalDate
  TZ : Windows.TIME_ZONE_INFORMATION; // time zone information
  Bias: Integer;                      // bias in seconds
  BiasTime: TDateTime;                // bias in hrs / mins to display
  GMTOffset: string;                  // bias as offset from GMT
begin
  // get year, month and day from date
  SysUtils.DecodeDate(LocalDate, Year, Month, Day);
  // compute GMT Offset bias
  Windows.GetTimeZoneInformation(TZ);
  Bias := TZ.Bias;
  if IsDST then
    Bias := Bias + TZ.DaylightBias
  else
    Bias := Bias + TZ.StandardBias;
  BiasTime := SysUtils.EncodeTime(Abs(Bias div 60), Abs(Bias mod 60), 0, 0);
  if Bias < 0 then
    GMTOffset := '-' + SysUtils.FormatDateTime('hhnn', BiasTime)
  else
    GMTOffset := '+' + SysUtils.FormatDateTime('hhnn', BiasTime);
  // build final string
  Result := Days[DayOfWeek(LocalDate)] + ', '
    + SysUtils.IntToStr(Day) + ' '
    + Months[Month] + ' '
    + SysUtils.IntToStr(Year) + ' '
    + SysUtils.FormatDateTime('hh:nn:ss', LocalDate) + ' '
    + GMTOffset;
end;

function SecondsToTime(const ASeconds: Cardinal): TDateTime;
  {Converts a number of seconds into a TDateTime value.}
const
  MSecsPerSec = 1000;  // ms per day: not defined in Delphi 6 and earlier
begin
  Result := ASeconds / SysUtils.MSecsPerDay * MSecsPerSec;
end;

function ShortDayName(const ADateTime: TDateTime): string;
  {Gets the short name of the day specified by a date.}
begin
  Result := SysUtils.ShortDayNames[SysUtils.DayOfWeek(ADateTime)]
end;

function ShortMonthName(const ADateTime: TDateTime): string;
  {Gets the short name of the month specified by a date.}
begin
  Result := SysUtils.ShortMonthNames[DateMonth(ADateTime)]
end;

function SQLDate(const Date: TDateTime): string;
  {Formats a date in SQL format.}
begin
  Result := SysUtils.FormatDateTime('yyyy"-"mm"-"dd', Date);
end;

function SQLDateToDateTime(const SQLDate: string): TDateTime;
  {Converts a date in SQL format into a TDateTime.}
begin
  Result := SysUtils.EncodeDate(
    SysUtils.StrToInt(Copy(SQLDate, 1, 4)),
    SysUtils.StrToInt(Copy(SQLDate, 6, 2)),
    SysUtils.StrToInt(Copy(SQLDate, 9, 2))
  );
end;

function TimeHour(const Time: TDateTime): Word;
  {Extracts the hour from a specified time.}
var
  Min, Sec, Sec100: Word; // unused dummy values required by DecodeTime
begin
  SysUtils.DecodeTime(Time, Result, Min, Sec, Sec100);
end;

function TimeMin(const Time: TDateTime): Word;
  {Extracts the minute from a specified time.}
var
  Hour, Sec, Sec100: Word; // unused dummy values required by DecodeTime
begin
  SysUtils.DecodeTime(Time, Hour, Result, Sec, Sec100);
end;

function TimeSec(const Time: TDateTime): Word;
  {Extracts the second from a specified time.}
var
  Hour, Min, Sec100: Word; // unused dummy values required by DecodeTime
begin
  SysUtils.DecodeTime(Time, Hour, Min, Result, Sec100);
end;

function TimeZoneBias: Integer;
  {<p>Gets the bias of the local time zone relative to UTC (GMT).</p><p>Does not
  adjust for daylight saving time.</p>}
var
  TZI: Windows.TTimeZoneInformation; // info about time zone
begin
  if Windows.GetTimeZoneInformation(TZI) = Windows.TIME_ZONE_ID_INVALID then
    SysUtils.RaiseLastOSError;
  Result := TZI.Bias
end;

function TimeZoneName: string;
  {Returns a string containing the local time zone name or '' if the name is
  unknown.}
var
  TZI: Windows.TTimeZoneInformation;  // info about time zone
begin
  case GetTimeZoneInformation(TZI) of
    Windows.TIME_ZONE_ID_INVALID: SysUtils.RaiseLastOSError;
    Windows.TIME_ZONE_ID_STANDARD: Result := TZI.StandardName;
    Windows.TIME_ZONE_ID_DAYLIGHT: Result := TZI.DaylightName;
    Windows.TIME_ZONE_ID_UNKNOWN: Result := '';
  end;
end;

function UnixDateToDateTime(const USec: Longint): TDateTime;
  {Converts a Unix date to a Delphi TDateTime.
  Does not check for range errors.}
const
  cUnixStartDate: TDateTime = 25569.0; // 1970/01/01
begin
  Result := (Usec / 86400) + cUnixStartDate;
end;

function WesternEaster(const Year: Word): TDateTime;
  {Returns the date of Easter Sunday for the given year in the Gregorian
  calendar as used by Western Christian Churches.}
var
  A, B, C, D, E, F, G, H, I, K, L, M, P : Integer;
  Day, Month: Word;
begin
  Assert(Year >= 1583);
  A := Year mod 19;
  B := Year div 100;
  C := Year mod 100;
  D := B div 4;
  E := B mod 4;
  F := (B + 8) div 25;
  G := (B - F + 1) div 3;
  H := (19 * A + B - D - G + 15) mod 30;
  I := C div 4;
  K := C mod 4;
  L := (32 + 2 * E + 2 * I - H - K) mod 7;
  M := (A + 11 * H + 22 * L) div 451;
  P := (H + L - 7 * M + 114);
  Month := P div 31;
  Day := (P mod 31) + 1;
  Result := SysUtils.EncodeDate(Year, Month, Day);
end;

function WinFileTimeToDateTime(FT: Windows.TFileTime): TDateTime;
  {Converts the given Windows FILETIME structure FT into a Delphi TDateTime
  value and returns it.
  Raises an exception if FT is not valid or can't be converted.}
var
  SysTime: Windows.TSystemTime; // stores date/time in system time format
begin
  // Convert file time to system time, raising exception on error
  SysUtils.Win32Check(Windows.FileTimeToSystemTime(FT, SysTime));
  // Convert system time to Delphi date time, raising excpetion on error
  Result := SysUtils.SystemTimeToDateTime(SysTime);
end;

function WinFileTimeToDOSFileTime(FT: Windows.TFileTime): Integer;
  {Converts the given Windows FILETIME structure FT to a DOS file time and
  returns it.
  Raises an exception if FT is not a valid value or can't be converted.}
begin
  SysUtils.Win32Check(
    Windows.FileTimeToDosDateTime(
      FT, SysUtils.LongRec(Result).Hi, SysUtils.LongRec(Result).Lo
    )
  );
end;

function WinFileTimeToStr(FT: Windows.TFileTime): string;
  {Converts the given Windows FILETIME structure FT to a string.
  Raises an exception if FT is not a valid value.}
begin
  Result := SysUtils.DateTimeToStr(WinFileTimeToDateTime(FT));
end;

end.
