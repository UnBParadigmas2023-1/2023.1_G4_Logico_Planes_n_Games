% Todas as salas
room(car).
room(house).
room(yard).
room(hallway).
room('living room').
room(kitchen).
room('utility room').
room('stairwell landing').
room('sisters room').
room('my room').
room(bathroom).
room(frontdoor).

% Localização dos itens
located(glovebox,car).
located(key,car).
located(note,car).
located(generator,yard).
located('light switch',hallway).
located(box,'my room').
located(pictures,'stairwell landing').
located(wardrobe,'sisters room').
located(wardrobe,photographs).
located(computer,'my room').
located(game,'my room').

% As conexões em cada sala
door(car,frontdoor).
door(frontdoor, car).
door(frontdoor, house).
door(frontdoor, yard).
door(yard, frontdoor).
door(house,frontdoor).
door(house,hallway).
door(yard,house).
door(house, yard).
door(hallway, yard).
door(hallway,'living room').
door(kitchen, hallway).
door(hallway,kitchen) :-
    light_on(true).
door(hallway,'stairwell landing') :-
    light_on(true). 
door('living room',hallway) :-
    light_on(true).
door(kitchen,'utility room').
door('utility room',kitchen).
door('stairwell landing',hallway).
door('stairwell landing','sisters room').
door('stairwell landing','my room') :-
    has_key(true).
door('stairwell landing',bathroom).
door('sisters room','stairwell landing').
door('my room','stairwell landing').
door(bathroom,'stairwell landing').

% o resultado das interações com os objetos
interaction(note, 'The note is from your Dad and reads:\n\nHi Son, hope you enjoy your break. Youl\'ll need to fire up the generator around back to get power and lights on.\n\nAlso, found something in the attic for you, it\'s in your room... Enjoy!').
interaction(generator, Message) :-
    \+ generator_on(true),
    assert(generator_on(true)),
    Message = 'You switch the generator on, and it whirrs to life. The house is still dark.'.
interaction(generator, 'The generator is already running.') :-
    generator_on(true).
interaction('light switch', Message) :-
    \+ light_on(true),
    generator_on(true),
    assert(light_on(true)),
    write('You flick the switch and the lights come on...'), nl, nl,
    Message = 'The hallway is now brightly lit. There is access to the kitchen and living room here, as well as a set of stairs going up.'.
interaction('light switch', Message) :-
    light_on(true),
    Message = 'The lights is already turned on'.
interaction('light switch', Message) :-
    Message = 'The generator is not up'.
interaction(wardrobe, 'It is empty, apart from a pile of scattered photographs at the bottom.').
interaction(box, Message) :-
    \+ gift_opened(true),
    assert(gift_opened(true)),
    Message = 'You unwrap the gift excitedly!...\n\nYou can\'t belive it!\n\nDad has found your old computer, a Futuro 128k +2! It\'s been preserved well in the attic and hopefully still works!'.
interaction(box, 'You have already opened the gift') :-
    gift_opened(true).
interaction(computer, Message) :-
    \+ computer_on(true),
    gift_opened(true),
    assert(computer_on(true)),
    Message = 'You start to plug in the various cables and leads...\n\nThe Computer is all set up and ready to go. There is a game here too...'.
interaction(computer, Message) :-
    \+ computer_on(true),
    Message = 'Nothing to use.'.
interaction(computer, Message) :-
    computer_on(true),
    Message = 'The computer is set up and ready to go.'.
interaction(game, 'You put the cassette in the computer, and press play.') :-
    computer_on(true),
    gift_opened(true),
    write('You put the cassette in the computer, and press play.'), nl, nl,
    halt.
interaction(game, Message) :-
    computer_on(false),
    gift_opened(true),
    Message = 'You need to turn on the computer first.'.
interaction(game, Message) :-
    gift_opened(false),
    Message = 'Nothing to use.'.
interaction('glove box', Message) :-
    \+ has_key(true),
    assert(has_key(true)),
    Message = 'Inside is a key, and a handwritten note from Dad. You take both.'.
interaction('glove box', 'There is nothing left in the glove box.') :-
    has_key(true).

