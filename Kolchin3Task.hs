module Lab3(listnums, secondlastlist, myunion, mysubst, fiveFunc) where
{- 1 task -}
listnums :: Int->[Int]
listnums 0 = []
listnums n = n : listnums(n-1)
{- 2 task -}
secondlastlist :: [[a]]->[a]
secondlastlist [] = []
secondlastlist (x:xs) = last x : secondlastlist xs
{- 3 task -}
isInList1 :: Eq a => a->[a]->Bool
isInList1 a (x:xs) = if a == x then True
else isInList1 a xs
isInList1 a [] = False

isInList2 :: Eq a => [a]->[a]->[Bool]
isInList2 [] _ = []
isInList2 (a:as) (x:xs) = isInList1 a (x:xs) : isInList2 as (x:xs)

extractElement :: Eq a => (Bool, a)->[a]
extractElement (contain, number) = if contain == True 
then [number]
else []

extractElements :: Eq a => [(Bool, a)]->[a]
extractElements [] = []
extractElements (x:xs) = extractElement x ++ extractElements xs

myunion :: Eq a => [a]->[a]->[a]
myunion [] _ = []
myunion (x:xs) (y:ys) = extractElements (zip (isInList2 (x:xs) (y:ys)) (x:xs))
{- 4 task -}
extractElement2 :: Eq a => (Bool, a)->[a]
extractElement2 (contain, number) = if contain == False 
then [number]
else []

extractElements2 :: Eq a => [(Bool, a)]->[a]
extractElements2 [] = []
extractElements2 (x:xs) = extractElement2 x ++ extractElements2 xs

mysubst :: Eq a => [a]->[a]->[a]
mysubst [] _ = []
mysubst (x:xs) (y:ys) = extractElements2 (zip (isInList2 (x:xs) (y:ys)) (x:xs))
{- 5 task -}
fiveFunc :: [[a]]->Int->[a]
fiveFunc (x:xs) pos = map (!! pos) (x:xs)