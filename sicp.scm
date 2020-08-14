(define (square x)
  (* x x))

;; Exercise 1.3

(define (big x y)
  (if (> x y) x y))

(define (biggest x y z)
  (cond ((and (> x y) (> x z)) x)
        ((and (> y x) (> y z)) y)
        ((and (> z x) (> z y)) z)))

(define (second-biggest x y z)
  (cond ((= x (biggest x y z)) (big x y))
        ((= y (biggest x y z)) (big x z))
        ((= z (biggest x y z)) (big x y))))


;; Exercise 1.5

(define (p) (p))

(define (test x y)
  (if (= x 0) x
      y))

;; this program will go into an infinite loop
;; because when we give (p) for y, it will be evaluated
;; and when evaluating, it is inside a infinite recursin.
;; So the program never exits.

