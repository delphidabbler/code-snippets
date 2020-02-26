# Code Snippets Collections

This repository is be used to store a collection of reusable code snippets, mainly in Pascal.

> **NOTE:** Further collections may be added in the future.

## Purpose

The collections that are (and will be) included here are designed, by and large, for use with the _DelphiDabbler [CodeSnip](https://github.com/delphidabbler/codesnip)_ program.

Having said that, the source code in the collections can be used stand-alone<sup>&dagger;</sup>. Each collection has meta data associated with it that was originally designed for use with _CodeSnip_, but can be used with any other software designed to parse the meta data. The meta data file formats will be documented.

<sup>&dagger;</sup> Note though that some snippets depend on others. The meta data, in part, specifies those relationships.

## Collections

So far there is just one collection, the DelphiDabbler Code Snippets Database. This collection is the (as yet unreleased) final version of the database. It is designed for use with the forthcoming releases of _CodeSnip_ (v4.16 and later) that do not get the database from DelphiDabbler.com. (DelphiDabbler.com is due to close in June 2020.)

> The collection is not compatible with versions of _CodeSnip_ up to v4.15.1.

The collection can be found in the `csdb/v4.16` directory. The actual collection is contained in the `collection` sub-directory and it is documented in the `docs` sub-directory - see `collection-format.html` for further information.

## Development

This repo uses the [Git Flow](http://nvie.com/posts/a-successful-git-branching-model/) methodology - i.e. development proceeds on the `develop` branch and `feature` branches off it. Only released content appears on the `master` branch.

## License

The license that applies to each section is specified by a text file named `LICENSE` stored with the collection's files.
