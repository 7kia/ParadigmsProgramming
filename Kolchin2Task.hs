{- 1 task -}
oddEven :: [Int] -> [Int]
oddEven []       = []
oddEven [x]      = [x]
oddEven (x:y:xs) = y:x:oddEven  xs
{- 2 task -}
insert :: ([Int],Int,Int) -> [Int]
insert (list, atom, position) = (take position list) ++ [atom] ++ (drop (position) list)
{- 3 task -}
listSumm :: [Int]->[Int]->[Int]
listSumm first second = [x | x<-(head first) + (head second),
 length first > 0,
 length second > 0, 
first = drop 1 first,
 second = drop 1 second]