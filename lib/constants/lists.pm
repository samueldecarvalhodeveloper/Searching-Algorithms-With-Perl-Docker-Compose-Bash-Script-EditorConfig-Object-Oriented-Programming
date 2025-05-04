package constants::lists;

use strict;
use warnings FATAL => "all";
use Exporter "import";

use constant LIST => [ "Alice", "Benjamin", "Charlotte", "Daniel", "Eleanor", "Frederick", "Grace", "Henry", "Isabella",
    "Jack", "Katherine", "Liam", "Mia", "Nathan", "Olivia", "Patrick", "Quinn", "Ryan", "Sophia", "Theodore" ];

use constant NOT_EXISTING_VALUE => "Samuel";

use constant INITIAL_TABLE_SIZE => 10;

use constant LIST_KEY_NAME => "LIST_KEY_NAME";

use constant NOT_EXISTING_KEY_NAME => "NOT_EXISTING_KEY_NAME";

use constant NODE_RED_COLOR => "red";

use constant NODE_BLACK_COLOR => "red";

our @EXPORT_OK = qw(LIST NOT_EXISTING_VALUE INITIAL_TABLE_SIZE LIST_KEY_NAME NOT_EXISTING_KEY_NAME NODE_RED_COLOR NODE_BLACK_COLOR);

1;
