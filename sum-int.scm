#lang racket
;; Note: Editied in Emacs using *.scm extension
;; Prof. Gerals Jay Sussman
;; Lecture 3

(define (sum-int a b)
  (if (> a b)
      0
      (+ a (sum-int (add1 a) b))))

(sum-int 1 4)

;; square of sum procedure
(define (square x ) (* x x ))

(define (sum-square a b)
  (if (> a b)
      0
      (+ (square a) (sum-square (add1 a) b))))

(sum-square 1 4)

