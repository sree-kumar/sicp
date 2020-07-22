(define (prime n m)
  (cond ((= 1 m) n)
        ((= 0 (remainder n m)) "NO")
        (prime n (- m 1))))
(prime 6 5)

(7 % 6) = 1
(7 % 5) = 2
(7 % 4) = 3
(7 % 3) = 
  
