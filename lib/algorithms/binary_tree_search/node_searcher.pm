package algorithms::binary_tree_search::node_searcher;
use strict;
use warnings FATAL => "all";
use Exporter "import";

sub get_node_with_key {
    my ($current_root_node, $key) = @_;

    return unless defined $current_root_node;

    return $current_root_node->{value} if $key eq $current_root_node->{key};

    if ($key lt $current_root_node->{key}) {
        return get_node_with_key($current_root_node->{left}, $key);
    } else {
        return get_node_with_key($current_root_node->{right}, $key);
    }
}

our @EXPORT_OK = qw(get_node_with_key);

1;
