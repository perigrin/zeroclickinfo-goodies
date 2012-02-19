package DDG::ZCI::Plugin::Passphrase;
use DDG::ZCI::Object;

has words => (
    is      => 'ro',
    default => sub {
        open my $in, '<', 'passphrase/goodie.txt';
        [ map { chomp($_); $_ } <$in> ];
    }
);

sub handle {
    my ( $self, $input ) = @_;
    return if $input->type eq 'E';
    return
        unless $input->query_check_lc
            =~ m/^passphrase ([1-9]+)(?: word| words|)$/i;

    my $word_count = $1;
    my $answer_results;
    for ( 0 .. $word_count ) {
        my @words = @{ $self->words };
        my $word = splice @words, int( rand @words ), 1;
        $answer_results .= "$word ";
    }
    chop $answer_results;

    $input->{type} = 'E';

    return output(
        answer_results => qq[random passphrase: $answer_results],
        answer_type    => 'passphrase',
        is_memcached   => 0,
    );
}

1;
__END__
