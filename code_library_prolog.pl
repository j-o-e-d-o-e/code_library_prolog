main :-
    CWD = 'C:/Users/joe/Desktop/code_library_prolog-master/library',
    working_directory(_, CWD),
    print_toc.

loop :- 
    write("\nWhat would you like to read? "),
    read(Input),
    check_input(Input).

check_input(end) :- halt.

check_input(toc) :- nl, print_toc.
    
check_input(Input) :-
    atom_concat(Input, '.txt', File),
    exists_file(File),
    print_file(File).

check_input(_) :-
    write("\nNo matching entry. Please try again.\n"),
    loop.

print_toc :-
    write("---CODE LIBRARY PROLOG---"),
    working_directory(CWD, CWD),
    directory_files(CWD, [_,_|Filenames]),
    print_titles(Filenames), nl,
    loop.

print_titles([]).

print_titles([Filename|Filenames]) :-
    split_string(Filename,'.','', [Title|_]),
    write("\n  - "),
    write(Title),
    print_titles(Filenames).

print_file(File) :-
    nl, open(File, read, Stream),
    repeat,
        get_char(Stream, Char),
        write(Char),
        at_end_of_stream(Stream),
        !,
    close(Stream), nl,
    loop.