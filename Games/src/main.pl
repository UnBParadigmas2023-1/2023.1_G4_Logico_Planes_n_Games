% Lógica principal do jogo

% imports
:- consult('gamedata.pl').
:- consult('game.pl').

% Posição atual do jogador 
:- dynamic position/1.
position(car). % Posição inicial

:- game_loop.