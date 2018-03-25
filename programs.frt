( 0 if even, 1 if odd )
: parity 2 % ;

( returns addres of a cell which contains 1 if number if prime, 0 otherwise )
: prime 
  dup 2 < if drop 1 allot dup 0 swap ! else
  dup 4 < if drop 1 allot dup 1 swap !
     else
            dup >r 
            2 swap 2 /
            swap r>
            repeat
                 over over swap % 
                 if 
                  over >r 
                  rot dup r> 
                  > 
                  if
                   rot 
                   1 + 
                   rot
                   0 
                  else 0 1 then 
                 else 1 1 then
            until
            >r drop drop drop r> 
            if 1 allot dup 0 swap ! else 1 allot dup 1 swap ! then
     then
then ; 

( writes null-terminated string by at addres )
: write-word
  repeat
       over over 
       c@ swap c! 
       1 + swap 1 + swap 
       dup c@ not
  until ; 

( concatenates two null-terminated strings and returns addres of a result string )
: cat
  over count over count 
  1 + + allot
  rot over >r 
  write-word
  drop swap 
  write-word 
  drop 0 swap 
  c! r> ;

( returns radical of an argrument )
: radical 
    dup 1 = not if
    dup prime @ not if 
    dup 1 < if drop 1 allot dup 0 swap ! else
    dup 1 = if drop 1 allot dup 0 swap !
     else
            dup >r 
            2 swap 2 /
            swap r>
            1 >r
            repeat
                 over over swap % 
                 if 
                  over >r 
                  rot dup r> 
                  > 
                  if
                   rot 
                   1 + 
                   rot
                   0 
                  else 1 then 
                 else
                 swap dup prime @ if dup r> * >r then 1 + swap 0
                 then
            until
            drop drop drop r>
     then
then
then
then ; 


