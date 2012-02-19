package DDG::Goodies::Plugin::Identity;
use Moo;

sub handle {
    my ( $self, $input ) = @_;
    return DDG::Goodies::Output->new( answer_results => $input->query, answer_type => 'moo:identity' );
}

1;
__END__
