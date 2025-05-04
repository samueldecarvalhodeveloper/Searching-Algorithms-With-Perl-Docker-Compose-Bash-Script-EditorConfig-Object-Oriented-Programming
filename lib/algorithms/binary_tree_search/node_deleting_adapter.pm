package algorithms::binary_tree_search::node_deleting_adapter;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use algorithms::binary_tree_search::subtree_minimum_value_node_finder;

sub get_root_with_node_deleted {
    my ($current_root_node, $key) = @_;

    return unless defined $current_root_node;

    if ($key lt $current_root_node->{key}) {
        $current_root_node->{left} = get_root_with_node_deleted($current_root_node->{left}, $key);
    }
    elsif ($key gt $current_root_node->{key}) {
        $current_root_node->{right} = get_root_with_node_deleted($current_root_node->{right}, $key);
    }
    else {
        unless ($current_root_node->{left}) {
            return $current_root_node->{right};
        }
        unless ($current_root_node->{right}) {
            return $current_root_node->{left};
        }

        my $current_root_node_to_be_swopt =
            algorithms::binary_tree_search::subtree_minimum_value_node_finder::get_subtree_minimum_value_node($current_root_node->{right});

        $current_root_node->{key} = $current_root_node_to_be_swopt->{key};
        $current_root_node->{value} = $current_root_node_to_be_swopt->{value};

        $current_root_node->{right} = get_root_with_node_deleted($current_root_node->{right}, $current_root_node_to_be_swopt->{key});
    }

    return $current_root_node;
}

our @EXPORT_OK = qw(get_root_with_node_deleted);

1;
