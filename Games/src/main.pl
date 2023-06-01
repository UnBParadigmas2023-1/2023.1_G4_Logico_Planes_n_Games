
% Para rodar o jogo, basta executar o swipl, em seguida executar "[main]." e por fim "game.".

% Comandos disponiveis no momento:
% ir(nome_do_lugar) - Se movimenta para o lugar inserido (atualmente so quarto e banheiro disponivel).
% acao(nome_do_alvo) - Interage com um objeto alvo (no momento apenas acao(mesa) para o quarto, e acao(pia) estao disponiveis).

:- consult('gamedata.pl').


:- dynamic position/1.
position(car).

:- nl,write('Bem vindo ao jogo!!'),nl.
:- write('Para ver o tutorial, digite help.'),nl,nl.


game :-
    write('> '),
    read(X),
    call(X),
    game.

use(X):- 
    interacao(X, Y), 
    nl,write(Y),nl.

go_to(X):- 
    position(Z),
    door(Z, X),!,
    retract(position(Z)),
    Fact =.. [position, X],
    assert(Fact),
    standard_text.

help :-
    nl,write('Os principais comandos utilizados são:'),nl,write('look at'),nl,write('go to'),nl,write('use'),nl,write('open'),nl,write('read'),nl.

lookaround:-
    position(X),
    look_around(X, A),
    nl,write(A),nl.

standard_text:-
    position(X),
    text(X, T),
    nl,write(T),nl.

text(car,'You pull up to the driveway of the family holiday home and park the car. It\'s dark, but it\'s as idyllic as you remember from all that time ago. You remember being told to look in the glove box before going in.\n\nIts good be back.').
text(house,'The house is grand, sat perfectly amongst the trees.\n\nIn front of you is the front door, and the yard stretches around the side of the house.').
text(yard,'The yard has been well maintained. You spent a lot of time here with your family on holiday trips. Good memories.').
text(hallway,'You enter the house to the hallway. It\'s dark and you can\'t see anything. You feel a light switch next to the door however.'). % luzes apagadas.
text(hallway,'The hallway in now brightly lit. There is access to the kitchen and living room here, as well as a set of stairs going up.'). % luzes acesas.
text('living room', 'A spacious and comfortable living room. We spenta lot of good time in here playing board games with the family. Warm and inviting.').
text(kitchen,'The kitchen is tidy and well kept. There is a door to a utility room, but otherwise, it\' just a kitchen.').
text('stairwell landing', 'The stairwell landing. There is bathroom, and two bedrooms: yours and your sisters.\n\nPictures adorn the walls; images of happy times.').
text(bathroom, 'You are in the bathroom. There\'s not much to note, but it\'s all in good order.').
text('sisters room','Your sisters room is in perfect condition, untouched since the last time you had seen her. Posters of her heroes and some of her own attempts at art adorn the walls.\n\nA few shelves are crammed full of trophies. Her bed is drowned under a pile of colourful soft toys.\n\nA real nostalgia trip!').
text('my room','Your old bedroom. So many good memories in here, and it\'s been preserved so well.\n\nOn the desk is a gift wrapped box.').


% o resultado do look around em cada posição.
look_around(car,'It\'s a nice clean car. Not much to see, but there is a glove box.').
look_around(house,'The trees strech up to the night sky. There is the house and the yard.').
look_around(yard,'You see a generator on the back wall of the house').
look_around(hallway,'The hallway is a pleasant welcome to the home. Airy and fresh.').
look_around('living room', 'There is nothing here of interest.').
look_around(kitchen,'It\'s very clean and tidy. Not been used in a while.').
look_around('stairwell landing', 'A standard landing. There are picture frames covering one wall.').
look_around(bathroom, 'The bathroom is clean. A large mirror sits above the sink.').
look_around('sisters room','There is also a large wardrobe in the corner of the room - the door slightly ajar.').
look_around('my room','It\'s a standard bedroom. A desk, a woodgrained TV. The usual.').