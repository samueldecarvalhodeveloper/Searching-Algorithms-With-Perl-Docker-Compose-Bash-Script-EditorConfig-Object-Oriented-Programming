package algorithms::binary_tree_search::binary_tree_search;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use algorithms::binary_tree_search::node_adding_adapter;
use algorithms::binary_tree_search::node_searcher;
use algorithms::binary_tree_search::subtree_minimum_value_node_finder;
use algorithms::binary_tree_search::node_deleting_adapter;

sub new {
    my ($class) = @_;

    my $self = {
        root => undef,
    };

    bless $self, $class;

    return $self;
}

sub add_key {
    my ($self, $key, $value) = @_;

    $self->{root} =
        algorithms::binary_tree_search::node_adding_adapter::get_root_with_node_added($self->{root}, $key, $value);
}

sub get_key {
    my ($self, $key) = @_;

    return algorithms::binary_tree_search::node_searcher::get_node_with_key($self->{root}, $key);
}

sub delete_key {
    my ($self, $key) = @_;

    $self->{root} = algorithms::binary_tree_search::node_deleting_adapter::get_root_with_node_deleted($self->{root}, $key);
}

our @EXPORT_OK = qw(new get_key add_key delete_key);

1;
