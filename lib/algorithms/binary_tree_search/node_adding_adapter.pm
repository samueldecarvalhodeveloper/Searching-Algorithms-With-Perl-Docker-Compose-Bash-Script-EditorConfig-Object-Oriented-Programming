package algorithms::binary_tree_search::node_adding_adapter;
use strict;
use warnings FATAL => "all";
use Exporter "import";
use algorithms::binary_tree_search::binary_tree_search_node;

sub get_root_with_node_added {
    my ($current_root_node, $key, $value) = @_;

    return algorithms::binary_tree_search::binary_tree_search_node->new($key, $value) unless defined $current_root_node;

    if ($key lt $current_root_node->{key}) {
        $current_root_node->{left} = get_root_with_node_added($current_root_node->{left}, $key, $value);
    }
    elsif ($key gt $current_root_node->{key}) {
        $current_root_node->{right} = get_root_with_node_added($current_root_node->{right}, $key, $value);
    }
    else {
        $current_root_node->{value} = $value;
    }

    return $current_root_node;
}

our @EXPORT_OK = qw(get_root_with_node_added);

1;
