#!/usr/bin/perl

while(1){
        system("wget https://openphish.com/feed.txt");
        sleep(300);
        system("rm feed.txt");
}
