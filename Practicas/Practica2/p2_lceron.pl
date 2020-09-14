#!/usr/bin/perl	

$conocidos=0;
$registrados=0;
$generales=0;
$num_ports=0;
$tcp_ports=0;
$udp_ports=0;
$linux=0;
$windows=0;
$desconocido=0;

open FILE, "p1_lceron.txt" or die "Error al abrir archivo\n";
open FIILE, ">p2_lceron.txt" or die "Error al abrir archivo\n";
@archivo = <FILE>;

print "-" x 50; 
print "\n";
print "Generando estadisticas del reporte p1_lceron.txt \n";
print "-" x 50; 
print "\n";

print FIILE "-" x 50; 
print FIILE "\n";
print FIILE "Estadisticas del reporte p1_lceron.txt \n";
print FIILE "-" x 50; 
print FIILE "\n";

@ips = grep(/\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}\n/, @archivo);
@lineas = grep(/^\d{1,5} /, @archivo);

#Realizamos arreglo con puertos abiertos
foreach $linea (@lineas){
	@spl = split /\s+/,$linea;
	push @ports, @spl[0];
	if (rindex($linea, "tcp")!=-1){
		$tcp_ports++;
	}
	if (rindex($linea, "udp")!=-1){
		$udp_ports++;
	}
}
#Contamos cuantos host usan cada puerto
my %count;
$count{$_}++ foreach @ports;
print "Numero de host que utilizan cada puerto detectado: \n";
print "\nPUERTO   HOSTS\n";
print FIILE "\nNumero de host que utilizan cada puerto detectado: \n";
print FIILE "PUERTO   HOSTS\n";
while (my ($key, $value) = each(%count)) {
    print "$key       $value";
    print FIILE "$key       $value";
    if ($key>=0 && $key<=1023){
    	print "   Puerto bien conocido\n";
    	print FIILE"   Puerto bien conocido\n";
    	$conocidos++;
    }
    elsif ($key>=1024 && $key<=49151){
    	print "   Puerto registrado\n";
    	print FIILE "   Puerto registrado\n";
    	$registrados++;
    }	
 	elsif ($key>=49152 && $key<=65535){
    	print "   Puerto de proposito general\n";
    	print FIILE "   Puerto de proposito general\n";
    	$generales++;
    }
}

print "\nNumero de puertos bien conocidos: $conocidos\n";
print "Numero de puertos registrados: $registrados\n";
print "Numero de puertos de proposito general: $generales\n";

print FIILE "\nNumero de puertos bien conocidos: $conocidos\n";
print FIILE "Numero de puertos registrados: $registrados\n";
print FIILE "Numero de puertos de proposito general: $generales\n";

$num_ports=@ports;
print "\nNumero de puertos Open|Filtered: $num_ports\n";
print FIILE "\nNumero de puertos Open|Filtered: $num_ports\n";

print "\nNumero de puertos TCP: $tcp_ports\n";
print "\nNumero de puertos UDP: $udp_ports\n\n";
print FIILE "\nNumero de puertos TCP: $tcp_ports\n";
print FIILE "\nNumero de puertos UDP: $udp_ports\n\n";
	
foreach $ip (@ips){
	print "Host: $ip";
	print FIILE "Host: $ip";
	$cad=`ping -c1 $ip`;
	@ttl = split(" ", $cad);
	@num=split("=", $ttl[12]);
	if(($num[1]>=0 && $num[1]<=64)||($num[1]>128 && $num[1]<=255)){
		print "Sistema operativo: Linux\n";
		print FIILE "Sistema operativo: Linux\n";
		$linux++;
	}elsif($num[1]>64 && $num[1]<=128){
		print "Sistema operativo: Windows\n";
		print FIILE "Sistema operativo: Windows\n";
		$windows++;
	}else{
		print "Sistema operativo: Desconocido\n";
		print FIILE "Sistema operativo: Desconocido\n";
		$desconocido++;
	} 
}
print "\nNumero de hosts con SO Linux: $linux\n";
print "Numero de hosts con SO Windows: $windows\n";
print "Numero de hosts con SO Desconocido: $desconocido\n";
print FIILE "\nNumero de hosts con SO Linux: $linux\n";
print FIILE "Numero de hosts con SO Windows $windows\n";
print FIILE "Numero de hosts con SO Desconocido: $desconocido\n";

print "-" x 50; 
print "\n";
print "Estadisticas guardadas en archivo p2_lceron.txt \n";
print "-" x 50; 
print "\n";
#print "@archivo";
close FIILE;