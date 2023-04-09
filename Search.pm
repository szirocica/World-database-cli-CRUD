package Search;

#use strict;
use warnings;
use DBI;
use Country;

$sql_for_country = "SELECT country.Code, country.Name, country.Capital, country.Code2
		FROM country, city
		WHERE country.Capital=city.ID AND country.Name = ?";
$sql_for_city = "SELECT ID, Name, CountryCode, District, Info
		FROM city
		WHERE Name = ?";
$sql_for_language = "SELECT CountryCode, Language, IsOfficial, Percentage
		FROM countrylanguage
		WHERE Language = ?";


sub search {
    my ($class, @args) = @_;
    die "class method invoked on object" if ref $class;

    my $dbh = DBI->connect("DBI:mysql:world_x",'root','');
    die "failed to connect to MySQL database:DBI->errstr()" unless($dbh);

    if($_[1] =~ m/[cC][oO][uU][nN][tT][rR][yY]$/){

        # prepare SQL statement
		my $sth = $dbh->prepare($sql_for_country)
        	or die "prepare statement failed: $dbh->errstr()";
        
        
        my($code,$name,$capital,$code2);
        my($given_name, $answer);
        
        print("\nPlease enter the country name:\n");
        
        while(<STDIN>){
        	
		$given_name = $_;
		chomp($given_name);
		
		$sth->execute($given_name) or die "execution failed: $dbh->errstr()"; 
		
		# loop through each row of the result set, and print it
		
		while(($code,$name,$capital,$code2) = $sth->fetchrow()){
		    if( length $capital ) { # no warning
			    print("$code\t$name\t$capital\t$code2\n"); 
		    }else{
			    print("$code\t$name\t$code2\n");     
		    }
	    }

		print("\nDo you want to continue searching? (Y/_)");
		$answer = <STDIN>;
		chomp($answer);
		last unless $answer eq 'Y' || $answer eq 'y';
		
		print("\nPlease enter the country name:\n");

	}
    $sth->finish();
	}

    if($_[1] =~ m/[cC][iI][tT][yY]$/){

        # prepare SQL statement
		my $sth = $dbh->prepare($sql_for_city)
        	or die "prepare statement failed: $dbh->errstr()";
        
        my($id,$name,$country_code,$district,$info);
        my($given_name, $answer);
        
        print("\nPlease enter the city name:\n");
        
        while(<STDIN>){
        	
		$given_name = $_;
		chomp($given_name);
		
		$sth->execute($given_name) or die "execution failed: $dbh->errstr()"; 
		
		# loop through each row of the result set, and print it
		
		while(($id,$name,$country_code,$district,$info) = $sth->fetchrow()){
		
			print("$id\t$name\t$country_code\t$district\t$info\n");
		
		}

		print("\nDo you want to continue? (Y/_)");
		$answer = <STDIN>;
		chomp($answer);
		last unless $answer eq 'Y' || $answer eq 'y';
		
		print("\nPlease enter the city name:\n");

	}
        
        $sth->finish();

    }
    if($_[1] =~ m/[lL][aA][nN][gG][uU][aA][gG][eE]$/){

        # prepare SQL statement
		my $sth = $dbh->prepare($sql_for_language)
        	or die "prepare statement failed: $dbh->errstr()";

        my($given_name, $answer);
        
        print("\nPlease enter the language name:\n");
        
        while(<STDIN>){
        	
		$given_name = $_;
		chomp($given_name);
		
		$sth->execute($given_name) or die "execution failed: $dbh->errstr()"; 
		
		my($country_code,$language,$is_official,$percentage);
	
		# loop through each row of the result set, and print it
		while(($country_code,$language,$is_official,$percentage) = $sth->fetchrow()){
			$tmp = "";
			if($is_official =~ m/^T$/)
			{$tmp = "Official"}
			else{ $tmp = "Not official"}
			print("$country_code\t$language\t\t$tmp\t$percentage\n"); 
		}
		
		print("\nDo you want to continue? (Y/_)");
		$answer = <STDIN>;
		chomp($answer);
		
		last unless $answer eq 'Y' || $answer eq 'y';
		
		print("\nPlease enter the language name:\n");

	}

        $sth->finish();
    }

}
1;
