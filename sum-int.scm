#lang racket

;; Note: Editied in Emacs using *.scm extension
;; Prof. Gerals Jay Sussman
;; Lecture 3

(define (sum-int a b)
  (if (> a b)
      0
      (+ a (sum-int (add1 a) b))))

;; (sum-int 1 4)

;; Another way to do the sum.
;; abstracting the summation part coming in sigma part

;; bit confusing - need to workout

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term
	      (next a)
	      next
	      b))))


(define (sum-int2 a b)
  (define (identity x) x)
  (sum identity a add1 b))

(sum-int2 1 4)

(define (identity a) a)
identity

;; the above definition indicates
;; that identity is a procedure.

;; hence defintion of sum requires two procedures
;; term => a procedure for identity
;; next => a procedure for increment
;; you are free to define your own procedures
;; depending on situation
