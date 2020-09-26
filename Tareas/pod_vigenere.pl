#!/usr/bin/perl
#########################################################
# Modo de ejecucion: ./pod_vigenere.pl texto_a_cifrar llave#
#########################################################

=encoding utf-8

=head1 Nombre

Implementacion del cifrado Vigenere

=head1 Descripcion

Este script permite cifrar y descifrar texto utilizando cifrado Vigenere. 

=head1 Funciones

=cut
#######################################
#		Funciones principales
#######################################

=pod

=over

=item generateKey()

Esta fucion permite obtener la llave completa con la que 
se cifrara el texto, es decir, la llave recibida como argumento
repetida n veces dependiendo de la longitud del texto a cifrar.
Parametros: texto_a_cifrar, llave
Regresa: llave para cifrado

=cut
sub generateKey{
	$string=$_[0];
	$key=$_[1];
	if(length($string)==length($key)){
		return $key;
		}
	else{
		$sub=length($string)-length($key);
		for($i=0; $i<$sub; $i++){
			$key=$key.substr($key, $i, 1);
		}
		return $key;
	}_
}
=item cipherText()

Esta funcion permite obtener el texto cifrado utilizando Vigenere
Parametros:texto_a_cifrar, key
Regresa:texto_cifrado

=cut
sub cipherText{
	$string=$_[0];
	$key=$_[1];
	for($i=0; $i<length($string); $i++){
		$x = (ord(substr($string, $i, 1)) + ord(substr($key, $i, 1))) % 26;
		$x+=ord('A');
		push @cipher_text,chr($x);
	}
	return @cipher_text;
}
=item cipherText()

Esta funcion permite obtener el texto descifrado utilizando Vigenere
Parametros:texto_a_descifrar, key
Regresa:texto_descifrado

=cut
sub descipherText{
	$string=$_[0];
	$key=$_[1];
	for($i=0; $i<length($string); $i++){
		$x = (ord(substr($string, $i, 1)) - ord(substr($key, $i, 1))+26) % 26;
		$x+=ord('A');
		push @plain_text,chr($x);
	}
	return @plain_text;
}
#######################################
# Funcion principal
#######################################
$texto=$ARGV[0];
$key=$ARGV[1];

$key_gen=generateKey("$texto", "$key");
#print $key;
@cipher_text=cipherText($texto, $key_gen);
$cipher_text = join '', @cipher_text;
print "Texto cifrado: $cipher_text \n";
@plain_text=descipherText($cipher_text, $key_gen);
print "Texto descifrado: ";
print @plain_text;
print "\n";

=pod
=head Autor
Lezly Dialid Ceron Rodriguez
=cut