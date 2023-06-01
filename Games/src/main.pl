
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
    retract(posicao(Pos)),
    Fact =.. [posicao, X],
    assert(Fact),
    posicao(Pos),
    texto(Pos,Out),
    nl,nl,write(Out),nl.

help :-
    nl,write('Os principais comandos utilizados são:'),nl,write('look at'),nl,write('go to'),nl,write('use'),nl,write('open'),nl,write('read'),nl.

lookaround(X):-
    look_around(X, A),
    nl,write(A),nl.



texto(quarto, 'Voce esta no quarto e voce ve uma cama e uma mesa.').
texto(banheiro, 'Voce chega no banheiro e ve uma pia ').

texto_acao(quarto, 'Acoes: acao(mesa), acao(cama).').
texto_acao(banheiro, 'Acoes: acao(pia)').



interacao(mesa, 'Voce encontra uma chave').
interacao(pia, 'Voce liga e desliga a torneira, vendo que ela esta funcionando').

lugar(banheiro).
lugar(quarto).

look_around(car,'It\'s a nice clean car. Not much to see, but there is a glove box.').
look_around(house,'the trees strech up to the night sky. There is the house and the yard.').
look_around(yard,'You see a generator on the back wall of the house').
look_around(hallway,'The hallway is a pleasant welcome to the home. Airy and fresh.').
look_around('living room', 'There is nothing here of interest.').
look_around(kitchen,'It\'s very clean and tidy. Not been used in a while.').
look_around('stairwell landing', 'A standard landing. There are picture frames covering one wall.').
look_around(bathroom, 'The bathroom is clean. A large mirror sits above the sink.').
look_around('sisters room','There is also a large wardrobe in the corner of the room - the door slightly ajar.').
look_around('my room','It\'s a standard bedroom. A desk, a woodgrained TV. The usual.').