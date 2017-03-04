module Lab4MyDataChar(myIsSpace, myIsOctDigit, myIsPrint, myIsSeparator, myDigitToInt) where

import Data.Char
import Control.Exception
{- for test

map <Function> (map chr [0..256])

getListCorrespond (map isSpace (map chr [0..256])) (map myIsSpace (map chr [0..256]))
filter isNotCorrespond (getListCorrespond (map <function> (map chr [0..256])) (map <myFunction> (map chr [0..256])))

-}
getListCorrespond :: [Bool]->[Bool]->[((Bool, Bool), Char)]
getListCorrespond (x:xs) (y:ys) =  zip (zip (x:xs) (y:ys)) ['\0'..]

isNotCorrespond :: ((Bool, Bool), Char)->Bool
isNotCorrespond ((first, second), symbol) = if first /= second then True else False

getNotCorresponds :: [((Bool, Bool), Char)]->[((Bool, Bool), Char)]
getNotCorresponds list = filter isNotCorrespond list 
{- 1 task 
isSpace + test done
-}
myIsSpace :: Char -> Bool
myIsSpace s = if s `elem` ['\t', '\n', '\r', ' ', '\v', '\f'] then True else False
{- 2 task 
isOctDigit + test done
-}
myIsOctDigit :: Char -> Bool
myIsOctDigit s = if s `elem` ['0'..'7'] then True else False
{- 3 task
isPrint + test done
-}
myIsPrint :: Char -> Bool
myIsPrint s = if s `elem` ['\160'..'\172'] ++ ['\174'..'\256'] ++ [' '..'~'] then True else False
{- 4 task
isSeparator  + test done
-}
myIsSeparator :: Char -> Bool
myIsSeparator s = if s `elem` ['\160', ' '] then True else False
{- 5 task
digitToInt + test done

map digitToInt (['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F'])
map myDigitToInt (['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F'])

-}
myDigitToInt :: Char -> Int
myDigitToInt s = if s `elem` ['0'..'9'] then (ord s) - (ord '0')
else if toLower(s) `elem` ['a'..'f'] then (ord (toLower(s))) - (ord 'a') + 10
else -1