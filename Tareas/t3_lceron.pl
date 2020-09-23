#!/usr/bin/perl
#Programa que dibuja un medio rombo segun el numero que le proporcione el usuario

print("Ingrese el numero de asteriscos: ");
$entrada=<STDIN>;
$mitad=$entrada/2;

for($i=0; $i<$mitad; $i++){
	print(" "x$mitad);
	print("*"x$i);
	print("\n");
}
print("*"x$entrada);
print("\n");
for($i=1; $i<$mitad; $i++){
	$entrada=$entrada-2;
	print(" "x$i);
	print("*"x$entrada);
	print("\n");
}
