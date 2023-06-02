% Predicado para desenhar círculos espalhados
iterar_pontos(_, []).
iterar_pontos(D, [Predicado|Predicados]) :-
    arg(1, Predicado, X),

    arg(2, Predicado, Tail),
    arg(1, Tail, Y),

    
    arg(2, Tail, Raio),
    write('('),write(X),write(','),write(Y),writeln(')'),

    draw_circles(D, X,Y,Raio),

    iterar_pontos(D, Predicados).

% Predicado para desenhar os pontos
draw_circles(D, X, Y, Raio) :-

    new(C, circle(Raio)),

    send(C, center, point(X, Y)),
    send(C, fill_pattern, colour(red)),
    send(D, display, C).

% Regra para iterar sobre a lista de predicados
iterar_predicados([]).
iterar_predicados([Predicado|Predicados]) :-
    arg(1, Predicado, X),

    arg(2, Predicado, Tail),
    arg(1, Tail, Y),

    write('('),write(X),write(','),write(Y),writeln(')'),

    iterar_predicados(Predicados).