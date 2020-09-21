#!/usr/bin/perl
#########################################################
# Modo de ejecucion: ./p7_lceron.pl texto_a_cifrar llave#
#########################################################

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