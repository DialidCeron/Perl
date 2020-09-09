#!/usr/bin/perl

my $total = $#ARGV + 1;

if ($total > 0){
        for ($i=0; $i<$total; $i++){
                print "$ARGV[$i]: ";
                print $ARGV[$i] eq reverse($ARGV[$i]) ? 'Es Palindromo' : 'No Palindromo', "\n";
        }
}else{
        $entrada = "";
        do{
                $entrada = <STDIN>;
                @pal = split('\n', $entrada);
                print @pal[0] eq reverse(@pal[0]) ? 'Es Palindromo' : 'No Palindromo', "\n";
        }while $entrada ne "ya no\n";
}