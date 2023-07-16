# About the CodeSnippets Tests project

This project provides tests and demos of snippets from the [DelphiDabbler Code Snippets Database](https://github.com/delphidabbler/code-snippets).

## Directory Structure

The project has the following directories:

### `./`

Contains:

* this file: `README.md`
* project group files for Delphi 2006..XE[^1] that group together all the sub-projects that are stored in sub-directories of `Src`.

### `./Cat-Arrays`

Contains the _TestArraysCat_[^2] project that provides _DUnit_ tests for snippets from the database's _Arrays_ category. Currently tests are only available for the _TArrayUtils_ advanced record.

### `./Cat-Date`

Contains the _TestDateCat_[^2] project that provides _DUnit_ tests for selected snippets from the database's _Date and Time_ category.

### `./Cat-Drive`

Contains the _TestDriveCat_[^2] project that implements a GUI application that exercises and demonstrates all the code from the database's _Drive Management_ category.

### `./Cat-Hex`

Contains the _TestHexCat_[^2] project that provides _DUnit_ tests for all the snippets from the database's _Hex Utilities_ category.

### `./Cat-Maths`

Contains the _TestCatMaths_[^2] project that provides _DUnit_ tests for selected snippets from the database's _Mathematics_ category.

### `./Cat-String`

Contains the _TestCatString_[^2] project that provides _DUnit_ tests for selected snippets from the database's _String Management_ category.

### `./Cat-WinSys`

Contains the _TextWinSysCat_[^2] project that provides a GUI application that exercises and demonstrates all the code from the database's _Windows System_ category.

### History

These test files originated as a [zip file on Google Drive](https://drive.google.com/file/d/1pH7LtyZY-ehwjJ4AjC801j-0bVMdLpsz/view) that were transferred to the `delphidabbler/code-snippets` repository on GitHub. The tests are located in the repository's `tests` sub-directory.

All subsequent changes to the files were made on GitHub. At present the GitHub repository differs from the original code on Google Drive.

[^1]: There are different versions of the group project file for different Delphi versions: `CodeSnippetsTestsbdsgroup` for Delphi 2006, `CodeSnippetsTests.groupproj` for Delphi 2007-2010 and `CodeSnippetsTestsXE.groupproj` for Delphi XE.

[^2]: There are different versions of project files for different Delphi versions. They are one or more of `<NAME>.bdsproj` for Delphi 2006, `<NAME>.dproj` for Delphi 2007 to 2010 and `<NAME>XE.dproj` for Delphi XE,  where `<NAME>` is the base name of the project, for example `TestDateCat` or `TestCatMaths`.
