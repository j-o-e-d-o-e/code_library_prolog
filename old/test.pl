start :-
    display("Hello"), nl,
    showfile(1).

showfile(N) :-
    read(Term),
    show(Term, N).

show(Term, _) :-
    Term == end_of_file;
    Term == end,
    !.

show(toc, N) :-
    display("Table of content"),
    nl,
    showfile(N).

show(Term, N) :-
    write(N),
    tab(2),
    write(Term),
    nl,
    N1 is N + 1,
    showfile(N1).