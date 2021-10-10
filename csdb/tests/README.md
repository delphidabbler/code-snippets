# About the CodeSnippets Tests project

This project provides tests and demos of snippets from the [DelphiDabbler Code Snippets Database](https://github.com/delphidabbler/code-snippets).

## Directory Structure

The project has the following directories:

### `./`

  Contains this file.

### `./Src`

  Contains project groups files for Delphi 2006..2010 that group together all the sub-projects that are stored in sub-directories of `Src`.

  There is also a batch file, `Config.bat`, that is used to create the temporary directories needed to compile the code.

### `./Src/Cat-Date`

  Contains the _TestDateCat_ project that provides _DUnit_ tests for selected snippets from the database's _Date and Time_ category.

### `./Src/Cat-Drive`

  Contains the _TestDriveCat_ project that implements a GUI application that exercises and demonstrates all the code from the database's _Drive Management_ category.

### `./Src/Cat-Hex`

  Contains the _TestHexCat_ project that provides _DUnit_ tests for all the snippets from the database's _Hex Utilities_ category.

### `./Src/Cat-Maths`

  Contains the _TestCatMaths_ project that provides _DUnit_ tests for selected snippets from the database's _Mathematics_ category.

### `./Src/Cat-String`

  Contains the _TestCatString_ project that provides _DUnit_ tests for selected snippets from the database's _String Management_ category.

### `./Src/Cat-WinSys`

  Contains the _TextWinSysCat_ project that provides a GUI application that exercises and demonstrates all the code from the database's _Windows System_ category.
