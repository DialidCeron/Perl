#!/usr/bin/perl
#CALCULADORA

$operadores = "";
@historial = (); 
do{
print "Bienvenido a calculadora\n";
print "Ingrese el numero de alguna de las siguientes opciones:\n";
print "1. Suma\n";
print "2. Resta\n";
print "3. Multiplicacion\n";
print "4. Division\n";
print "5. Historial de operaciones\n";
print "6. Salir\n";
$opcion = <STDIN>;
        if ($opcion eq "1\n"){
                print "Ingresa la suma: Ejemplo 3+1\n";
                $operadores = <STDIN>;
                @ops = split('\+', $operadores); 
                $rst = @ops[0] + @ops[1];
                print("Resultado: $rst\n");
                push(@historial, $operadores);
        }elsif ($opcion eq "2\n"){
                print "Ingresa la resta: Ejemplo 5-1\n";
                $operadores = <STDIN>;
                @ops = split('\-', $operadores);
                $rst = @ops[0] - @ops[1];
                print("Resultado: $rst\n");
                push(@historial, $operadores);
        }elsif ($opcion eq "3\n"){
                print "Ingresa la multiplicacion: Ejemplo 3*1\n";
                $operadores = <STDIN>;
                @ops = split('\*', $operadores);
                $rst = @ops[0] * @ops[1];
                print("Resultado: $rst\n");
                push(@historial, $operadores);
        }elsif ($opcion eq "4\n"){
                print "Ingresa la division: Ejemplo 4/2\n";
                $operadores = <STDIN>;
                @ops = split('\/', $operadores);
                $rst = @ops[0] / @ops[1];
                print("Resultado: $rst\n");
                push(@historial, $operadores);
        }elsif ($opcion eq "5\n"){
                print"Historial de operaciones:\n";
                print "@historial";
        }
} while $opcion ne "6\n";
