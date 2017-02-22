module Lab2(listnums, listnums2, secondlastlist ) where
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

myunion :: [Int]->[Int]->[Bool]
myunion (x:xs) (y:ys) = isInList1 x (y:ys) : []
-- TODO ^^^
--[1,2,3][4,5,1]
--[1,2,3][1][4,5,1]