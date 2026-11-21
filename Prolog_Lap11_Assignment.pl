% Najah - 9FS3
%Allow runtime modification of letter/1 facts
:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    writeln('Hi, This is the "Name Game".'),
    writeln('You will be given a set of English letters in which you will add, delete or move to create your name.'),
    menu.

menu :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the botton'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    writeln('Enter your choice.'),
    read(Choice),
    process(Choice).

process(1) :- !,
    display_letters,
    menu.

process(2) :- !,
    writeln('Enter a letter to add:'),
    read(L),
    assert(letter(L)),
    menu.

process(3) :- !,
    writeln('Enter a letter to add at the top:'),
    read(L),
    asserta(letter(L)),
    menu.

process(4) :- !,
    writeln('Enter a letter to add at the bottom:'),
    read(L),
    assertz(letter(L)),
    menu.

process(5) :- !,
    writeln('Enter a letter to delete:'),
    read(L),
    delete_letter(L),
    menu.

process(6) :- !,
    retractall(letter(_)),
    writeln('All letters deleted.'),
    menu.

process(7) :- !,
    writeln('Goodbye!').

% invalid
process(_) :-
    writeln('Invalid choice. Please enter a number from 1 to 7.'),
    menu.

display_letters :-
    letter(X),
    writeln(X),
    fail.
display_letters.

delete_letter(L) :-
    retract(letter(L)), !,
    writeln('Letter deleted.').
delete_letter(_) :-
    writeln('Letter not found.').
