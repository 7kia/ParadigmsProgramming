module Lab4MyDataChar(myIsSpace, myIsOctDigit, myIsPrint, myIsSeparator, myDigitToInt) where

import Data.Char
import Control.Exception
{- for test
map chr [0..256]
-}

getListCorrespond :: [Bool]->[Bool]->[((Bool, Bool), Int)]
getListCorrespond (x:xs) (y:ys) =  zip (zip (x:xs) (y:ys)) [0..]
{- 1 task 
for test
map chr [0..256]
-}
myIsSpace :: Char -> Bool
myIsSpace s = if s `elem` ['\t', '\n', '\r', ' '] then True else False
{- 2 task -}
myIsOctDigit :: Char -> Bool
myIsOctDigit s = if s `elem` ['0'..'7'] then True else False
{- 3 task -}
myIsPrint :: Char -> Bool
myIsPrint s = True
{- 4 task -}
myIsSeparator :: Char -> Bool
myIsSeparator s = if s `elem` ['\n', '\r', ' '] then True else False
{- 5 task -}
myDigitToInt :: Char -> Int
myDigitToInt s = if s `elem` ['0'..'9'] ++ ['a'..'f'] then (ord s) - (ord '0')
else -1