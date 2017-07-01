module Number2Number.Converter
  ( decToOther
  , otherToDec
  ) where

import Data.List (length, elemIndex)
import Data.Maybe (isNothing, fromMaybe)


numericSymbols :: String
numericSymbols = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

numToSymbol :: Int -> Maybe Char
numToSymbol x = if x > -1 && x < length numericSymbols
                then Just $ numericSymbols !! x
                else Nothing

symbolToNum :: Char -> Maybe Int
symbolToNum sym = elemIndex sym numericSymbols

getModulos :: Int -> Int -> [Int]
getModulos 0 _ = []
getModulos x radix = (x `mod` radix) : getModulos (x `div` radix) radix

decToOther :: Int -> Int -> Maybe String
decToOther x radix
  | radix >= length numericSymbols = Nothing
  | radix <= 2 = Nothing
  | otherwise =
    let numDigits = map numToSymbol $ reverse $ getModulos x radix
    in if any isNothing numDigits
      then Nothing
      else Just $ map (fromMaybe '_') numDigits

otherToDec :: String -> Int -> Maybe Int
otherToDec x radix
  | radix >= length numericSymbols = Nothing
  | radix <= 2 = Nothing
  | null x = Nothing
  | otherwise =
    let trans x = zip (reverse $ map symbolToNum x) [0..]
        pow radix = map (\x -> fmap (* radix ^ snd x) (fst x))
        powList = pow radix (trans x)
    in if any isNothing powList
        then Nothing
        else Just (sum $ map (fromMaybe 0) powList)
