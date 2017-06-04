/*
member(X,[X|_]):-!.
member(X,[_|L]) :- member(X,L).

Отсечение зелёное, процедура без отсчения:

member(X,[X|_]):-true.
member(X,[_|L]) :- member(X,L).

*/
member(X,[X|_]):-true.
member(X,[_|L]) :- member(X,L).

% +
% Написать отношение fib(N,F), которое находит по 
% аргументу N  (номер числа в последовательности) число Фибоначчи F. 
fib(Number, Result) :- 
(
    Number < 1,
    write(error),
    !
);
(
    Number < 3,
    Result = 1,
    !
);
(
    Number > 2,
    fib(Number - 1, Previous),
    fib(Number - 2, Previous2),
    Result is Previous + Previous2,
    !
).

% +
% 4.5. #3
% Построить бесповторный упорядоченный список L3, состоящий из всех элементов,
% содержащихся как в списке L1, так и в списке L2.
% Должно давать только одно решение!!!
common(L1, L2, L3) :-
    append(L1, L2, Union),
    distinct(Union, WithoutDuplicates),
    sort(WithoutDuplicates, L3),
    !.

distinct([], Result) :- append([], [], Result).
distinct([H|T], Result) :-
    distinct(T, Temp),
    appendIfHasNo(H, Temp, Result),
    !.

appendIfHasNo(Added, List, Result) :-
(
	member(Added, List),
	append(List, [], Result),
	!
);
(
	append(List, [Added], Result),
	!
).

% +
% ? 
sort_3 :-
    format("list? "),
    read(Input),
    format("answer: "),
    sortn(Input, Output),
    write(Output).

% +
% Метод наивной сортировки
sort_4_1 :-
    format("list? "),
    read(Input),
    format("answer: "),
    sortn(Input, Output),
    write(Output).

permutation(L, [H|T]) :-
    append(V, [H|U], L),
    append(V, U, W),
    permutation(W, T).
permutation([], []).

order(X, Y) :- X =< Y.
sorted([_]).
sorted([X,Y|T]) :- order(X,Y), sorted([Y|T]). 
sortn(L1, L2) :- permutation(L1, L2), sorted(L2),!.

% +
% Метод пузырька (назвать правило sort_4_2).  
sort_4_2 :-
    format("list? "),
    read(Input),
    format("answer: "),
    busort(Input, Output),
    write(Output).

busort(L, S) :- swap(L, M), !, busort(M, S).
busort(L, L) :- !.
swap([X, Y|R], [Y, X|R]) :- order(Y, X).
swap([X|R], [X|R1]) :- swap(R, R1).

% +
% Mетод вставки (назвать правило sort_4_3).
sort_4_3 :-
    format("list? "),
    read(Input),
    format("answer: "),
    insort(Input, Output),
    write(Output).

insort([], []).
insort([X|L], M) :- insort(L, N), insortx(X, N, M).
insortx(X, [A|L], [A|M]) :- order(A, X), !, insortx(X, L, M).
insortx(X, L, [X|L]).

% +
% Быстрая сортировка quick (назвать правило sort_4_4).
sort_4_4 :-
    format("list? "),
    read(Input),
    format("answer: "),
	qsort(Input, Output),
    write(Output).

qsort([], []) :- !.
qsort([H|Tail], S) :- 
	split(H, Tail, Small, Big),
	qsort(Small, Small1),
	qsort(Big, Big1),
	append(Small1, [H|Big1], S),
	!.

split(H, [A|Tail], [A|Small], Big) :- order(A, H), !, split(H, Tail, Small, Big), !.
split(H, [A|Tail], Small, [A|Big]) :- split(H, Tail, Small, Big), !.
split(_, [], [], []) :- !. 
   

    
% +
% Определить самый распространенный элемент X в списке L.
% Если в списке несколько самых распространенных элементов,
% то ответ надо сделать в виде списка из самых распространенных элементов.

most_oft(List, Result) :-
    buildFrequencyList(List, Elements, Frequency),    
    max(Frequency, Mode),
    buildMostOftList(Elements, Frequency, Mode, Result).

buildFrequencyList(List, Elements, Frequency) :-
    countUpFreqImpl(List, [], [], Elements, Frequency).


countUpFreqImpl([], SourceEl, SourceFr, Elements, Frequency) :-
    append(SourceEl,[], Elements),
    append(SourceFr,[], Frequency),
    !.
countUpFreqImpl(
	[H|T], 
	SourceEl, SourceFr, 
	Elements, Frequency
) :-
(
	emplaceFreq(
		H, 
		SourceEl, SourceFr,
		TailElements, TailFrequency
	),
	countUpFreqImpl(
		T, 
		TailElements, TailFrequency, 
		TTEl, TTFr
	),
	append(TTEl, [], Elements),
	append(TTFr, [], Frequency),
	!
).
   
emplaceFreq(X, [], [], Elements, Frequencies) :-
    append([], [X], Elements),
    append([], [1], Frequencies),
    !.
emplaceFreq(
	X,
	[ElementsHead|ElementsTail],
	[FrequencyHead|FrequencyTail],
	Elements,
	Frequencies
) :-
(
    X == ElementsHead,
    IncrementHead is FrequencyHead + 1,
    append([ElementsHead|ElementsTail], [], Elements),
    append([IncrementHead|FrequencyTail], [], Frequencies),
    !
);
(
    emplaceFreq(X, ElementsTail, FrequencyTail, TailElements, TailFrequency),
    append([ElementsHead], TailElements, Elements),
    append([FrequencyHead], TailFrequency, Frequencies),
    !
).
   
max([Max],Max).
max([H|Tail],H):-max(Tail,M),H>M,!.
max([_|Tail],M):-max(Tail,M).

buildMostOftList([],[],_,Result) :- append([],[], Result),!.
buildMostOftList(
	[ElementsHead|ElementsTail],
	[FrequencyHead|FrequencyTail],
	Mode,
	Result
) :-
buildMostOftList(ElementsTail, FrequencyTail, Mode, TailResult),
(
    (
        FrequencyHead == Mode,
        append([ElementsHead], TailResult, Result),
        !
    );
    (
        append([], TailResult, Result),
        !
    )
).