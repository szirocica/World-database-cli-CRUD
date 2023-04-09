
package List;

#use strict;
use warnings;
use DBI;
use Country;

$sql_for_country = "SELECT Code, Name, Capital, Code2
	        FROM country";
$sql_for_city = "SELECT ID, Name, CountryCode, District, Info 
            FROM city";
$sql_for_language = "SELECT CountryCode, Language, isOfficial, Percentage 
            FROM countrylanguage";

sub list {
    my ($class, @args) = @_;
    die "class method invoked on object" if ref $class;

    my $dbh = DBI->connect("DBI:mysql:world_x",'root','');
    die "failed to connect to MySQL database:DBI->errstr()" unless($dbh);

    if($_[1] =~ m/^[cC][oO][uU][nN][tT][rR][yY]$/){

        # prepare SQL statement
	    my $sth = $dbh->prepare($sql_for_country)
            or die "prepare statement failed: $dbh->errstr()";
        
        $sth->execute() or die "execution failed: $dbh->errstr()";

        my($code,$name,$capital,$code2);
	
	    # loop through each row of the result set, and print it
	    while(($code,$name,$capital,$code2) = $sth->fetchrow()){

		    #creating a temporary country variable thus
		    #printig is easier by its to_string() method
		    my $country_tmp = Country->new({
                          Code =>$code,
                          Name =>$name,
                          Capital =>$capital,
                          Code2 =>$code2});

		    print $country_tmp->to_string();

    }
    $sth->finish();
    }

    elsif($_[1] =~ m/^[cC][iI][tT][yY]$/){

        # prepare SQL statement
	    my $sth = $dbh->prepare($sql_for_city)
           or die "prepare statement failed: $dbh->errstr()";
        
        $sth->execute() or die "execution failed: $dbh->errstr()"; 

	    my($id,$name,$country_code,$district,$info);
	
	    # loop through each row of the result set, and print it

	    while(($id,$name,$country_code,$district,$info) = $sth->fetchrow()){

		    #creating a temporary city variable thus
		    #printig is easier by its to_string() method
		    my $city_tmp = City->new({
                          ID =>$id,
                          Name =>$name,
                          CountryCode =>$country_code,
                          District =>$district,
                          Info =>$info});

		    print $city_tmp->to_string();	
	        }
	
	    $sth->finish();

	}
    elsif($_[1] =~ m/^[lL][aA][nN][gG][uU][aA][gG][eE]$/){

        # prepare SQL statement
	    my $sth = $dbh->prepare($sql_for_language)
           or die "prepare statement failed: $dbh->errstr()";
        
        $sth->execute() or die "execution failed: $dbh->errstr()"; 

	    my($country_code,$language,$is_official,$percentage);
	
	    # loop through each row of the result set, and print it
	    while(($country_code,$language,$is_official,$percentage) = $sth->fetchrow()){

		    #creating a temporary language variable thus
		    #printig is easier by its to_string() method
		    my $language_tmp = Language->new({
                          CountryCode =>$country_code,
                          Language =>$language,
                          IsOfficial =>$is_official,
                          Percentage =>$percentage
                          });

		    print $language_tmp->to_string();
            }	
	    $sth->finish();
	}
}
1;