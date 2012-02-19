package DDG::ZCI::Output;
use Moo;

has answer_results => ( is => 'rw' );
has answer_type    => ( is => 'rw' );
has is_memcached   => ( is => 'rw' );

1;
__END__
