; this is from lecture.
; we need to work it out in paper.
;

(define (move n from to  spare)
    (cond ((= n 0) "DONE")
          (else
	  (move (sub1 n) from spare to)
          (print-move from to)
          (move (sub1 n) spare to from))))

; from = 1 to = 2 spare = 3

(move 4 1 2 3)
