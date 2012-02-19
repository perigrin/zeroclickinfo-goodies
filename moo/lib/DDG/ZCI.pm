package DDG::ZCI;
use DDG::ZCI::Object;
use Module::Pluggable require => 1;

has goodies => (
    is      => 'ro',
    default => sub { [ sort shift->plugins ] },
);

sub handle {
    my $self = shift;
    my @results = grep { $_ } map { $_->handle( input @_ ) } @{ $self->goodies };
    return shift @results;
}

1;
__END__
