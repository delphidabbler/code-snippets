unit TestUDateCatSnippets;

interface

uses
  TestFramework, UDateCatSnippets;

type
  TestDateCatSnippets = class(TTestCase)
  published
    procedure TestDateQuarter;
    procedure TestDateQuarterStart;
    procedure TestDateQuarterEnd;
    procedure TestSQLDate;
    procedure TestSQLDateToDateTime;
    procedure TestDateDay;
    procedure TestDateMonthStart;
    procedure TestDateMonthEnd;
    procedure TestDateYearStart;
    procedure TestDateYearEnd;
    procedure TestWesternEaster;
  end;

implementation

uses
  SysUtils;

{ TestDateCatSnippets }

procedure TestDateCatSnippets.TestDateDay;
begin
  CheckEquals(1, DateDay(EncodeDate(1997, 05, 01)), 'Test 1');
  CheckEquals(3, DateDay(EncodeDate(2000, 01, 03)), 'Test 2');
  CheckEquals(21, DateDay(EncodeDate(2008, 12, 21)), 'Test 3');
  CheckEquals(29, DateDay(EncodeDate(2008, 02, 29)), 'Test 4');
end;

procedure TestDateCatSnippets.TestDateMonthEnd;
var
  D, ME: TDateTime;
begin
  D := EncodeDate(2011, 1, 1); ME := EncodeDate(2011, 1, 31);
  CheckEquals(ME, DateMonthEnd(D), 'Test 1');
  D := EncodeDate(2011, 2, 4); ME := EncodeDate(2011, 2, 28);
  CheckEquals(ME, DateMonthEnd(D), 'Test 2');
  D := EncodeDate(2011, 3, 31); ME := EncodeDate(2011, 3, 31);
  CheckEquals(ME, DateMonthEnd(D), 'Test 3');
  D := EncodeDate(1997, 12, 1); ME := EncodeDate(1997, 12, 31);
  CheckEquals(ME, DateMonthEnd(D), 'Test 4');
  D := EncodeDate(1998, 12, 13); ME := EncodeDate(1998, 12, 31);
  CheckEquals(ME, DateMonthEnd(D), 'Test 5');
  D := EncodeDate(1999, 12, 31); ME := EncodeDate(1999, 12, 31);
  CheckEquals(ME, DateMonthEnd(D), 'Test 6');
  D := EncodeDate(2011, 6, 12); ME := EncodeDate(2011, 6, 30);
  CheckEquals(ME, DateMonthEnd(D), 'Test 7');
  D := EncodeDate(2012, 2, 02); ME := EncodeDate(2012, 2, 29);
  CheckEquals(ME, DateMonthEnd(D), 'Test 8');
end;

procedure TestDateCatSnippets.TestDateMonthStart;
var
  D, MS: TDateTime;
begin
  D := EncodeDate(2011, 1, 1); MS := EncodeDate(2011, 1, 1);
  CheckEquals(MS, DateMonthStart(D), 'Test 1');
  D := EncodeDate(2011, 2, 4); MS := EncodeDate(2011, 2, 1);
  CheckEquals(MS, DateMonthStart(D), 'Test 2');
  D := EncodeDate(2011, 3, 31); MS := EncodeDate(2011, 3, 1);
  CheckEquals(MS, DateMonthStart(D), 'Test 3');
  D := EncodeDate(1997, 12, 1); MS := EncodeDate(1997, 12, 1);
  CheckEquals(MS, DateMonthStart(D), 'Test 4');
  D := EncodeDate(1998, 12, 13); MS := EncodeDate(1998, 12, 1);
  CheckEquals(MS, DateMonthStart(D), 'Test 5');
  D := EncodeDate(1999, 12, 31); MS := EncodeDate(1999, 12, 1);
  CheckEquals(MS, DateMonthStart(D), 'Test 6');
  D := EncodeDate(2011, 6, 30); MS := EncodeDate(2011, 6, 1);
  CheckEquals(MS, DateMonthStart(D), 'Test 7');
  D := EncodeDate(2012, 2, 29); MS := EncodeDate(2012, 2, 1);
  CheckEquals(MS, DateMonthStart(D), 'Test 8');
end;

