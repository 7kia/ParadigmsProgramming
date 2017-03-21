import Data.List
import System.Environment


main = do
    [inputFile, outputFile, searchString] <- getArgs
    content <- readFile inputFile
    let fileLines = lines content
    writeFile outputFile (unlines ([x | x <- fileLines, searchString `isInfixOf` x]))