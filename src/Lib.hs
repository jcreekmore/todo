module Lib
    ( someFunc
    , Todo(..)
    , priority
    , parse
    ) where

type Action = String
type Priority = Char
type Date = String
type Context = String
type Project = String

data Todo = Incomplete Action (Maybe Priority) (Maybe Date) [Context] [Project]
          | Complete Action Date (Maybe Date) [Context] [Project]
          deriving(Eq, Show)

priority :: Todo -> Maybe Priority
priority (Incomplete _ p _ _ _) = p
priority _ = Nothing

parseComplete :: [String] -> (Bool, [String])
parseComplete ("x":xs) = (True, xs)
parseComplete xs = (False, xs)

parse :: String -> Todo
parse x
      | isComplete = Complete (unwords $ tail action) (head action) Nothing [] []
      | otherwise = Incomplete (unwords action) Nothing Nothing [] []
      where (isComplete, action) = parseComplete $ words x

someFunc :: IO ()
someFunc = putStrLn "someFunc"
