package algorithms::red_black_binary_search_tree_search::node_inserting_on_tree_adapter;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use constants::lists qw(NODE_RED_COLOR);
use algorithms::red_black_binary_search_tree_search::red_black_binary_search_tree_search_node;

sub get_tree_with_new_node_inserted {
    my ($node, $key, $value) = @_;

    if (!defined $node) {
        return algorithms::red_black_binary_search_tree_search::red_black_binary_search_tree_search_node->new($key, $value, NODE_RED_COLOR);
    }

    if ($key lt $node->{key}) {
        $node->{left} = get_tree_with_new_node_inserted($node->{left}, $key, $value);
    }
    elsif ($key gt $node->{key}) {
        $node->{right} = get_tree_with_new_node_inserted($node->{right}, $key, $value);
    }
    else {
        $node->{value} = $value;
    }

    return $node;
}

1;
