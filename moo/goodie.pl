use lib qw(moo/lib);

use DDG::Goodies;
use DDG::Goodies::Input;
my $duck = DDG::Goodies->new();

my $output = $duck->handle(
    DDG::Goodies::Input->new(
        type           => $type,
        query          => $q,
        query_internal => $q_internal,
        query_check    => $q_check,
        query_check_lc => $q_check_lc,
    )
);

$answer_results = $output->answer_results;
$answer_type    = $output->answer_type;
$is_memcached   = $output->is_memcached;
