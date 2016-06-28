module Useless.SearchTree (
		search
	) where
import Useless.Base

-- defining binary search tree
-- should be Ord a => ([a], [Int], [Int])
-- when Int set to -1, the node is not 
-- adjacented.

searchDriver :: Ord a => [a] -> [(Int, Int)] -> Int -> a -> Bool
searchDriver [] [] current tofind = False
searchDriver node offspring current tofind 
	| value == tofind = True
	| value > tofind =
		if lidx < 0 then False
		else searchDriverIdx lidx
	| value < tofind = 
		if ridx <  0 then False
		else searchDriverIdx ridx
	| otherwise = False where 
		value = node !! current;
		lidx = fst $ offspring !! current;
		ridx = snd $ offspring !! current;
		searchDriverIdx i = searchDriver node offspring i tofind;

search :: Ord a => [a] -> [(Int, Int)] -> a -> Bool
search node offspring tofind = searchDriver node offspring 0 tofind
