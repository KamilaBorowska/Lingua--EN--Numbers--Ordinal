# t/ordinal.t -- test the &ordinal sub
use v6;
use Test;
use Numbers::Ordinal;

plan *;

# single digits
is ordinal(0), "zeroth", "0 is zeroth";
is ordinal(1), "first", "1 is first";
is ordinal(2), "second", "2 is second";
is ordinal(3), "third", "3 is third";
is ordinal(4), "fourth", "4 is fourth";
is ordinal(5), "fifth", "5 is fifth";
is ordinal(6), "sixth", "6 is sixth";
is ordinal(7), "seventh", "7 is seventh";
is ordinal(8), "eighth", "8 is eighth";
is ordinal(9), "ninth", "9 is ninth";

# those pesky numbers from 10..19 are special
is ordinal(10), "tenth", "10 is tenth";
is ordinal(11), "eleventh", "11 is elventh";
is ordinal(12), "twelfth", "12 is twelfth";
is ordinal(13), "thirteenth", "13 is thirteenth";
is ordinal(14), "fourteenth", "14 is fourteenth";
is ordinal(15), "fifteenth", "15 is fifteenth";
is ordinal(16), "sixteenth", "16 is sixteenth";
is ordinal(17), "seventeenth", "17 is seventeenth";
is ordinal(18), "eighteenth", "18 is eighteenth";
is ordinal(19), "nineteenth", "19 is nineteenth";

# checking on 20, 30 ... 90
is ordinal(20), "twentieth", "20 is twentieth";
is ordinal(30), "thirtieth", "30 is thirtieth";
is ordinal(40), "fortieth", "40 is fortieth";
is ordinal(50), "fiftieth", "50 is fiftieth";
is ordinal(60), "sixtieth", "60 is sixtieth";
is ordinal(70), "seventieth", "70 is seventieth";
is ordinal(80), "eightieth", "80 is eightieth";
is ordinal(90), "ninetieth", "90 is ninetieth";

#TODO: check on numbers like 21, 54, and >= 100
done;
