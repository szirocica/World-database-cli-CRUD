package Language;

use strict;
use warnings;

#constructor
sub new{
    my ($class,$args) = @_;
    my $self = bless { CountryCode => $args->{CountryCode},
                       Language => $args->{Language}, 
                       IsOfficial => $args->{IsOfficial},
                       Percentage => $args->{Percentage}
                     }, $class;
}

# get CountryCode of the language
sub get_country_code{
   my $self = shift;
   return $self->{CountryCode};
}

# set CountryCode code for the language
sub set_country_code{
   my ($self,$new_name) = @_;
   $self->{CountryCode} = $new_name;
}

# get name of the Language
sub get_name{
   my $self = shift;
   return $self->{Language};
}

# set new name for the Language
sub set_name{
   my ($self,$new_name) = @_;
   $self->{Language} = $new_name;
}

# get officiality of the Language
sub get_capital{
   my $self = shift;
   return $self->{IsOfficial};
}

# set new capital for the Language
sub set_capital{
   my ($self,$new_capital) = @_;
   $self->{IsOfficial} = $new_capital;
}

# get Percentage of the Language
sub get_code2{
   my $self = shift;
   return $self->{Percentage};
}

# set new Percentage for the Language
sub set_code2{
   my ($self,$new_code2) = @_;
   $self->{Percentage} = $new_code2;
}


#toString method
sub to_string{
   my $self = shift;
   return "CountryCode: $self->{CountryCode} Language: $self->{Language}\tIsOfficial: $self->{IsOfficial}\tPercentage: $self->{Percentage}\n";
}
1;