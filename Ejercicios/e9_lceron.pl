#!/usr/bin/perl

foreach ("A"..."K") {
	$path = "./".$_;
	#print "$path";
	mkdir($path);
	system("touch $path/$_.txt");
}