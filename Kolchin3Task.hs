module Lab2(listnums, listnums2, secondlastlist) where
{- 1 task -}
listnums :: Int->[Int]
listnums 0 = []
listnums n = n : listnums(n-1)
{- not recursive -}
listnums2 :: Int->[Int]
listnums2 n = reverse [1..n]
{- 2 task -}
secondlastlist :: [[a]]->[a]
secondlastlist [] = []
secondlastlist (x:xs) = last x : secondlastlist xs
{- 3 task -}
-- TODO : concre type
isInList1 :: Int->[Int]->Bool
isInList1 a (x:xs) = if a == x then True
else isInList1 a xs
isInList1 a [] = False

isInList2 :: [Int]->[Int]->[Bool]
isInList2 [] _ = []
isInList2 (a:as) (x:xs) = isInList1 a (x:xs) : isInList2 as (x:xs)

extractElement :: (Bool, Int)->[Int]
extractElement (contain, number) = if contain == True 
then [number]
else []

extractElements :: [(Bool, Int)]->[Int]
extractElements [] = []
extractElements (x:xs) = extractElement x ++ extractElements xs

myunion :: [Int]->[Int]->[Bool]
myunion [] _ = []
myunion (x:xs) (y:ys) = isInList2 (x:xs) (y:ys)
-- TODO ^^^