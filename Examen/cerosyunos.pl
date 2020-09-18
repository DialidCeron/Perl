#!/usr/bin/perl	

open FILE, "data.dat" or die "Error al abrir archivo\n";

@archivo = <FILE>;
my $count=0;

foreach $linea (@archivo){
	print "$linea ";
	my $ceros = $linea =~ tr/0//;
	my $unos = $linea =~ tr/1//;
	if ($ceros%3==0 || $unos%2==00){
		$count++;
		print "si";
	}
	print "$ceros $unos \n";
}

print $count;