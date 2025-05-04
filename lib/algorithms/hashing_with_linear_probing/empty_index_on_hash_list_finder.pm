package algorithms::hashing_with_linear_probing::empty_index_on_hash_list_finder;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use algorithms::hashing_with_linear_probing::hashing_with_linear_probing_hash_generator;
use constants::lists qw (INITIAL_TABLE_SIZE);

sub get_key_empty_index {
    my ($key, @list_of_hashes) = @_;

    my $key_initial_index_on_list_of_hashes =
        algorithms::hashing_with_linear_probing::hashing_with_linear_probing_hash_generator::get_key_hash_index($key);
    my $key_final_index_on_list_of_hashes = $key_initial_index_on_list_of_hashes;

    do {
        return unless (defined $list_of_hashes[$key_final_index_on_list_of_hashes]);

        $key_final_index_on_list_of_hashes = ($key_final_index_on_list_of_hashes + 1) % INITIAL_TABLE_SIZE;
    } while ($key_final_index_on_list_of_hashes != $key_initial_index_on_list_of_hashes);

    return undef;
}

our @EXPORT_OK = qw(get_key_empty_index);

1;
