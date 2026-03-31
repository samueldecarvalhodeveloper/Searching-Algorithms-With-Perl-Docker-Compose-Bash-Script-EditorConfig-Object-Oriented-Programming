package algorithms::binary_search::binary_search;

use strict;
use warnings FATAL => "all";
use Exporter "import";

sub is_value_on_list {
    my ($value_to_be_searched, @list_to_search_on) = @_;

    my ($list_lowest_index, $list_highest_index) = (0, $#list_to_search_on);

    while ($list_lowest_index <= $list_highest_index) {
        my $list_middle_index = int(($list_lowest_index + $list_highest_index) / 2);

        if ($list_to_search_on[$list_middle_index] == $value_to_be_searched) {
            return 1;
        }
        elsif ($list_to_search_on[$list_middle_index] < $value_to_be_searched) {
            $list_lowest_index = $list_middle_index + 1;
        }
        else {
            $list_highest_index = $list_middle_index - 1;
        }
    }

    return 0;
}

our @EXPORT_OK = qw(is_value_on_list);

1;
