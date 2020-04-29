# DelphiDabbler Code Snippets Database v2

This collection is version 2 of the DelphiDabbler Code Snippets Database.

The collection contains over 600 reusable Pascal code snippets. The majority are simple functions and procedures but there are also some constants and type definitions, including some advanced records with methods.

All of the snippets have been tested: some received basic testing while others have been tested more comprehensively. The collection contains details of the level of testing each snippet received.

## History

Version 1 was designed exclusively for use with _DelphiDabbler [CodeSnip](https://github.com/delphidabbler/codesnip)_ and was downloaded by the program directly from a web service on DelphiDabbler.com.

Version 2 is designed to be able to be used by other applications in addition to _CodeSnip_. This version is **not** backwards compatible with version 1.

## Using the Collection

When used with _CodeSnip_, v4.16.0 or later is required.

Anyone is welcome to write applications or web pages that access the snippets in the collection. You should read the collection's documentation which explains the file format in detail.

> **WARNING:** Implementors must not read the collection data directly from this GitHub repository - that could generate more than the permitted amount of traffic. Instead you must download a release from the _Releases_ tab and either distribute the collection with the application or host it on a web server.

## Documentation

The collection data format is fully documented in the file `collection-format.html` in the `docs` directory.

## Change Log

The project's change log can be found in `CHANGELOG.md` in the collection's base directory.

## License

All snippets in this collection are licensed under the MIT license **unless** the snippet contains contrary licensing information in its source code file, in which case that license applies to that snippet only.

Full details can be found in the `LICENSE` file in the `collection` sub-directory.