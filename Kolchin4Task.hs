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
isSpace
-}
myIsSpace :: Char -> Bool
myIsSpace s = if s `elem` ['\t', '\n', '\r', ' ', '\v', '\f'] then True else False
{- 2 task 
isOctDigit
-}
myIsOctDigit :: Char -> Bool
myIsOctDigit s = if s `elem` ['0'..'7'] then True else False
{- 3 task
isPrint
-}
myIsPrint :: Char -> Bool
myIsPrint s = True
{- 4 task
isSeparator
-}
myIsSeparator :: Char -> Bool
myIsSeparator s = if s `elem` ['\n', '\r', ' '] then True else False
{- 5 task
digitToInt 
-}
myDigitToInt :: Char -> Int
myDigitToInt s = if s `elem` ['0'..'9'] ++ ['a'..'f'] then (ord s) - (ord '0')
else -1