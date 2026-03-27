% Êóøåâ Àëåêñàíëð ÁÀÑ-2
% Ëàáîðàòîðíàÿ ðàáîòà ¹5 (Çàäàíèå ¹2)

DOMAINS
    number = integer
    list = number*

PREDICATES
    nondeterm start
    nondeterm read_numbers(number, list)
    find_min_max(list, number, number)
    find_min(list, number, number)
    find_max(list, number, number)

CLAUSES
    start :-
        write("Ââåäèòå êîëè÷åñòâî ÷èñåë: "),
        readint(Count),
        read_numbers(Count, NumberList),
        find_min_max(NumberList, Min, Max),
        Difference = Max - Min,
        write("Ìèíèìàëüíîå ÷èñëî: "), write(Min), nl,
        write("Ìàêñèìàëüíîå ÷èñëî: "), write(Max), nl,
        write("Ðàçíîñòü ìàêñèìàëüíîãî è ìèíèìàëüíîãî ÷èñåë: "), write(Difference), nl.

    % Ôîðìèðîâàíèå ñïèñêà ÷èñåë
    read_numbers(0, []).
    read_numbers(N, [X|Tail]) :-
        N > 0,
        write("Ââåäèòå ÷èñëî: "),
        readint(X),
        N1 = N - 1,
        read_numbers(N1, Tail).

    % Ïîèñê ìèíèìóìà è ìàêñèìóìà
    find_min_max([Head|Tail], Min, Max) :-
        find_min(Tail, Head, Min),
        find_max(Tail, Head, Max).

    find_min([], Min, Min).
    find_min([H|T], CurMin, Min) :-
        H < CurMin, !,
        find_min(T, H, Min).
    find_min([_|T], CurMin, Min) :-
        find_min(T, CurMin, Min).

    find_max([], Max, Max).
    find_max([H|T], CurMax, Max) :-
        H > CurMax, !,
        find_max(T, H, Max).
    find_max([_|T], CurMax, Max) :-
        find_max(T, CurMax, Max).

GOAL
    start.
