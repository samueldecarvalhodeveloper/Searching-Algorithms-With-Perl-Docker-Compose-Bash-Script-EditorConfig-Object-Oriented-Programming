package algorithms::red_black_binary_search_tree_search::subtree_minimum_value_node_finder;

use strict;
use warnings FATAL => "all";
use Exporter "import";

sub get_subtree_minimum_value_node {
    my ($node) = @_;

    while (defined $node->{left}) {
        $node = $node->{left};
    }

    return $node;
}

our @EXPORT_OK = qw(get_subtree_minimum_value_node);

1;
