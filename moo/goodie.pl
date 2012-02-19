use lib qw(moo/lib);

use DDG::ZCI;
use DDG::ZCI::Input;
my $duck = DDG::ZCI->new();

my $output = $duck->handle(
    {   type           => $type,
        query          => $q,
        query_internal => $q_internal,
        query_check    => $q_check,
        query_check_lc => $q_check_lc,
    }
);

$answer_results = $output->answer_results;
$answer_type    = $output->answer_type;
$is_memcached   = $output->is_memcached;
