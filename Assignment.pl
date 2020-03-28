# Flip the Switch Assignment

#!/usr/bin/perl 
use strict; 
use warnings; 

# define the 8x8 switchboard
my @switchboard = (
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0],
	);

# print_switchboard();

# accept the input in a variable
my $input = <STDIN>;
chomp $input;

my @inputArr = split / /, $input;

my $inputOnCount = 0;

while (my ($i, $el) = each @inputArr) {

	
	if ($i==0) {
		
		$inputOnCount = $el;
	
	} else { 

		# 1. handle input - switch it on (1)

		# print "$i : $inputOnCount\n";
		if ($i<=$inputOnCount) {
			# print "$el ON\n";

			my @elArr = split //, $el;
			my $row = 0;
			
			while (my ($ii, $eli) = each @elArr) {

				
				if ($ii==0) {
					$row = $eli;

				} else {

					# turn on the initial state of switchboard
					update_switchboard($row, $eli);

				}
			}	
			# loop through the row/col combination <row><col><col>....

		}

		# 2. handle output - reverse the state (0/1)

	}
}

print_switchboard();



# helper functions 

sub update_switchboard {

	my $rowVal = $_[0]-1;
	my $colVal = $_[1]-1;

	# update value / always invert the existing
	$switchboard[$rowVal][$colVal] = (1-$switchboard[$rowVal][$colVal]);

}

sub print_switchboard {
	for (my $i = 0; $i < scalar(@switchboard); $i++) {  
		for (my $j = 0; $j < scalar(@switchboard); $j++) {  
	    	print "$switchboard[$i][$j] ";  
	   	}  
	   	print "\n";  
	}
}

#end
