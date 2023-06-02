% Dynamic predicates
:- dynamic flight/2.   % Nome1, Nome2
:- dynamic infoVoo/1.               

% Predicado para limpar as impressoes de voos na tela
iterar_prints(_, []):-
    write('tem nada aqui nao').
iterar_prints(D, [Predicado|Predicados]) :-
    
    send(Predicado, destroy),

    retract(infoVoo(Predicado)),

    iterar_prints(D, Predicados).

% Predicado para imprimir os voos ocorrendo na tela
iterar_voo(_, [], _).
iterar_voo(D, [Predicado|Predicados], Posy) :-

    arg(1, Predicado, X),
    arg(2, Predicado, Y),

    write('('),write(X),write(','),write(Y),writeln(')'),
    new(T1, text(X)),
    % mostra o texto na posicao desejada
    send(D, display, T1, point(783, Posy)),
    
    new(T2, text(' -> ')),
    % mostra o texto na posicao desejada
    send(D, display, T2, point(870, Posy)),

    new(T3, text(Y)),
    % mostra o texto na posicao desejada
    send(D, display, T3, point(890, Posy)),
    assertz(infoVoo(T1)),
    assertz(infoVoo(T2)),
    assertz(infoVoo(T3)),

    write('opaa'),
    Newy is Posy + 20,
    iterar_voo(D, Predicados, Newy).


% Predicado que itera sobre os pontos e cria a linha
draw_line_connection([], _).            % Lista de pontos, instância da tela
draw_line_connection([Predicado|PredicadosRestantes], D) :-
    % Processar o predicado atual
    draw_line(Predicado, D),

    % Iterar recursivamente sobre a cauda da lista
    draw_line_connection(PredicadosRestantes, D).

% Predicado que desenha a linha
draw_line(Predicado, D) :-
    arg(1, Predicado, X1),              % obtem o ponto X1

    arg(2, Predicado, Tail1), 
    arg(1, Tail1, Y1),                  % obtem o ponto Y1

    arg(2, Tail1, Tail2), 
    arg(1, Tail2, X2),                  % obtem o ponto X2

    arg(2, Tail2, Tail3), 
    arg(1, Tail3, Y2),                  % obtem o ponto Y2

    arg(2, Tail3, Distance),            % obtem o a distância entre os pontos

    write('Linha entre: ('), write(X1), write(','), write(Y1), write(') e ('), write(X2), write(','), write(Y2), write(') com distância de: '), writeln(Distance),

    new(L, line(X1, Y1, X2, Y2)),

    send(D, display, L).

% Predicado que move o avião na tela
move_point(PointA, PointB, D) :-                % Ponto A e B e a instância da tela
    arg(1, PointA, X1), % obtem o ponto X1
    arg(2, PointA, Y1), % obtem o ponto Y1
    
    arg(1, PointB, X2), % obtem o ponto X2
    arg(2, PointB, Y2), % obtem o ponto Y2

    point(X1, Y1, _, Name1),
    point(X2, Y2, _, Name2),
    assertz(flight(Name1, Name2)),
    findall((X, Y), flight(X, Y), ListOfflights),
    new(L, line(X1, Y1, X2, Y2)),

    send(D, display, L), 

    % Criação de um círculo que representa o avião
    new(C1, circle(10)), 

    send(C1, center, point(X1, Y1)),
    send(C1, fill_pattern, colour(blue)),
    send(D, display, C1),

    findall((L), infoVoo(L), _),
    findall((L2), infoVoo(L2), ListOfprints2),
    iterar_prints(D, ListOfprints2),
    iterar_voo(D, ListOfflights, 400),

    update_position(X1, Y1, X2, Y2, D, C1, 0, L, Name1).

% Condição de parada: Eixo X e Y coincidiram com o objetivo
update_position(_, _, X2, Y2, D, C, T, L, Name1) :-
    % Quando um valor muito pequeno é utilizado para o incremento de T, maior é a dificuldade em se atingir exatamente o 
    % valor de (X2, Y2), por isso, ao invés de verificar se o ponto inicial já é igual ao ponto final,
    % optei por basear a condição de parada no valor do coeficiente T, o que atinge um certo valor ao chegar no ponto final
    T > 0.125,
    send(C, destroy),
    send(L, destroy),

    write('opa, vai um paozin de queijo ai?'),

    point(X2, Y2, _, Name2),

    retract(flight( Name1, Name2)),

    findall((X, Y), flight(X, Y), ListOfflights),
    findall((L), infoVoo(L), _),
    findall((L2), infoVoo(L2), ListOfprints2),

    write(ListOfprints2),

    iterar_prints(D, ListOfprints2),
    iterar_voo(D, ListOfflights, 400),

    write(flight(Name1, Name2)).

% Atualiza a posição do ponto inicial para alcançar o ponto final
update_position(X1, Y1, X2, Y2, D, C1, T, L, Name1) :-
    sleep(0.3),
    send(C1, center, point(X1, Y1)),
    send(D, display, C1),

    % Calculo dos pontos (x,y) que obedecem o percurso da reta e retorna o (a,b) que obedece a reta
    calc_stretching_point(X1, Y1, X2, Y2, T, LinePoint),
    
    % Coeficiente T que representa a posição relativa ao longo da linha (varia de 0 a 1)
    % O incremento da variação pode ser utilizado para determinar a velocidade com que o ponto se aproxima do seu objetivo
    % Quanto menor o incremento, menor é a valocidade com que o ponto se move
    NewT is T + 0.001,

    % Velocidade com que o avião se move
    arg(1, LinePoint, NewX1),
    arg(2, LinePoint, NewY1),

    update_position(NewX1, NewY1, X2, Y2, D, C1, NewT, L, Name1).