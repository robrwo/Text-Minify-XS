
use Test::More 1.302183;

use_ok "Text::Minify::XS", "minify_ascii";

is minify_ascii("") => "", "empty";

is minify_ascii(" ") => "", "empty";

is minify_ascii("\t\t \n") => "", "empty";

is minify_ascii("simple") => "simple";

is minify_ascii("\nsimple") => "simple";

is minify_ascii("\n  simple") => "simple";

is minify_ascii("\n  simple\n") => "simple\n";

is minify_ascii("\r  simple \r ") => "simple\n";

is minify_ascii("\n\n  simple\r\n test\n\r") => "simple\ntest\n";

is minify_ascii("simple  \n") => "simple\n";

is minify_ascii("simple  \r") => "simple\n";

is minify_ascii("simple  \nstuff  ") => "simple\nstuff";

is minify_ascii("\r\n\r\n\t0\r\n\t\t1\r\n") => "0\n1\n";

{
    is minify_ascii(" \0 x") => "\0 x";

    is minify_ascii("\0") => "\0", "null";

    is minify_ascii(" \0 ") => "\0", "null";

}

done_testing;
