module Main where

import Number2Number.Converter (decToOther, otherToDec)
import Data.Maybe (fromMaybe)

main = do
    putStrLn "Enter a number:"
    x <- getLine
    putStrLn "Enter a radix of number[2-36]:"
    baseOrig <- getLine
    putStrLn "Enter a result radix[2-36]:"
    baseResult <- getLine
    putStrLn "Result:"

    let inDec = otherToDec x (read baseOrig :: Int)
    let result = decToOther (fromMaybe 0 inDec) (read baseResult :: Int)

    case result of
      (Just x) -> putStrLn x
      Nothing -> putStrLn "Error!"
