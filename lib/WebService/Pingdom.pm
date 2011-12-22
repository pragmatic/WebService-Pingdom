#  COPYRIGHT: © 2011 Peter Hallam.

package WebService::Pingdom;

#   ABSTRACT: This module does
#    CREATED: Thu, 22 Dec 2011 10:33:09 UTC
#     AUTHOR: Peter Hallam <pragmatic@cpan.org>

use strict;
use warnings;
use v5.10.1;

# VERSION

use Moose;

with 'WebService::Pingdom::Role::Request';

use WebService::Pingdom::Contact;

sub contacts {
    my $self = shift;

    my $url = 'https://api.pingdom.com/';
    my $response = $self->ua->get( $url . 'api/2.0/contacts' );

    my $decoded;

    if ($response->is_success) {

        say $response->headers->as_string;
        $decoded = $self->json->decode($response->decoded_content);  # or whatever

        say $self->json->pretty->encode( $decoded );
    }
    else {
        die $response->status_line;
    }

    return [ map { WebService::Pingdom::Contact->new( ua => $self->ua->clone, %$_ ) } @{ $decoded->{contacts} } ];
}

1;
__END__
=pod

=head1 SYNOPSIS

 use WebService::Pingdom;

 my $pingdom = WebService::Pingdom->new;

=cut

# vim:set ts=4 sw=4 et ft=perl:
