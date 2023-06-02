
% Para rodar o jogo, basta executar o swipl, em seguida executar "[main]." e por fim "game.".

% Comandos disponiveis no momento:
% ir(nome_do_lugar) - Se movimenta para o lugar inserido (atualmente so quarto e banheiro disponivel).
% acao(nome_do_alvo) - Interage com um objeto alvo (no momento apenas acao(mesa) para o quarto, e acao(pia) estao disponiveis).

:- consult('gamedata.pl').

:- dynamic position/1.
position(car).

:- dynamic have_key/1.
have_key(false).

:- dynamic generator_on/1.
generator_on(false).

:- dynamic light_on/1.
light_on(false).

:- dynamic gift_opened/1.
gift_opened(false).

:- dynamic computer_on/1.
computer_on(false).

:- tty_clear.
:- write('You pull up to the driveway of the family holiday home and park the car. It\'s dark, but it\'s as idyllic as you remember from all that time ago. You remember being told to look in the glove box before going in.\n\nIts good be back.').

game :-
    repeat,
    read(X),
    call(X),
    fail.

use(X):-
    position(P), located(X, P),
    interaction(X, Y),
    nl,write(Y),nl,!;
    write('Nothing to use.').

go_to(X):- 
    position(Y),
    (   door(Y, X)
    ->  retract(position(Y)),
        assert(position(X)),
        standard_text
    ;   write('Cannot go to that place.'),
        nl, nl
    ).


look_at(X):-
    (
      position(P), located(X, P);
      position(X)
    ),
    look(X, Y),
    nl,write(Y),nl,!;
    write('Nothing to look at.').


lookaround:-
    position(X),
    look_around(X, A),
    nl,write(A),nl.
    

standard_text:-
    tty_clear,
    position(X),
    text(X, T),
    nl,write(T),nl.
