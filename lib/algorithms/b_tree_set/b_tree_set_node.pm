package algorithms::b_tree_set::b_tree_set_node;

use strict;
use warnings FATAL => "all";

sub new {
    my ($class, $key, $value) = @_;
    my $self = {
        key   => $key,
        value => $value,
        left  => undef,
        right => undef,
    };
    bless $self, $class;
    return $self;
}

1;
