package Delete;

#use strict;
use warnings;
use DBI;
use Country;

$sql_for_country = "DELETE 
        FROM country 
        WHERE `country`.`Name` = ?";
$sql_for_city = "DELETE
		FROM `city`
		WHERE `city`.`Name` = ?;";
$sql_for_language = "DELETE
        FROM countrylanguage 
        WHERE `countrylanguage`.`Language` = ?";

sub delete {
    my ($class, @args) = @_;
    die "class method invoked on object" if ref $class;

    my $dbh = DBI->connect("DBI:mysql:world_x",'root','');
    die "failed to connect to MySQL database:DBI->errstr()" unless($dbh);

	#print($_[1]);
	#print("\n");

    if($_[1] =~ m/[cC][oO][uU][nN][tT][rR][yY]$/){

        # prepare SQL statement
	    my $sth = $dbh->prepare($sql_for_country)
            or die "prepare statement failed: $dbh->errstr()";
        
        #declaring variables
        my($given_name);
        
        #initializing variables
        print("\nPlease enter the country name:\n");
	    $given_name = <STDIN>;

	    #removing white space characters from variables 	
	    chomp($given_name);

	    unless($sth->execute($given_name)){
		    warn "execution failed: $dbh->errstr()";
		    next;
		    print("Type the chosen command!\n");
	    }
		
	    print("country removed from database successfully!\n");
        $sth->finish();
    }
    elsif($_[1] =~ m/[cC][iI][tT][yY]$/){
	
	    # prepare SQL statement
	    my $sth = $dbh->prepare($sql_for_city)
            or die "prepare statement failed: $dbh->errstr()";
        
        #declaring variables
        my($given_name);
        
        #initializing variables
        print("\nPlease enter the city name:\n");
	    $given_name = <STDIN>;

	    #removing white space characters from variables 	
	    chomp($given_name);

	    unless($sth->execute($given_name)){
		    warn "execution failed: $dbh->errstr()";
		    next;
		    print("Type the chosen command!\n");
	    }
		
	    print("city removed from database successfully!\n");
	    print("$given_name\n");
        
        $sth->finish();
	}
    elsif($_[1] =~ m/[lL][aA][nN][gG][uU][aA][gG][eE]$/){
	
	    # prepare SQL statement
	    my $sth = $dbh->prepare($sql_for_language)
            or die "prepare statement failed: $dbh->errstr()";
        
        #declaring variables
        my($given_name);
        
        #initializing variables
        print("\nPlease enter the language:\n");
	    $given_name = <STDIN>;

	    #removing white space characters from variables 	
	    chomp($given_name);

	    unless($sth->execute($given_name)){
		    warn "execution failed: $dbh->errstr()";
		    next;
		    print("Type the chosen command!\n");
	    }
		
	    print("language removed from database successfully!\n");
	    print("$given_name\n");
        
        $sth->finish();
	}
    else{
        print("unknown command!\n");
        last;
    }
}
1;