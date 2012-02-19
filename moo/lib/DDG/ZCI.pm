package DDG::ZCI;
use DDG::ZCI::Object;
use Module::Pluggable require => 1;

has goodies => (
    is      => 'ro',
    default => sub {
        [ map { $_->can('new') ? $_->new : $_ } sort shift->plugins ];
    },
);

sub handle {
    my $self = shift;
    my @results = grep { $_ = $_->handle( input @_ ) } @{ $self->goodies };

    # gotta figure out a reduce function
    return shift @results;
}

1;
__END__
