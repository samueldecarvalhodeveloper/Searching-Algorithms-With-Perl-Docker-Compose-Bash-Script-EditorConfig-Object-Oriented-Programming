package algorithms::hashing_with_linear_probing::hashing_with_linear_probing;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use constants::lists qw(INITIAL_TABLE_SIZE);
use algorithms::hashing_with_linear_probing::hashing_with_linear_probing_node;
use algorithms::hashing_with_linear_probing::hashing_with_linear_probing_hash_generator;
use algorithms::hashing_with_linear_probing::empty_index_on_hash_list_finder;
use algorithms::hashing_with_linear_probing::key_index_finder;

my @list_of_hashes = (undef) x INITIAL_TABLE_SIZE;

sub new {
    my ($class) = @_;

    my $self = {};

    bless $self, $class;

    return $self;
}

sub get_key {
    my ($key) = @_;

    my $index = algorithms::hashing_with_linear_probing::key_index_finder::get_key_index($key);

    return undef unless defined $index;

    return $list_of_hashes[$index]->{value};
}

sub add_key {
    my ($key, $value) = @_;

    my $index =
        algorithms::hashing_with_linear_probing::empty_index_on_hash_list_finder::get_key_empty_index($key, @list_of_hashes);

    return unless (defined $index);

    $list_of_hashes[$index] =
        algorithms::hashing_with_linear_probing::hashing_with_linear_probing_node->new($key, $value);
}

sub delete_key {
    my ($key) = @_;

    my $index = algorithms::hashing_with_linear_probing::key_index_finder::get_key_index($key);

    return unless defined $index;

    $list_of_hashes[$index] = undef;
}

our @EXPORT_OK = qw(new get_key add_key delete_key);

1;
