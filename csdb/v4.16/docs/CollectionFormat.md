# Code Snippets Database v4 File Format

## Introduction

The collection is organised as a set of categories, each of which contains one or more code snippets.

Meta data describing the categories and snippets is stored in a set of `.ini` files. In addition there are numerous `.dat` files, each of which contains the source code of a snippet.

There are additional files containing the source code license information, version information and lists of credits.

All the files are plain text, encoded in UTF-8 format with UTF-8 preamble (BOM).

## Meta Data Files

There are two kinds of meta data files:

1. `categories.ini` lists the categories contained in the collection.
2. A set of further `.ini` files, one for each category specified in `categories.ini`. Each of these files contains numerous details of each snippet along with the name of the `.dat` file containing the source code.

### Format Of `categories.ini`

Each section in this file defines a category and has the following format:

```
[<cat-id>]
Desc=<category-description>
Ini=<ini-file-name>
```

The sections in these files are named with a unique identifier that identifies a category within the collection. The section names must be alphanumeric characters. The values have the following purpose:

<dl>
  <dt>
    Desc
  </dt>
  <dd>
    A human readable, brief, description of the category. Any valid UTF-8 text is permitted.
  </dd>
  <dt>
    Ini
  </dt>
  <dd>
    The name of the <code>.ini</code> file that contains information about each snippet in the category. Must be a valid file name, without path. The files must be stored in the same directory as <code>category.ini</code>.
  </dd>
</dl>

