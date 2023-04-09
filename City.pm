package City;

use strict;
use warnings;

#constructor
sub new{
    my ($class,$args) = @_;
    my $self = bless { ID => $args->{ID},
                       Name => $args->{Name}, 
                       CountryCode => $args->{CountryCode},
                       District => $args->{District},
                       Info => $args->{Info}
                     }, $class;
}

# get id of the city
sub get_id{
   my $self = shift;
   return $self->{ID};
}

# set new id for the city
sub set_id{
   my ($self,$new_name) = @_;
   $self->{ID} = $new_name;
}

# get name of the city
sub get_name{
   my $self = shift;
   return $self->{Name};
}

# set new name for the city
sub set_name{
   my ($self,$new_name) = @_;
   $self->{Name} = $new_name;
}

# get CountryCode of the city
sub get_country_code{
   my $self = shift;
   return $self->{CountryCode};
}

# set new CountryCode for the city
sub set_country_code{
   my ($self,$new_capital) = @_;
   $self->{CountryCode} = $new_capital;
}

# get District of the city
sub get_district{
   my $self = shift;
   return $self->{District};
}

# set new District for the city
sub set_district{
   my ($self,$new_code2) = @_;
   $self->{District} = $new_code2;
}

# get Info of the city
sub get_info{
   my $self = shift;
   return $self->{Info};
}

# set new Info for the city
sub set_info{
   my ($self,$new_info) = @_;
   $self->{Info} = $new_info;
}


#toString method
sub to_string{
   my $self = shift;   
   return "ID: $self->{ID} Name: $self->{Name}\tCountryCode: $self->{CountryCode}\tDistrict: $self->{District}\tInfo: $self->{Info}\n";
}

1;