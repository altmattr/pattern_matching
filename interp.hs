data Term = TCon String Int Int
          = TInt Int

data Pattern = PVar String
             | PCon [(Constructor, Pattern)]
             | PInt Int

data MRule a = MRule Pattern a
type Match a = [MRule a]

main :: IO ()
main = putStrLn "all done"

-- compare a term to a set of rules and return the RHS of the first matching rule
fail :: Term -> Match a -> Maybe a
fail t []               = None
fail t (p1, rhs)::rules = match t p1 [] rhs rules

succeed :: Term -> 
