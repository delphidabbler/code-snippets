# Code Snippets Database v4 File Format

## Introduction

The collection is organised as a set of categories, each of which contains one or more code snippets.

Meta data describing the categories and snippets is stored in a set of `.ini` files. In addition there are numerous `.dat` files, each of which contains the source code of a snippet.

Finally there are also plain text files containing the source code license and lists of credits.

All the files are plain text, encoded in UTF-8 format with byte order mark (i.e. UTF-8 preamble).

## Meta Data Files

There are two kinds of meta data files:

1. `categories.ini` lists the categories contained in the collection.
2. A set of further `.ini` files, one for each category specified in `categories.ini`. Each of these files contains numerous details of each snippet along with the name of the `.dat` file containing the source code.

### Format Of `categories.ini`

This file has a simple format. Each section is named after a category ID, i.e. the ID by which the category is uniquely referred to in the collection. Each section of the file has a value containing the description of the category and another that names that category's own `.ini` file. Here is the format of a section:

```
[<cat-id>]
Desc=<category-description>
Ini=<ini-file-name>
```

Where the values are:

<dl>
  <dt>
    cat-id
  </dt>
  <dd>
    A unique identifier of the category. This is used to uniquely identify the category within the collection. ASCII letter and numbers only.
  <dt>
    category-description
  </dt>
  <dd>
    A human readable, brief, description of the category. Any valid UTF-8 text.
  </dd>
  <dt>
    ini-file-name
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
Category ini files
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
StandardFormat=<0|1>
Kind=<freeform|routine|type|const|class|unit>
TestInfo=<none|basic|advanced>
MinVer=<version-number>
```

The sections in these files are named with a unique name that identifies a snippet. This must be a valid Unicode Pascal identifier. The values have the following purpose:

<dl>
  <dt>
    DisplayName
  </dt>
  <dd>
    Human readable name of snippet. Optional. If not present the name of the section is used as the human readable name. Any valid UTF-8 string.
  </dd>
  <dt>
    Desc
  </dt>
  <dd>
    Description of the snippet as plain text. Ignored if the <em>DescEx</em> field is present.
  </dd>
  <dt>
    DescEx
  </dt>
  <dd>
    Formatted description of the snippet using REML code. May be empty, in which case the <em>Desc</em> field is used. The <em>Desc</em> field is ignored if <em>DescEx</em> has a value.
  </dd>
  <dt>
    Snip
  </dt>
  <dd>
    Name of file containing source code. Contains no file path information. Source files must be in the same directory as the <code>.ini</code> file.
  </dd>
  <dt>
    Units
  </dt>
  <dd>
    Comma separated list of units required by the snippet. May be omitted or empty if no units are required. The System unit is assumed and does not need to be specified. Unit names must be valid Pascal identifiers.
  </dd>
  <dt>
    Depends
  </dt>
  <dd>
    Comma separated list of the names (IDs) snippets that are required to compile this snippet. May be omitted or empty if there are no dependencies. Must not cause a circular reference back to this snippet. Snippet names must exist within the collection.
  </dd>
  <dt>
    SeeAlso
  </dt>
  <dd>
    Comma separated list of the names (IDs) of cross-referenced snippets. May be omitted or empty. Snippet names should exist in the collection.
  </dd>
  <dt>
    Credits
  </dt>
  <dd>
    Optional. Text string that notes any credits / acknowledgements. May be omitted or empty. Credits may optionally contain one (and only one) section of text delimited by <code>[</code> and <code>]</code> characters that indicate the presence of a hyperlink. The enclosed text is used as the text of a hyperlink whose URL must be specified in the <em>Credits_URL</em> field must contain the URL of the hyperlink. <em>Credits</em> is ignored if the <em>Extra</em> field is present and not empty.
  </dd>
  <dt>
    Credits_URL
  </dt>
  <dd>
    The URL used in any hyperlink present in the <em>Credits</em> field. Must be present if <em>Credits</em> specifies a hyperlink. Ignored if <em>Credits</em> contains no hyperlink section or if the <em>Extra</em> field is present and not empty.
  </dd>
  <dt>
    Comments
  </dt>
  <dd>
    Text string containing any additional comments about the snippet. Optional. Ignored if the <em>Extra</em> field is present and not empty.
  </dd>
  <dt>
    DelphiXXX &amp; FPC
  </dt>
  <dd>
    This related group of values describe compilation results for the snippets on various compilers. Valid value names are:
    <ul>
      <li><em>Delphi2</em> – Delphi 2 compiler</li>
      <li><em>Delphi3</em> – Delphi 3 compiler</li>
      <li><em>Delphi4</em> – Delphi 4 compiler</li>
      <li><em>Delphi5</em> – Delphi 5 compiler</li>
      <li><em>Delphi6</em> – Delphi 6 compiler</li>
      <li><em>Delphi7</em> – Delphi 7 compiler</li>
      <li><em>Delphi2005Win32</em> – Win32 personality of Delphi 2005 compiler</li>
      <li><em>Delphi2006Win32</em> – Win32 personality of Delphi 2006 compiler</li>
      <li><em>Delphi2007</em> – Delphi 2007 compiler</li>
      <li><em>Delphi2009Win32</em> – Win32 personality of Delphi 2009 compiler<li>
      <li><em>Delphi2010</em> – Delphi 2010 compiler</li>
      <li><em>DelphiXE</em> – Delphi XE compiler</li>
      <li><em>DelphiXE2</em> – Delphi XE2 compiler</li>
      <li><em>DelphiXE3</em> – Delphi XE3 compiler</li>
      <li><em>DelphiXE4</em> – Delphi XE4 compiler</li>
      <li><em>DelphiXE5</em> – Delphi XE5 compiler</li>
      <li><em>DelphiXE6</em> – Delphi XE6 compiler</li>
      <li><em>DelphiXE7</em> – Delphi XE7 compiler</li>
      <li><em>DelphiXE8</em> – Delphi XE8 compiler</li>
      <li><em>Delphi10S</em> – Delphi 10 Seattle compiler</li>
      <li><em>Delphi101B</em> – Delphi 10.1 Berlin compiler</li>
      <li><em>FPC</em> – Free Pascal compiler</li>
    </ul>
    Valid values for these fields are:
    <ul>
      <li><code>Y</code> – compiles on the compiler</li>
      <li><code>N</code> – does not compile on the compiler</li>
      <li><code>W</code> – compiles with warnings on the compiler</li>
      <li><code>Q</code> – compilation result unknown</li>
    </ul>
    If any of the above compilers is not present, the compile result is assumed to be <code>Q</code>. A compile result of <code>W</code> is treated as if it were <code>Y</code>.
  </dd>
  <dt>
    Extra
  </dt>
  <dd>
    Provides extra information about the snippet. Optional. When present the value must be a valid string of REML code. If omitted the extra information is generated from any <em>Comments</em> and <em>Credits</em> / <em>Credits_URL</em> values. When present <em>Comments</em> and <em>Credits</em> / <em>Credits_URL</em> are ignored.
  </dd>
  <dt>
    StandardFormat
  </dt>
  <dd>
    Flag indicating if a snippet is in "standard format" (i.e. it is a routine as opposed to freeform / plain text). Valid values are <code>0</code> for False or <code>1</code> for True. If omitted then <code>1</code> is assumed. Ignored if the <em>Kind</em> is present. If <em>Kind</em> is not present then <em>StandardFormat</em> = <code>0</code> is interpreted as <em>Kind</em> = <code>freeform</code> and <em>StandardFormat</em> = <code>1</code> is interpreted as <em>Kind</em> = <code>routine</code>.
  </dd>
  <dt>
    Kind
  </dt>
  <dd>
    Kind of code snippet this is. Valid values are:
    <ul>
      <li><code>freeform</code> – a freeform snippet that doesn't conform to any type other supported type. This is the default if <em>Kind</em is omitted unless <em>StandardFormat</em> is present (see above).</li>
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
    Testing information for snippets. Valid values are:
    <ul>
      <li><code>none</code> – the snippet has not been tested.</li>
      <li><code>basic</code> – the snippet has passed some simple testing.</li>
      <li><code>advanced</code> – the snippet has passed more advanced testing, usually unit tests.</li>
    </ul>
    If <em>TestInfo</em> is not present then its value defaults to <code>basic</code>.
  </dd>
  <dt>
</dl>

The format is quite messy, with several values having similar or overlapping purposes. This has happened because new features have been added over time while preserving backward compatibility. Where continued use of old values still served the required purpose they were retained in favour of newer features.

Backwards compatibility with older formats has now been dropped, but to save development time some of the old style values have been retained. However some duplication of values has been removed.

## Source Code Files

There is a separate source code file for each snippet. They are usually numbered from `001` and have a `.dat` extension.

## Credits Files

There are two credits files, `contrib.txt` and `testers.txt` that list the people who have contributed code to the collection or helped to test the code, respectively.

Each file is simply a list of names, with each name on a separate line.

The credits files stand alone from the other files in the collection in that they are not referenced by, and do not reference, any of the other files.

## License File

This is a plain UTF-8 text file named `LICENSE` that contains the license that applies to the source code in the collection.

The exception is that any source code file may contains license information in comments. Such a license overrides that in the `LICENSE` file.

The `LICENSE` file stand alone from the other files in the collection in that they are not referenced by, and do not reference, any of the other files.
