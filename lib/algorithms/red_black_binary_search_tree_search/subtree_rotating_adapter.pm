package algorithms::red_black_binary_search_tree_search::subtree_rotating_adapter;
use strict;
use warnings FATAL => "all";
use Exporter "import";

sub rotate_node_left {
    my ($self, $node) = @_;

    my $node_sibling = $node->{right};

    $node->{right} = $node_sibling->{left};

    if (defined $node_sibling->{left}) {
        $node_sibling->{left}->{parent} = $node;
    }

    $node_sibling->{parent} = $node->{parent};

    if (!defined $node->{parent}) {
        $self->{root} = $node_sibling;
    }
    elsif ($node == $node->{parent}->{left}) {
        $node->{parent}->{left} = $node_sibling;
    }
    else {
        $node->{parent}->{right} = $node_sibling;
    }

    $node_sibling->{left} = $node;

    $node->{parent} = $node_sibling;
}

sub rotate_node_right {
    my ($self, $node_sibling) = @_;
    my $node = $node_sibling->{left};

    $node_sibling->{left} = $node->{right};

    if (defined $node->{right}) {
        $node->{right}->{parent} = $node_sibling;
    }

    $node->{parent} = $node_sibling->{parent};

    if (!defined $node_sibling->{parent}) {
        $self->{root} = $node;
    }
    elsif ($node_sibling == $node_sibling->{parent}->{left}) {
        $node_sibling->{parent}->{left} = $node;
    }
    else {
        $node_sibling->{parent}->{right} = $node;
    }

    $node->{right} = $node_sibling;

    $node_sibling->{parent} = $node;
}

our @EXPORT_OK = qw(rotate_node_left rotate_node_right);

1;
