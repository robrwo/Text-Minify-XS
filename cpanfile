# This file is generated by Dist::Zilla::Plugin::CPANFile v6.015
# Do not edit this file directly. To change prereqs, edit the `dist.ini` file.

requires "Exporter" => "0";
requires "XSLoader" => "0";
requires "perl" => "v5.9.3";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "Encode" => "0";
  requires "File::Spec" => "0";
  requires "Module::Metadata" => "0";
  requires "Test::More" => "0";
  requires "Test::Warnings" => "0";
  requires "utf8" => "0";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "2.120900";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "Pod::Coverage::TrustPod" => "0";
  requires "Test::CleanNamespaces" => "0.15";
  requires "Test::EOF" => "0";
  requires "Test::EOL" => "0";
  requires "Test::Kwalitee" => "1.21";
  requires "Test::MinimumVersion" => "0";
  requires "Test::More" => "0.88";
  requires "Test::NoTabs" => "0";
  requires "Test::PPPort" => "0.03";
  requires "Test::Pod" => "1.41";
  requires "Test::Pod::Coverage" => "1.08";
  requires "Test::Pod::LinkCheck" => "0";
  requires "Test::Portability::Files" => "0";
  requires "Test::TrailingSpace" => "0.0203";
};
