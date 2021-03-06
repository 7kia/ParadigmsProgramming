module Lab2(oddEven, insert, listSumm, position, func1, func2, func22) where
{- 1 task -}
oddEven :: [a] -> [a]
oddEven []       = []
oddEven [x]      = [x]
oddEven (x:y:xs) = y:x:oddEven  xs
{- 2 task -}
insert :: [a]->a->Int->[a]
insert list atom position = (take position list) ++ [atom] ++ (drop (position) list)
{- 3 task -}
listSumm :: Num a => [a] -> [a] -> [a]
listSumm (x:xs) [] = (x:xs)
listSumm [](x:xs) = (x:xs)
listSumm [][] = []
listSumm (x:xs) (y:ys) = (x + y) : listSumm xs ys
{- 4 task -}
position :: Eq a => [a]-> a -> Int

position list element = funcPos 0
                        where funcPos pos | (pos >= (length list)) = -1
                                       | ((list !! pos) == element) = pos
                                       | otherwise = funcPos (pos + 1)
{- 5 task -}
func1 :: Int->Int
func1 amount = sum [1..amount]
{- 6 task -}
func2 :: Int->Int
func2 amount = sum [amount - x| x<-[1..amount] ]
{- second variant 6 -}
func22 :: Int->Int
func22 amount = func1 amount - amount