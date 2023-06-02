:- consult('main.pl').

user_input(String) :-
  write("> "), readln(String).

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
    write("I don\'t understand."),!.

end_condition([quit]) :-
	write("Quitting game"), nl,
  halt.

game_loop :-
  tty_clear,
  write('You pull up to the driveway of the family holiday home and park the car. It\'s dark, but it\'s as idyllic as you remember from all that time ago. You remember being told to look in the glove box before going in.\n\nIts good be back.\n'),
  repeat,
  nl,
  user_input(String), nl,
  do(String),
  end_condition(String).

:- game_loop.