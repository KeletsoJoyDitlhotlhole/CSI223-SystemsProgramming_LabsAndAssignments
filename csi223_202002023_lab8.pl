#!/bin/perl
use warnings;
use strict;

use DBI;

my $dsn='DBI:mysql:CSI223:10.0.19.74';
my $db_user_name='dit02023';
my $db_password='dit02023';
my $dbh=DBI->connect($dsn,$db_user_name,$db_password);

#i.Displaying all records within the table
my $sth=$dbh->prepare (qq {select account,name,box,town,phone from clients});

$sth->execute();
while (my ($c_account,$c_name,$c_box,$c_town,$c_phone)=$sth->fetchrow_array())
{
 print "$c_account,$c_name,$c_box,$c_town,$c_phone\n";
}

$sth->finish();

#ii.Displaying clients from Tlokweng only.
my $sth=$dbh->prepare(qq{select account,name,box,town,phone from clients where town='Tlokweng'});
 
$sth->execute();
while(my ($c_account,$c_name,$c_box,$c_town,$c_phone)=$sth->fetchrow_array())
{
 print "$c_account,$c_name,$c_box,$c_town,$c_phone\n";
}
$sth->finish();


#iii.Displaying clients from Gaborone and whose accounts are greater than '10000040'
my $sth=$dbh->prepare(qq{select account,name,box,town,phone from clients where town='Gaborone' and accounts>10000040});

$sth->execute();
while(my ($c_account,$c_name,$c_box,$c_town,$c_phone)=$sth->fetchrow_array())
{
 print "$c_account,$c_name,$c_box,$c_town,$c_phone\n";
}
$sth->finish();
