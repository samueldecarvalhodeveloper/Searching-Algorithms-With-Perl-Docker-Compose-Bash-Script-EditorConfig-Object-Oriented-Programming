package algorithms::red_black_binary_search_tree_search::node_deleting_on_tree_adapter;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use algorithms::red_black_binary_search_tree_search::subtree_minimum_value_node_finder;

sub get_tree_with_node_deleted {
    my ($node, $key) = @_;

    return undef unless defined $node;

    if ($key lt $node->{key}) {
        $node->{left} = get_tree_with_node_deleted($node->{left}, $key);
    }
    elsif ($key gt $node->{key}) {
        $node->{right} = get_tree_with_node_deleted($node->{right}, $key);
    }
    else {
        if (!defined $node->{left}) {
            return $node->{right};
        }
        elsif (!defined $node->{right}) {
            return $node->{left};
        }
        else {
            my $successor_node =
                algorithms::red_black_binary_search_tree_search::subtree_minimum_value_node_finder::get_subtree_minimum_value_node($node->{right});

            $node->{key} = $successor_node->{key};
            $node->{value} = $successor_node->{value};

            $node->{right} = get_tree_with_node_deleted($node->{right}, $successor_node->{key});
        }
    }

    return $node;
}

our @EXPORT_OK = qw(get_tree_with_node_deleted);

1;
