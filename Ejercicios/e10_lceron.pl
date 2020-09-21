#!/usr/bin/perl

open FILE, "</etc/passwd" or die "No se pudo abrir el archivo passwd";

@passwd = <FILE>; 

foreach $linea (@passwd){
	$name = (split /:/, $linea)[0];
	$user_id = (split /:/, $linea)[2];
	$group_id = (split /:/, $linea)[3];
	$home = (split /:/, $linea)[-2];
	$shell = (split /:/, $linea)[-1];
	if ($shell =~ "\/bin\/bash"){
		print "Nombre: ".$name;
		print " Id de usuario: ".$user_id;
		print " Id de grupo: ".$group_id;
		print " Home: ".$home;
		print " Interprete de comandos: ".$shell;
		print "\n";		
	}
}
