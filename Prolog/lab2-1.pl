seg(1,point(1,11),point(14,11)).
seg(2,point(2,4),point(13,4)).
seg(3,point(2,2),point(9,2)).
seg(4,point(3,1),point(3,10)).
seg(5,point(7,10),point(13,10)).
seg(6,point(8,0),point(8,13)).
seg(7,point(10,3),point(10,12)).
seg(8,point(11,3),point(11,13)).
seg(9,point(12,2),point(12,12)).

vertical(N) :- seg(N, point(X1, _), point(X2, _)), X1 = X2.
horiz(N) :- seg(N, point(_, Y1), point(_, Y2)), Y1 = Y2.

cross(LINE1,LINE2,point(X,Y),LINE1LEN,LINE2LEN):-
	seg(LINE1, point(X3, Y3), point(X4, Y4)),
    seg(LINE2, point(X1, Y1), point(X2, _)),
    Y3 =< Y1, Y1 =< Y4, 
    X1 =< X3, X3 =< X2,
    X is X3, Y is Y1,
	LINE1 \= LINE2,
    LINE1LEN is Y4 - Y3,
    LINE2LEN is X2 - X1.

perimetr(N1, N2, N3, N4, P, S) :-
    cross(N1, N2, point(X1, Y1), _, _),
    cross(N1, N4, point(_, _), _, _),
    cross(N3, N2, point(_, _), _, _),
    cross(N3, N4, point(X2, Y2), _, _),
    P is ((Y2 - Y1) + (X2 - X1)) * 2,
    S is ((Y2 - Y1) * (X2 - X1)),
	Y2 > Y1, X2 > X1,
    N1 \= N2, N1 \= N3, N1 \= N4,
    N2 \= N3, N2 \= N4,
    N3 \= N4.