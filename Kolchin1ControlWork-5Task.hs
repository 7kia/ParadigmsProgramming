import System.IO
import System.Environment

bracketsCheck' :: String -> Int -> Bool
bracketsCheck' "" n = (n==0)
bracketsCheck' (s:ss) n | (s == '(') = bracketsCheck' ss (n+1)
                 | (s == ')') && (n==0) = False
                 | (s == ')') = bracketsCheck' ss (n-1)
                 | otherwise = bracketsCheck' ss n
                 
bracketsCheck :: String -> Bool
bracketsCheck s = bracketsCheck' s 0

main = do
[nameFile] <- getArgs
content <- readFile nameFile
if (bracketsCheck content) then  putStr "Complete\n" else putStr "Incorrect\n"