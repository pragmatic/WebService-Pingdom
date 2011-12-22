#  COPYRIGHT: © 2011 Peter Hallam.

package WebService::Pingdom::Role::JSON;

#   ABSTRACT: Abstract
#    CREATED: Wed, 21 Dec 2011 00:51:00
#     AUTHOR: Peter Hallam <pragmatic@cpan.org>

use strict;
use warnings;
use v5.10;

use Moose::Role;

use JSON;

has [ 'allow_nonref', 'pretty' ] => (
    is          => 'ro',
    isa         => 'Str',
    default     => 1,
);

has 'json' => (
    is          => 'ro',
    isa         => 'JSON',
    lazy_build  => 1,
);
sub _build_json {
    my $self = shift;

    JSON->new(
        allow_nonref    => $self->allow_nonref,
        pretty          => $self->pretty,
    );
}

1;

# vim:set ts=4 sw=4 et ft=perl:
