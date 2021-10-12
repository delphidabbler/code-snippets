# DelphiDabbler Code Snippets Database v2

This collection is version 2 of the DelphiDabbler Code Snippets Database.

The collection contains over 600 reusable Pascal code snippets. The majority are simple functions and procedures but there are also some constants and type definitions, including some advanced records with methods.

All of the snippets have been tested: some received basic testing while others have been tested more comprehensively. The collection contains details of the level of testing each snippet received.

## History

Version 1 was designed exclusively for use with _DelphiDabbler [CodeSnip](https://github.com/delphidabbler/codesnip)_ (v4.15.1 and earlier) and was downloaded by the program directly from a web service on DelphiDabbler.com.

Version 2 is designed to be able to be used by other applications in addition to _CodeSnip_ (v4.16.0 or later). This version is **not** backwards compatible with version 1.

## Using the Collection

Anyone is welcome to write applications or web pages that access the snippets in the collection, subject to the terms of the license (see below). You should read the collection's documentation which explains the file format in detail.

> **WARNING:** Implementors **must not** read the collection data directly from this GitHub repository - that could generate more than the permitted amount of traffic. Instead you must download a release from the _Releases_ tab and either distribute the collection with the application or host it on a web server.

## Documentation

The collection data format is fully documented in the file `collection-format.html` in the `docs` directory.

## Releases

Releases can be found on the `releases` tab on the GitHub project page.

From v2.0.1, each release comprises three zip files, as follows (replace `X.Y.X` in the file names with the release version number):

  * `csdb-vX.Y.Z-data.zip` - Contains all the data in the collection. Required by applications that access the collection.
  * `csdb-vX.Y.Z-docs.zip` - Contains the documentation developers need to understand the structure of the data.
  * `csdb-vX.Y.Z-tests.zip` - Contains the unit tests and demonstration code for _some_ of the snippets in the database, with one test project for each category for which tests are available.

## Change Log

The project's change log can be found in `CHANGELOG.md` in the collection's base directory.

## License

All snippets in this collection (stored in `.dat` files in the `collections` directory) are licensed under the MIT license and are copyright © 2005-2020, [Peter Johnson](https://gravatar.com/delphidabbler) and Contributors. The full license and a list of contributors can be found in the `LICENSE` and `CONTRIBUTORS` files in the `collection` sub-directory.

Certain files in the `tests` directory contain copies of snippets extracted from the collection. These files are identified as such in the comments at the start of the file. The files are licensed  under the same license as the `.dat` files in the `collections` directory. See the paragraph above for details.

All other files in this project are licensed under the MIT license and are copyright © 2020-2021, [Peter Johnson](https://gravatar.com/delphidabbler).
