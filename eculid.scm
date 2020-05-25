#lang racket

;; eculid algorithm
;; trivial method
;; calling two times ecluid method
;; is there a better way to do this?

(define (eculid a b)
  (cond ((= a b) a)
	((> a b) (eculid (- a b) b))
	((< a b) (eculid (- b a) a))))

(eculid 252 105)

;; work out
;; (eculid 252 105)
;; (eculid 147 105)
;; (eculid 42  105)
;; (eculid 42 63)
;; (eculid 42 21)
;; (eculid 21 21)
