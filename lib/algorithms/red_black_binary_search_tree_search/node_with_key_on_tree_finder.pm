package algorithms::red_black_binary_search_tree_search::node_with_key_on_tree_finder;
use strict;
use warnings FATAL => "all";
use Exporter "import";

sub get_node_with_key {
    my ($node, $key) = @_;

    return unless defined $node;

    if ($key lt $node->{key}) {
        return get_node_with_key($node->{left}, $key);
    }
    elsif ($key gt $node->{key}) {
        return get_node_with_key($node->{right}, $key);
    }
    else {
        return $node;
    }
}

our @EXPORT_OK = qw(get_node_with_key);

1;
