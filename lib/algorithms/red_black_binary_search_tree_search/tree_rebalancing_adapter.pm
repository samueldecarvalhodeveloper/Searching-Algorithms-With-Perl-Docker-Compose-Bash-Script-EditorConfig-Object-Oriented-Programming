package algorithms::red_black_binary_search_tree_search::tree_rebalancing_adapter;
use strict;
use warnings FATAL => "all";
use Exporter "import";
use constants::lists qw(NODE_RED_COLOR NODE_BLACK_COLOR);
use algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter;

sub rebalance_tree_after_insertion {
    my ($self, $key) = @_;
    my $inserted_node =
        algorithms::red_black_binary_search_tree_search::node_with_key_on_tree_finder::get_node_with_key($self->{root}, $key);

    return unless defined $inserted_node;

    while (defined $inserted_node->{parent} && $inserted_node->{parent}->{color} eq NODE_RED_COLOR) {
        my $inserted_node_parent = $inserted_node->{parent};

        if (defined $inserted_node_parent->{parent}) {
            my $subtree_root_node = $inserted_node_parent->{parent};

            if (defined $subtree_root_node->{left} && $subtree_root_node->{left} == $inserted_node_parent) {
                if (defined $subtree_root_node->{right} && $subtree_root_node->{right}->{color} eq NODE_RED_COLOR) {
                    $inserted_node_parent->{color} = NODE_BLACK_COLOR;

                    $subtree_root_node->{right}->{color} = NODE_BLACK_COLOR;

                    $subtree_root_node->{color} = NODE_RED_COLOR;

                    $inserted_node = $subtree_root_node;
                }
                else {
                    if ($inserted_node == $inserted_node_parent->{right}) {
                        algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter::rotate_node_left($self, $inserted_node_parent);

                        $inserted_node = $inserted_node_parent;

                        $inserted_node_parent = $inserted_node->{parent};
                    }

                    $inserted_node_parent->{color} = NODE_BLACK_COLOR;

                    $subtree_root_node->{color} = NODE_RED_COLOR;

                    algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter::rotate_node_right($self, $subtree_root_node);
                }

            }
            else {
                if (defined $subtree_root_node->{left} && $subtree_root_node->{left}->{color} eq NODE_RED_COLOR) {
                    $inserted_node_parent->{color} = NODE_BLACK_COLOR;

                    $subtree_root_node->{left}->{color} = NODE_BLACK_COLOR;

                    $subtree_root_node->{color} = NODE_RED_COLOR;

                    $inserted_node = $subtree_root_node;
                }
                else {
                    if ($inserted_node == $inserted_node_parent->{left}) {
                        algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter::rotate_node_right($self, $inserted_node_parent);

                        $inserted_node = $inserted_node_parent;

                        $inserted_node_parent = $inserted_node->{parent};
                    }

                    $inserted_node_parent->{color} = NODE_BLACK_COLOR;

                    $subtree_root_node->{color} = NODE_RED_COLOR;

                    algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter::rotate_node_left($self, $subtree_root_node);
                }
            }
        }
    }

    $self->{root}->{color} = NODE_BLACK_COLOR;
}