% Texto padrão da localização
text(car,'You pull up to the driveway of the family holiday home and park the car. It\'s dark, but it\'s as idyllic as you remember from all that time ago. You remember being told to look in the glove box before going in.\n\nIts good be back.').
text(frontdoor,'The house is grand, sat perfectly amongst the trees.\n\nIn front of you is the front door, and the yard stretches around the side of the house.').
text(yard,'The yard has been well maintained. You spent a lot of time here with your family on holiday trips. Good memories.').
text(house,'You enter the house to the hallway. It\'s dark and you can\'t see anything. You feel a light switch next to the door however.'). % luzes apagadas.
text(hallway, Text) :-
    light_on(true),
    Text = 'Now you are in hallway. There is access to the kitchen and living room here, as well as a set of stairs going up.'.
text(hallway, Text) :-
    light_on(false),
    Text = 'You enter the house to the hallway. It\'s dark and you can\'t see anything. You feel a light switch next to the door however.'.
text('living room', 'A spacious and comfortable living room. We spenta lot of good time in here playing board games with the family. Warm and inviting.').
text(kitchen,'The kitchen is tidy and well kept. There is a door to a utility room, but otherwise, it\' just a kitchen.').
text('stairwell landing', 'The stairwell landing. There is bathroom, and two bedrooms: yours and your sisters.\n\nPictures adorn the walls; images of happy times.').
text(bathroom, 'You are in the bathroom. There\'s not much to note, but it\'s all in good order.').
text('sisters room','Your sisters room is in perfect condition, untouched since the last time you had seen her. Posters of her heroes and some of her own attempts at art adorn the walls.\n\nA few shelves are crammed full of trophies. Her bed is drowned under a pile of colourful soft toys.\n\nA real nostalgia trip!').
text('my room', Message) :-
    gift_opened(false),
    Message = 'Your old bedroom. So many good memories in here, and it\'s been preserved so well.\n\nOn the desk is a gift wrapped box.'.
text('my room', Message) :-
    gift_opened(true),
    Message = 'Your old bedroom. So many good memories in here, and it\'s been preserved so well.\n\nOn the desk is a Futuro 128k +2 computer, and a copy of The House Abandon. It\'s all still to be set up though.'.

% o resultado do look around em cada posição.
look_around(car,'It\'s a nice clean car. Not much to see, but there is a glove box.').
look_around(frontdoor,'The trees strech up to the night sky. There is the house and the yard.').
look_around(yard,'You see a generator on the back wall of the house').
look_around(hallway,'The hallway is a pleasant welcome to the home. Airy and fresh.').
look_around('living room', 'There is nothing here of interest.').
look_around(kitchen,'It\'s very clean and tidy. Not been used in a while.').
look_around('stairwell landing', 'A standard landing. There are picture frames covering one wall.').
look_around(bathroom, 'The bathroom is clean. A large mirror sits above the sink.').
look_around('sisters room','There is also a large wardrobe in the corner of the room - the door slightly ajar.').
look_around('my room','It\'s a standard bedroom. A desk, a woodgrained TV. The usual.').

% o resultado do "look at" de cada objeto
can_look_at(house,'The lights are all off, no one else is here.').
can_look_at(yard, 'The spacious yard extends around to the back of the house. A great place to relax in the long summers.').
can_look_at(pictures, 'Family photos and holiday snaps. Our happy family.').
can_look_at(wardrobe, 'A large clothes wardrobe. Unusually, the door is slightly ajar.\n\nShe never liked you going through he stuff.').
can_look_at('wardrobe photographs', 'They are all identical. A forest road at night. You put them back.').
can_look_at(box, 'A large gift-wrapped present. The tag says your name.').
can_look_at(glovebox, 'The glove box is closed but appears to be unlocked.').
can_look_inside(glovebox, 'Inside is a key, and a handwritten note from Dad. You take both.').
can_look_inside(wardrobe, 'It is empty, apart from a pile of scattered photographs at the bottom.').

can_open(frontdoor).
can_open(box).
can_read(note).
can_turn_on(computer).
can_turn_on(generator).
