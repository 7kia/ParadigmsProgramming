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

surname(kyznitsov).
surname(slesarev).
surname(rezchikov).
surname(tokarev).

profesion(kyznits).
profesion(slesar).
profesion(rezchik).
profesion(tokar).

opposite(kyznitsov, slesar).
opposite(rezchikov, rezchik).
right(slesarev, tokar).

notHaveProfession(kyznitsov, kyznits).
notHaveProfession(kyznitsov, slesar).

notHaveProfession(slesarev, slesar).
notHaveProfession(slesarev, tokar).

notHaveProfession(rezchikov, rezchik).

notHaveProfession(tokarev, tokar).

exactlyNotHaveProfession(kyznitsov, kyznits).
exactlyNotHaveProfession(slesarev, slesar).
exactlyNotHaveProfession(rezchikov, rezchik).
exactlyNotHaveProfession(tokarev, tokar).

findProfessionForOpposite(Name, SearchProfession):-
	(
		opposite(Name, SearchProfession)
	);
	(
		(
			opposite(Name, Prof_1),
			opposite(Name_2, Prof_2)
		);
		(
		)
	).

searchProfession(Name, Profession):-
(
	(
		opposite(Name, Profession)
	);
	(
		opposite(Name_1, Prof_1),
		not(notHaveProfession(Name, Prof_1)),
		assert(haveProfession(Name, Prof_1)),
		Profession = Prof_1,
		assert(
			notHaveProfession(
				Name, 
				arg(
					2,
					exactlyNotHaveProfession(Name_1, _),
					Name_prof_1
				)
			)
		),
		assert(
			left(
				Name_1,
				arg(
					2,
					right(Name, _),
					Name_prof_2
				)
			)
		),
	)
).

searchName(Profession):-
(
	(
	);
	(
	)
).

main(Argv) :-
        searchProfession(slesarev),
		searchProfession(rezchikov)
		.


haveProfession(Name, Profession):-
	notHaveProfession(Name_1, Profession),
	notHaveProfession(Name_2, Profession),
	notHaveProfession(Name_3, Profession),
	not(notHaveProfession(Name, Profession)),
	surname(Name_1), surname(Name_2), surname(Name_3), 
    Name \= Name_1, Name \= Name_2, Name \= Name_3,
    Name_1 \= Name_2, Name_1 \= Name_3,
    Name_2 \= Name_3.

leftOrRight(Name, Profession):-
	opposite(Name_1, Prof_1),
	opposite(Name_2, Prof_2),	
	opposite(Name_3, Profession).

findProfessions(A):-haveProfession(Name,Profession),
	assert(notHaveProfession(Name, Prof_1)), 
	assert(notHaveProfession(Name, Prof_2)), 
	assert(notHaveProfession(Name, Prof_3)),
    Profession \= Prof_1, Profession \= Prof_2, Profession \= Prof_3,
    Prof_1 \= Prof_2, Prof_1 \= Prof_3,
    Prof_2 \= Prof_3.

	