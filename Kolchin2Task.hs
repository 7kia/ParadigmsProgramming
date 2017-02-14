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