procedure TestDateCatSnippets.TestDateQuarter;
begin
  CheckEquals(1, DateQuarter(EncodeDate(2011, 1, 1)), 'Test 1');
  CheckEquals(1, DateQuarter(EncodeDate(2011, 1, 31)), 'Test 2');
  CheckEquals(1, DateQuarter(EncodeDate(2011, 3, 31)), 'Test 3');
  CheckEquals(2, DateQuarter(EncodeDate(2011, 4, 1)), 'Test 4');
  CheckEquals(2, DateQuarter(EncodeDate(2011, 5, 31)), 'Test 5');
  CheckEquals(2, DateQuarter(EncodeDate(2011, 6, 30)), 'Test 6');
  CheckEquals(3, DateQuarter(EncodeDate(2011, 7, 1)), 'Test 7');
  CheckEquals(3, DateQuarter(EncodeDate(2011, 8, 14)), 'Test 8');
  CheckEquals(3, DateQuarter(EncodeDate(2011, 9, 30)), 'Test 9');
  CheckEquals(4, DateQuarter(EncodeDate(2011, 10, 1)), 'Test 10');
  CheckEquals(4, DateQuarter(EncodeDate(2011, 11, 3)), 'Test 11');
  CheckEquals(4, DateQuarter(EncodeDate(2011, 12, 31)), 'Test 12');
  CheckEquals(4,
    DateQuarter(EncodeDate(2011, 12, 31) + EncodeTime(23, 59, 59, 999)),
    'Test 13');
  CheckEquals(1,
    DateQuarter(EncodeDate(2012, 1, 1) + EncodeTime(0, 0, 0, 0)),
    'Test 14');
end;

procedure TestDateCatSnippets.TestDateQuarterEnd;
var
  D, QE: TDateTime;
begin
  D := EncodeDate(2011, 1, 1); QE := EncodeDate(2011, 3, 31);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 1');
  D := EncodeDate(2011, 2, 4); QE := EncodeDate(2011, 3, 31);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 2');
  D := EncodeDate(2011, 3, 31); QE := EncodeDate(2011, 3, 31);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 3');
  D := EncodeDate(2011, 4, 1); QE := EncodeDate(2011, 6, 30);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 4');
  D := EncodeDate(2011, 5, 1); QE := EncodeDate(2011, 6, 30);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 5');
  D := EncodeDate(2011, 6, 30); QE := EncodeDate(2011, 6, 30);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 6');
  D := EncodeDate(2011, 7, 1); QE := EncodeDate(2011, 9, 30);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 7');
  D := EncodeDate(2011, 8, 12); QE := EncodeDate(2011, 9, 30);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 8');
  D := EncodeDate(2011, 9, 30); QE := EncodeDate(2011, 9, 30);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 9');
  D := EncodeDate(2011, 10, 1); QE := EncodeDate(2011, 12, 31);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 10');
  D := EncodeDate(2011, 11, 11); QE := EncodeDate(2011, 12, 31);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 11');
  D := EncodeDate(2011, 12, 31); QE := EncodeDate(2011, 12, 31);
  CheckEquals(QE, DateQuarterEnd(D), 'Test 12');
end;

procedure TestDateCatSnippets.TestDateQuarterStart;
var
  D, QS: TDateTime;
