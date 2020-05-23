#lang racket
; recursive version of summing 2 numbers
; from lecture by Prof. Gerald Jay Sussman
; time = O(x)
; space = O(x)

(define (sum x y)
  (if (= x 0)
	  y
	  (add1 (+ (sub1  x) y))))

(sum 3 4)

; execution sequence
; (+ 3 4))
; (add1 (+ 2 4)))
; (add1 (add1 (+ 1 4))))
; (add1 (add1 (add1 (+ 0 4))))
; (add1 (add1 (add1 4))))
; (add1 (add1 5)))
; (add1 6))
; 7 
