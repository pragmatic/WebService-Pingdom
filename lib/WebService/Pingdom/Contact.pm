#  COPYRIGHT: © 2011 Peter Hallam.

package WebService::Pingdom::Contact;

#   ABSTRACT: Abstract
#    CREATED: Wed, 21 Dec 2011 01:17:53
#     AUTHOR: Peter Hallam <pragmatic@cpan.org>

use strict;
use warnings;
use v5.10;

use Moose;

with 'WebService::Pingdom::Role::Request';

has 'id' => (
    is          => 'ro',
    isa         => 'Num',
);

has [ qw{
    name
    email
    cellphone
    countryiso
    defaultsmsprovider
    twitteruser
    iphonetokens
    androidtokens
} ] => (
    is          => 'ro',
    isa         => 'Str',
);

has [ qw{
    directtwitter
    paused
} ] => (
    is          => 'ro',
    isa         => 'Bool | Object',
);

1;

# vim:set ts=4 sw=4 et ft=perl:
