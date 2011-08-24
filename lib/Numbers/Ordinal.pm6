use v6;

module Numbers::Ordinal;

sub ordinal(Int $input) is export {
    ##STEP 0: Preparation
    # NYI, but still a good guide to the below arrays
    #my enum NumType <base cardinal ordinal>;

    my $n = $input;

    # for the single digits
    my @single = ['zero','','th'],['','one','first'],['','two','second'],['th','ree','ird'],['four','','th'],['fi','ve','fth'],['six','', 'th'],['seven','','th'],['eight','','h'],['nin','e','th'];

    # for those pesky 10..19 numbers (seems almost every language does this.)
    my @teens = ['ten','','th'],['eleven','','th'],['twel','ve','fth'],['thirteen','','th'],['fourteen','','th'],['fifteen','','th'],['sixteen','','th'],['seventeen','','th'],['eighteen','','th'],['nineteen','','th'];

    # for the tens digit (bar that pesky one)
    my @tenplace = ['','',''],['','',''],['twent','y','ieth'],['thirt','y','ieth'],['fort','y','ieth'],['fift','y','ieth'],['sixt','y','ieth'],['sevent','y','ieth'],['eight','y','ieth'],['ninet','y','ieth'];

    # for the groups of three
    my @highdenoms = ['','',''],['thousand','','th'],['million','','th'],['billion','','th'],['trillion','','th'];

    # setting up for the main operation
    $n = '0' ~ $n until $n.chars %% 3;
    my @number = $n.comb(/<digit>**3/);
    my @outnum;
    my $output;

    if ($input != 0) { # if the input wasn't zero, let's go!
        # this for loop is where the magic happens!
        for @number -> $hundred {
            my $last = ?($hundred == @number[*-1]); # are we on the last group of three?
            my $outtmp;

            ##STEP 1: Hundreds digit
            if $hundred.comb[0] !~~ 0 {
                $outtmp ~= @single[$hundred.comb[0]][0] ~ @single[$hundred.comb[0]][1] ~ " hundred";
                $outtmp ~= ($hundred.substr(1,2) ~~ 0 && $last ?? "th " !! " ");
            }

            ##STEP 2: Tens digit
            if $hundred.comb[1] ~~ 1 {
                $outtmp ~= @teens[$hundred.comb[2]][0];
                $outtmp ~= $last ?? @teens[$hundred.comb[2]][2] !! @teens[$hundred.comb[2]][1]; # unlike the hundreds digit above, it's useless to check for the rest of the number being 0 when it's in the teens (10..19).
            }
            else {
                $outtmp ~= @tenplace[$hundred.comb[1]][0];
                ##STEP 3: Ones digit
                if $hundred.comb[2] ~~ 0 {
                    $outtmp ~= $last ?? @tenplace[$hundred.comb[1]][2] !! @tenplace[$hundred.comb[1]][1];
                }
                else {
                    $outtmp ~= @tenplace[$hundred.comb[1]][1] ~ "-" if @tenplace[$hundred.comb[1]][1];
                    $outtmp ~= @single[$hundred.comb[2]][0];
                    $outtmp ~= $last ?? @single[$hundred.comb[2]][2] !! @single[$hundred.comb[2]][1];
                }
            }
            ##STEP 4: Spit out the newly generated group-of-three ordinal, then on to the next!
            @outnum.push($outtmp);
        }

        ##STEP 5: Add groups of three delimiters
        for 1..^@outnum.elems { # because working on the last element of @outnum is redundant
            @outnum[*-($_+1)] ~= " " ~ @highdenoms[$_][0];
            @outnum[*-($_+1)] ~= (@outnum[*-$_..*-1].join("") == "" ?? @highdenoms[$_][2] !! @highdenoms[$_][1]);
        }
        ##STEP 6: Send the number to the user!
        return @outnum.join('').trim; # trim for things like 'two hundredth '
    }
    else { # if it does equal zero, then...
        return "zeroth"; # yes, this entry exists in the @single array, but it doesn't work. This does, though.
    }
}

# TODO: add ordinal_digit [should be millions of times easier :P]
