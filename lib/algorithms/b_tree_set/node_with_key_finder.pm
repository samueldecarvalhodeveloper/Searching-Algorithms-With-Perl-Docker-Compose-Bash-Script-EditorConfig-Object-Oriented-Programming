package algorithms::b_tree_set::node_with_key_finder;

use strict;
use warnings FATAL => "all";
use Exporter "import";

sub get_node_with_key {
    my ($current_root_node, $key) = @_;

    return undef unless defined $current_root_node;

    if ($key lt $current_root_node->{key}) {
        return get_node_with_key($current_root_node->{left}, $key);
    }
    elsif ($key gt $current_root_node->{key}) {
        return get_node_with_key($current_root_node->{right}, $key);
    }
    else {
        return $current_root_node->{value};
    }
}

our @EXPORT_OK = qw(get_node_with_key);

1;
