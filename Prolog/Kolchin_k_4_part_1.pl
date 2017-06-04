/*
Вариант №4
1.	Четыре человека играют в домино. Их фамилии Кузнецов, Токарев, Слесарев и Резчиков. 
Профессия каждого игрока соответствует фамилии одного из других игроков. 
Напротив Кузнецова сидит слесарь.
Напротив Резчикова сидит резчик.
Справа от Слесарева сидит токарь.
Кто сидит слева от кузнеца?
2.	Выбор сорта вина для заданного набора блюд.
*/

opposite(A, B, [_, A, _, B]).
opposite(A, B, [_, B, _, A]).
opposite(A, B, [A, _, B, _]).
opposite(A, B, [B, _, A, _]).

leftTo(A, B, [A, B, _, _]).
leftTo(A, B, [_, A, B, _]).
leftTo(A, B, [_, _, A, B]).
leftTo(A, B, [B, _, _, A]).

rightTo(A, B, List) :- leftTo(B, A, List).

solution(Result, PlayerList, KuznetsName, RezchikName, SlesarName):-
	permutation(['kuznecov', 'tokarev', 'slesarev', 'rezchikov'], [Name_1, Name_2, Name_3, Name_4]),
	permutation(['kuznec', 'tokar', 'slesar', 'rezchik'], [Prof_1, Prof_2, Prof_3, Prof_4]),
	PlayerList = [
		player(Name_1, Prof_1),
		player(Name_2, Prof_2),
		player(Name_3, Prof_3),
		player(Name_4, Prof_4)
	],

	% Подбираем данные под факт "Напротив Кузнецова сидит слесарь"
	member(player(KuznetsName, 'kuznec'), PlayerList),
	not(KuznetsName = 'kuznecov'),
	member(player(SlesarName, 'slesar'), PlayerList),
	not(SlesarName = 'slesarev'),
	opposite('kuznecov', SlesarName, [Name_1, Name_2, Name_3, Name_4]),

	% Подбираем данные под факт "Справа от Слесарева сидит токарь"
	member(player(TokarName, 'tokar'), PlayerList),
	not(TokarName = 'tokarev'),
	rightTo('slesarev', TokarName, [Name_1, Name_2, Name_3, Name_4]),

	% Подбираем данные под факт "Напротив Резчикова сидит резчик"
	member(player(RezchikName, 'rezchik'), PlayerList),
	not(RezchikName = 'rezchikov'),
	opposite('rezchikov', RezchikName, [Name_1, Name_2, Name_3, Name_4]),

	leftTo(KuznetsName, Result, [Name_1, Name_2, Name_3, Name_4]).