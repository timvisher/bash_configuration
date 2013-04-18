#!/usr/bin/env perl
use strict;
use warnings;
use URI::Escape qw(uri_escape_utf8);
use open IO  =>  ":utf8",       # UTF8 by default
                 ":std";        # Apply to STDIN/STDOUT/STDERR

my $query = do { local $/; <> };
$query =~ s/^\s+//g;
$query =~ s/\s+$//g;

my $url = "http://www.google.com/search?&q=" 
           . uri_escape_utf8($query, "^A-Za-z0-9") . "&btnI";
my $headers = `curl -iIs -A "Mozilla/5.0" "$url"`;
$headers =~ m/^Location: (\S+)/im;
print $1;
