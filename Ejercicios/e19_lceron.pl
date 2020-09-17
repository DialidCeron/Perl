use Sys::Info;
use System::Info;

my $info = Sys::Info->new;
my $i = System::Info->new;

printf "Perl version is %s\n", $info->perl;
if(my $httpd = $info->httpd) {
    print "HTTP Server is $httpd\n";
}
my $cpu = $info->device('CPU');
my $os  = $info->os;
my $host = $i->host;
my $ncpus = $i->ncpu;
my $cpu_type = $i->cpu_type;

printf "Host: %s\n", scalar $host;
printf "CPUs number: %s\n", $ncpus;
printf "CPU Type: %s\n", scalar $cpu_type;
printf "Operating System is %s\n", $os->name( long => 1 );
printf "CPU: %s\n", scalar $cpu->identify;