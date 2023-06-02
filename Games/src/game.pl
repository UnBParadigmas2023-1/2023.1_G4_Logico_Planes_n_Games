:- consult('gamedata.pl').

% Use object logic
use(X):-
  position(P), located(X, P),
  interaction(X, Y),
  tty_clear,
  nl,write(Y),nl,!;
  tty_clear,
  write('Nothing to use.').

% Movement logic
go_to(X):- 
  position(Y),
  (   door(Y, X)
  ->  retract(position(Y)),
      assert(position(X)),
      standard_text;
      tty_clear,
      write('Cannot go to that place.'),
      nl, nl
  ).

% Look at logic
look_at(X):-
  (
    position(P), located(X, P);
    position(P), door(P, X)
  ),
  can_look_at(X, Y),
  tty_clear,
  nl,write(Y),nl,!;
  tty_clear,
  write('Nothing to look at.').

% Look inside logic
look_inside(X):-
  (
    position(P), located(X, P);
    position(X)
  ),
  can_look_inside(X, Y),
  tty_clear,
  nl,write(Y),nl,!;
  tty_clear,
  write('Nothing to look inside.').

% Look around current position logic
lookaround:-
  position(X),
  look_around(X, A),
  tty_clear,
  nl,write(A),nl.
  
% Call the standard text from current position
standard_text:-
  tty_clear,
  position(X),
  text(X, T),
  tty_clear,
  nl,write(T),nl.

% Leave car logic
exit_car:-
  tty_clear,
  nl,write("You open the car door and step out..."),nl,
  sleep(3),
  go_to(frontdoor).

% Get input from user in natural language
user_input(String) :-
  readln(String).

% List of available commands in natural language
do([go, to, house]) :-
  go_to(house),
  go_to(hallway), !.

do([go, inside, house]) :-
  go_to(house),
  go_to(hallway), !.

do([go, to, Direction]) :-
  room(Direction),
  go_to(Direction), !.

do([check, Object]) :-
  look_at(Object),!;
  look_inside(Object),!.

do([look, at, Object]) :-
  look_at(Object),!.

do([look, inside, Object]) :-
  look_inside(Object),!.

do([lookaround]) :-
  lookaround,!.

do([open , Object]):-
  can_open(Object),
  use(Object),!.

do([turn, on, Object]):-
  can_turn_on(Object),
  use(Object),!.

do([read, Object]):-
  can_read(Object),
  use(Object),!.

do([exit, car]):-
    exit_car,!.

do([get, out, of, car]):-
    exit_car,!.

do([quit]).

do(_) :-
    write('I don\'t understand.'),!.

% Leave game logic
end_condition([quit]) :-
	write('Leaving game...'), nl,
  halt.

% Game loop logic
game_loop :-
  tty_clear,
  write('You pull up to the driveway of the family holiday home and park the car. It\'s dark, but it\'s as idyllic as you remember from all that time ago. You remember being told to look in the glove box before going in.\n\nIts good be back.\n'),
  repeat,
  nl,
  user_input(String), nl,
  do(String),
  end_condition(String).