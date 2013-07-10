# extract_charset_from_file 

ruby script that extracts a character set from a unicode (utf-8) file.  
It generates a report document on five lines:

line 1 contains all lower case characters  
line 2 contains all upper case characters  
line 3 contains the digits  
line 4 contain every other character (punctuation etc)  
line 5 concludes with a total character count (excluding whitespaces)  

takes two arguments  
1: input file  
2: report name  

tested on ruby 1.9