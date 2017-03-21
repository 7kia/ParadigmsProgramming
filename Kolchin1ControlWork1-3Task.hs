-- 1 task
task1 = sum [x | x <- [1..999], (x `mod` 3 == 0) ||  (x `mod` 5 == 0)]

-- 2 task
threeNumbers = head [(a,b,c) | a <-[1..1000], b <- [1..1000], c <- [1..1000], a<b, b<c, (a+b+c) == 1000, ((a^2)+(b^2))==(c^2)]

-- 3 task
myTranspose :: Num a => [[a]] -> [[a]]
myTranspose [[]]    = []
myTranspose [[], _] = []
myTranspose rows    = (map head rows) : myTranspose (map tail rows)
