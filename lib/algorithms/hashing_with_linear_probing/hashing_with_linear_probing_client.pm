package algorithms::hashing_with_linear_probing::hashing_with_linear_probing_client;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use constants::lists qw(LIST);
use algorithms::hashing_with_linear_probing::hashing_with_linear_probing;

sub execute {
    my @list = @{+LIST};

    my $set = algorithms::hashing_with_separate_chaining::hashing_with_separate_chaining->new();

    foreach my $value (@list) {
        $set->add_key($value, $value);

        if ($set->get_key($value)) {
            print("Value \"$value\" Added To The Set!\n");
        }
    }

    print("\n");

    foreach my $value (@list) {
        if ($set->get_key($value)) {
            print("Value \"$value\" Is On The Set!\n");
        }
    }

    print("\n");

    foreach my $value (@list) {
        $set->delete_key($value);

        if (!$set->get_key($value)) {
            print("Value \"$value\" Has Been Deleted From The Set!\n");
        }
    }
}

our @EXPORT_OK = qw(execute);

1;
