use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'PPD::Test::RoundRobin',
    AUTHOR           => q{H.Seo <seo@psoft.co.jp>},
    VERSION_FROM     => 'lib/PPD/Test/RoundRobin.pm',
    ABSTRACT_FROM    => 'lib/PPD/Test/RoundRobin.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => '5.006',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    BUILD_REQUIRES => {
        'Test::More' => '0',
    },
    PREREQ_PM => {
        #'ABC'              => '1.6',
        #'Foo::Bar::Module' => '5.0401',
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'PPD-Test-RoundRobin-*' },
);
