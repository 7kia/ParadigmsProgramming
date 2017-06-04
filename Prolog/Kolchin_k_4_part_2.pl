wine('Шардане'):-
	positive('белое'),
	positive('отечественное'),
	negative('дорогое'),
	negative('подарочное').

wine('Сотерн'):-
	positive('белое'),
	positive('подарочное'),
	positive('дорогое'),
	negative('отечественное').

wine('Ореанда'):-
	positive('белое'),
	positive('отечественное'),
	negative('дорогое'),
	negative('подарочное').

wine('Рислинг'):-
	positive('белое'),
	negative('подарочное'),
	negative('дорогое'),
	negative('отечественное').

wine('VinaSol'):-
	positive('белое'),
	positive('подарочное'),
	positive('ограниченный тираж'),
	positive('большая выдержка'),
	positive('дорогое'),
	negative('отечественное').

wine('Мерло'):-
	positive('ограниченный тираж'),
	positive('большая выдержка'),
	negative('белое'),
	negative('подарочное'),
	negative('дорогое'),
	negative('отечественное').

wine('Мадера'):-
	negative('белое'),
	positive('отечественное'),
	positive('дорогое'),
	positive('подарочное').

wine('Кьяти'):-
	negative('белое'),
	positive('большая выдержка'),
	negative('отечественное'),
	negative('дорогое'),
	negative('подарочное').

wine('Frontera'):-
	negative('белое'),
	positive('большая выдержка'),
	positive('ограниченный тираж'),
	positive('подарочное'),
	positive('дорогое'),
	negative('отечественное').

wine('Нужное вино отсутствует в базе данных ...').

%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
% работа с динамической базой данных
  positive(X):-xpositive(X),!; xnegative(X),!,fail; ask(X,'y').
  negative(X):-xnegative(X),!; xpositive(X),!,fail; ask(X,'n').
  ask(X,R):-write(X),write('  ?  : '),read(Reply),write(Reply),nl,
            remember(X,Reply),R=Reply.
% проверка присутствия фактов в динамической базе данных
  xpositive(X):-yes(X);maybe(X).
  xnegative(X):-no(X);maybe(X).
% запоминаем факт в динамической базе данных
  remember(X,'y'):-asserta(yes(X)).
  remember(X,'n'):-assertz(no(X)).
  remember(X,'q'):-asserta(maybe(X)).
% очищаем память от фактов динамической базы данных
delete_all:-retract(yes(_)),delete_all.
delete_all:-retract(no(_)),delete_all.
delete_all:-retract(maybe(_)),delete_all.
delete_all.
%-----------------------------------------------------------------------------
 

 run:-delete_all,
       write('На вопросы отвечать (y-да, n-нет, q-не знаю).'),nl,
       wine(X),
       write('Можем предложить : '),write(X),nl.