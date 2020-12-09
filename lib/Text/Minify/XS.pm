package Text::Minify::XS;

# ABSTRACT: Minify text

use v5.6;
use strict;
use warnings;

require Exporter;
require XSLoader;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(minify);

our $VERSION = 'v0.1.0';

XSLoader::load( "Text::Minify::XS", $VERSION );

1;
