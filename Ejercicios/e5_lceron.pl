use LWP::Simple;

open(URLLIST, "feed.txt")
        or die "[!] Failed to open: feed.txt";
open(ACTIVE, ">active_sites.txt")
        or die "[!] Failed to open: active_sites.txt"; 

@url_list=<URLLIST>;

foreach $url (@url_list){
	if (head($url)) {
  		print ACTIVE "$url\n"; 
	}
}        

print "Lista de sitios activos generada en active_sites.txt"