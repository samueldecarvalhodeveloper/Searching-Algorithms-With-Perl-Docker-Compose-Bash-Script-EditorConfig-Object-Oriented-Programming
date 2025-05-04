package algorithms::binary_tree_search::subtree_minimum_value_node_finder;
use strict;
use warnings FATAL => "all";
use Exporter "import";

sub get_subtree_minimum_value_node {
    my ($current_root_node) = @_;

    while ($current_root_node->{left}) {
        $current_root_node = $current_root_node->{left};
    }

    return $current_root_node;
}

our @EXPORT_OK = qw(get_subtree_minimum_value_node);

1;
