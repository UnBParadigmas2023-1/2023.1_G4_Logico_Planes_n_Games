
% Para rodar o jogo, basta executar o swipl, em seguida executar "[main]." e por fim "game.".

% Comandos disponiveis no momento:
% ir(nome_do_lugar) - Se movimenta para o lugar inserido (atualmente so quarto e banheiro disponivel).
% acao(nome_do_alvo) - Interage com um objeto alvo (no momento apenas acao(mesa) para o quarto, e acao(pia) estao disponiveis).

:- dynamic posicao/1.
posicao(carro).

:- nl,write('Bem vindo ao jogo!!'),nl.
:- write('Para ver o tutorial, digite help.'),nl,nl.

:- discontiguous game/0.

game :-
    posicao(Pos),
    nl,write('Voce esta em: '), write(Pos),nl,
    texto_acao(Pos, Out),
    write(Out),nl,nl,
    write('> '),
    read(X),
    call(X),
    game.

acao(X):- 
    interacao(X, Y), 
    nl,write(Y),nl.

ir(X) :-
    posicao(Y),
    (   door(Y, X)
    ->  retract(posicao(Y)),
        assert(posicao(X)),
        posicao(Pos),
        texto(Pos, Out),
        nl, nl, write(Out), nl
    ;   write('Você tentou se movimentar para um lugar inacessível.'),
        nl, nl
    ).


texto(quarto, 'Voce esta no quarto e voce ve uma cama e uma mesa.').
texto(banheiro, 'Voce chega no banheiro e ve uma pia.').
texto(quarto, 'Você está no quarto e ASEDFASDFASDF.').
texto(banheiro, 'Você está no banheiro e ASEDFASDFASDF.').
texto(carro, 'Você está no carro e ASEDFASDFASDF.').
texto(casa, 'Você está na casa e ASEDFASDFASDF.').
texto(jardim, 'Você está no jardim e ASEDFASDFASDF.').
texto(hall_entrada, 'Você está no hall_entrada e ASEDFASDFASDF.').
texto(sala_de_estar, 'Você está na sala_de_estar e ASEDFASDFASDF.').
texto(segundo_andar, 'Você está no segundo_andar e ASEDFASDFASDF.').
texto(cozinha, 'Você está na cozinha e ASEDFASDFASDF.').
texto(dispensa, 'Você está na dispensa e ASEDFASDFASDF.').
texto(seu_quarto, 'Você está no seu_quarto e ASEDFASDFASDF.').
texto(quarto_da_irma, 'Você está no quarto_da_irma e ASEDFASDFASDF.').
texto(carro, 'Você está no carro e ASEDFASDFASDF.').

texto_acao(quarto, 'Acoes: acao(mesa), acao(cama).').
texto_acao(banheiro, 'Acoes: acao(pia)').

door(carro, casa).
door(casa, carro).
door(casa, jardim).
door(jardim, casa).
door(casa, hall_entrada).
door(hall_entrada, casa).
door(hall_entrada, sala_de_estar).
door(sala_de_estar, hall_entrada).
door(hall_entrada, segundo_andar).
door(cozinha, hall_entrada).
door(hall_entrada, cozinha).
door(cozinha, dispensa).
door(dispensa, cozinha).
door(seu_quarto, segundo_andar).
door(segundo_andar, seu_quarto).
door(quarto_da_irma, segundo_andar).
door(segundo_andar, quarto_da_irma).
door(segundo_andar, banheiro).
door(banheiro, segundo_andar).

interacao(mesa, 'Voce encontra uma chave').
interacao(pia, 'Voce liga e desliga a torneira, vendo que ela esta funcionando').

lugar(carro).
lugar(banheiro).
lugar(quarto).
lugar(casa).
lugar(jardim).
lugar(hall_entrada).
lugar(sala_de_estar).
lugar(segundo_andar).
lugar(cozinha).
lugar(dispensa).
lugar(seu_quarto).
lugar(quarto_da_irma).

game.