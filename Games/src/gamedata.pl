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


