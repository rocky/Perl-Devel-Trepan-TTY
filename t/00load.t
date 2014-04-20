#!/usr/bin/env perl
use strict;
use warnings;
use lib '../lib';
use blib;

use Test::More tests => 2;
note( "Testing Device::Trepan::TTY $Devel::Trepan::TTY::VERSION" );

BEGIN {
use_ok( 'Devel::Trepan::TTY' );
}

ok(defined($Devel::Trepan::TTY::VERSION),
   "\$Devel::Trepan::TTY::VERSION number is set");
