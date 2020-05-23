#lang racket
; iterative version of summing 2 numbers
; from lecture by Prof. Gerald Jay Sussman
; time = O(x)
; space = O(1)
; Note that iteration is represented by recursion

(define (sum x y)
  (if (= x 0)
	  y
	  (+ (sub1 x) (add1 y))))
(sum 3 4)

; execution sequence
; (+ 3 4)
; (+ 2 5)
; (+ 1 6)
; (+ 0 7)
