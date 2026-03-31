package algorithms::binary_tree_search::binary_tree_search_node;

use strict;
use warnings FATAL => "all";
use Exporter "import";

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

our @EXPORT_OK = qw(new);

1;
