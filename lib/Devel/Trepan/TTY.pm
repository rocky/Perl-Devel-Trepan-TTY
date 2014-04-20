#!/usr/bin/env perl
# Copyright (C) 2014 Rocky Bernstein <rocky@cpan.org>
# Documentation is at the __END__
package Devel::Trepan::TTY;
use version; $VERSION = '1.0';
"All of the real action is in Devel::Trepan::CmdProcessor::Command::TTY.pm and Devel::Trepan:::IO::TTY*.pm";
__END__

=pod

=head1 NAME

Master/slave TTY support plugin for L<Devel::Trepan>

=head1 SUMMARY

This adds a "set tty" command and server/client options tty to the
L<Devel::Trepan> debugger, I<trepan.pl>.

=head1 AUTHORS

Rocky Bernstein

=head1 COPYRIGHT

Copyright (C) 2014 Rocky Bernstein <rocky@cpan.org>

This program is distributed WITHOUT ANY WARRANTY, including but not
limited to the implied warranties of merchantability or fitness for a
particular purpose.

The program is free software. You may distribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation (either version 2 or any later version) and
the Perl Artistic License as published by O'Reilly Media, Inc. Please
open the files named gpl-2.0.txt and Artistic for a copy of these
licenses.

=cut
