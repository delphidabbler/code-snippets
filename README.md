# DelphiDabbler Code Snippets Collection

## Overview

This repository contains a collection of over 700 reusable Pascal code snippets. The majority are simple functions and procedures but there are also some constants and type definitions, including some advanced records with methods.

Snippets are grouped into categories, with each snippet belonging to exactly one category.

All of the snippets have been tested to some extent: some received basic testing while others have been tested more comprehensively. The collection contains details of the level of testing each snippet received.

## Purpose

The primary purpose of the collection is for use with the _DelphiDabbler [CodeSnip](https://github.com/delphidabbler/codesnip)_ program.

However the intent is that other applications will also be able to use the collection by parsing the meta data provided with it.

## Documentation

The collection data format is [fully documented](https://htmlpreview.github.io/?https://github.com/delphidabbler/code-snippets/blob/master/docs/index.html) in `docs` directory.

## Using the Collection

Anyone is welcome to write applications or web pages that access the snippets in the collection, subject to the terms of the license (see below). You should read the collection's documentation which explains the file formats in detail.

⚠️ Implementers **must not** read the collection data directly from this GitHub repository - that could generate more than the permitted amount of traffic. Instead you must download a release from the _Releases_ tab and either distribute the collection with the application or host it on a web server.

## Tests

Unit tests and demonstration projects are available for _some_ of the snippets.

Source code for these tests and demonstrations is available in the `tests` directory. There is a sub-directory for each category where such code is available.

See the `README.md` file in the `tests` directory for full details.

## Releases

Releases can be found on the `releases` tab on the GitHub project page.

Each release[^1] comprises three zip files, as follows (replace `X.Y.Z` in the file names with the release version number):

* `csdb-vX.Y.Z-data.zip` - Contains all the data in the collection. Required by applications that access the collection.
* `csdb-vX.Y.Z-docs.zip` - Contains the documentation developers need to understand the structure of the data.
* `csdb-vX.Y.Z-tests.zip` - Contains the unit tests and demo code.

## Development

This repo uses the [Git Flow](http://nvie.com/posts/a-successful-git-branching-model/) methodology - i.e. development proceeds on the `develop` branch and `feature` branches off it. Only released content appears on the `master` branch.

## History & Changes

This repository contains version 2 of the collection.

Version 1 was designed exclusively for use with _DelphiDabbler [CodeSnip](https://github.com/delphidabbler/codesnip)_ (v4.15.1 and earlier). It was downloaded by the program directly from a web service on DelphiDabbler.com. This version was not developed under Git and is longer available.

Version 2 is designed to be able to be used by other applications in addition to _CodeSnip_ (v4.16.0 or later). This version is **not** backwards compatible with version 1.

The project's change log can be found in `CHANGELOG.md`.

## License

This project is MIT Licensed. See `LICENSE.md` for full details.

[^1]: `csdb-vX.Y.Z-tests.zip` was only available from v2.0.1.
