package algorithms::hashing_with_separate_chaining::hashing_with_separate_chaining;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use constants::lists qw(INITIAL_TABLE_SIZE);
use algorithms::hashing_with_separate_chaining::hashing_with_separate_chaining_node;
use algorithms::hashing_with_separate_chaining::hashing_with_separate_chaining_hash_generator;

my @list_of_hashes = map {[]} 1 .. INITIAL_TABLE_SIZE;

sub new {
    my ($class) = @_;

    my $self = {
    };

    bless $self, $class;

    return $self;
}

sub get_key {
    my ($key) = @_;

    my $hash_key_index_on_set =
        algorithms::hashing_with_separate_chaining::hashing_with_separate_chaining_hash_generator::get_key_hash_index($key);

    for my $pair (@{$list_of_hashes[$hash_key_index_on_set]}) {
        return $pair->{value} if $pair->{key} eq $key;
    }
}

sub add_key {
    my ($key, $value) = @_;

    my $hash_key_index_on_set =
        algorithms::hashing_with_separate_chaining::hashing_with_separate_chaining_hash_generator::get_key_hash_index($key);

    push(
        @{$list_of_hashes[$hash_key_index_on_set]},
        algorithms::hashing_with_separate_chaining::hashing_with_separate_chaining_node->new($key, $value)
    );
}

sub delete_key {
    my ($key) = @_;

    my $hash_key_index_on_set =
        algorithms::hashing_with_separate_chaining::hashing_with_separate_chaining_hash_generator::get_key_hash_index($key);

    @{$list_of_hashes[$hash_key_index_on_set]} =
        grep({$_->{key} ne $key} @{$list_of_hashes[$hash_key_index_on_set]});
}

our @EXPORT_OK = qw(new get_key add_key delete_key);

1;
