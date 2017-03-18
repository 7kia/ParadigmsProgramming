import System.Environment   
import System.Directory  
import System.IO  
import Data.List  
import Data.Char  
import Control.Monad
  
dispatch :: [(String, [String] -> IO ())]  
dispatch =  [ ("add", add)  
            , ("view", view)  
            , ("remove", remove)  
            , ("copyWithFilter", copyWithFilter)  
            ]  

filters :: [(String, [String] -> String)]  
filters =  [ ("isUpperFilter", isUpperFilter)  
            , ("isPrintFilter", isPrintFilter)  
            ]  
   
main = do  
    (command:args) <- getArgs  
    let (Just action) = lookup command dispatch  
    action args  
  
add :: [String] -> IO ()  
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")  
  
view :: [String] -> IO ()  
view [fileName] = do  
    contents <- readFile fileName  
    let todoTasks = lines contents  
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks  
    putStr $ unlines numberedTasks  
  
remove :: [String] -> IO ()  
remove [fileName, numberString] = do  
    handle <- openFile fileName ReadMode  
    (tempName, tempHandle) <- openTempFile "." "temp"  
    contents <- hGetContents handle  
    let number = read numberString  
        todoTasks = lines contents  
        newTodoItems = delete (todoTasks !! number) todoTasks  
    hPutStr tempHandle $ unlines newTodoItems  
    hClose handle  
    hClose tempHandle  
    removeFile fileName  
    renameFile tempName fileName

isUpperFilter :: [ String ] -> String
isUpperFilter [ str ] = filter isUpper str

isPrintFilter :: [ String ] -> String
isPrintFilter [ str ] = filter isPrint str

copyWithFilter :: [String] -> IO ()
copyWithFilter [inputFile, outputFile, filterName] = do
    content <- readFile inputFile
    let (Just action) = lookup filterName filters  
    writeFile outputFile (action [ content ])
