# Code Snippets Database v4 File Format

## Introduction

The collection is organised as a set of categories, each of which contains one or more code snippets.

Meta data describing the categories and snippets is stored in a set of `.ini` files. In addition there are numerous `.dat` files, each of which contains the source code of a snippet.

Finally there are also plain text files containing the source code license and lists of credits.

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
StandardFormat=<0|1>
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
    StandardFormat
  </dt>
  <dd>
    Flag indicating if a snippet is in <em>standard format</em><sup>3</sup> (i.e. it is a routine as opposed to freeform / plain text). Valid values are <code>0</code> for False or <code>1</code> for True. If the key is omitted or empty then <code>1</code> is assumed. Ignored if a non-empty <em>Kind</em> key is present. If <em>Kind</em> is not present or empty then <em>StandardFormat</em> = <code>0</code> is interpreted as <em>Kind</em> = <code>freeform</code> and <em>StandardFormat</em> = <code>1</code> is interpreted as <em>Kind</em> = <code>routine</code>.
  </dd>
  <dt>
    Kind
  </dt>
  <dd>
    The kind (or type) of this code snippet. Valid values are:
    <ul>
      <li><code>freeform</code> – a freeform snippet that doesn't conform to any other other supported type. This is the default if <em>Kind</em> is omitted unless <em>StandardFormat</em><sup>3</sup> is present (see above).</li>
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

There are two credits files, `contrib.txt` and `testers.txt` that list the people who have contributed code to the collection or helped to test the code, respectively.

Each file is simply a list of names, with each name on a separate line.

The credits files are not referenced by, and do not reference, any of the other files in the collection.

## License File

This is a plain UTF-8 text file named `LICENSE` that contains the license that applies to the source code in the collection.

The exception is that any source code file may contains license information in comments. Such a license overrides that in the `LICENSE` file.

The `LICENSE` file is not referenced by, and do not reference, any of the other files in the collection.

## Footnotes

<sup>**1**</sup> REML is a text markup language used by the <em>CodeSnip</em>to format text. REML version 4 is supported. The REML format is documented elsewhere.

<sup>**2**</sup> Here is an example of how the <em>Credits</em> and <em>Credits_URL</em> key values in the individual category `.ini` files are used. If <em>Credits</em>="`See [example]`" and <em>Credits_URL</em>="`http://example.com</em>`" and the <em>Extra</em>key is empty or missing then the extra text generated will be `See <a href="example.com">example 1</a>`.

<sup>**3</sup> The <em>StandardFormat</em> key was used when snippets could only be either "standard" Pascal routines or simple plain text files. Later further types of snippets were added and the <em>Kind</em> key was introduced to enable them to be specified in the `.ini` file.