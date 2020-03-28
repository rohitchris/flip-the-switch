# Flip the Switch Assignment

#!/usr/bin/perl 
use strict; 
use warnings; 


# define the 8x8 switchboard
my @switchboard;
my $input;

print "Enter 5 lines of INPUT:\n";
my $input1 = <STDIN>;
my $input2 = <STDIN>;
my $input3 = <STDIN>;
my $input4 = <STDIN>;
my $input5 = <STDIN>;

run($input1);
run($input2);
run($input3);
run($input4);
run($input5);


sub run {

	# accept the input in a variable
	$input = $_[0];
	chomp $input;

	@switchboard = (
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


	my @inputArr = split / /, $input;

	my $inputOnCount = 0;
	my $outputFlipCount = 0;

	while (my ($i, $el) = each @inputArr) {

		
		if ($i==0) {
			
			$inputOnCount = $el;
		
		} else {

			# 1. handle input - switch it on (1)

			if ($i<=$inputOnCount) {

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
				
			} else {

				# 2. handle output - reverse the state (0/1)
				if ($i==$inputOnCount+1) {

					my $outputFlipCount = $el;

				} else {

					my @elArr = split //, $el;
					my $row = 0;
					
					while (my ($ii, $eli) = each @elArr) {

						
						if ($ii==0) {
							$row = $eli;

						} else {

							# turn on the initial state of switchboard
							update_switchboard_adjacent($row, $eli);

						}
					}
				}
			}
		}
	}

	# print_switchboard();

	print count_switchboard()."\n";
}


# helper functions 

sub update_switchboard {

	my $rowVal = $_[0]-1;
	my $colVal = $_[1]-1;

	# update value / always invert the existing
	if (defined $switchboard[$rowVal][$colVal] && $rowVal>=0 && $colVal>=0) {
		$switchboard[$rowVal][$colVal] = (1-$switchboard[$rowVal][$colVal]);
	}
}

sub update_switchboard_adjacent {

	my $rowVal = $_[0];
	my $colVal = $_[1];

	# invert the pressed cell
	update_switchboard($rowVal, $colVal);

	# invert the adjacent cells
	update_switchboard($rowVal-1, $colVal);
	update_switchboard($rowVal+1, $colVal);
	update_switchboard($rowVal, $colVal-1);
	update_switchboard($rowVal, $colVal+1);

	# invert the adjacent cells to the adjacent cells
	update_switchboard($rowVal-2, $colVal);
	update_switchboard($rowVal+2, $colVal);
	update_switchboard($rowVal, $colVal-2);
	update_switchboard($rowVal, $colVal+2);

	# invert the diagnol cells
	update_switchboard($rowVal-1, $colVal-1);
	update_switchboard($rowVal-1, $colVal+1);
	update_switchboard($rowVal+1, $colVal-1);
	update_switchboard($rowVal+1, $colVal+1);
}

sub count_switchboard {
	my $on = 0;
	for (my $i = 0; $i < scalar(@switchboard); $i++) {  
		for (my $j = 0; $j < scalar(@switchboard); $j++) {  
	    	if ($switchboard[$i][$j]==1) {
	    		$on++;
	    	}
	   	}  
	}

	return $on;
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
