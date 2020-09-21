#!/usr/bin/perl

use POE;
use POE::Component::IRC;

@channels = ('#lceron');
$irc_name  = 'Local IRC';
$name = 'Bot IRC' . $$;
$server   = '127.0.0.1';

#Bot IRC se conecta al canal lceron
$irc = POE::Component::IRC->spawn(
  nick => $name,
  irc_name => $irc_name,
  server  => $server,
) or die "No se puede conectar al canal IRC";
 
POE::Session->create(
  package_states => [
    main => [ qw(_start irc_001 irc_public) ],
  ],
  heap => { irc => $irc },
);
 
$poe_kernel->run();
 
sub _start {
  my $heap = $_[HEAP];
  my $irc = $heap->{irc};

  $irc->yield( register => 'all' );
  $irc->yield( connect => { } );
  return;
}
 
sub irc_001 {
  my $sender = $_[SENDER];
  my $irc = $sender->get_heap();
 
  print "Conectado a", $irc->server_name(), "\n";

  $irc->yield( join => $_ ) for @channels;
  return;
}
 
sub irc_public {
  my ($sender, $who, $where, $what) = @_[SENDER, ARG0 .. ARG2];
  my $nick = ( split /!/, $who )[0];
  my $channel = $where->[0];

#Solo reacciona ante los mensajes que empiecen con Hola o contengan unam
  if ($what =~ /^Hola/) {
    $irc->yield( privmsg => $channel => "Saludos becario de seguridad informatica\n" );
  } 
  elsif ($what =~ /unam/) {
    $irc->yield( privmsg => $channel => "Soy parte del unam cert\n" );
  }else{
    $irc->yield( privmsg => $channel => "Solo respondo a Hola y unam\n" );
  } 
  return;
}