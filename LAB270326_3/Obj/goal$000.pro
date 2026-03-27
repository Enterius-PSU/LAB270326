% Кушев Александр БАС-2
% Лабораторная работа №5 (Задание №3)

DOMAINS
    number = integer
    list = number*

PREDICATES
    nondeterm result()
    nondeterm get_numbers(number, list)
    nondeterm get_next_number(number, number, list, list)
    nondeterm is_subset(list, list)
    nondeterm member(number, list)
    nondeterm check_subset_relation(list, list)

CLAUSES
    % Основной предикат программы
    result() :-
        write("(Список №1) "),
        write("Введите количество элементов списка: "),
        readint(Count1),
        get_numbers(Count1, List1),

        write("(Список №2) "),
        write("Введите количество элементов списка: "),
        readint(Count2),
        get_numbers(Count2, List2),

        check_subset_relation(List1, List2).

    % Формирование списка чисел
    get_numbers(Count, NumberList) :-
        get_next_number(Count, 1, [], NumberList).

    % Рекурсивный ввод чисел с накоплением в список
    get_next_number(TotalCount, CurrentIndex, Acc, Result) :-
        CurrentIndex <= TotalCount, !,
        write("Введите число №"), write(CurrentIndex), write(": "),
        readint(Number),
        NewAcc = [Number | Acc],
        NextIndex = CurrentIndex + 1,
        get_next_number(TotalCount, NextIndex, NewAcc, Result).
        
    get_next_number(_, _, Acc, Acc).

    % Проверка отношения списков и вывод результата
    check_subset_relation(List1, List2) :-
        is_subset(List1, List2), !,
        write("Список №1 является подмножеством списка №2.\n").
    check_subset_relation(List1, List2) :-
        is_subset(List2, List1), !,
        write("Список №2 является подмножеством списка №1.\n").
    check_subset_relation(_, _) :-
        write("Ни один список не является подмножеством другого.\n").

    % Проверка, является ли первый список подмножеством второго
    is_subset([], _) :- !.
    is_subset([Head | Tail], Set) :-
        member(Head, Set),
        is_subset(Tail, Set).

    % Проверка принадлежности элемента списку
    member(X, [X | _]) :- !.
    member(X, [_ | Tail]) :-
        member(X, Tail).

GOAL
    result().








