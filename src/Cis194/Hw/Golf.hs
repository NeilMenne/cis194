module Cis194.Hw.Golf where
import Data.List

----------------
-- Exercise 1 --
----------------
skips :: [a] -> [[a]]
-- applies function s for every possible n and concats resulting lists
skips l = [(s n l) | n <- [1..(length l)]]

s :: Int -> [a] -> [a]
-- takes a list, l, and returns a new list with
-- only every nth value
s n l = [l !! (i-1) | i <- [n,2*n..(length l)]]

-- This shorter definition of s works if we take chunk from the 'split' package:
--  import Data.List.Split
--  s n = map last . chunk n

----------------
-- Exercise 2 --
----------------
localMaxima :: [Integer] -> [Integer]
-- take first three elements, while labeling tail of list as 't'
-- include y if it is greater that neighbors x and z
-- recur to localMaxima of the tail t
localMaxima (x:t@(y:z:_))
  | y > x && y > z = y : localMaxima t
  | otherwise      = localMaxima t
localMaxima _ = []

-- one line version using list comprehension:
-- 'tails' takes list and progressively removes the head
-- we then filter that for local maximi
-- result is filtered list
localMaxima a = [y | (x:y:z:_) <- tails a, x < y && y > z]

----------------
-- Exercise 3 --
----------------
histogram :: [Integer] -> String
histogram = unlines . f . g

g :: [Integer] -> [Int]
-- Count the frequencies of each number and store in a list
g a = [c n a | n <- [0..9]]

c :: Integer -> [Integer] -> Int
-- counts how many of item x are in a list
c x = length . filter (\y -> y == x)

f :: [Int] -> [String]
-- Draw histogram using a list, a, of frequencies
f a =  [r n a | n <- [9,8..1], n <= maximum a] 
    ++ ["==========\n0123456789"]

r :: Int -> [Int] -> String
-- Draw row n of the histogram, using list, a, of frequencies
r n a = [if x >= n then '*' else ' ' | x <- a]

