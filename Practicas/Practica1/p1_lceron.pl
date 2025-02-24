#!/usr/bin/perl
#Para generar reportes con mayor velocidad reducir el numero de puertos
#Ej. -p 1-1023
use Nmap::Parser;
open FIILE, ">p1_lceron.txt" or die "Error al abrir archivo\n";
print FIILE "-" x 50; 
print FIILE "\n";
print FIILE "Escaneo a la red: $ARGV[0] \n";
print FIILE "-" x 50; 
print FIILE "\n";

print "-" x 50; 
print "\n";
print "Escaneo a la red: $ARGV[0] \n";
print "Esto puede tomar varios minutos, por favor espere...\n";
print "-" x 50; 
print "\n";

my $np = new Nmap::Parser;
my @hosts = @ARGV; #get hosts from cmd line
my $num_ports = 0; 
#runs the nmap command with hosts and parses it automagically
$np->parsescan('/usr/bin/nmap','-sV -p-',@hosts);
 
for my $host ($np->all_hosts()){
       print "Host:";
       print $host->addr."\n";
       print FIILE "Host:\n";
       print FIILE $host->addr."\n";
       print "PUERTO PROTOCOLO ESTADO      SERVICIO     VERSION\n";
       print FIILE "PUERTO  PROTOCOLO ESTADO      SERVICIO     VERSION\n";
       for $port ($host->tcp_ports('open')){
                     $num_ports++;
                     print "$port        tcp          open       ";
                     print FIILE "$port        tcp          open       ";
                     $svc = $host->tcp_service($port);
                     print $svc->name;
                     print FIILE $svc->name;
                     print "          ";
                     print $svc->version;
                     print "\n";   
                     print FIILE "          ";
                     print FIILE $svc->version;
                     print FIILE "\n";    
       }
       for $port ($host->udp_ports('open')){
                     $num_ports++;
                     print "$port        udp          open       ";
                     print FIILE "$port        udp          open       ";
                     $svc = $host->udp_service($port);
                     print $svc->name;
                     print FIILE $svc->name;
                     print "          ";
                     print $svc->version;
                     print "\n";   
                     print FIILE "          ";
                     print FIILE $svc->version;
                     print FIILE "\n";    
       }
       print "\nNumero de puertos activos por hosts: $num_ports\n";
       print FIILE "\nNumero de puertos activos por hosts: $num_ports\n";
       $num_ports=0;
}
print "Se escribieron las estadisticas en el archivo: p1_lceron.txt\n";
close FIILE;