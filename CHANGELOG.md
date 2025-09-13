# Changelog

This is the change log for the _DelphiDabbler Code Snippets Database_ collection.

From v2.0.0 all notable changes to this project will be documented in this file.

> No change log was kept for version 1 of the collection.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## v2.3.0 of 2025/09/13

* Updated the collection specification:
    * Added snippet properties to enable recording of compilation results with Delphi 13 (issue [62](https://github.com/delphidabbler/code-snippets/issues/62)).
    * Deprecated compiler results with value `W` (issue [63](https://github.com/delphidabbler/code-snippets/issues/63)).
* Changes were made to the _Structures_ category:
    * Added a new `TIntegerRange` advanced record (issue [56](https://github.com/delphidabbler/code-snippets/issues/56)).
    * Fixed an error in the description of the `Range` snippet.
    * Added a warning to the `TRangeEx` advanced record to note potentially buggy behaviour if the range lower bound is greater than the upper bound.
* Added new `RandomString` routine to the _String Management_ category (issue [28](https://github.com/delphidabbler/code-snippets/issues/28)).
* Added results of compiling every snippet with Delphi 13 (issue [60](https://github.com/delphidabbler/code-snippets/issues/60)).
* Fixed bug that was preventing the `Softmax` routine in the _Mathematics_ category from compiling due to a missing unit declaration (issue [61](https://github.com/delphidabbler/code-snippets/issues/61)).
* Changes to unit tests:
    * Added a new DUnit test project for the _Structures_ category and added it to the _CodeSnippetsTestsXE_ project group. Unit tests for all snippets in the _Structures_ category were created (issue [58](https://github.com/delphidabbler/code-snippets/issues/58)).
    * Added further unit tests for all snippets in the _Arrays_ category that did not already have them (issue [38](https://github.com/delphidabbler/code-snippets/issues/38)).
    * Added unit tests for the new `RandomString` routine.
* Documentation:
    * Updated `tests/README.md` re the unit test changes in this release and other minor revisions.
    * Fixed typo in `README.md`. 

## v2.2.3 of 2025/04/03

* Added results of compiling with Delphi 12 for all snippets with no pre-existing compile results for that compiler (issue [#27](https://github.com/delphidabbler/code-snippets/issues/27)).
* Fixed memory leak in the `CountOccurences` function (issue [#54](https://github.com/delphidabbler/code-snippets/issues/54)).
* Updated `GetGIFSize` function to work around a deprecated warning with Delphi 12 and some earlier compilers because of a call to `SysUtils.StrLComp` which has been moved to the `AnsiStrings` unit (issue [#52](https://github.com/delphidabbler/code-snippets/issues/52)).

## v2.2.2 of 2025/01/19

* New snippets were added to the _Arrays_ and _Mathematics_ categories:
    * _Arrays_ category:
        * `Reverse<T>` method of `TArrayUtils` & `ReverseByteArray` function (issue [#37](https://github.com/delphidabbler/code-snippets/issues/37)).
        * `Max<T>`, `Min<T>` & `MinMax<T>` methods of `TArrayUtils` (issue [#8](https://github.com/delphidabbler/code-snippets/issues/8)).
    * _Mathematics_ category:
        * 3 overloaded versions of each of the `ArithmeticMean` & `WeightedArithmeticMean` functions (issue [#30](https://github.com/delphidabbler/code-snippets/issues/30)).
        * `DigitSumBase`, `DigitCountBase` & `DigitsOf` function (issue [#17](https://github.com/delphidabbler/code-snippets/issues/17)).
        * `DigitPowerSum` function (issue [#39](https://github.com/delphidabbler/code-snippets/issues/39)).
        * `IsPalindromic` function (issue [#19](https://github.com/delphidabbler/code-snippets/issues/19)).
        * `IsNarcissistic` function (issue [#18](https://github.com/delphidabbler/code-snippets/issues/18)).
        * `LSE` & `Softmax` functions (issue [34](https://github.com/delphidabbler/code-snippets/issues/34)).
        * 3 overloaded versions of a `Median` function (issue [#41](https://github.com/delphidabbler/code-snippets/issues/41)).
        * 2 overloaded versions of each of the `MinMaxOfArray`, `RescaleRange`, `NormaliseByWeight` & `RangeOf` functions (issue [#44](https://github.com/delphidabbler/code-snippets/issues/44)).
        * 3 overloaded versions of each of the `GeometricMean` and `WeightedGeometricMean` functions (issue [#31](https://github.com/delphidabbler/code-snippets/issues/31)).
        * 3 overloaded versions of each of the `SumOfReciprocals` and `HarmonicMean` functions (issue [#35](https://github.com/delphidabbler/code-snippets/issues/35)).
        * 3 overloaded versions of a `WeightedHarmonicMean` function (issue [#47](https://github.com/delphidabbler/code-snippets/issues/47)).
        * `LogarithmicMean` function (issue [#32](https://github.com/delphidabbler/code-snippets/issues/32)).
        * 3 overloaded versions of the `PowerMean` and `WeightedPowerMean` functions (issue [#33](https://github.com/delphidabbler/code-snippets/issues/33)).
        * `Mode`, `ModeAlt`, `ModeCount`, `HasMode` & `CountOccurences` functions (issue [#42](https://github.com/delphidabbler/code-snippets/issues/42)).
        * 2 overloaded versions of a `RMS` function (issue [#49](https://github.com/delphidabbler/code-snippets/issues/49)).
        * 2 overloaded versions of a `TSS` (total sum of squares) function (issue [#51](https://github.com/delphidabbler/code-snippets/issues/51)).
* Updates to snippets in the _Mathematics_ category:
    * Overflow checking was added to the `PowNZN`.
    * Fixed bug in all overloads of the `SumOfLogs` routine that was causing access violations whenever an exception was to be raised (issue [#46](https://github.com/delphidabbler/code-snippets/issues/46)).
* Changes to tests:
    * Added unit tests for all the routines and methods that were added to the _Arrays_ and _Mathematics_ categories in this release.
    * Added unit test for the pre-existing `ByteArraysEqual` function in the _Arrays_ category.
    * Modified unit test for `PowNZN` to check for new `EOverflow` exception raised when an overflow condition is detected.
    * Removed conditional compilation directives from the array unit test unit.
* Updated `README.md` to note that there are now over 700 snippets in the collection.
* Updated all copyright dates for 2025.

## v2.2.1 of 2024/12/02 (HOTFIX)

* Fixed invalid and corrupted values in some `AdvancedTest.URL` and `AdvancedTest.Level` keys in `data.ini`, `hex.ini` and `maths.ini`. Fixes issue [#29](https://github.com/delphidabbler/code-snippets/issues/29).

## v2.2.0 of 2024/10/15

* Updated collection specification:
    * Added snippet properties to enable recording of compilation results with Delphi 10.2 through to Delphi 12. Fixes issue [#26](https://github.com/delphidabbler/code-snippets/issues/26).
    * Added new `AdvancedTest.Level` and `AdvancedTest.URL` snippet properties to provide additional information for snippets that have received advanced testing. See issues [#13](https://github.com/delphidabbler/code-snippets/issues/13) & [#15](https://github.com/delphidabbler/code-snippets/issues/15).
* Changes to the collection:
    * Added 3 new IEEE Pown functions to the _Maths_ category: `PowN`, `PowNZN`, `PowNZZ`. Fixes issue [#20](https://github.com/delphidabbler/code-snippets/issues/20).
    * Added 7 overloaded version of each of two new summing functions in the _Maths_ category: `ArraySum` & `SumOfLogs`. Fixes issue [#25](https://github.com/delphidabbler/code-snippets/issues/25).
    * Added `AdvancedTest.Level` values to numerous snippets that have received advanced testing to provide details of the type of testing. See issue [#15](https://github.com/delphidabbler/code-snippets/issues/15).
    * Added `AdvancedTest.URL`values to to numerous snippets that have received advanced testing to provide links to the test source code. See issue [#13](https://github.com/delphidabbler/code-snippets/issues/13)
    * Corrected `RFC1123DateGMT` snippet test level from `advanced` to `basic`.
    * Fixed syntax errors in `maths.ini` & `hex.ini` category files.
* Changes to tests:
    * Comments corrected and updated in the test projects for the `drive` and `winsys` categories.
    * Pascal files in test projects that were generated from the collection had header comments changed to refer to the revised `LICENSE.md`.
    * Added unit tests for the `PowN`, `PowNZN`, `PowNZZ` routines and the `ArraySum` & `SumOfLogs` overloaded functions the to maths category test project.
* Restructured source code repository. All files and sub-directories that were in the `csdb` directory were moved up one directory level and `csdb` was deleted. Fixes issue [#14](https://github.com/delphidabbler/code-snippets/issues/14).
* Updated documentation:
    * `README.md` in the repo root was heavily edited to include information formerly in `csdb/README.md`, which was deleted.
    * `tests/README.md` was changed to reflect the changed repo directory structure and footnotes were converted to GitHub style.
    * `LICENSE.md` was changed to reflect the different copyright details that apply to the files belong to the collection and other files.
    * Collection documentation updated as follows:
        * Noted changes to the collection specification made in this releases.
        * General editing
        * Revised styling
        * Added a new section discussing some issues that may be encountered when designing software to that reads the database.
    * Fixed a CSS error in `docs/main.css`.
    * Rewrote REML documentation to link to become a brief overview that links to an authoratitive definition of REML in the `delphidabbler/reml` repository. Fixes issue [#24](https://github.com/delphidabbler/code-snippets/issues/24).

## v2.1.2 of 2023/07/15

* Fixed simple errors and oversights in documentation. Fixes issues [#9](https://github.com/delphidabbler/code-snippets/issues/9) & [#10](https://github.com/delphidabbler/code-snippets/issues/10).

> Other than to update the `VERSION` file there were no changes to any snippets or associated meta-data in this release.

## v2.1.1 of 2021/12/29 (HOTFIX)

* Fixed malformed REML tags. Fixes [issue #7](https://github.com/delphidabbler/code-snippets/issues/7).

## v2.1.0 of 2021/12/26

* Deprecated `Desc`, `Comments`, `Credits` & `Credits_URL` keys in Code Snippets Database collection and changed `DescEx` key to be required. Made following changes to `.ini` files as a consequence:
    * Changed all `Desc` keys to `DescEx` keys and removed all `Desc` keys as a result.
    * Converted content of all `Comments`, `Credits` & `Credits_URL` keys to `Extra` key values and removed the deprecated keys.
* Made all `DescEx` and `Extra` values fully REML v4 compliant by ensuring all content is wrapped in `<p>`..`</p>` tags.
* Fixed errors in `.ini` files. Fixes [issue #6](https://github.com/delphidabbler/code-snippets/issues/6).
* Updated a small number of snippet descriptions and extra information.
* Updated documentation in `collection-format.html` and `reml.html` to reflect the above changes.

## v2.0.1 of 2021/10/12

* Add new unit tests and demo code for _some_ snippets from the database. All such code was added to a new `tests` directory. See `tests/README.md` for details.
* Fix minor errors in documentation.

> Other than to update the `VERSION` file there were no changes to any snippets or associated meta-data in this release.

## v2.0.0 of 2020/05/02

Initial release of v2 of the collection.

### Changes since last v1 release

* Removed any code that restricted use of the collection to _[DelphiDabbler CodeSnip](https://github.com/delphidabbler/codesnip)_. The collection can now be used by 3rd party applications.
    * Removed backwards compatibility with _CodeSnip_ v4.15.1 and earlier.
    * Removed conditionally included code and _CodeSnip_ version dependent code from category .ini files.
    * Merged multiple versions of category .ini files down into a single file. (These multiple file were used to hide some categories from earlier versions of _CodeSnip_).
    * Removed duplicated, _CodeSnip_ version dependent, source code files: used a copy of the most recent version and removed version specifiers from the file names.
* Rationalised and corrected errors in category .ini files:
    * Condensed two string management categories into one.
    * Removed `Desc` keys where they duplicated `DescEx` keys.
    * Removed some duplicate `Credits` and `Comments` keys.
    * Removed some empty keys.
    * Fixed or removed some broken web links.
    * Rephrased some descriptive text.
* Changed layout of category .ini files and `categories.ini`:
    * Re-ordered sections of `categories.ini` in alphabetic order.
    * Removed all explanatory comments: there were inconsistencies.
    * Added header comments, including copyright and licensing information, to all .ini files.
* File format changes:
    * Removed the `StandardFormat` key from the specification of category .ini files.
    * Added requirements for `LICENSE`, `LICENSE_INFO` and `VERSION` files and added suitable files to the collection.
    * Changed the required name for the contributors and testers files to `CONTRIBUTORS` and `TESTERS` respectively. Renamed the existing `contrib.txt` and `testers.txt` files accordingly.
    * Made support for REML v4 an official requirement.
    * Dropped support for conditional inclusion of code in .ini files.
* Added documentation:
    * Of the collection file format.
    * A read-me file.
    * This change log.
* Ensured that all files in the collection use the UTF-8 text file preamble (aka byte order mark).
* Added a shell script to create releases.
* Officially adopted the MIT license for source code files.
