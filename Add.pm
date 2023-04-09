package Add;

#use strict;
use warnings;
use DBI;
use Country;

$sql_for_country = "INSERT INTO `country` 
		(`Code`, `Name`, `Capital`, `Code2`) 
		VALUES
		(?, ?, ?, ?);";
$sql_for_city = "INSERT INTO `city` 
		(`ID`, `Name`, `CountryCode`, `District`, `Info`) 
		VALUES
		(?, ?, ?, ?, ?);";
$sql_for_language = "INSERT INTO `countrylanguage` 
		(`CountryCode`, `Language`, `IsOfficial`, `Percentage`) 
		VALUES (?, ?, ?, ?);";

sub add {
    my ($class, @args) = @_;
    die "class method invoked on object" if ref $class;

    my $dbh = DBI->connect("DBI:mysql:world_x",'root','');
    die "failed to connect to MySQL database:DBI->errstr()" unless($dbh);

    if($_[1] =~ m/[cC][oO][uU][nN][tT][rR][yY]$/){

        # prepare SQL statement
	    my $sth = $dbh->prepare($sql_for_country)
            or die "prepare statement failed: $dbh->errstr()";
        
        #$sth->execute() or die "execution failed: $dbh->errstr()";

        my($code,$name,$capital,$code2);
	
	    #declaring variables
        my($given_country_code, $given_name, $given_capital, $given_second_code);
        
        #initializing variables
        print("\nPlease enter the country code:\n");
	    $given_country_code = <STDIN>;
        print("\nPlease enter the country name:\n");
        $given_name = <STDIN>;
        print("\nPlease enter the capital:\n");
        $given_capital = <STDIN>;
        print("\nPlease enter the second code:\n");
        $given_second_code = <STDIN>;

        #removing white space characters from variales 	
	    chomp($given_country_code, $given_name, $given_capital, $given_second_code);

	    $sth->execute($given_country_code, $given_name, $given_capital, $given_second_code)
		    or warn "execution failed: $dbh->errstr()";
		
	    print("country added to database successfully!");
	    print("$given_country_code\t$given_name\t\t$given_capital\t$given_second_code\n");
        
        $sth->finish();

    }

    elsif($_[1] =~ m/[cC][iI][tT][yY]$/){

        # prepare SQL statement
	    my $sth = $dbh->prepare("INSERT INTO `city` 
		(`ID`, `Name`, `CountryCode`, `District`, `Info`) 
		VALUES
		(?, ?, ?, ?, ?);")
        or die "prepare statement failed: $dbh->errstr()";
        
        #declaring variables
        my($given_name, $given_country_code, $given_district, $given_info);
        
        #initializing variables
        print("\nPlease enter the city name:\n");
	    $given_name = <STDIN>;
        print("\nPlease enter the country code:\n");
        $given_country_code = <STDIN>;
        print("\nPlease enter the district:\n");
        $given_district = <STDIN>;
        print("\nPlease enter the info:\n");
        $given_info = <STDIN>;

	    #removing white space characters from variales 	
	    chomp($given_name, $given_country_code, $given_district, $given_info);

	    #$sth->execute("NULL", $given_name, $given_country_code, $given_district, $given_info)
	    #	or warn "execution failed: $dbh->errstr()";

	    unless($sth->execute("NULL", $given_name, $given_country_code, $given_district, $given_info)){
		    warn "execution failed: $dbh->errstr()";
		    next;
		    print("Type the choosen command!\n");
	    }
		
	    print("city added to database successfully!\n");
	    print("$given_name\t$given_country_code\t$given_district\t$given_info\n");
        
        $sth->finish();

	}
    elsif($_[1] =~ m/[lL][aA][nN][gG][uU][aA][gG][eE]$/){

        # prepare SQL statement
	    my $sth = $dbh->prepare($sql_for_language)
            or die "prepare statement failed: $dbh->errstr()";
        
        #declaring variables
        my($given_country_code, $given_language, $given_is_official, $given_percentage);
        
        #initializing variables
        print("\nPlease enter the country code:\n");
	    $given_country_code = <STDIN>;
	
        print("\nPlease enter the language:\n");
        $given_language = <STDIN>;
        
        print("\nPlease enter the language officiality (T/F):\n");
        $given_is_official = <STDIN>;
        
        print("\nPlease enter the language percentage:\n");
        $given_percentage = <STDIN>;
        	
	    chomp($given_country_code, $given_language, $given_is_official, $given_percentage);
		
	    $sth->execute($given_country_code, $given_language, $given_is_official, $given_percentage) 
		    or warn "execution failed: $dbh->errstr()";
		
	    print("language added to database successfully!");	
	    print("$given_country_code\t$given_language\t\t$given_is_official\t$given_percentage\n");
        
        $sth->finish();
	}
}
1;