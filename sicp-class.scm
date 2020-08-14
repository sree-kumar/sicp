;; Program 1
;; program to show count-down
;; introducing 'begin' and 'newline'

(define (count-down x)
  (cond ((> x 0)
         (begin
           (display x)
           (newline)
           (count-down (- x 1))))))

;; the above code returns
;; ;Unspecified return values

;; this is version 2
;; to avoid "unspecified value"
;; we add x (the expression to be executed)


(define (count-down x)
    (if (= x 0) x
        (begin
          (display x)
          (newline)
          (count-down (- x 1)))))

;; Program 2
;; To sum the numbers from start to end

(define (sum-numbers sum start end)
    (if (= start end) sum
        (sum-numbers (+ sum start) (+ start 1) end)))

;; Program 3
;; To sum all the odd numbers between start and end
;; Find the bug
(define (sum-odd-numbers sum start end)
    (cond ((= start end) sum)
          ((= 0 (/ start 2)) (sum-odd-numbers sum (+ start 1) end))
          (else (sum-odd-numbers (+ sum start) (+ start 1) end))))

;; Write a better solution

;; Program 4

;; if year is divisible by 400 then is_leap_year
;; else if year is divisible by 100 then not_leap_year
;; else if year is divisible by 4 then is_leap_year
;; else not_leap_year

;; introducing remainder primitive

(define (leap-year? year)
  (cond ((and (= 0 (remainder year 400))
              (= 0 (remainder year 100))) #t)
        ((= 0 (remainder year 4)) #t)
        (else #f))))
 

;; Program 5
;; half diamond problem
;; print (hald-diamond 4)
;; *
;; **
;; ***
;; ****
;; ***
;; **
;; *


;; Problem 6
;; Co-linear points
;; Show that the three points A (2, 4), B (4, 6)
;; and C (6, 8) are collinear.

;; Solution:

;; If the three points A (2, 4), B (4, 6) and C (6, 8)
;; are collinear, then slopes of any two pairs
;; of points will be equal.

;; Now, apply slope formula to find the slopes of the
;; respective pairs of points:
;; Slope of AB = (6 - 4)/ (4 - 2) = 1,
;; Slope of BC = (8 - 6)/ (6 - 4) = 1, and
;; Slope of AC = (8 - 4) /(6 - 2) = 1

;; Since slopes of any two pairs out of three pairs
;; of points are same, this proves that A, B and C
;; are collinear points.

;; Problem 7

;; Check whether the given points (a1, a2), (b1, b2), (c1, c2)
;; are vertices of an isosceles traingle.

;; involve square root


;; Problem 8
;; Write a program to check whether a given
;; number is prime or not.

;; problem 9

;; calculate the power of number


;; Problem 10
;; count the number of digits


;; Problem 11
;; Strobogrammatic number
;; 0, 1, 8, 11, 69, 88, 96, 101, 111, 181, 609, 619, 689, 808,
;; 818, 888, 906, 916, 986, 1001, 1111, 1691, 1881, 1961, 6009,
;; 6119, 6699, 6889, 6969, 8008, 8118, 8698, 8888, 8968, 9006,
;; 9116, 9696, 9886, 9966
