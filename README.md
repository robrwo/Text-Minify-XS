# NAME

Text::Minify::XS - Remove indentation and trailing whitespace from multi-line text

# VERSION

version v0.7.8

# SYNOPSIS

```perl
use Text::Minify::XS qw/ minify /;

my $out = minify( $in );
```

# DESCRIPTION

This is a simple and fast text minifier that quickly removes extra
whitespace from multi-line text.

# EXPORTS

None by default.

## minify

```perl
my $out = minify( $in );
```

This is a quick-and-dirty text minifier that removes indentation and
trailing whitespace from a multi-line text document in a single pass.

It does the following:

- removes leading whitespace (indentation),
- removes trailing whitespace,
- collapses multiple newlines,
- and changes carriage returns to newlines.

It does not recognise any form of markup, comments or text quoting.
Nor does it remove extra whitespace in the middle of the line.

Because it does not recognise any markup, newlines are not removed
since they may be significant.

## minify\_utf8

This is an alias for ["minify"](#minify).  It was added in v0.5.3.

## minify\_ascii

This is a version of ["minify"](#minify) that works on ASCII text. It was added in v0.5.3.

If you are only processing 8-bit text, then it should be faster.
(Rudimentary benchmarks show it is twice as fast as ["minify"](#minify).)

Unlike ["minify"](#minify), if the input string has the UTF-8 flag set, the
resulting string will not.  You should ensure the string is properly
encoded.

# KNOWN ISSUES

## Malformed UTF-8

Malformed UTF-8 characters may be be mangled or omitted from the
output.  In extreme cases it may throw an exception in order to avoid
memory overflows. You should ensure that the input string is properly
encoded as UTF-8.

## Byte Order Marks

The Byte Order Mark (BOM) at the beginning of a file will not be removed. That is because the minifier does not know
this is the beginning of a file or not.

# SECURITY CONSIDERATIONS

Passing malformed UTF-8 characters may throw an exception, which in some cases could lead to a denial of service if
untrusted input is passed to ["minify\_utf8"](#minify_utf8).  See ["KNOWN ISSUES"](#known-issues).

# SUPPORT

Only the latest version of this module will be supported.

Since v0.7.0, this module requires Perl v5.14 or later.
Future releases may only support Perl versions released in the last ten (10) years.

## Reporting Bugs and Submitting Feature Requests

Please report any bugs or feature requests on the bugtracker website
[https://github.com/robrwo/Text-Minify-XS/issues](https://github.com/robrwo/Text-Minify-XS/issues)

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

If the bug you are reporting has security implications which make it inappropriate to send to a public issue tracker,
then see `SECURITY.md` for instructions how to report security vulnerabilities.

# SOURCE

The development version is on github at [https://github.com/robrwo/Text-Minify-XS](https://github.com/robrwo/Text-Minify-XS)
and may be cloned from [git://github.com/robrwo/Text-Minify-XS.git](git://github.com/robrwo/Text-Minify-XS.git)

See `CONTRIBUTING.md` for more information.

# AUTHOR

Robert Rothenberg <rrwo@cpan.org>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2020-2025 by Robert Rothenberg.

This is free software, licensed under:

```
The Artistic License 2.0 (GPL Compatible)
```
