use Test::More;

use_ok "Text::Minify::XS", "minify";

is minify("simple") => "simple";

is minify("\n  simple") => "simple";

is minify("\n\n  simple\n test\n") => "simple\ntest\n";


done_testing;