begin
  D := EncodeDate(2011, 1, 1); QS := EncodeDate(2011, 1, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 1');
  D := EncodeDate(2011, 2, 4); QS := EncodeDate(2011, 1, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 2');
  D := EncodeDate(2011, 3, 31); QS := EncodeDate(2011, 1, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 3');
  D := EncodeDate(2011, 4, 1); QS := EncodeDate(2011, 4, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 4');
  D := EncodeDate(2011, 5, 1); QS := EncodeDate(2011, 4, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 5');
  D := EncodeDate(2011, 6, 30); QS := EncodeDate(2011, 4, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 6');
  D := EncodeDate(2011, 7, 1); QS := EncodeDate(2011, 7, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 7');
  D := EncodeDate(2011, 8, 12); QS := EncodeDate(2011, 7, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 8');
  D := EncodeDate(2011, 9, 30); QS := EncodeDate(2011, 7, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 9');
  D := EncodeDate(2011, 10, 1); QS := EncodeDate(2011, 10, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 10');
  D := EncodeDate(2011, 11, 11); QS := EncodeDate(2011, 10, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 11');
  D := EncodeDate(2011, 12, 31); QS := EncodeDate(2011, 10, 1);
  CheckEquals(QS, DateQuarterStart(D), 'Test 12');
end;

procedure TestDateCatSnippets.TestDateYearEnd;
var
  D, YE: TDateTime;
begin
  D := EncodeDate(2011, 1, 1); YE := EncodeDate(2011, 12, 31);
  CheckEquals(YE, DateYearEnd(D), 'Test 1');
  D := EncodeDate(2011, 2, 4); YE := EncodeDate(2011, 12, 31);
  CheckEquals(YE, DateYearEnd(D), 'Test 2');
  D := EncodeDate(2011, 3, 31); YE := EncodeDate(2011, 12, 31);
  CheckEquals(YE, DateYearEnd(D), 'Test 3');
  D := EncodeDate(1997, 12, 1); YE := EncodeDate(1997, 12, 31);
  CheckEquals(YE, DateYearEnd(D), 'Test 4');
  D := EncodeDate(1998, 12, 13); YE := EncodeDate(1998, 12, 31);
  CheckEquals(YE, DateYearEnd(D), 'Test 5');
  D := EncodeDate(1999, 12, 31); YE := EncodeDate(1999, 12, 31);
  CheckEquals(YE, DateYearEnd(D), 'Test 6');
  D := EncodeDate(2011, 6, 30); YE := EncodeDate(2011, 12, 31);
  CheckEquals(YE, DateYearEnd(D), 'Test 7');
  D := EncodeDate(2012, 2, 29); YE := EncodeDate(2012, 12, 31);
  CheckEquals(YE, DateYearEnd(D), 'Test 8');
end;

procedure TestDateCatSnippets.TestDateYearStart;
var
  D, YS: TDateTime;
begin
  D := EncodeDate(2011, 1, 1); YS := EncodeDate(2011, 1, 1);
  CheckEquals(YS, DateYearStart(D), 'Test 1');
  D := EncodeDate(2011, 2, 4); YS := EncodeDate(2011, 1, 1);
  CheckEquals(YS, DateYearStart(D), 'Test 2');
  D := EncodeDate(2011, 3, 31); YS := EncodeDate(2011, 1, 1);
  CheckEquals(YS, DateYearStart(D), 'Test 3');
  D := EncodeDate(1997, 12, 1); YS := EncodeDate(1997, 1, 1);
  CheckEquals(YS, DateYearStart(D), 'Test 4');
  D := EncodeDate(1998, 12, 13); YS := EncodeDate(1998, 1, 1);
  CheckEquals(YS, DateYearStart(D), 'Test 5');
  D := EncodeDate(1999, 12, 31); YS := EncodeDate(1999, 1, 1);
  CheckEquals(YS, DateYearStart(D), 'Test 6');
  D := EncodeDate(2011, 6, 30); YS := EncodeDate(2011, 1, 1);
  CheckEquals(YS, DateYearStart(D), 'Test 7');
  D := EncodeDate(2012, 2, 29); YS := EncodeDate(2012, 1, 1);
  CheckEquals(YS, DateYearStart(D), 'Test 8');
end;

procedure TestDateCatSnippets.TestSQLDate;
begin
  CheckEquals('2011-01-01', SQLDate(EncodeDate(2011, 1, 1)), 'Test 1');
  CheckEquals('1997-10-23', SQLDate(EncodeDate(1997, 10, 23)), 'Test 2');
  CheckEquals('2000-12-31', SQLDate(EncodeDate(2000, 12, 31)), 'Test 3');
  CheckEquals('2100-04-26', SQLDate(EncodeDate(2100, 04, 26)), 'Test 4');
end;

procedure TestDateCatSnippets.TestSQLDateToDateTime;
begin
  CheckEquals(EncodeDate(2011, 1, 1), SQLDateToDateTime('2011-01-01'),
    'Test 1');
  CheckEquals(EncodeDate(1997, 10, 23), SQLDateToDateTime('1997/10/23'),
    'Test 2');
  try
    SQLDateToDateTime('19xx-09-30');
    Fail('Test 3, Conversion error expected for 19xx-09-30');
  except
  end;
  try
    SQLDateToDateTime('10-09-30');
    Fail('Test 4, Conversion error expected for 10-09-30');
  except
  end;
  try
    SQLDateToDateTime('1999-12-45');
    Fail('Test 4, Conversion error expected for 1999-12-45');
  except
  end;
end;

procedure TestDateCatSnippets.TestWesternEaster;

  procedure DoCheck(const SampleEaster: string);
  var
    Y : Word;
    E: TDateTime;
    CalculatedEaster: string;
  begin
    Y := StrToInt(Copy(SampleEaster, 1, 4));
    E := WesternEaster(Y);
    CalculatedEaster := FormatDateTime('YYYY"-"MM"-"DD', E);
    CheckEquals(SampleEaster, CalculatedEaster, 'Test: ' + SampleEaster);
  end;

begin
  // Sample Easter dates taken from
  // http://online-calculators.appspot.com/easter/list/
  DoCheck('1583-04-10');
  DoCheck('1584-04-01');
  DoCheck('1597-04-06');
  DoCheck('1607-04-15');
  DoCheck('1624-04-07');
  DoCheck('1637-04-12');
  DoCheck('1652-03-31');
  DoCheck('1661-04-17');
  DoCheck('1682-03-29');
  DoCheck('1707-04-24');
  DoCheck('1725-04-01');
  DoCheck('1741-04-02');
  DoCheck('1809-04-02');
  DoCheck('1818-03-22');
  DoCheck('1833-04-07');
  DoCheck('1865-04-16');
  DoCheck('1866-04-01');
  DoCheck('1867-04-21');
  DoCheck('1874-04-05');
  DoCheck('1877-04-01');
  DoCheck('1881-04-17');
  DoCheck('1885-04-05');
  DoCheck('1886-04-25');
  DoCheck('1889-04-21');
  DoCheck('1893-04-02');
  DoCheck('1894-03-25');
  DoCheck('1897-04-18');
  DoCheck('1898-04-10');
  DoCheck('1899-04-02');
  DoCheck('1900-04-15');
  DoCheck('1901-04-07');
  DoCheck('1908-04-19');
  DoCheck('1927-04-17');
  DoCheck('1936-04-12');
  DoCheck('1943-04-25');
  DoCheck('1947-04-06');
  DoCheck('1953-04-05');
  DoCheck('1959-03-29');
  DoCheck('1966-04-10');
  DoCheck('1967-03-26');
  DoCheck('1968-04-14');
  DoCheck('1969-04-06');
  DoCheck('1970-03-29');
  DoCheck('1978-03-26');
  DoCheck('1979-04-15');
  DoCheck('1980-04-06');
  DoCheck('1981-04-19');
  DoCheck('1982-04-11');
  DoCheck('1983-04-03');
  DoCheck('1990-04-15');
  DoCheck('1991-03-31');
  DoCheck('1992-04-19');
  DoCheck('1993-04-11');
  DoCheck('1994-04-03');
  DoCheck('1995-04-16');
  DoCheck('1996-04-07');
  DoCheck('1997-03-30');
  DoCheck('1998-04-12');
  DoCheck('1999-04-04');
  DoCheck('2000-04-23');
  DoCheck('2009-04-12');
  DoCheck('2012-04-08');
  DoCheck('2028-04-16');
  DoCheck('2032-03-28');
  DoCheck('2038-04-25');
  DoCheck('2057-04-22');
  DoCheck('2088-04-11');
  DoCheck('2089-04-03');
  DoCheck('2099-04-12');
  DoCheck('2118-04-10');
  DoCheck('2148-04-07');
  DoCheck('2182-04-21');
  DoCheck('2190-04-25');
  DoCheck('2198-03-25');
  DoCheck('2199-04-14');
  DoCheck('2213-04-11');
  DoCheck('2248-04-16');
  DoCheck('2269-04-18');
  DoCheck('2283-04-15');
  DoCheck('2285-03-22');
  DoCheck('2296-04-19');
  DoCheck('2300-04-08');
  DoCheck('2301-03-31');
  DoCheck('2319-04-06');
  DoCheck('3885-04-19');
  DoCheck('4078-04-17');
  DoCheck('4099-04-19');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestDateCatSnippets.Suite);

end.
