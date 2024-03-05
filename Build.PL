use 5.010;
use strict;
use warnings;
use Module::Build;
Module::Build->VERSION('0.4004');

my $builder = Module::Build->new(
    module_name         => 'Yari2',
    license             => 'apache',
    dist_author         => q{Chris Kwak <chris.kwak@samsung.com>},
    dist_version_from   => 'lib/Yari2.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => '0.4004',
    },
    test_requires => {
        'Test::More' => '0',
    },
    requires => {
		'Log::Log4perl' => 1.41,
		'Getopt::Long' => 2.38,
		'Text::Tabs' => 0,
		'Pod::Usage' => 0,
		'File::Basename' => 0,
		'Data::Dump' => 1.21,
		'Regexp::Grammars' => 1.033,
		'Verilog::Preproc' => 3.402,	
    },
	script_files => [ qw(scripts/yari2) ],
    add_to_cleanup     => [ 'Yari2-*' ],
);

$builder->create_build_script();
