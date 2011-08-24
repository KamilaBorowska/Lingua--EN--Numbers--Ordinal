# t/ordinal-digit.t -- test &ordinal_digit
use v6;
use Test;
use Lingua::EN::Numbers::Ordinal;

plan *;

is ordinal_digit(0), "0th", "0 is 0th";
is ordinal_digit(1), "1st", "1 is 1st";
is ordinal_digit(2), "2nd", "2 is 2nd";
is ordinal_digit(3), "3rd", "3 is 3rd";
is ordinal_digit(4), "4th", "4 is 4th";
is ordinal_digit(5), "5th", "5 is 5th";
is ordinal_digit(6), "6th", "6 is 6th";
is ordinal_digit(7), "7th", "7 is 7th";
is ordinal_digit(8), "8th", "8 is 8th";
is ordinal_digit(9), "9th", "9 is 9th";

done;
