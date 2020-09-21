#!/usr/bin/perl

use LWP::Simple;

print "Crawler con URL: $ARGV[0]\n";

$request = get ($ARGV[0]); die "No se pudo procesar la url" unless defined $request;

$request =~ s/\"/\'/ig;

while (index($request, "<a href") != -1) {
   $i = index($request, "<a href");
   $tmp = substr($request, $i );
   $val = index($tmp,">");
   $request = substr($request, $i + 1 );
      
   if (index(($tmp,0, $val+1)) != -1){
      $tmp2 = substr($tmp,0, $val+1);
      
      $val1 = index($tmp2,"\'");
      $tmp2 = substr($tmp2,$val1+1);
      
      $val1 = index($tmp2,"\'");
      $tmp2 = substr($tmp2,0,$val1);

      push @urls, $tmp2;  
   }
}

foreach(@urls){
   if ($_ =~ /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/){
      $url = $_,'\n';
      $request = get ($url);
      die "No se pudo procesar la url" unless defined $request;

      $request =~ s/\"/\'/ig;

      while (index($request, "<a href") != -1) {
         $i = index($request, "<a href");
         $tmp = substr($request, $i );
         $request = substr($request, $i + 1 );
         $val = index($tmp,">");
         
         if (index(($tmp,0, $val+1)) != -1){
            $tmp2 = substr($tmp,0, $val+1);
            
            $val1 = index($tmp2,"\'");
            $tmp2 = substr($tmp2,$val1+1);
            
            $val1 = index($tmp2,"\'");
            $tmp2 = substr($tmp2,0,$val1);

            push @{ $direc{$url} }, $tmp2;  
            print "@{ $direc{$url} } \n";
         }
      }
   }
   else{
      push @urls2, $_,"\n";  
   }
}

print @urls2;