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

% Localização dos itens
located('glove box',car).
located(key,'glove box').
located('note from dad','glove box').
located(generator,yard).
located('light switch',hallway).
located(box,'my room').
located(pictures,'stairwell landing').
located(wardrobe,'sisters room').
located(wardrobe,photographs).

% As conexões em cada sala
door(car,house).
door(house,car).
door(house,yard).
door(house,hallway).
door(yard,house).
door(hallway,house).
door(hallway,'living room').
door(hallway,kitchen).
door(hallway,'stairwell landing').
door('living room',hallway).
door(kitchen,'utility room').
door('utility room',kitchen).
door('stairwell landing',hallway).
door('stairwell landing','sisters room').
door('stairwell landing','my room').
door('stairwell landing',bathroom).
door('sisters room','stairwell landing').
door('my room','stairwell landing').
door(bathroom,'stairwell landing').

% o resultado das interações com os objetos
interaction(note, 'The note is from your Dad and reads:\n\nHi Son, hope you enjoy your break. Youl\'ll need to fire up the generator around back to get power and lights on.\n\nAlso, found something in the attic for you, it\'s in your room... Enjoy!').
interaction(generator, 'You switch the generator on, and it whirrs to life. The house is still dark.').
interaction('light switch', 'You flick the switch and the lights come on...').
interaction(wardrobe, 'It is empty, apart from a pile of scattered photographs at the bottom.').
interaction(box, 'You unwrap the gift excitedly!...\n\nYou can\'t belive it!\n\nDad has found your old computer, a Futuro 128k +2! It\'s been preserved well in the attic and hopefully still works!').
interaction(computer, 'You start to plug in the various cables and leads...\n\nThe Computer is all set up and ready to go. There is a game here too...').
interaction(game, 'You put the cassette in the computer, and press play.').
interaction('glove box', 'Inside is a key, and a handwritten note from Dad. You take both.').

% Texto padrão da localização
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
text('my room','Your old bedroom. So many good memories in here, and it\'s been preserved so well.\n\nOn the desk is a Futuro 128k +2 computer, and a copy of The House Abandon. It\'s all still to be set up though.').

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

% o resultado do "look at" de cada objeto
look(house,'The lights are all off, no one else is here.').
look(yard, 'The spacious yard extends around to the back of the house. A great place to relax in the long summers.').
look(pictures, 'Family photos and holiday snaps. Our happy family.').
look(wardrobe, 'A large clothes wardrobe. Unusually, the door is slightly ajar.\n\nShe never liked you going through he stuff.').
look('wardrobe photographs', 'They are all identical. A forest road at night. You put them back.').
look(box, 'A large gift-wrapped present. The tag says your name.').
look('glove box', 'The glove box is closed but appears to be unlocked.').


