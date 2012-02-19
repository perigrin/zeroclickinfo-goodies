package DDG::ZCI::Input;
use Moo;

has query          => ( is => 'ro', required => 1 );
has query_check    => ( is => 'ro', required => 1 );
has query_check_lc => ( is => 'ro', required => 1 );
has query_internal => ( is => 'ro', required => 1 );
has type           => ( is => 'ro', required => 1 );

