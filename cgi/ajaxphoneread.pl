#!/usr/bin/perl

print "Content-type: text/html\n\n";

%query = split(/=/, $ENV{QUERY_STRING});

$searchname = $query{"firstname"};

open(DATAFILE, "ajaxphone.txt");
while($line = <DATAFILE>) {
      ($firstname,$lastname,$address,$phone,$email,$image) = split(/\|/,$line);
      $lastnamedb{"$firstname"} = $lastname;
      $addressdb{"$firstname"} = $address;
      $phonedb{"$firstname"} = $phone;
      $emaildb{"$firstname"} = $email;
      $imagedb{"$firstname"} = $image;
}
close(DATAFILE);

$lastname = $lastnamedb{"$searchname"};
$address = $addressdb{"$searchname"};
$phone = $phonedb{"$searchname"};
$email = $emaildb{"$searchname"};
$image = $imagedb{"$searchname"};

print "$lastname|$address|$phone|$email|$image";