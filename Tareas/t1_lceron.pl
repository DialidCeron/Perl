#!/usr/bin/perl                                                                                                                                            
                                                                                                                                                           
for($i=1; $i<=$ARGV[0]; $i++){                                                                                                                             
        if($i%2==0 && $i%3==0){
                print "$i FizzBuzz\n";
        }elsif($i%3==0){
                print "$i Buzz\n";
        }elsif($i%2==0){
                print "$i Fizz\n";
        }else{
                print "$i\n";
        }
}