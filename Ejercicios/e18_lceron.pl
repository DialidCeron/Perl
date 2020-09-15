use Crypt::OpenSSL::AES;

open FILE, "<:raw", $ARGV[0] or die "No se pudo leer el archivo";
open ENC, ">encrypted" or die "No se pudo generar el archivo";
open DES, ">decrypted" or die "No se pudo generar el archivo";

$key = "AAAAAAAAAAAAAAAA";
my $cipher = new Crypt::OpenSSL::AES($key);
my $bytes_read = 0;
while (($bytes_read=read FILE, my $bytes, 16) > 0){
	if ($bytes_read ==16 ){
		print ENC $cipher->encrypt($bytes);
	}else{
		$bytes .=" "x(16-$bytes_read);
		print ENC $cipher->encrypt($bytes);
	}
}
close FILE;
close ENC;
#$archivo = <FILE>;
open FILEENC, "<:raw", "encrypted" or die "No se pudo leer el archivo";
$bytes_read=0;

while (($bytes_read=read FILEENC, my $bytes, 16) > 0){
	print DES $cipher->decrypt($bytes);
}
close FILEENC;
close DES;