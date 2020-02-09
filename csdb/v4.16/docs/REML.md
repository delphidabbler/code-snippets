# REML Markup Language (v4)

REML is a little markup language that can be used to style text. It is used in Code Snippets collection meta data for certain properties of a snippet.

The REML language is a SGML language similar to a greatly simplified XHTML. The are a small number of tags and character entities that can be used.

The language described here is REML v4. Earlier versions are obsolete.

## Tags

There are two types of tags: block level and in-line.

If an unrecognised tag is encountered an REML code the interpreter *should* report an error. However, providing start and end tags are matched, the interpreter *may* choose to simply ignore the tags.

### Block Level Tags

Block level tags separate the enclosed text into paragraphs of some description. The supported tags are:

* `<p>...</p>` - Renders the enclosed markup as a simple paragraph.
* `<heading>...</heading>` - Renders the enclosed markup as a heading.

The following rules apply to the use of block level tags:

* The tags must not be nested.
* The tags must be matched, e.g. `<p>` must have a matching `</p>`.
* All text should be embedded within block level tags, e.g. `<heading>heading</heading><p>text</p>` or simply `<p>text</p>`.
* White space between blocks must be ignored.

Here is a valid example:

```
<p>Hello World</p>
<heading>Hello</heading>
<p>Hello World</p>
```



Strictly speaking, the following example is invalid code – all occurrences of `wrong` are in error because they are not contained within block tags.

```
wrong <heading>blah</heading> wrong <p>blah</p> wrong
```

However interpreting code *may* interpret this permissively. If this is done the text outside blocks *must* be interpreted as if it was enclosed in `<p>` and `</p>` tags. Therefore the above code would be interpreted as:

```
<p>wrong </p><heading>blah</heading><p>wrong </p><p>blah</p><p>wrong</p>
```

> **Note:** The REML used in the Code Snippets Database v4 file collection may contain such non-conforming texts. Therefore interpreters of REML sourced there *must* be able to handle text without enclosing block tags. 

#### Inline Tags

In-line tags format the text enclosed between the start and end tags.

Here are the available in-line tags:

* `<strong>...</strong>` -  Renders the enclosed markup with strong emphasis.
* `<em>...</em>` - Emphasises the enclosed markup.
* `<var>...</var>` - Used to indicate the enclosed markup is a variable.
* `<warning>...</warning>` - Used for warning text.
* `<mono>...</mono>` - Renders markup in a mono-spaced font.
* `<a href="url">...</a>` - Creates a hyper-link. The `href` attribute must specify the required URL, which must use one of the `http`, `https` or `file` protocols; others are not permitted. If you use the `file` protocol it must reference a valid local or network file.

The following rules apply to the use of in-line tags:

* In-line tags must be embedded inside a block level tag. E.g. `<p>one<strong>two</strong>three</p>`.
* Tags must match. E.g. `<em>` must be matched with `</em>`.
* Tags may be nested, providing the tags match. E.g. `<em>blah <var>blah</var></em>` is valid but `<em>blah <var>blah</em></var>` is not.

Examples:

```
<p>Make stuff <strong>stand out</strong>.</p>
<p><em>Emphasised <warning>warning!</warning></em></p>
<p>Refer to a function <var>parameter</var>.</p>
<p>Use the: <mono>Windows</mono> unit.</p>
<p>See this <a href="http://example.com">example</a>.</p>
```

## Character Entities

A few symbolic character entities are supported in REML. Here is the complete list:

* `&lt;` for `<`
* `&gt;` for `>`
* `&quot;` for `"`
* `&amp;` for `&`
* `&copy;` for `©`

> **Note:** the '&lt;' and '&' characters are special within the markup and cannot be used literally, even when you are just entering plain text. You must use the `&lt;` character entity in place of `<` and `&amp;` instead of `&`. For example to write `x<y` in REML use `x&lt;y` and to write `you & me` use `you &amp; me`.

To express other special symbols for which there is no symbolic character entity, numeric character entities can be used. For example to display the '¶' character (Unicode *pilcrow sign*) use `&#182;`.

> **Note:** Numeric entities should be used with caution because the characters they represent may vary across different text encodings, whereas symbolic entities are safe across encodings.
