# first exercise
# Define a procedure that takes three numbers as arguments and returns 
# the sum of the squares of the two larger numbers.
# finding square and sum is trivial. Hence I focus on finding biggest 
# second biggest numbers in x, y z.

# find bigger of x and y
(define (big x y)
    (cond ((> x y) x)
          (else y)))

# find biggest of x, y, z.
(define (biggest x y z)
    (cond ((> x (big y z)) x)
          (else (big y z))))

# fins second biggest of x, y, z.
(define (secondbig a b c)
    (cond ((= a (biggest a b c)) (big b c))
          ((= b (biggest a b c)) (big a c))
          ((= c (biggest a b c)) (big a b))))

# an example
# sum of the biggest and second biggest numbers
(+ (biggest 3 1 2) (secondbig 3 1 2))