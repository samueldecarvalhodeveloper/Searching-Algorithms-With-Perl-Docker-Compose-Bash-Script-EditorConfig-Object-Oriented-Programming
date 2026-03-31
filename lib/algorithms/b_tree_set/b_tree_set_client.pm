package algorithms::b_tree_set::b_tree_set_client;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use constants::lists qw(LIST);
use algorithms::b_tree_set::b_tree_set;

sub execute {
    my @list = @{+LIST};

    my $set = algorithms::b_tree_set::b_tree_set->new();

    foreach my $value (@list) {
        # Pass both key and value to add_key
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
