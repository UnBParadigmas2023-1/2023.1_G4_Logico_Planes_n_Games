% Dynamic predicates
:- dynamic user_point_start/2.      % Departure point (X, Y)
:- dynamic user_point_stop/2.       % Destination point (X, Y)

% Exibe os botões para o usuário selecionar a origem e o destino
handle_buttons_on_interface([], _, _, _).
handle_buttons_on_interface([Predicado|Predicados], D, P1, P2) :-
    arg(1, Predicado, X),

    arg(2, Predicado, Tail),
    arg(1, Tail, Y),

    arg(2, Tail, Tail2),
    arg(2, Tail2, Nome),

    write('Ponto ('),write(X),write(','),write(Y),writeln(')'),

    handle_button_of_state(X, Y, Nome, D, P1, P2),

    NewP2 is P2 + 30,

    handle_buttons_on_interface(Predicados, D, P1, NewP2).

% Cria o botão na tela
handle_button_of_state(X, Y, Nome, D, P1, P2) :-      % Conjunto de pontos(X,Y), instância da tela, valores da posição de onde os pontos são exibidos (P1, P2)
    new(Botao, button(Nome)),
    get(Botao, area, A),
    send(A, size, size(100, 25)),
    send(Botao, message, message(@prolog, handle_click, X, Y, D)),
    send(Botao, position, point(P1, P2)),
    send(D, display, Botao).

% Trata o click do inicio
handle_click(X, Y, _) :-
    \+ user_point_start(_,_),           % Isso será verdade somente quando o a regra falhar para qualquer ponto X, Y. Isso indica que o usuário ainda não informou o ponto de origem
    assertz(user_point_start(X,Y)),
    write('Registrando inicio da localização: ('),write(X),write(','),write(Y),write(')'),nl.

% Trata o click
handle_click(X, Y, D) :-
    \+ user_point_stop(_,_),            % Isso será verdade somente quando o a regra falhar para qualquer ponto X, Y. Isso indica que o usuário ainda não informou o ponto de destino
    assertz(user_point_stop(X,Y)),
    write('Registrando fim da localização: ('),write(X),write(','),write(Y),write(')'),nl,

    % Com o ponto final, é possivel movimentar o avião
    user_point_start(Xi, Yi),
    point(Xi,Yi,_,Name1),
    point(X,Y,_,Name2),
    % Limpo a base para os ponto incial e final para que o usuário possa escolher novamente
    retract(user_point_start(_,_)),
    retract(user_point_stop(_,_)),
    \+ flight(Name1, Name2),
    Name1 \= Name2,
    thread_create(move_point(point(Xi, Yi, _), point(X, Y, _), D), ThreadId, []).