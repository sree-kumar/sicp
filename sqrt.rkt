#lang racket
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
