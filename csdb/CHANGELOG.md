# Changelog

This is the change log for the _DelphiDabbler Code Snippets Database_ collection.

From v2.0.0 all notable changes to this project will be documented in this file.

> No change log was kept for version 1 of the collection.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## v2.0.1 of 2021/10/12

* Add new unit tests and demo code for _some_ snippets from the database. All such code was added to a new `tests` directory. See `tests/README.md` for details.

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
