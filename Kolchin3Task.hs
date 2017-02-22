module Lab2(listnums, listnums2) where
{- 1 task -}
listnums :: Int->[Int]
listnums 0 = []
listnums n = n : listnums(n-1)
{- not recursive -}
listnums2 :: Int->[Int]
listnums2 n = reverse [1..n]
{- 1 task -}
