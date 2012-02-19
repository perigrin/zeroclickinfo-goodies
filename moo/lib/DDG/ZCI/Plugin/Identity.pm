package DDG::ZCI::Plugin::Identity;
use DDG::ZCI::Plugin;

sub handle {
    my ( $self, $input ) = @_;
    return output(
        answer_results => $input->query,
        answer_type    => 'moo:identity'
    );
}

1;
__END__
