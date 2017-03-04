module Lab4MyDataChar(myIsSpace, myIsOctDigit, myIsPrint, myIsSeparator, myDigitToInt) where

import Data.Char
{- for test
map <Function> (map chr [0..256])

getListCorrespond (map isSpace (map chr [0..256])) (map myIsSpace (map chr [0..256]))
filter isNotCorrespond (getListCorrespond (map <function> (map chr [0..256])) (map <myFunction> (map chr [0..256])))
-}
getListCorrespond :: [Bool]->[Bool]->[((Bool, Bool), Char)]
getListCorrespond (x:xs) (y:ys) =  zip (zip (x:xs) (y:ys)) ['\0'..]

isNotCorrespond :: ((Bool, Bool), Char)->Bool
isNotCorrespond ((first, second), symbol) = if first /= second then True else False
{- 1 task 
isSpace 
Тип :: Char -> Bool
Описание : Проверяет является символ пробельным(пробелы, табуляции, символ конца строки и т.д)
-}
myIsSpace :: Char -> Bool
myIsSpace s = if s `elem` ['\t', '\n', '\r', ' ', '\v', '\f'] then True else False

{- Right tests
isSpace ' '
myIsSpace ' '

isSpace '\n'
myIsSpace '\n'

isSpace '\t'
myIsSpace '\t'
-}
{- Not right tests
isSpace 'a'
myIsSpace 'a'

isSpace '\0'
myIsSpace '\0'

isSpace '1'
myIsSpace '1'
-}


{- 2 task 
isOctDigit
Тип :: Char -> Bool
Описание : Проверяет является символ восьмеричным числом
-}
myIsOctDigit :: Char -> Bool
myIsOctDigit s = if s `elem` ['0'..'7'] then True else False

{- Right tests
isOctDigit '0'
myIsOctDigit '0'

isOctDigit '7'
myIsOctDigit '7'

isOctDigit'8'
myIsOctDigit '8'
-}
{- Not right tests
isOctDigit 'a'
myIsOctDigit 'a'

isOctDigit '\0'
myIsOctDigit '\0'

isOctDigit 'z'
myIsOctDigit 'z'
-}

{- 3 task
isPrint
Тип :: Char -> Bool
Описание : Проверяет является печаемым
-}
myIsPrint :: Char -> Bool
myIsPrint s = if s `elem` ['\160'..'\172'] ++ ['\174'..'\256'] ++ [' '..'~'] then True else False

{- Right tests
isPrint '0'
myIsPrint '0'

isPrint 'a'
myIsPrint 'a'

isPrint '{'
myIsPrint '{'

isPrint '\172'
myIsPrint '\172'

isPrint '\174'
myIsPrint '\174'
-}
{- Not right tests
isPrint '\v'
myIsPrint '\v'

isPrint '\0'
myIsPrint '\0'

isPrint '\173'
myIsPrint '\173'
-}

{- 4 task
isSeparator
Тип :: Char -> Bool
Описание : Проверяет является разделителем(пробел и "а" с чёрточкой наверху)
-}
myIsSeparator :: Char -> Bool
myIsSeparator s = if s `elem` ['\160', ' '] then True else False

{- Right tests
isSeparator ' '
myIsSeparator ' '

isSeparator '\160'
myIsSeparator '\160'
-}
{- Not right tests
isSeparator '\v'
myIsSeparator '\v'

isSeparator '\0'
myIsSeparator '\0'

isSeparator '\173'
myIsSeparator '\173'
-}

{- 5 task
digitToInt 

Тип :: Char -> Int
Описание : Преобразует символ в число, в том и шестнадцатеричное

map digitToInt (['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F']) ==
map myDigitToInt (['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F'])
-}
myDigitToInt :: Char -> Int
myDigitToInt s = if s `elem` ['0'..'9'] then (ord s) - (ord '0')
else if toLower(s) `elem` ['a'..'f'] then (ord (toLower(s))) - (ord 'a') + 10
else -1

{- Right tests
map digitToInt (['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F'])
map myDigitToInt (['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F'])

map digitToInt (['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F']) ==
map myDigitToInt (['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F'])
-}

{- Not right tests
digitToInt '\v' // -1
myDigitToInt '\v' // throw exception

digitToInt '\0' // -1
myDigitToInt '\0' // throw exception

digitToInt '\173' // -1
myDigitToInt '\173' // throw exception
-}