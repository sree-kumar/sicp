#lang racket
; simplest recursive program
; I made a blunder by not using if cluase.
; the program hanged my  computer.
; syntacticaly correct but runnning in a endless loop.

(define (fib n)
   (if (< n 2)
   n
   (+ (fib (- n 1))
      (fib (- n 2)))))

(fib 10)

; program execution for n = 4
;
;            fib-4
;            /   \
;        fib-3   fib-2
;         /        \
;      fib-2  fib-1 \  
;       /  \    \    ...
;      /    \    \
;    fib-1 fib-0  \
;     |     |     1
;     1     0