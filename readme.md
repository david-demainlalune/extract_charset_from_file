# extract_charset_from_file 

ruby script to extract a character set from a unicode (utf-8) file.  
creates a report document on four lines:

line 1 contains all lower case characters  
line 2 contains all upper case characters  
line 3 contains the digits  
line 4 contain every other character (punctuation etc)  

takes two arguments  
1: input file  
2: report name  

tested on ruby 1.9