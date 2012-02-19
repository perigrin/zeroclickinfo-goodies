package DDG::ZCI::Plugin::Identity;
use DDG::ZCI::Sugar;

sub match {
        my ($self, $input) = @_;
        return if $input->type;
        return 1;
}

sub handle {
    my ( $self, $input ) = @_;
    return output(
        answer_results => $input->query,
        answer_type    => 'moo:identity'
    );
}

1;
__END__
