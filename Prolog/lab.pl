parent(bill, joe).
parent(sue, joe).
parent(bill, ann).
parent(sue, ann).
parent(joe, tammy).
parent(paul, jim).
parent(mary, jim).
parent(ann, bob).
parent(jim, bob).
male(bill).
male(joe).
male(paul).
male(jim).
male(bob).
female(sue).
female(ann).
female(tammy).
female(mary).

different(X,Y):-X \= Y.
grandmother(Y, X):-parent(Z, X),parent(Y, Z),female(Y).
grandson(Y, X):-parent(X, Z),parent(Z, Y),male(Y).
sister(X, Y):-parent(Z, X), parent(Z, Y), female(X), different(X, Y).
aunt(X, Y):-sister(X,Z), parent(Z,Y).
brotherOrSister(X, Y):-parent(Z, X), parent(Z, Y), different(X, Y).
cousin(X, Y):-parent(Z, X), parent(A, Y), brotherOrSister(Z, A).

likes(ellen, reading).
likes(john, computers).
likes(john, badminton).
likes(john, photo).
likes(john, reading).
likes(leonard, badminton).
likes(eric, swimming).
likes(eric, reading).
likes(eric, chess).
likes(paul, swimming).

likes(X,A1), likes(X,A2), likes(X,A3), likes(X,A4), different(A1, A2),different(A1, A3),different(A1, A4), different(A2, A3), different(A2, A4), different(A3, A4)

likes(A1, X), likes(A2, X), different(A1,A2)
