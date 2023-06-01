% Todas as salas
room(car).
room(driveway).
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
located(glovebox,car).
located(key,glovebox).
located('note from dad',glovebox).
located(generator,yard).
located('light switch',hallway).
located(box,'my room').
located(pictures,'stairwell landing').
located(wardrobe,'sisters room').
located(wardrobe,photographs).
% As conexões em cada sala
door(car,driveway).
door(driveway,car).
door(driveway,yard).
door(driveway,house).
door(yard,driveway).
door(house,driveway).
door(house,hallway).
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