sub rebalance_tree_after_delete {
    my ($self) = @_;
    my $deleted_node = $self->{deleted_node};
    my $deleted_node_parent = $deleted_node ? $deleted_node->{parent} : $self->{root};

    while (defined $deleted_node && $deleted_node != $self->{root} && $deleted_node->{color} eq NODE_BLACK_COLOR) {
        if ($deleted_node == $deleted_node_parent->{left}) {
            my $deleted_node_sibling = $deleted_node_parent->{right};

            if (!defined $deleted_node_sibling) {
                $deleted_node_parent->{color} = NODE_BLACK_COLOR;

                $deleted_node = $deleted_node_parent;

                $deleted_node_parent = $deleted_node->{parent};
            }
            elsif ($deleted_node_sibling->{color} eq NODE_RED_COLOR) {
                $deleted_node_sibling->{color} = NODE_BLACK_COLOR;

                $deleted_node_parent->{color} = NODE_RED_COLOR;

                algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter::rotate_node_left($self, $deleted_node_parent);

                $deleted_node_sibling = $deleted_node_parent->{right};
            }
            elsif (
                (!defined $deleted_node_sibling->{left} || $deleted_node_sibling->{left}->{color} eq NODE_BLACK_COLOR) &&
                    (!defined $deleted_node_sibling->{right} || $deleted_node_sibling->{right}->{color} eq NODE_BLACK_COLOR)
            ) {
                $deleted_node_sibling->{color} = NODE_RED_COLOR;

                $deleted_node = $deleted_node_parent;

                $deleted_node_parent = $deleted_node->{parent};
            }
            elsif (!defined $deleted_node_sibling->{right} || $deleted_node_sibling->{right}->{color} eq NODE_BLACK_COLOR) {
                $deleted_node_sibling->{left}->{color} = NODE_BLACK_COLOR;

                $deleted_node_sibling->{color} = NODE_RED_COLOR;

                algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter::rotate_node_right($self, $deleted_node_sibling);

                $deleted_node_sibling = $deleted_node_parent->{right};
            }
            else {
                $deleted_node_sibling->{color} = $deleted_node_parent->{color};

                $deleted_node_parent->{color} = NODE_BLACK_COLOR;

                $deleted_node_sibling->{right}->{color} = NODE_BLACK_COLOR;

                algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter::rotate_node_left($self, $deleted_node_parent);

                $deleted_node = $self->{root};
            }
        }
        else {
            my $deleted_node_sibling = $deleted_node_parent->{left};

            if (!defined $deleted_node_sibling) {
                $deleted_node_parent->{color} = NODE_BLACK_COLOR;

                $deleted_node = $deleted_node_parent;

                $deleted_node_parent = $deleted_node->{parent};
            }
            elsif ($deleted_node_sibling->{color} eq NODE_RED_COLOR) {
                $deleted_node_sibling->{color} = NODE_BLACK_COLOR;

                $deleted_node_parent->{color} = NODE_RED_COLOR;

                algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter::rotate_node_right($self, $deleted_node_parent);

                $deleted_node_sibling = $deleted_node_parent->{left};
            }
            elsif (
                (!defined $deleted_node_sibling->{left} || $deleted_node_sibling->{left}->{color} eq NODE_BLACK_COLOR) &&
                    (!defined $deleted_node_sibling->{right} || $deleted_node_sibling->{right}->{color} eq NODE_BLACK_COLOR)
            ) {
                $deleted_node_sibling->{color} = NODE_RED_COLOR;

                $deleted_node = $deleted_node_parent;

                $deleted_node_parent = $deleted_node->{parent};
            }
            elsif (!defined $deleted_node_sibling->{left} || $deleted_node_sibling->{left}->{color} eq NODE_BLACK_COLOR) {
                $deleted_node_sibling->{right}->{color} = NODE_BLACK_COLOR;

                $deleted_node_sibling->{color} = NODE_RED_COLOR;

                algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter::rotate_node_left($self, $deleted_node_sibling);

                $deleted_node_sibling = $deleted_node_parent->{left};
            }
            else {
                $deleted_node_sibling->{color} = $deleted_node_parent->{color};

                $deleted_node_parent->{color} = NODE_BLACK_COLOR;

                $deleted_node_sibling->{left}->{color} = NODE_BLACK_COLOR;

                algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter::rotate_node_right($self, $deleted_node_parent);

                $deleted_node = $self->{root};
            }
        }
    }

    if (defined $deleted_node) {
        $deleted_node->{color} = NODE_BLACK_COLOR;
    }

    $self->{root}->{color} = NODE_BLACK_COLOR;
}

our @EXPORT_OK = qw(rebalance_tree_after_insertion rebalance_tree_after_delete);

1;
