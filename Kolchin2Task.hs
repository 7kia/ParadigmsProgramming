{- 1 task -}
oddEven :: [Int] -> [Int]
oddEven []       = []
oddEven [x]      = [x]
oddEven (x:y:xs) = y:x:oddEven  xs
{- 2 task -}
insert :: ([Int],Int,Int) -> [Int]
insert (list, atom, position) = (take position list) ++ [atom] ++ (drop (position) list)
{- 3 task -}
listSumm :: Num a => [a] -> [a] -> [a]
listSumm (x:xs) [] = (x:xs)
listSumm [](x:xs) = (x:xs)
listSumm [][] = []
listSumm (x:xs) (y:ys) = (x + y) : listSumm xs ys
{- 4 task -}
position :: [Int]->Int->Int
position (x:xs) atom = if x == atom 
then 0 
else (position xs atom) + 1

position [] atom = 0
{- 5 task -}
func1 :: Int->Int
func1 amount = sum [1..amount]
{- 6 task -}
func2 :: Int->Int
func2 amount = sum [amount - x| x<-[1..amount] ]
{- second variant 6 -}
func22 :: Int->Int
func22 amount = func1 amount - amount