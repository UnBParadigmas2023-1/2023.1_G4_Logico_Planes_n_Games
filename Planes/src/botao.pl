:- use_module(library(pce)).

handle_buttons_on_interface([], _).
handle_buttons_on_interface([Predicado|Predicados], D) :-
    arg(1, Predicado, X),
    arg(2, Predicado, Y),

    write('Ponto ('),write(X),write(','),write(Y),writeln(')'),

    handle_button_of_state(X, Y, D),

    handle_buttons_on_interface(Predicados, D).

handle_button_of_state(X, Y, D) :-
    new(Dialog, dialog('Exemplo de Botão')),
    new(Botao, button('Maranhão')),
    send(Botao, message, message(@prolog, handle_click, X, Y))
    send(D, append, Botao).

handle_click(X, Y) :-
    write('Registrando localização: ('),write(X),write(','),write(Y),write(')'),nl.

main :-
    List = [point(10,20),point(30,40),point(11,55)],
    handle_buttons_on_interface(List).
