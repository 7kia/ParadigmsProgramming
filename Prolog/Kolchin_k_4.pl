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

nameHavePlace(slesarev).
nameNotHavePlace(kyznitsov).
nameNotHavePlace(tokarev).
nameNotHavePlace(rezchikov).


professionHavePlace(tokar).
professionNotHavePlace(rezchik).
professionNotHavePlace(slesar).
professionNotHavePlace(kyznits).

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
			professionHavePlace(Prof_1)
		),
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
		assert(
			oppositeNames(Name, Name_1)
		),
		assert(
			oppositeNames(Name_1, Name)
		),
		assert(
			nameHavePlace(Name_1)
		),
		recract(
			nameNotHavePlace(Name_1)
		),
		assert(
			professionHavePlace(Profession)
		),
		retract(
			professionNotHavePlace(Profession)
		)
	)
).

searchName(Profession, Name):-
(
	(
		haveProfession(Name, Profession)
	);
	(
		opposite(Name_1, Prof_1), Prof_1 \= Profession,
		not(oppositeNames(Name_1, _)),
		assert(
			haveProfession(Name_1, Profession)
		),
		assert(
			left(
				arg(1, right(Name_2, Profession), _)
				Profession
			)
		),
		assert(
			right(
				arg(1, left(Name_3, Profession), _)
				Profession
			)
		),
		assert(
			nameHavePlace(Name_1)
		),
		retract(
			nameNotHavePlace(Profession).
		)
		assert(
			professionHavePlace(Profession)
		),
		retract(
			professionNotHavePlace(Profession)
		),
		assert(
			professionHavePlace(Prof_1)
		),
		retract(
			professionNotHavePlace(Prof_1)
		),
		Name = Name_1
	)
).

getLeftK(R) :-
        searchProfession(slesarev, Prof_1_),
		searchName(tokar, Name_1_),

		LastNotPlaceName = nameNotHavePlace(surname(_)),
		asserr(
			nameHavePlace(
				LastNotPlaceName
			)
		),
		assert(
			opposite(LastNotPlaceName, tokar)
		),
		assert(
			haveProfession(LastNotPlaceName, arg(2, opposite(Name_1_, Prof_2), _))
		),

		LastNotPlaceProfession = professionNotHavePlace(profession(_)),
		assert(
			opposite(slesarev, LastNotPlaceProfession)
		),
		slesarevOpposite = arg(
			1,
			opposite(_, Prof_1_),
			_
		),
		assert(
			haveProfession(
				slesarevOpposite, 
				LastNotPlaceProfession
			)
		),
		assert(
			professionHavePlace(LastNotPlaceProfession)
		),
		rectract(
			professionNotHavePlace(LastNotPlaceProfession)
		),
		// свяжи лево и право для кузнеца



		R = 
		arg(
			1,
			haveProfession(
				_,
				arg(
					2,
					left(slesarev, _),
					Prof_3
				)
			),
			R
		)
		

		.

	