use ExtUtils::MakeMaker;
WriteMakefile
(
  'NAME' => 'Text::Minify::XS',
  'VERSION_FROM' => 'lib/Text/Minify/XS.pm',
  'PREREQ_PM' => {
                   'ExtUtils::CBuilder' => 0,
                   'Test::More' => 0,
                   'XSLoader' => 0,
                 },
  'INSTALLDIRS' => 'site',
  'EXE_FILES' => [],
  'PL_FILES' => {}
)
;
