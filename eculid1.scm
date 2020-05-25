#lang racket

;; eculid algorithm version 2
;; using remainder instead of subtraction
;; fewer steps when compared to subtraction

;; trivial method
;; calling two times ecluid method
;; is there a better way to do this?

(define (eculid a b)
  (cond ((= a 0) b)
	((= b 0) a)
	((> a b) (eculid (remainder a b) b))
	((< a b) (eculid (remainder b a) a))))

(eculid 252 105)

;; work out
;; (eculid 252 105)
;; (eculid 42 105)
;; (eculid 42 21)
;; (eculid 42 0)

;; another simple version

(define (eculid1 a b)
  (cond ((= a 0) b)
	((eculid1 (remainder b a) a))))

(eculid1 105 252)

;; no need for four conditionals
;; a and be alternates keeping the lowest
;; number always in a.

;; work out
;; (eculid1 105 252)
;; (eculid1 42 105)
;; (eculid1 21 42)
;; (eculid1 0 21)

;; workout for 252 and 105
;; (eculid1 252 105)
;; (eculid1 105 252) ;; swaps the number
;; (eculid 42 105)
;; rest follows as perivious
