package TestApp::Controller::Root;
use strict;
use warnings;

__PACKAGE__->config(namespace => q{});

use base 'Catalyst::Controller';

# your actions replace this one
sub main :Path { $_[1]->res->body('<h1>It works</h1>') }

sub increment :Local {
    my ($self, $c) = @_;
    my $count = ++$c->session->{counter};
    
    $c->res->body("count is now $count");
}

sub session :Local {
    my ($self, $c) = @_;
    use YAML;
    $c->res->body(YAML::Dump($c->session));
}

1;
