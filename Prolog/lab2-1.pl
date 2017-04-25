seg(1,point(1,11),point(14,11)).
seg(2,point(2,4),point(13,4)).
seg(3,point(2,2),point(9,2)).
seg(4,point(3,1),point(3,10)).
seg(5,point(7,10),point(13,10)).
seg(6,point(8,0),point(8,13)).
seg(7,point(10,3),point(10,12)).
seg(8,point(11,3),point(11,13)).
seg(9,point(12,2),point(12,12)).

horiz(1).
horiz(2).
horiz(3).
horiz(5).

vertical(4).
vertical(6).
vertical(7).
vertical(8).
vertical(9).

perpendicular(X,Y):-horiz(X),vertical(Y).
perpendicular(X,Y):-horiz(Y),vertical(X).

someCoordinate(N,COOR):-horiz(N),seg(N,point(_,COOR),_).
someCoordinate(N,COOR):-vertical(N),seg(N,point(COOR,_),_).
firstCoordinate(N,COOR):-horiz(N),seg(N,point(COOR,_),_).
firstCoordinate(N,COOR):-vertical(N),seg(N,point(_,COOR),_).
secondCoordinate(N,COOR):-horiz(N),seg(N,_,point(COOR,_)).
secondCoordinate(N,COOR):-vertical(N),seg(N,_,point(_,COOR)).

xForFirst(N,COOR):-horiz(N),seg(N,point(COOR,_),_).
xForFirst(N,COOR):-vertical(N),seg(N,point(COOR,_),_).
yForFirst(N,COOR):-horiz(N),seg(N,point(_,COOR),_).
yForFirst(N,COOR):-vertical(N),seg(N,point(_,COOR),_).
xForSecond(N,COOR):-horiz(N),seg(N,_,point(COOR,_)).
xForSecond(N,COOR):-vertical(N),seg(N,_,point(COOR,_)).
yForSecond(N,COOR):-horiz(N),seg(N,_,point(_,COOR)).
yForSecond(N,COOR):-vertical(N),seg(N,_,point(_,COOR)).

interpoint(LINE1,LINE2,point(X,Y)):-horiz(LINE1),vertical(LINE2),someCoordinate(LINE1,Y),someCoordinate(LINE2,X).
interpoint(LINE1,LINE2,point(X,Y)):-horiz(LINE2),vertical(LINE1),someCoordinate(LINE1,X),someCoordinate(LINE2,Y).
len(X,LENGTH):-xForFirst(X,XFOR1),xForSecond(X,XFOR2),
yForFirst(X,YFOR1),yForSecond(X,YFOR2),LENGTH is sqrt((XFOR1 - XFOR2)^2 + (YFOR1 - YFOR2)^2).

crossimpl(LINE1,LINE2,point(X,Y)):-horiz(LINE1),
vertical(LINE2),
interpoint(LINE1,LINE2,point(X,Y)),
firstCoordinate(LINE1,NMI),secondCoordinate(LINE1,NMA),
firstCoordinate(LINE2,MMI),secondCoordinate(LINE2,MMA),
NMI=<X,
X=<NMA,
MMI=<Y,
Y=<MMA.

crossimpl(LINE1,LINE2,point(X,Y)):-vertical(LINE1),
horiz(LINE2),
crossimpl(LINE2,LINE1,point(X,Y)).

cross(LINE1,LINE2,point(X,Y),LINE1LEN,LINE2LEN):-crossimpl(LINE1,LINE2,point(X,Y)),len(LINE1,LINE1LEN),len(LINE2,LINE2LEN).

per_sq_impl(N1,N2,N3,N4,P,S):-N1\=N3,
N2\=N4,
cross(N1,N2,point(N1N2X,N1N2Y),_,_),
cross(N2,N3,_,_,_),
cross(N3,N4,point(N3N4X,N3N4Y),_,_),
cross(N4,N1,_,_,_),
N4X is abs(N1N2X-N3N4X),
N4Y is abs(N1N2Y-N3N4Y),
P is 2*(N4X+N4Y),
S is N4X*N4Y.

perimetr(N1,N2,N3,N4,P,S):-per_sq_impl(N1,N2,N3,N4,P,S).
perimetr(N1,N2,N3,N4,P,S):-per_sq_impl(N1,N2,N4,N3,P,S).
perimetr(N1,N2,N3,N4,P,S):-per_sq_impl(N1,N3,N2,N4,P,S).
