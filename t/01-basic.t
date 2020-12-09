use Test::More;

use_ok "Text::Minify::XS", "minify";

is minify("simple") => "simple";

is minify("\n  simple") => "simple";

is minify("\n\n  simple\r\n test\n\r") => "simple\ntest\n";

is minify("simple  \n") => "simple\n";

is minify("simple  \nstuff") => "simple\nstuff";

done_testing;
