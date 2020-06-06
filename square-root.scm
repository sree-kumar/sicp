; find the square root of x using 
; using square root algorithm of Heron of Alexandria.
; To find an square root of x
; make a guess of g
; improve the guess by averaging x and x/g
; Keep improving the guess until it is good enough.
; Start g = 1 (Start with 1 as the first guess)
; Not racket has already (abs x) function
; so we are using (absolute x) function defined by us
; Also note that racket provides rational answers 
; for decimal. so we are using 1.0 and 2.0 for
; getting decimal values.

(define (absolute x)
  (cond ((< x 0) (- x))
		((= x 0) 0)
		((> x 0) x)))

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2.0))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (absolute (- (square guess) x))
     0.001))

(define (try guess x)
  (if (good-enough? guess x)
      guess
      (try (improve guess x) x)))

(try 1.0 2.0)
