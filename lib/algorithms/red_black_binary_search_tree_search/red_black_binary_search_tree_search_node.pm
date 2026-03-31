package algorithms::red_black_binary_search_tree_search::red_black_binary_search_tree_search_node;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use constants::lists qw(NODE_RED_COLOR);

sub new {
    my ($class, $key, $value, $color) = @_;

    my $self = {
        key    => $key,
        value  => $value,
        color  => defined $color ? $color : NODE_RED_COLOR,
        left   => undef,
        right  => undef,
        parent => undef,
    };

    bless $self, $class;

    return $self;
}

our @EXPORT_OK = qw(new);

1;
