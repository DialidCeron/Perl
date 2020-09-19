#!/usr/bin/perl	

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
print %num_puertos;
print $puertos_conocidos;