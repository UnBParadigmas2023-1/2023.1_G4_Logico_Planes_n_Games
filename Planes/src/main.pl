:- use_module(library(thread)).
:- use_module(library(time)).
:- use_module(library(pce)).
:- use_module(library(random)).

:- consult('points.pl').          % Knowledge base
:- consult('drawPoints.pl').      % Node-creation module
:- consult('calcPoints.pl').      % Calculations module
:- consult('buttonInterface.pl'). % Buttons module
:- consult('randomPlanes.pl').    % Random plane generator module
:- consult('manageFlights.pl').   % Manage flights module

% Para executar, use o comando: 'swipl main.pl'

main :-

    new(D, picture('Sistema de Controle de Trafego Aereo')),
    send(D, size, size(1111, 834)),
    
    % Cria um objeto bitmap para a imagem
    new(B, bitmap('../assets/mapa.jpg')), % Substitua pelo caminho da sua imagem

    % Configure o tamanho e a posição do bitmap para cobrir a janela
    send(B, size, D?size),
    send(B, position, point(0, 0)),

    % Bitmap como background da janela
    send(D, display, B),
    send(D, open),
    
    findall((X, Y, Raio), point(X, Y, Raio, _), ListOfPointers),
    findall((X, Y, Raio, Nome), point(X, Y, Raio, Nome), ListOfPointers2),
    iterar_pontos(D, ListOfPointers),
    
    writeln('Predicados para os pontos:'),
    writeln(ListOfPointers),
    
    calc_distance_between_all_pointers(ListOfPointers),       % Adiciona o conhecimento da distância a base de dados
    findall((X1, Y1, X2, Y2, Distance), distance(X1, Y1, X2, Y2, Distance), ListOfPointersWithDistance),

    writeln('Predicado para a distância entre os pontos:'),
    writeln(ListOfPointersWithDistance),

    iterar_predicados(ListOfPointers), % Imprime os pontos para o usuário selecionar

    handle_buttons_on_interface(ListOfPointers2, D, 1000, 20),

    generate_random_planes(D, ListOfPointers).


% Inicializa o programa
:- initialization(main).