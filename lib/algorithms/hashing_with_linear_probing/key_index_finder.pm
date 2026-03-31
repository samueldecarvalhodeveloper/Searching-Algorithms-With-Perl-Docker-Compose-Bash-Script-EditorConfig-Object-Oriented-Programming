package algorithms::hashing_with_linear_probing::key_index_finder;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use algorithms::hashing_with_linear_probing::hashing_with_linear_probing_hash_generator;
use constants::lists qw(INITIAL_TABLE_SIZE);

sub get_key_index {
    my ($key, @list_of_hashes) = @_;

    my $key_initial_index_on_list_of_hashes =
        algorithms::hashing_with_linear_probing::hashing_with_linear_probing_hash_generator::get_key_hash_index($key);
    my $key_index_on_list_of_hashes = $key_initial_index_on_list_of_hashes;

    do {
        return $key_index_on_list_of_hashes
            if (
                defined $list_of_hashes[$key_index_on_list_of_hashes] &&
                    $list_of_hashes[$key_index_on_list_of_hashes]->{key} eq $key
            );

        $key_index_on_list_of_hashes = ($key_index_on_list_of_hashes + 1) % INITIAL_TABLE_SIZE;
    } while ($key_index_on_list_of_hashes != $key_initial_index_on_list_of_hashes);
}

our @EXPORT_OK = qw(get_key_index);

1;
