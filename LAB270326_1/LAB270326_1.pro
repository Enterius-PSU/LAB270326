% Êóøåâ Àëåêñàíäð ÁÀÑ-2
% Ëàáîðàòîðíàÿ ðàáîòà ¹5 (Çàäàíèå ¹1) 

DOMAINS
    number = integer
    list = number*

PREDICATES
    nondeterm start()
    nondeterm generate(list)   
    nondeterm gen_h(integer, list, list)  
    nondeterm gen_t(integer, integer, list, list)  
    nondeterm gen_u(integer, integer, integer, list, list)  
    nondeterm reverse_list(list, list) 
    nondeterm append(list, list, list)  
    nondeterm print_list(list)

CLAUSES
    start() :-
        generate(List),
        print_list(List).

    generate(List) :-
        gen_h(1, [], RevList),
        reverse_list(RevList, List).

    % Ïåðåáîð ñîòåí
    gen_h(H, Acc, Result) :-
        H <= 9,
        gen_t(H, 0, Acc, NewAcc),
        H1 = H + 1,
        gen_h(H1, NewAcc, Result).
    gen_h(_, Acc, Acc).

    % Ïåðåáîð äåñÿòêîâ
    gen_t(H, T, Acc, Result) :-
        T <= 9,
        H <> T,
        gen_u(H, T, 0, Acc, NewAcc),
        T1 = T + 1,
        gen_t(H, T1, NewAcc, Result).
    gen_t(H, T, Acc, Result) :-
        T <= 9,
        H = T,
        T1 = T + 1,
        gen_t(H, T1, Acc, Result).
    gen_t(_, _, Acc, Acc).

    % Ïåðåáîð åäèíèö (äîáàâëåíèå ÷èñëà)
    gen_u(H, T, U, Acc, Result) :-
        U <= 9,
        H <> U,
        T <> U,
        Number = H * 100 + T * 10 + U,
        NewAcc = [Number | Acc],
        U1 = U + 1,
        gen_u(H, T, U1, NewAcc, Result).
    % Ïðîïóñê, åñëè åäèíèöû ðàâíû ñîòíÿì
    gen_u(H, T, U, Acc, Result) :-
        U <= 9,
        H = U,
        U1 = U + 1,
        gen_u(H, T, U1, Acc, Result).
    % Ïðîïóñê, åñëè åäèíèöû ðàâíû äåñÿòêàì
    gen_u(H, T, U, Acc, Result) :-
        U <= 9,
        T = U,
        U1 = U + 1,
        gen_u(H, T, U1, Acc, Result).
    gen_u(_, _, _, Acc, Acc).

    % Ðàçâîðîò ñïèñêà (ñ ïîìîùüþ append)
    reverse_list([], []).
    reverse_list([H|T], Rev) :-
        reverse_list(T, RevTail),
        append(RevTail, [H], Rev).

    % Îáúåäèíåíèå ñïèñêîâ
    append([], L, L).
    append([H|T], L, [H|R]) :-
        append(T, L, R).

    % Âûâîä ñïèñêà
    print_list([]).
    print_list([H|T]) :-
        write(H), nl,
        print_list(T).

GOAL
    start().
 




