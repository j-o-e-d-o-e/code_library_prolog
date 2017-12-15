main :-
    input(toc), nl,
    loop.
    
loop :- 
    write("\nWhat would you like to read? "),
    read(X),
    nl, input(X), nl,
    loop.

input(toc) :- write("--CODE LIBRARY PROLOG--
   - atoms
   - append").

input(atoms) :- write("atoms
- either begin with lower-case character
- or are enclosed in single quotes (strings)
- if written in double quotes, they are converted to characters codes

EXAMPLE:
| ?- write('Hello.').       
Hello.
yes").


input(append) :- write("append
- append(L1, L2, Output) appends two lists L1 & L2
- useful for decomposing lists & finding elements

EXAMPLES:
| ?- append([1,2,3], [a,b,c], L).
L = [1,2,3,a,b,c] ?
| ?- append(Lower, [3|Higher], [1,2,3,4,5,6]).
Lower = [1,2], Higher = [4,5,6] ?
| ?- append(_, [PRE, 3, POST|_],[m, y, 3, b, f]).
PRE = y, POST = b ?
| ?- Input = [a,b,c,c,d], append(Output, [c,c|_], Input).
Input = [a,b,c,c,d], Output = [a,b] ?").

input(_) :-
    write("No matching entry. Please try again."), nl,
    loop.
