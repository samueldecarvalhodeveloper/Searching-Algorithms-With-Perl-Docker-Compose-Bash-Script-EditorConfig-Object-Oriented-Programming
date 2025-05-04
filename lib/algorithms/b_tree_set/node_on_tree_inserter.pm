package algorithms::b_tree_set::node_on_tree_inserter;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use algorithms::b_tree_set::b_tree_set_node;

sub get_tree_with_new_key_inserted {
    my ($current_root_node, $key, $value) = @_;

    if (!defined $current_root_node) {
        return algorithms::b_tree_set::b_tree_set_node->new($key, $value);
    }
    if ($key lt $current_root_node->{key}) {
        $current_root_node->{left} = get_tree_with_new_key_inserted($current_root_node->{left}, $key, $value);
    }
    elsif ($key gt $current_root_node->{key}) {
        $current_root_node->{right} = get_tree_with_new_key_inserted($current_root_node->{right}, $key, $value);
    }
    else {
        $current_root_node->{value} = $value;
    }
    return $current_root_node;
}

our @EXPORT_OK = qw(get_tree_with_new_key_inserted);

1;
