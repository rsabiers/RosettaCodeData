primes = _Y $ ((2:) . minus [3..]
                    . foldr (\x-> (x*x :) . union [x*x+x, x*x+2*x..]) [])

_Y g = g (_Y g)              -- non-sharing multistage fixpoint combinator
--   = let x = g x in g x    -- sharing two-stage fixpoint combinator

union a@(x:xs) b@(y:ys) = case compare x y of
         LT -> x : union  xs b
         EQ -> x : union  xs ys
         GT -> y : union  a  ys
