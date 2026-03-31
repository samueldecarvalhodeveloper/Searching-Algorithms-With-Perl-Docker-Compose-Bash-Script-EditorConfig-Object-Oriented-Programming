package algorithms::red_black_binary_search_tree_search::red_black_binary_search_tree_search;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use constants::lists qw(NODE_RED_COLOR NODE_BLACK_COLOR);
use algorithms::red_black_binary_search_tree_search::node_with_key_on_tree_finder;
use algorithms::red_black_binary_search_tree_search::red_black_binary_search_tree_search_node;
use algorithms::red_black_binary_search_tree_search::node_inserting_on_tree_adapter;
use algorithms::red_black_binary_search_tree_search::subtree_minimum_value_node_finder;
use algorithms::red_black_binary_search_tree_search::node_deleting_on_tree_adapter;
use algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter;
use algorithms::red_black_binary_search_tree_search::tree_rebalancing_adapter;

sub new {
    my ($class) = @_;

    my $self = {
        root => undef,
    };

    bless $self, $class;

    return $self;
}

sub get_key {
    my ($self, $key) = @_;

    return if !($self->{root}->{value});

    my $node = algorithms::red_black_binary_search_tree_search::node_with_key_on_tree_finder::get_node_with_key($self->{root}, $key);

    return $node if defined $node;
}

sub add_key {
    my ($self, $key, $value) = @_;

    $self->{root} =
        algorithms::red_black_binary_search_tree_search::node_inserting_on_tree_adapter::get_tree_with_new_node_inserted($self->{root}, $key, $value);

    algorithms::red_black_binary_search_tree_search::tree_rebalancing_adapter::rebalance_tree_after_insertion($self, $key);
}

sub delete_key {
    my ($self, $key) = @_;

    $self->{root} =
        algorithms::red_black_binary_search_tree_search::node_deleting_on_tree_adapter::get_tree_with_node_deleted($self->{root}, $key);

    algorithms::red_black_binary_search_tree_search::tree_rebalancing_adapter::rebalance_tree_after_delete($self);
}

our @EXPORT_OK = qw(new get_key add_key delete_key);

1;
