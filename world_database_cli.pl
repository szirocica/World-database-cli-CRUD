#!/usr/bin/perl
#use strict;
use warnings;
use DBI;
use List;
use Search;
use Add;
use Delete;

#Models:
use Country;
use City;
use Language;

my $dbh = DBI->connect("DBI:mysql:world_x",'root','');
die "failed to connect to MySQL database:DBI->errstr()" unless($dbh);

#entry point
print_welcome_text();

while(<STDIN>){
   	$b = $_;
   	print($b);

	my @abc = split(' ', $b);
   
   	if($b =~ m/^[Qq][Uu][iI][tT]/){
		$dbh->disconnect();
		print("Shutting down world database cli...\n"); 
		exit;
	}
	
   	elsif($b =~ m/^[lL][Ii][sS][tT][ ]/){
		List->list($abc[1]);
		
	}
	
   	elsif($b =~ m/^[sS][eE][aA][rR][cC][hH][ ]/){
		Search->search($b);
	
	}
	
  	elsif($b =~ m/^[aA][dD][dD][ ]/){
		Add->add($b);
	
	}

	elsif($b =~ m/^[dD][eE][lL][eE][tT][eE][ ]/){
		Delete->delete($b);
	
	}
	elsif($b =~ m/^[uU][pP][dD][aA][tT][eE][ ]/){
		#TODO
		Delete->delete($b);
		Add->add($b);
	}
	elsif($b =~ m/^*([-])[hH]*([eE][lL][pP])/){
		print_welcome_text();
	}

   	else{
		print("Unknown command! use --help\n"); 
	}
   	print("Type the chosen command!\n");
}

sub print_welcome_text {
	print("\nWelcome to world database cli!\n");
	print("Write commands in the following pattern:\n");
	print("[COMMAND] [ENTITY]\nEntity : [ country | city | language ]\n");
	print("Command : [ LIST \| ADD \| UPDATE \| DELETE \| SEARCH \| QUIT ]\n");
	print("Type the chosen command!\n\n");
}
