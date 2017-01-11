# wsf

This is a BF derivative that uses whitespace.

## Syntax

All sequences of whitespace are interpreted as trits (ternary digits) with all other characters ignored/removed. The translation table is below:

    WHITESPACE 	= " \t\n"
    TRINARY		  = "012"	

Then, the translated code is padded with `2`s to an even length, chunked into sections of 2, and interpreted as BF code by the following table:

    "00" 	=> "+",
    "01" 	=> "-",
    "02" 	=> ">",
    "10" 	=> "<",
    "11" 	=> ".",
    "12" 	=> ",",
    "20" 	=> "[",
    "21" 	=> "]",	
    "22" 	=> "G"
    
Uses a semi-custom BF interpreter in which cells can have infinite values, and there are 1048576 cells.
