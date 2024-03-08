use 5.010;
use strict;
use warnings;
use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
    NAME             => 'Yari2',
    AUTHOR           => q{Chris Kwak <moldyelk@gmail.com>},
    VERSION_FROM     => 'lib/Yari2.pm',
    ABSTRACT_FROM    => 'lib/Yari2.pm',
    LICENSE          => 'apache',
    MIN_PERL_VERSION => '5.010',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
	EXE_FILES	=> [ 'scripts/yari2' ],
    TEST_REQUIRES => {
        'Test::More' => '0',
    },
    PREREQ_PM => {
	    'Getopt::Long' => '2.38',
        'Pod::Usage' => 0,
        'Regexp::Grammars' => '1.033',
        'Test::More' => 0,
        'Text::Tabs' => 0,
        'Data::Dump' => '1.21',
        'File::Basename' => 0,
        'Log::Log4perl' => '1.41',
		'Verilog::Preproc' => '3.402',
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Yari2-*' },
);

# Compatibility with old versions of ExtUtils::MakeMaker
unless (eval { ExtUtils::MakeMaker->VERSION('6.64'); 1 }) {
    my $test_requires = delete $WriteMakefileArgs{TEST_REQUIRES} || {};
    @{$WriteMakefileArgs{PREREQ_PM}}{keys %$test_requires} = values %$test_requires;
}

unless (eval { ExtUtils::MakeMaker->VERSION('6.55_03'); 1 }) {
    my $build_requires = delete $WriteMakefileArgs{BUILD_REQUIRES} || {};
    @{$WriteMakefileArgs{PREREQ_PM}}{keys %$build_requires} = values %$build_requires;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
    unless eval { ExtUtils::MakeMaker->VERSION('6.52'); 1 };
delete $WriteMakefileArgs{MIN_PERL_VERSION}
    unless eval { ExtUtils::MakeMaker->VERSION('6.48'); 1 };
delete $WriteMakefileArgs{LICENSE}
    unless eval { ExtUtils::MakeMaker->VERSION('6.31'); 1 };

WriteMakefile(%WriteMakefileArgs);
