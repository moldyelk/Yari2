#===================================================================================
#
# Yari.pm
#
# Perl5 module for integrating Verilog RTLs
#
# Wriiten by Chris Kwak <chris.kwak@samsung.com>
#
# Copyright (C) 2017-2024 Chris Kwak. All Rights Reserved.
#==================================================================================

package Yari2;


=head1 NAME

Yari2 - Yet Another Rapid Intgrator by Chris Kwak

=head1 VERSION

Version 2.31

=cut

our $VERSION = '2.31';

# top hierachy hash reference
my $top = {};

# XML project file
my $xml;

# con_info hash
#my %con_info;

# pre-defined keywords
my @predef = qw/TOP TOPB TOPZ WIRE FLOAT TIE/;
my @predef_nf = qw/TOP TOPB WIRE TIE/;  # predef not float

# run-time options
my $uncon = 0;
my $data;
my $year;

my $option = {
    proj      => '',
};


