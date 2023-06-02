% Obter e remover predicado aleatório
obter_predicado_aleatorio(Lista, Predicado, NovaLista) :-
    random_member(Predicado, Lista),
    select(Predicado, Lista, NovaLista).

% Gera avioes aleatorios
generate_random_planes(D, ListOfPointers) :-
    obter_predicado_aleatorio(ListOfPointers, RandomPointer1, NewListOfPointers1),
    
    arg(1, RandomPointer1, A1),
    arg(2, RandomPointer1, Tail1),
    arg(1, Tail1, B1),
    
    obter_predicado_aleatorio(NewListOfPointers1, RandomPointer2, NewListOfPointers2),

    arg(1, RandomPointer2, A2),
    arg(2, RandomPointer2, Tail2),
    arg(1, Tail2, B2),

    obter_predicado_aleatorio(NewListOfPointers2, RandomPointer3, NewListOfPointers3),

    arg(1, RandomPointer3, A3),
    arg(2, RandomPointer3, Tail3),
    arg(1, Tail3, B3),

    obter_predicado_aleatorio(NewListOfPointers3, RandomPointer4, _),

    arg(1, RandomPointer4, A4),
    arg(2, RandomPointer4, Tail4),
    arg(1, Tail4, B4),

    write('Ponto aleatorio: '),writeln(RandomPointer1),
    write('Ponto aleatorio: '),writeln(RandomPointer2),
    write('Ponto aleatorio: '),writeln(RandomPointer3),
    write('Ponto aleatorio: '),writeln(RandomPointer4),

    thread_create(move_point(point(A1, B1, _), point(A2, B2, _), D), ThreadId1, []),
    sleep(0.5),
    thread_create(move_point(point(A3, B3, _), point(A4, B4, _), D), ThreadId2, []),

    thread_join(ThreadId1, _),
    thread_join(ThreadId2, _),
    
    sleep(2),
    generate_random_planes(D, ListOfPointers).