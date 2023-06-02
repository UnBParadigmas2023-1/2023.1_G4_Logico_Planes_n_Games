% Lógica principal do jogo

% imports
:- consult('gamedata.pl').
:- consult('game.pl').

% Posição atual do jogador 
:- dynamic position/1.
position(car). % Posição inicial

:- dynamic has_key/1.
has_key(false).

:- dynamic generator_on/1.
generator_on(false).

:- dynamic light_on/1.
light_on(false).

:- dynamic gift_opened/1.
gift_opened(false).

:- dynamic computer_on/1.
computer_on(false).

:- game_loop.