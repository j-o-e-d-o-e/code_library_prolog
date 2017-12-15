% -1: end of the stream, 32: blank, 10: newline
% get_code(Stream, Code)

print_file :-
    File = 'c:/users/joe/desktop/programming/prolog/code_library/test.txt',
    open(File, read, Stream),
    repeat,
    get_char(Stream, Char),
    %write(Char),
    %display(Char),
    write1(Char),
    at_end_of_stream(Stream),
    !,
    close(Stream).

write1('\n') :- !.

write1(X) :- write(X).