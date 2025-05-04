package algorithms::sequential_search::sequential_search_client;

use strict;
use warnings FATAL => "all";
use Exporter "import";
use constants::lists qw(LIST NOT_EXISTING_VALUE);
use algorithms::sequential_search::sequential_search qw(is_value_on_list);

sub execute {
    my @list = @{+LIST};

    if (is_value_on_list($list[0], @list)) {
        print("Value \"$list[0]\" Is In The List!\n")
    }
    else {
        print("Value \"$list[0]\" Is Not In The List!\n")
    }

    print("\n");

    if (is_value_on_list(NOT_EXISTING_VALUE, @list)) {
        print("Value \"" . NOT_EXISTING_VALUE . "\" Is In The List!\n")
    }
    else {
        print("Value \"" . NOT_EXISTING_VALUE . "\" Is Not In The List!\n")
    }
}

our @EXPORT_OK = qw(execute);

1;
