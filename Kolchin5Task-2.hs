import System.IO
import Data.Char ( toUpper )
import System.Environment 
  
copyFile :: Handle -> Handle -> String -> IO ()
copyFile h1 h2 symbol = do
                   eof <- hIsEOF h1
                   if eof then return () else
                      do
                        c <- hGetChar h1
                        hPutChar h2 (replace c symbol)   
                        copyFile h1 h2 symbol

main = do 
         [f1,f2, symbol] <- getArgs
         h1 <- openFile f1 ReadMode     
         h2 <- openFile f2 WriteMode 
         copyFile h1 h2 symbol           
         hClose h1                  
         hClose h2

replace :: Char->String->Char
replace replaceSym symbol = if replaceSym `elem` [',' , ';'] 
then head symbol 
else replaceSym 
