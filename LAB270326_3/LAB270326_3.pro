% Êóøåâ Àëåêñàíäð ÁÀÑ-2
% Ëàáîðàòîðíàÿ ðàáîòà ¹5 (Çàäàíèå ¹3)

DOMAINS
    number = integer
    list = number*

PREDICATES
    nondeterm start()
    nondeterm get_numbers(number, list)
    nondeterm get_next_number(number, number, list, list)
    nondeterm is_subset(list, list)
    nondeterm member(number, list)
    nondeterm check_subset_relation(list, list)

CLAUSES
    % Îñíîâíîé ïðåäèêàò ïðîãðàììû
    result() :-
        write("(Ñïèñîê ¹1) "),
        write("Ââåäèòå êîëè÷åñòâî ýëåìåíòîâ ñïèñêà: "),
        readint(Count1),
        get_numbers(Count1, List1),

        write("(Ñïèñîê ¹2) "),
        write("Ââåäèòå êîëè÷åñòâî ýëåìåíòîâ ñïèñêà: "),
        readint(Count2),
        get_numbers(Count2, List2),

        check_subset_relation(List1, List2).

    % Ôîðìèðîâàíèå ñïèñêà ÷èñåë
    get_numbers(Count, NumberList) :-
        get_next_number(Count, 1, [], NumberList).

    % Ðåêóðñèâíûé ââîä ÷èñåë ñ íàêîïëåíèåì â ñïèñîê
    get_next_number(TotalCount, CurrentIndex, Acc, Result) :-
        CurrentIndex <= TotalCount, !,
        write("Ââåäèòå ÷èñëî ¹"), write(CurrentIndex), write(": "),
        readint(Number),
        NewAcc = [Number | Acc],
        NextIndex = CurrentIndex + 1,
        get_next_number(TotalCount, NextIndex, NewAcc, Result).
        
    get_next_number(_, _, Acc, Acc).

    % Ïðîâåðêà îòíîøåíèÿ ñïèñêîâ è âûâîä ðåçóëüòàòà
    check_subset_relation(List1, List2) :-
        is_subset(List1, List2), !,
        write("Ñïèñîê ¹1 ÿâëÿåòñÿ ïîäìíîæåñòâîì ñïèñêà ¹2.\n").
    check_subset_relation(List1, List2) :-
        is_subset(List2, List1), !,
        write("Ñïèñîê ¹2 ÿâëÿåòñÿ ïîäìíîæåñòâîì ñïèñêà ¹1.\n").
    check_subset_relation(_, _) :-
        write("Íè îäèí ñïèñîê íå ÿâëÿåòñÿ ïîäìíîæåñòâîì äðóãîãî.\n").

    % Ïðîâåðêà, ÿâëÿåòñÿ ëè ïåðâûé ñïèñîê ïîäìíîæåñòâîì âòîðîãî
    is_subset([], _) :- !.
    is_subset([Head | Tail], Set) :-
        member(Head, Set),
        is_subset(Tail, Set).

    % Ïðîâåðêà ïðèíàäëåæíîñòè ýëåìåíòà ñïèñêó
    member(X, [X | _]) :- !.
    member(X, [_ | Tail]) :-
        member(X, Tail).

GOAL
    start().








