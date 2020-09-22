#!/usr/bin/perl	
 
use GD::Graph::bars;
use GD::Graph::Data;
 
open FILE, "p2_lceron.txt" or die "Error al abrir archivo\n";

my $linux=0;
my $windows=0;
my $desconocido=0;
my $puertos_conocidos=0;
my $puertos_registrados=0;
my $puertos_generales=0;
my %num_puertos;

@archivo = <FILE>;

print "-" x 50; 
print "\n";
print "Generando graficas del reporte p2_lceron.txt \n";
print "-" x 50; 
print "\n";

@puertos = grep(/^\d{1,5} /, @archivo);

#Realizamos arreglo con puertos abiertos
foreach $puerto (@puertos){
	@spl = split /\s+/,$puerto;
	$num_puertos{$spl[0]}=$spl[1];
	if ($spl[3] eq "bien"){
		$puertos_conocidos++;
	}elsif($spl[3] eq "registrado"){
		$puertos_registrados++;
	}elsif($spl[3] eq "de"){
		$puertos_generales++;
	}
}
@tmp = grep(/Numero de puertos Open|Filtered/,@archivo);
@puertos_open=split /: /,$tmp[0];
$open=$puertos_open[1];

@tmp = grep(/Numero de puertos TCP/,@archivo);
@puertos_tcp=split /: /,$tmp[0];
$tcp=$puertos_tcp[1];

@tmp = grep(/Numero de puertos UDP/,@archivo);
@puertos_udp=split /: /,$tmp[0];
$udp=$puertos_udp[1];

@tmp = grep(/Numero de hosts con SO Linux/,@archivo);
@linuxes=split /: /,$tmp[0];
$linux=$linuxes[1];

@tmp = grep(/Numero de hosts con SO Windows/,@archivo);
@windowses=split /: /,$tmp[0];
$windows=$windowses[1];

@tmp = grep(/Numero de hosts con SO Desconocido/,@archivo);
@desconocidos=split /: /,$tmp[0];
$desconocido=$desconocidos[1];


my $data = GD::Graph::Data->new([
    ["Linux","Windows","Desconocido"],
    [$linux, $windows, $desconocido],
]) or die GD::Graph::Data->error;
 
 
my $graph = GD::Graph::bars->new;
 
$graph->set( 
    x_label         => 'Sistema Operativo',
    y_label         => 'Numero',
    title           => 'Hosts por Sistema Operativo',

) or die $graph->error;
 
$graph->plot($data) or die $graph->error;
 
my $file = 'so.png';
open(my $out, '>', $file) or die "Cannot open '$file' for write: $!";
binmode $out;
print $out $graph->gd->png;
close $out;

my $data = GD::Graph::Data->new([
    ["Abiertos","TCP","UDP"],
    [$open,$tcp, $udp],
]) or die GD::Graph::Data->error;
 
 
my $graph = GD::Graph::bars->new;
 
$graph->set( 
    x_label         => 'Puertos',
    y_label         => 'Numero',
    title           => 'Estadisticas puertos abiertos',

) or die $graph->error;
 
$graph->plot($data) or die $graph->error;
 
my $file = 'puertos_abiertos.png';
open(my $out, '>', $file) or die "Cannot open '$file' for write: $!";
binmode $out;
print $out $graph->gd->png;
close $out;

my $data = GD::Graph::Data->new([
    [keys(%num_puertos)],
    [values(%num_puertos)],
]) or die GD::Graph::Data->error;
 
 
my $graph = GD::Graph::bars->new;
 
$graph->set( 
    x_label         => 'Puerto',
    y_label         => 'Numero de hosts',
    title           => 'Numero de hosts que utilizan cada puerto',

) or die $graph->error;
 
$graph->plot($data) or die $graph->error;
 
my $file = 'puertos.png';
open(my $out, '>', $file) or die "Cannot open '$file' for write: $!";
binmode $out;
print $out $graph->gd->png;
close $out;

print "Graficas generadas\n";
print "puertos.png\n";
print "puertos_abiertos.png\n";
print "so.png\n";