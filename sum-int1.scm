#lang racket

;; continued from previous example.

;; abstracting the summation part coming in sigma part

;; bit confusing - need to workout

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term       ;; procedure
	      (next a)   ;; value
	      next       ;; procdure
	      b))))      ;; value


(define (sum-int2 a b)
  (define (identity x) x)
  (sum identity a add1 b))

(sum-int2 1 4)

(define (identity a) a)
identity  ;; prints #<procedure:identity>

;; the above definition indicates
;; that identity is a procedure.

;; hence defintion of sum requires two procedures
;; term => a procedure for identity
;; next => a procedure for increment
;; you are free to define your own procedures
;; depending on situation

;; the sum square method  will become

(define (square x) (* x x))
(define (sum-square a b)
  (sum square a add1 b))

(sum-square 1 4)
