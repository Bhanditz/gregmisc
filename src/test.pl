#!/bin/env perl

# Get installation path
@my_path=split(/[\\\/]/, $0);     # grab path to this script
$#my_path=$#my_path-1;            # drop script name
$inst_path = join('/',@my_path);  # reassemble

# Add our library directory to the search path
#use lib ".";
@INC = ( @INC , $inst_path);
for $item (  @INC ) {
  print "$item\n"
}


