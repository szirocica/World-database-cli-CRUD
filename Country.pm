package Country;

use strict;
use warnings;

#constructor
sub new{
    my ($class,$args) = @_;
    my $self = bless { Code => $args->{Code},
                       Name => $args->{Name}, 
                       Capital => $args->{Capital},
                       Code2 => $args->{Code2}
                     }, $class;
}

# get code of the country
sub get_code{
   my $self = shift;
   return $self->{Code};
}

# set new code for the Country
sub set_code{
   my ($self,$new_name) = @_;
   $self->{Code} = $new_name;
}

# get name of the country
sub get_name{
   my $self = shift;
   return $self->{Name};
}

# set new name for the Country
sub set_name{
   my ($self,$new_name) = @_;
   $self->{Name} = $new_name;
}

# get capital of the country
sub get_capital{
   my $self = shift;
   return $self->{Capital};
}

# set new capital for the Country
sub set_capital{
   my ($self,$new_capital) = @_;
   $self->{Capital} = $new_capital;
}

# get code2 of the country
sub get_code2{
   my $self = shift;
   return $self->{Code2};
}

# set new code2 for the Country
sub set_code2{
   my ($self,$new_code2) = @_;
   $self->{Code2} = $new_code2;
}


#toString method
sub to_string{
   my $self = shift;
   #in case of null capital, value is not returned to avoid unnecesery warnings
   if( length $self->get_capital ) {
			return "Code: $self->{Code}\tName: $self->{Name}\tCapital: $self->{Capital}\tCode2: $self->{Code2}\n";
		}else{
			return "Code: $self->{Code}\tName: $self->{Name}\tCode2: $self->{Code2}\n";    
		}	
}

1;