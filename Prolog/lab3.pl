getTail([_|Tail], L) :-
    append(Tail, [], L).
    
trim(Source, Result) :-
length(Source, Length),
(
	(
		Length > 2,
		getTail(Source, ListWithoutHead),
		reverse(ListWithoutHead, ReverseList),
		getTail(ReverseList, ReverseListWithoutHead),
		reverse(ReverseListWithoutHead, Result)
	);
	(
		Length < 3, append([],[], Result)
	)
).

first([First|_], Result) :- Result = First.

first_last(Source, Result) :-
	length(Source, Length),
	(
		(
			Length > 1,
			first(Source, Head),
			last(Source, Last),
			trim(Source, Middle),
			append([], [Last], L1),
			append(L1, Middle, L2),
			append(L2, [Head], Result)
		);
		(
			Length < 2,
			append(Source, [], Result)
		)    
	).

total([], X) :- X = 0,!.
total([Head], X) :- X = Head,!.
total([Head|Tail], X) :- total(Tail, Y), X is Head * Y,!.

place(X, [], L) :- append([], [X], L).
place(X,[Head|Tail],L) :-
	append([X], [Head|Tail], L);
	(
		place(X, Tail, L1),
		append([Head], L1, L)
	).

double([], Result) :- append([], [], Result), !.
double([Head], Result) :- append([], [Head], L1), append(L1, [Head], Result).
double([Head|Tail], Result) :- 
    double([Head], HeadList),
    double(Tail, TailList),
    append(HeadList, TailList, Result),
    !.

splitOdd([], L) :- append([],[],L).    
splitOdd([Head|Tail], L) :-
    splitOdd(Tail, L1), Mod is Head mod 2,
    (
        (
            Mod == 1, append([Head], L1, L)
        );
        (
            Mod == 0, append([], L1, L)
        )
    ).

splitEven([], L) :- append([],[],L).    
splitEven([Head|Tail], L) :-
    splitEven(Tail, L1), Mod is Head mod 2,
    (
        (
            Mod == 0, append([Head], L1, L)
        );
        (
            Mod == 1, append([], L1, L)
        )
    ).    

splitImpl(L, EvenList, OddList) :-
		splitEven(L, EvenList),
        splitOdd(L, OddList).
 
split(L, EvenList, OddList) :-
    reverse(L, ReverseList), splitImpl(ReverseList, EvenList, OddList).

repeat_back3(Source, Result) :-
    trim(Source, Trimmed),
    first(Source, Head),
    last(Source, Last),
    append([], [Last, Last, Last], NewHead),
    append(NewHead, Trimmed, L1),
    append(L1, [Head, Head, Head], Result).
    
combi([], [], Result) :- append([], [], Result).
combi([], [Head|Tail], Result) :- append([], [Head|Tail], Result).
combi([Head|Tail], [], Result) :- append([], [Head|Tail], Result).
combi([Head1|Tail1], [Head2|Tail2], Result) :-
    combi(Tail1, Tail2, L1),
    append([Head1, Head2], L1, Result).
