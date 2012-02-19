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
    my $self    = shift;
    my $input   = input(@_);
    my @plugins = grep { $_->match($input) } @{ $self->goodies };
    my @results = grep { $_ = $_->handle($input) } @plugins;
    return shift @results;    # gotta figure out a reduce function
}

1;
__END__