Here is an example (this is a copy of the "Date and Time" category's entry):

```
[date]
Desc=Date and Time
Ini=date.ini
```

### Format Of Individual Category `.ini` Files

Each section in these files defines a snippet and has the following content:

```
[snippet-name]
DisplayName=<snippet-display-name>
Desc=<description-text>
DescEx=<description-REML>
Snip=<snippet-file-name>
Units=<required-units>
Depends=<required-snippets>
SeeAlso=<cross-referenced-snippets>
Credits=<credits-text>
Credits_URL=<url-used-in-credits>
Comments=<comments-text>
Delphi2=<Y|N|Q|W>
Delphi3=<Y|N|Q|W>
Delphi4=<Y|N|Q|W>
Delphi5=<Y|N|Q|W>
Delphi6=<Y|N|Q|W>
Delphi7=<Y|N|Q|W>
Delphi2005Win32=<Y|N|Q|W>
Delphi2006Win32=<Y|N|Q|W>
Delphi2007=<Y|N|Q|W>
Delphi2009Win32=<Y|N|Q|W>
Delphi2010=<Y|N|Q|W>
DelphiXE=<Y|N|Q|W>
DelphiXE2=<Y|N|Q|W>
DelphiXE3=<Y|N|Q|W>
DelphiXE4=<Y|N|Q|W>
DelphiXE5=<Y|N|Q|W>
DelphiXE6=<Y|N|Q|W>
DelphiXE7=<Y|N|Q|W>
DelphiXE8=<Y|N|Q|W>
Delphi10S=<Y|N|Q|W>
Delphi101B=<Y|N|Q|W>
FPC=<Y|N|Q|W>
Extra=<extra-info-REML>
Kind=<freeform|routine|type|const|class|unit>
TestInfo=<none|basic|advanced>
```

The sections in these files are named with identifiers that uniquely identify a snippet. This must be a valid Unicode Pascal identifier. The keys in a section have the following purpose:

<dl>
  <dt>
    DisplayName
  </dt>
  <dd>
    Human readable name of snippet. May be any valid UTF-8 string of up to 64 characters. If not present then the snippet identifier that names the section is used as the human readable name.
  </dd>
  <dt>
    Desc
  </dt>
  <dd>
    Description of the snippet as plain text. Ignored if a non-empty <em>DescEx</em> key is present.
  </dd>
  <dt>
    DescEx
  </dt>
  <dd>
    Formatted description of the snippet using REML<sup>1</sup> code. May be empty, in which case the <em>Desc</em> key is used. <em>Desc</em> is ignored if <em>DescEx</em> has a non-empty value.
  </dd>
  <dt>
    Snip
  </dt>
  <dd>
    Name of the file containing this snippet's source code. Must be a valid file name and contain no file path information. Source files must be in the same directory as the <code>.ini</code> file.
  </dd>
  <dt>
    Units
  </dt>
  <dd>
    Comma separated list of units required to compile the snippet. May be omitted or empty if no units are required. The <code>System</code> unit is assumed and does not need to be specified. Unit names must be valid Pascal identifiers.
  </dd>
  <dt>
    Depends
  </dt>
  <dd>
    Comma separated list of the identifiers of snippets that are required to compile this snippet. May be omitted or empty if there are no such dependencies. Snippet identifiers must exist within the collection and must not cause a circular reference back to this snippet.
  </dd>
  <dt>
    SeeAlso
  </dt>
  <dd>
    Comma separated list of the identifiers of cross-referenced snippets. May be omitted or empty. Snippet identifiers should exist in the collection.
  </dd>
  <dt>
    Credits<sup>2</sup>
  </dt>
  <dd>
    Optional. Text string that notes any credits / acknowledgements. May be omitted or empty. <em>Credits</em> may optionally contain one (and only one) section of text delimited by <code>[</code> and <code>]</code> characters that indicate the presence of a hyperlink. The enclosed text is used as the text of a hyperlink whose URL must be specified in the <em>Credits_URL</em> key. <em>Credits</em> is ignored if a non-empty <em>Extra</em> key is present.
  </dd>
  <dt>
    Credits_URL<sup>2</sup>
  </dt>
  <dd>
    The URL used in any hyperlink present in the <em>Credits</em> key. Must be present if <em>Credits</em> specifies a hyperlink. Ignored if <em>Credits</em> contains no hyperlink section or if a non-empty <em>Extra</em> key is present.
  </dd>
  <dt>
    Comments
  </dt>
  <dd>
    Text string containing any additional comments about the snippet. Optional. Ignored if a non-empty <em>Extra</em> key is present.
  </dd>
  <dt>
    DelphiXXX &amp; FPC
  </dt>
  <dd>
    This related group of keys describe compilation results for the snippets on various compilers. Valid key names are:
    <ul>
      <li><strong>Delphi2</strong> – Delphi 2 compiler</li>
      <li><strong>Delphi3</strong> – Delphi 3 compiler</li>
      <li><strong>Delphi4</strong> – Delphi 4 compiler</li>
      <li><strong>Delphi5</strong> – Delphi 5 compiler</li>
      <li><strong>Delphi6</strong> – Delphi 6 compiler</li>
      <li><strong>Delphi7</strong> – Delphi 7 compiler</li>
      <li><strong>Delphi2005Win32</strong> – Win32 personality of Delphi 2005 compiler</li>
      <li><strong>Delphi2006Win32</strong> – Win32 personality of Delphi 2006 compiler</li>
      <li><strong>Delphi2007</strong> – Delphi 2007 compiler</li>
      <li><strong>Delphi2009Win32</strong> – Win32 personality of Delphi 2009 compiler</li>
      <li><strong>Delphi2010</strong> – Delphi 2010 compiler</li>
      <li><strong>DelphiXE</strong> – Delphi XE compiler</li>
      <li><strong>DelphiXE2</strong> – Delphi XE2 compiler</li>
      <li><strong>DelphiXE3</strong> – Delphi XE3 compiler</li>
      <li><strong>DelphiXE4</strong> – Delphi XE4 compiler</li>
      <li><strong>DelphiXE5</strong> – Delphi XE5 compiler</li>
      <li><strong>DelphiXE6</strong> – Delphi XE6 compiler</li>
      <li><strong>DelphiXE7</strong> – Delphi XE7 compiler</li>
      <li><strong>DelphiXE8</strong> – Delphi XE8 compiler</li>
      <li><strong>Delphi10S</strong> – Delphi 10 Seattle compiler</li>
      <li><strong>Delphi101B</strong> – Delphi 10.1 Berlin compiler</li>
      <li><strong>FPC</strong> – Free Pascal compiler</li>
    </ul>
    Valid values for these keys are:
    <ul>
      <li><code>Y</code> – compiles on the compiler</li>
      <li><code>N</code> – does not compile on the compiler</li>
      <li><code>W</code> – compiles with warnings on the compiler</li>
      <li><code>Q</code> – compilation result unknown</li>
    </ul>
    If any of the above compilers is not present, the compile result is assumed to be <code>Q</code>. A compile result of <code>W</code> is obsolete and treated as if it were <code>Y</code>.
  </dd>
  <dt>
    Extra
  </dt>
  <dd>
    Provides extra information about the snippet. Optional. When present the value must be a valid string of REML<sup>1</sup> code. If omitted the extra information is generated from the values of any <em>Comments</em>, <em>Credits</em> and <em>Credits_URL</em> keys. When <em>Extra</em> has a non-empty value the <em>Comments</em>, <em>Credits</em> and <em>Credits_URL</em> keys are ignored.
  </dd>
  <dt>
    Kind
  </dt>
  <dd>
    The kind (or type) of this code snippet. Valid values are:
    <ul>
      <li><code>freeform</code> – a freeform snippet that doesn't conform to any other other supported type. This is the default if <em>Kind</em> is omitted.</li>
      <li><code>routine</code> – a Pascal routine (function or procedure).</li>
      <li><code>type</code> – a simple Pascal type definition.</li>
      <li><code>const</code> – a Pascal constant definition.</li>
      <li><code>class</code> – a Pascal class or advanced record definition and implementation.</li>
      <li><code>unit</code> – a complete Pascal unit.</li>
    </ul>
  </dd>
  <dt>
    TestInfo
  </dt>
  <dd>
    Testing information for the snippet. Valid values are:
    <ul>
      <li><code>none</code> – the snippet has not been tested.</li>
      <li><code>basic</code> – the snippet has passed some simple testing.</li>
      <li><code>advanced</code> – the snippet has passed more advanced testing, usually unit tests.</li>
    </ul>
    If <em>TestInfo</em> is not present then its value defaults to <code>basic</code>.
  </dd>
  <dt>
</dl>

The format is quite messy, with several keys having similar or overlapping purposes. This has happened because new features have been added over time while preserving backward compatibility..

Backwards compatibility with older formats has now been dropped, but to save development time some of the old style values have been retained. However some duplication of keys has been removed.

## Source Code Files

There is a separate source code file for each snippet. These file names must be named exactly as specified in the related category `.ini` file's <em>Snip</em> key. They are usually numbered from `001` and have a `.dat` extension, but this is not a requirement.

## Credits Files

There are two credits files, `CONTRIBUTORS` and `TESTERS` that list the people who have contributed code to the collection or helped to test the code, respectively.

Each file is simply a list of names, in plain UTF-8 text format, with each name on a separate line. No blank lines are permitted.

The files may be empty if there are no contributors and/or testers, but they *must* be present.

The credits files are not referenced by, and do not reference, any of the other files in the collection.

## License File

There are two files relating to license (and copyright) information: the full text of the license in human readable format and a file providing machine readable meta data about the license and copyright.

### Full License Text

This is a plain UTF-8 text file named `LICENSE` that contains the license that applies to the source code in the collection.

The `LICENSE` file is not referenced by, and does not reference, any of the other files in the collection.

### License Meta Information

A file named `LICENSE-INFO` is provided that contains information about the license in machine readable form. Information is in Key=Value format as follows:

```
LicenseName=<human-readable-name>
LicenseSPDX=<code>
LicenseURL=<url>
CopyrightDate=<date-range>
CopyrightHolder=<name>
CopyrightHolderURL=<url>
```

The keys have the following meaning:

<dl>
  <dt>
    LicenseName
  </dt>
  <dd>
    The name of the license as plain text. E.g. <code>MIT License</code> or <code>Mozilla Public License 2.0</code>.    
  </dd>
  <dt>
    LicenseSPDX
  </dt>
  <dd>
    The Open Source Initiative (OSI) SPDX short identifier of the license, if any. E.g. <const>MIT</const> or <const>MPL-2.0</const>. If the license does not have a SPDX identifier this key <em>must</em> either be omitted or be empty. For a list of OSI licenses with their SPDXs see <a href="https://opensource.org/licenses/alphabetical">https://opensource.org/licenses/alphabetical</a>. 
  </dd>
  <dt>
    LicenseURL
  </dt>
  <dd>
    The URL of an online copy of the license. E.g. <code>https://opensource.org/licenses/MIT</code>. If the license has no URL then this key <em>must</em> be omitted or be empty.
  </dd>
  <dt>
    CopyrightDate
  </dt>
  <dd>
    The date of the copyright or range of copyright dates as plain text. E.g. <code>2020</code> or <code>2005-2020</code>.
  </dd>
  <dt>
    CopyrightHolder
  </dt>
  <dd>
    The name of the copyright holder as plain text. Where there are contributors either list them all or append &quot;and contributors&quot;<sup> 4</sup> to the primary copyright holder's name. E.g. <code>Joe Bloggs</code> or <code>Annie Smith, Joe Bloggs and Jessie Sharp</code> or <code>Annie Smith and Contributors</code>.
  </dd>
  <dt>
    CopyrightHolderURL
  </dt>
  <dd>
    The URL of a web page where details of the copyright holder(s) or primary copyright holder can be found. E.g. <code>https://example.com/joe-blogs-bio</code>. This key is optional.
  </dd>
</dl>

The `LICENSE-INFO` file is not referenced by, and does not reference, any of the other files in the collection.

## Version Information File

There is a plain UTF-8 text file named `VERSION` that contains the version number of the database in the form vX.X.X. where X represents a non-negative integer. The file is required and must be non-empty.

Version numbers must be incremented according to to the principles of [semantic versioning](https://semver.org/).

The current major version is v2. Databases before v2.0.0 did not have a `VERSION` file<sup>3</sup>.

The `VERSION` file is not referenced by, and does not reference, any of the other files in the collection.

## Footnotes

<sup>**1**</sup> REML is a text markup language used to format text. REML version 4 is supported. The REML format is documented in [REML.md](REML.md).

<sup>**2**</sup> Here is an example of how the <em>Credits</em> and <em>Credits_URL</em> key values in the individual category `.ini` files are used. If <em>Credits</em>="`See [example]`" and <em>Credits_URL</em>="`http://example.com</em>`" and the <em>Extra</em>key is empty or missing then the extra text generated will be `See <a href="example.com">example 1</a>`.

<sup>**3**</sup> Version tracking was not done before v2.0.0. However it is safe to assume, using [semantic versioning](https://semver.org/), that the current format is the second major release. This is because all previous database versions were backwards compatible and therefore all belonged to the same major version, which, logically, must have been v1. The fact that this version of the database breaks that backward compatibility means the major version must be bumped.

<sup>**4**</sup> If "contributors" is specified as part of the *CopyrightHolder* key value in `LICENSE-INFO` then the `CONTRIBUTORS` file *must* contain a list of all the contributors.
