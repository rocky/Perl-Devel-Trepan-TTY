# -*- coding: utf-8 -*-
# Copyright (C) 2014 Rocky Bernstein <rocky@cpan.org>
use warnings; no warnings 'redefine'; no warnings 'once';
use rlib '../../../../..';
use strict;

package Devel::Trepan::CmdProcessor::Command::Set::TTY;

use vars qw(@ISA @SUBCMD_VARS $slave_tty $master_tty);
our @ISA = qw(Devel::Trepan::CmdProcessor::Command::Subcmd);

unless (@ISA) {
    eval <<"EOE";
use constant MIN_ARGS   => 0;
use constant MAX_ARGS   => 1;
EOE
}

use IO::Pty;

our $HELP   = <<"HELP";

C<set tty> I<input-tty> I<output-tty>

Set debugger input and output tty.

HELP
our $SHORT_HELP   = "Set tty.";

our $MIN_ABBREV = length('tt');

sub run($$)
{
    my ($self, $args) = @_;
    my $proc = $self->{proc};
    my $intf = $proc->{interfaces};
    if (scalar @$args == 2) {
	$master_tty = IO::Pty->new();
	$slave_tty  = $master_tty->slave;
	$proc->msg($slave_tty->ttyname());
	$self->{proc}->msg($master_tty->ttyname());
	$intf->[-1]{output}{output} = $slave_tty;
	$intf->[-1]{input}{input} = $slave_tty;
    } elsif (scalar @$args == 4) {
	my $in_name = $args->[2];
	my $out_name = $args->[3];
	if (CORE::open($intf->[-1]{output}{output}, ">", $out_name)) {
	    CORE::open($intf->[-1]{input}{input}, "<", $in_name);
	    # $intf->[-1]{input}{input} = $intf->[-1]{output}{output};
	} else {
	    $proc->errmsg("can't open $in_name");
	}
    } else {
        $proc->errmsg("wrong number of args - need 0 or 2");
    }
}
unless (caller) {
    # Demo it.
    require Devel::Trepan;
    # require_relative '../../mock'
    # dbgr, parent_cmd = MockDebugger::setup('set', false)
    # cmd              = Trepan::SubSubcommand::SetMax.new(dbgr.core.processor,
    #                                                      parent_cmd)
    # cmd.run(cmd.prefix + ['string', '30'])

    # %w(s lis foo).each do |prefix|
    #   p [prefix, cmd.complete(prefix)]
    # end
}

1;
