% Predicado para calcular a distância entre dois pontos.
% A distância entre dois pontos em um plano bidimensional 
% pode ser calculada utilizando a fórmula da distância euclidiana.
% distância = sqrt((x2 - x1)^2 + (y2 - y1)^2) 
calc_point_distance(X1, Y1, X2, Y2, Distance) :-
    Distance is sqrt((X2 - X1)^2 + (Y2 - Y1)^2).

% Predicado para iterar sobre uma lista de predicados e comparar cada elemento com todos os outros
calc_distance_between_all_pointers([]).
calc_distance_between_all_pointers([Predicado|PredicadosRestantes]) :-      % Cabeça e cauda da lista
    % Comparar o predicado atual com todos os outros predicados
    forall(member(OutroPredicado, PredicadosRestantes), handle_comparison(Predicado, OutroPredicado)),
    
    % Iterar recursivamente sobre a cauda da lista
    calc_distance_between_all_pointers(PredicadosRestantes).

% Regra para calcular as coordenadas do ponto ao longo da linha entre A e B
% utilizando a equação paramétrica da reta
% x = x1 + t * (x2 - x1)
% y = y1 + t * (y2 - y1)
% onde t varia de 0 a 1 e representa a posição relativa ao longo da linha entre A e B.
calc_stretching_point(X1, Y1, X2, Y2, T, point(X, Y, _)) :-
    X is X1 + T * (X2 - X1),
    Y is Y1 + T * (Y2 - Y1).

% Predicado para comparar dois predicados
handle_comparison(Predicado1, Predicado2) :-
    % Código para comparar os predicados
    % writeln('Comparando:'),
    % writeln(Predicado1),
    % writeln(Predicado2),
    
    arg(1, Predicado1, X1),             % obtem o ponto X1

    arg(2, Predicado1, Tail1),          
    arg(1, Tail1, Y1),                  % obtem o ponto Y1

    arg(1, Predicado2, X2),             % obtem o ponto X2

    arg(2, Predicado2, Tail2), 
    arg(1, Tail2, Y2),                  % obtem o ponto Y2

    calc_point_distance(X1, Y1, X2, Y2, Distance),

    assert(distance(X1, Y1, X2, Y2, Distance)).