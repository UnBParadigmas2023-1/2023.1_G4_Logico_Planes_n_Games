
% Para rodar o jogo, basta executar o swipl, em seguida executar "[main]." e por fim "game.".

% Comandos disponiveis no momento:
% ir(nome_do_lugar) - Se movimenta para o lugar inserido (atualmente so quarto e banheiro disponivel).
% acao(nome_do_alvo) - Interage com um objeto alvo (no momento apenas acao(mesa) para o quarto, e acao(pia) estao disponiveis).

:- dynamic posicao/1.
posicao(quarto).

:- nl,write('Bem vindo ao jogo!!'),nl.
:- write('Para ver o tutorial, digite help.'),nl,nl.


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

ir(X):- 
    posicao(Y),
    acessivel(Y, X),
    retract(posicao(Y)),
    assert(posicao(X)),
    posicao(Pos),
    texto(Pos,Out),
    nl,nl,write(Out),nl.


texto(quarto, 'Voce esta no quarto e voce ve uma cama e uma mesa.').
texto(banheiro, 'Voce chega no banheiro e ve uma pia ').

texto_acao(quarto, 'Acoes: acao(mesa), acao(cama).').
texto_acao(banheiro, 'Acoes: acao(pia)').

acessivel(carro, casa).
acessivel(casa, carro).
acessivel(casa, jardim).
acessivel(jardim, casa).
acessivel(casa, hall_entrada).
acessivel(hall_entrada, casa).
acessivel(hall_entrada, sala_de_estar).
acessivel(sala_de_estar, hall_entrada).
acessivel(hall_entrada, segundo_andar).
acessivel(cozinha, hall_entrada).
acessivel(hall_entrada, cozinha).
acessivel(cozinha, dispensa).
acessivel(dispensa, cozinha).
acessivel(seu_quarto, segundo_andar).
acessivel(segundo_andar, seu_quarto).
acessivel(quarto_da_irma, segundo_andar).
acessivel(segundo_andar, quarto_da_irma).
acessivel(segundo_andar, banheiro).
acessivel(banheiro, segundo_andar).

interacao(mesa, 'Voce encontra uma chave').
interacao(pia, 'Voce liga e desliga a torneira, vendo que ela esta funcionando').

lugar(banheiro).
lugar(quarto).