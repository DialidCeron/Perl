#!/usr/bin/perl

print "Programa que lee de entrada estandar, para salir escriba salir\n";
$entrada = "";
do{
        $entrada = <STDIN>;
}while $entrada ne "salir\n";