#!/usr/bin/perl -w
# Filename : client.pl

use Socket;

# initialize host and port
my $host = shift || 'localhost';
my $port = shift || 9733;
my $server = "164.90.148.203";  # Host IP running the server

# create the socket, connect to the port
socket(SOCKET,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2])
   or die "Can't create a socket $!\n";
connect( SOCKET, pack_sockaddr_in($port, inet_aton($server)))
   or die "Can't connect to port $port! \n";

my $line;
while ($line = <SOCKET>) {
   print "$line\n";
   @spl = split /\s+/,$line;
   if ($spl[1] eq "+"){
   $res = $spl[0] + $spl[2];
   }elsif ($spl[1] eq "-"){
   $res = $spl[0] - $spl[2];
   }elsif ($spl[1] eq "*"){
   $res = $spl[0] * $spl[2];
   }
   send(SOCKET, $res , 0);
}

print $res;
close SOCKET or die "close: $!";