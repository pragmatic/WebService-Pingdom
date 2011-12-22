#  COPYRIGHT: © 2011 Peter Hallam.

package WebService::Pingdom::Role::Request;

#   ABSTRACT: Abstract
#    CREATED: Wed, 21 Dec 2011 00:43:08
#     AUTHOR: Peter Hallam <pragmatic@cpan.org>

use strict;
use warnings;
use v5.10;

use Moose::Role;

with 'WebService::Pingdom::Role::JSON';

use LWP::UserAgent;
use HTTP::Request::Common;

sub BUILD {
    my $self = shift;
    
    $self->ua->credentials(
        $self->url . ':' . $self->port,
        $self->realm,
        $self->username,
        $self->password,
    );
}

has 'ua' => (
    is          => 'ro',
    isa         => 'LWP::UserAgent',
    lazy_build  => 1,
);
sub _build_ua {
    my $self = shift;

    LWP::UserAgent->new(
        timeout     => $self->timeout,
        default_headers => HTTP::Headers->new(
            'App-Key' => $self->api_key,
        ),
    );
}

sub get {
    my ( $self, %params ) = @_;

    $self->ua->request( GET $self->url, \%params );
}

has 'timeout' => (
    is          => 'ro',
    isa         => 'Num',
    default     => 10,
);

has [ qw{ username password api_key } ] => (
    is          => 'ro',
    isa         => 'Str',
    required    => 1,
);

has 'url' => (
    is          => 'ro',
    isa         => 'Str',
    default     => 'api.pingdom.com',
);

has 'port' => (
    is          => 'ro',
    isa         => 'Num',
    default     => 443,
);

has 'realm' => (
    is          => 'ro',
    isa         => 'Str',
    default     => 'Pingdom API',
);

has 'realm' => (
    is          => 'ro',
    isa         => 'Str',
    default     => 'Pingdom API',
);

1;

# vim:set ts=4 sw=4 et ft=perl:
