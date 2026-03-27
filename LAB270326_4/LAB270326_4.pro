% Кушев Александр БАС-2
% Лабораторная работа №5 (Задание №4)

DOMAINS
    city = string
    citylist = city*

PREDICATES
    nondeterm permutation(citylist, citylist)  
    nondeterm select(city, citylist, citylist) 
    nondeterm solve                          
    nondeterm check1(city, city)              
    nondeterm check2(city, city)            
    nondeterm check3(city, city)             
    nondeterm check4(city, city)              

CLAUSES
    % Выбор элемента X из списка с возвратом новго списка без X
    select(X, [X|Tail], Tail).
    select(X, [Y|Tail], [Y|Rest]) :-
        select(X, Tail, Rest).

    % Перестановка элементов списка
    permutation([], []).
    permutation(List, [X|Perm]) :-
        select(X, List, Rest),
        permutation(Rest, Perm).

    % Условие №1 - Если Алик не из Умани, то Боря из Краматорска.
    check1(City1, City2) :-
        City1 = "Умань"; City2 = "Краматорск".

    % Условие №2 - Или Боря, или Витя из Харькова.
    check2(City2, City3) :-
        City2 = "Харьков"; City3 = "Харьков".

    % Условие №3 - Если Витя не из Славянска, то Лена приехала из Харькова.
    check3(City3, City4) :-
        City3 = "Славянск"; City4 = "Харьков".

    % Условие №4 - Или Даша приехала из Умани, или Лена из Краматорска.
    check4(City5, City4) :-
        City5 = "Умань"; City4 = "Краматорск".

    % Решение задачи.
    solve :-
        Cities = ["Харьков", "Умань", "Полтава", "Славянск", "Краматорск"],
        % Подстановка городов с сопоставлением с детьми.
        % City1 – Алик, City2 – Боря, City3 – Витя, City4 – Лена, City5 – Даша.
        permutation(Cities, [City1, City2, City3, City4, City5]),
        
        % Проверка условий.
        check1(City1, City2),
        check2(City2, City3),
        check3(City3, City4),
        check4(City5, City4),
        
        % Вывод результатов.
        write("Алик - ", City1), nl,
        write("Боря - ", City2), nl,
        write("Витя - ", City3), nl,
        write("Лена - ", City4), nl,
        write("Даша - ", City5), nl.

GOAL
    solve.




