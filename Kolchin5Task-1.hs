getMultiplicityElements :: Int -> Int -> Int -> [Int]
getMultiplicityElements startValue amount multiplicity = [ x | x <- [startValue..(startValue + (amount - 1) * multiplicity)],
 ((x `mod` multiplicity) == 0) ]

main = do
putStrLn "Введите начальное значение, количество элементов, кратность."
putStrLn "Начальное значение = "
startValue <- getLine
putStrLn "Количество = "
amount <- getLine
putStrLn "Кратность ="
multiplicity <- getLine
print (getMultiplicityElements (read startValue) (read amount) (read multiplicity))
