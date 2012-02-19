package DDG::ZCI::Plugin::ABC;
use DDG::ZCI::Plugin;

sub handle {
    my ( $class, $input ) = @_;
    return if $input->type;
    return unless $input->query_internal =~ m/\s+or\s+/oi;
    return unless $input->query_check    =~ m/\s+or\s+/oi;

    my @choices = split /\s+or\s+/, $input->query_check;

    if ( my @duck = grep { m/^duck/ or $_ eq 'ddg' } @choices ) {
        return output(
            answer_results => "$duck[0] (not random)",
            answer_type    => 'moo:egg',
            is_memcached   => 1,
        );

    }

    my $choice = int rand @choices;
    return output(
        answer_results => "$choices[$choice] (random)",
        answer_type    => 'moo:egg',
        is_memcached   => 1,
    );

}

1;
__END__
