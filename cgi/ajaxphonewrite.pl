#!/usr/bin/perl

print "Content-type: text/html\n\n";

require "ajaxlib.pl";

&parse_input;

# Check if ajaxphone.txt file exists.  If not, create it.
if (!(-f "ajaxphone.txt")) {
   open(DATAFILE,">ajaxphone.txt");
   close(DATAFILE);
}

open(DATAFILE,">>ajaxphone.txt");
flock(DATAFILE,2) || die "Could not lock the data file\n";
print DATAFILE "$FORM_DATA{'entryFirst'}|$FORM_DATA{'entryLast'}|$FORM_DATA{'entryAddress'}|";
print DATAFILE "$FORM_DATA{'entryPhone'}|$FORM_DATA{'entryEmail'}|";
print DATAFILE "$FORM_DATA{'entryImage'}\n";
flock(DATAFILE,8);
close(DATAFILE);