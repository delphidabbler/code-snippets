# Code Snippets Collections

This repository is used to store a collection of reusable code snippets, mainly in Pascal.

> **NOTE:** Further collections may be added in the future.

## Purpose

The purpose of this repository is to provide collections of snippets for use with the _DelphiDabbler [CodeSnip](https://github.com/delphidabbler/codesnip)_ program.

However the intent is that other applications will also be able to use the collections by parsing the meta data provided with the collections. It is intended that the meta data will be fully documented.

## Collections

So far there is just one collection, the _DelphiDabbler Code Snippets Database_. This collection is version 2 of the database. It is designed for use with _CodeSnip_ v4.16 and later.

> The collection is not compatible with versions of _CodeSnip_ up to v4.15.1.

The collection can be found in the `csdb` directory. The actual collection is contained in the `collection` sub-directory and it is documented in the `docs` sub-directory - see `collection-format.html` for further information.

## Development

This repo uses the [Git Flow](http://nvie.com/posts/a-successful-git-branching-model/) methodology - i.e. development proceeds on the `develop` branch and `feature` branches off it. Only released content appears on the `master` branch.

## Licenses

The license that applies to this project can be found in `LICENSE.md` in the repo's root directory.

Code snippets in collections may have a different license or licenses. See the documentation of each collection for details.
