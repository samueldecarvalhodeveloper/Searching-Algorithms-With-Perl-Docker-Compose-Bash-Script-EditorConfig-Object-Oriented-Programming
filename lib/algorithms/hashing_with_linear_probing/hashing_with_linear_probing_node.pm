package algorithms::hashing_with_linear_probing::hashing_with_linear_probing_node;

use strict;
use warnings FATAL => "all";
use Exporter "import";

sub new {
    my ($class, $key, $value) = @_;

    my $self = {
        key => $key,
        value => $value
    };

    bless $self, $class;

    return $self;
}

our @EXPORT_OK = qw(new);

1;
