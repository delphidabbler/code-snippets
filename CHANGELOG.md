# Changelog

This is the change log for the _DelphiDabbler Code Snippets Database_ collection.

From v2.0.0 all notable changes to this project will be documented in this file.

> No change log was kept for version 1 of the collection.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
