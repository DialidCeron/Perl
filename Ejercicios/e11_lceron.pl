#!/usr/bin/perl
open(MAILS, "$ARGV[0]")
        or die "[!] Failed to open: $ARGV[0]";

my @mails=<MAILS>;
my %dicc;
print "Correos electronicos validos en el archivo: $ARGV[0]\n";
foreach(@mails){
	if($_=~ /[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+/){
		@tmp=split "@", $_;
		$dicc{$tmp[1]}.=$_;
	}
}
print "Correos electronicos agrupados por dominio:\n";
print values(%dicc);		
