package Text::Minify::XS;

use v5.10;
use strict;
use warnings;

require Exporter;
require DynaLoader;

our @ISA = qw(Exporter DynaLoader);
our @EXPORT_OK = qw(minify);

our $VERSION = 'v0.1.0';

bootstrap Text::Minify::XS $VERSION;

1;
