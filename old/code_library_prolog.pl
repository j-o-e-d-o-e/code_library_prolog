main :-
    print_file('c:/users/joe/desktop/programming/prolog/code_library/library/toc.txt'), nl,
    loop.
    
loop :- 
    write("\nWhat would you like to read? "),
    read(Input),
    check_input(Input).

check_input(end).
    
check_input(Input) :-
    atom_concat('c:/users/joe/desktop/programming/prolog/code_library/library/', Input, Path),
    atom_concat(Path, '.txt', File),
    exists_file(File),
    print_file(File),
    loop.
    
check_input(_) :-
    write("No matching entry. Please try again.\n"),
    loop.

print_file(File) :-
    nl, open(File, read, Stream),
    repeat,
        get_char(Stream, Char),
        write(Char),
        at_end_of_stream(Stream),
        !,
    close(Stream), nl.