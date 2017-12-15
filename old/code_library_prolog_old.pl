% -1: end of the stream, 32: blank, 10: newline
% get_code(Stream, Code)

main :- toc(1).

toc(N) :-
    File = 'c:/users/joe/desktop/programming/prolog/code_library/test.txt',
    open(File, read, Stream),
    repeat,
    get_char(Stream, Char),
    write(Char),
    Char == '\n';
    at_end_of_stream(Stream),
    !,
    close(Stream).