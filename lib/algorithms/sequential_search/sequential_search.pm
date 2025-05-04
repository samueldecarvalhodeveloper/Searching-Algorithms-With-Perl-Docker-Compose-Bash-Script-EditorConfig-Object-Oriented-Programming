package algorithms::sequential_search::sequential_search;

use strict;
use warnings FATAL => "all";
use Exporter "import";

sub is_value_on_list {
    my ($value_to_be_searched, @list_to_search_on) = @_;

    for my $current_value_index (0 .. $#list_to_search_on) {
        if ($list_to_search_on[$current_value_index] eq $value_to_be_searched) {
            return 1
        }
    }

    return 0;
}

our @EXPORT_OK = qw(is_value_on_list);

1;
