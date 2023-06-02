
% Para rodar o jogo, basta executar o swipl, em seguida executar "[main]." e por fim "game.".

% Comandos disponiveis no momento:
% ir(nome_do_lugar) - Se movimenta para o lugar inserido (atualmente so quarto e banheiro disponivel).
% acao(nome_do_alvo) - Interage com um objeto alvo (no momento apenas acao(mesa) para o quarto, e acao(pia) estao disponiveis).

:- consult('gamedata.pl').

:- dynamic position/1.

position(car).

use(X):-
    position(P), located(X, P),
    interaction(X, Y),
    tty_clear,
    nl,write(Y),nl,!;
    tty_clear,
    write('Nothing to use.').

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


look_at(X):-
    (
      position(P), located(X, P);
      position(P), door(P, X)
    ),
    can_look_at(X, Y),
    nl,write(Y),nl,!;
    tty_clear,
    write('Nothing to look at.').


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


lookaround:-
    position(X),
    look_around(X, A),
    tty_clear,
    nl,write(A),nl.
    

standard_text:-
    tty_clear,
    position(X),
    text(X, T),
    tty_clear,
    nl,write(T),nl.
