package algorithms::b_tree_set::b_tree_set;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use algorithms::b_tree_set::b_tree_set_node;
use algorithms::b_tree_set::node_with_key_finder;
use algorithms::b_tree_set::subtree_minimum_value_node_finder;
use algorithms::b_tree_set::node_on_tree_inserter;

sub new {
    my ($class) = @_;

    my $self = {
        root => undef
    };

    bless $self, $class;

    return $self;
}

sub get_key {
    my ($self, $key) = @_;

    return algorithms::b_tree_set::node_with_key_finder::get_node_with_key($self->{root}, $key);
}

sub add_key {
    my ($self, $key, $value) = @_;

    $self->{root} =
        algorithms::b_tree_set::node_on_tree_inserter::get_tree_with_new_key_inserted($self->{root}, $key, $value);
}

sub delete_key {
    my ($self, $key) = @_;

    $self->{root} = get_tree_with_key_deleted($self->{root}, $key);
}

sub get_tree_with_key_deleted {
    my ($current_root_node, $key) = @_;

    return undef unless defined $current_root_node;

    if ($key lt $current_root_node->{key}) {
        $current_root_node->{left} = get_tree_with_key_deleted($current_root_node->{left}, $key);
    }
    elsif ($key gt $current_root_node->{key}) {
        $current_root_node->{right} = get_tree_with_key_deleted($current_root_node->{right}, $key);
    }
    else {
        if (!defined $current_root_node->{left}) {
            return $current_root_node->{right};
        }
        elsif (!defined $current_root_node->{right}) {
            return $current_root_node->{left};
        }
        else {
            my $min_right_node =
                algorithms::b_tree_set::subtree_minimum_value_node_finder::get_subtree_minimum_value_node($current_root_node->{right});

            $current_root_node->{key} = $min_right_node->{key};
            $current_root_node->{value} = $min_right_node->{value};

            $current_root_node->{right} = get_tree_with_key_deleted($current_root_node->{right}, $min_right_node->{key});
        }
    }

    return $current_root_node;
}

1;
