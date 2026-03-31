package algorithms::hashing_with_linear_probing::hashing_with_linear_probing_hash_generator;
use strict;
use warnings FATAL => "all";
use Exporter "import";
use constants::lists qw (INITIAL_TABLE_SIZE);

sub get_key_hash_index {
    my ($key) = @_;

    return length($key) % INITIAL_TABLE_SIZE;
}

our @EXPORT_OK = qw(get_key_hash_index);

1;
