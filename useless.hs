module Useless.Base (
	bi,
	pop,
	popt,
	popTail,
	tmap,
	Useless.Base.and,
	Useless.Base.or) where 

-- we are likely to seperate something from
-- a structure, where a bi-function is ideal.
bi l r f x = f (l x) (r x)

-- seperate first element from a list.
-- easily construct right-recursive function.
pop = bi head tail

-- seperate last element from a list.
-- this function is strongly deprecated!
-- easily construct left-recursive function.
popt = bi (reverse.tail.reverse) last
popTail = popt

-- seperate first element from second in a tuple.
-- also serves as a unzip function (from a zip)
tmap = bi fst snd

-- i think you should use && and || instead
-- but who knows. somebody would love a `and` b
-- or a `or` b, like me.
and a b = if a then b else False
or a b = if a then True else b


