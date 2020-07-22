;; Little Schemer Book

;; all atoms are S-expressions  e.g: harry, 123, some@mail
;; all lists are S-expressions  e.g: (), (one, two)

;; pre-defined functions / macros / s-expressions

;;  1 (cons S-exp list)
;;  2 (car list)
;;  3 (cdr list)
;;  4 (null? S-exp)
;;  5 (pair? S-exp)
;;  6 (eq? atom atom) ;; only non-numeric atoms
;;  7 (symbol? s-exp)
;;  8 (string? s-exp)
;;  9 (number? s-exp)
;; 10 (real? s-exp)
;; 11 (exact? s-exp)
;; 12 (integer? s-exp)
;; 13 (set! 'atom 'value)
;; 14 (zero? 'number)

;; 
;; test whether a given S-expression is an atom;
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

;; test whether the list 'l' consists of only atoms
(define lat?
  (lambda (l)
    (cond
     ((null? l) #t)
     ((atom? (car l))(lat? (cdr l)))
     (else #f))))

;; test whether an atom 'a' is a member of list 'lat'

(define member?
  (lambda ( a lat)
    (cond
     ((null? lat) #f)
     (else (or (eq? a (car lat))
         (member? a (cdr lat)))))))

;; remove a member (atom) from lat lat (list)
;; takes two arguments: atom and lat
;; the following code is written by me and corrected
;; looking at the book. There was a bug. And I keep the
;; comments below it because, it some way, it helps us understand
;; though  it is wrong.  I am commenting this code as we
;; ignore the atoms before the atom we want to remove
;; and only gives atoms after the term to be removed.
;; refer book for further details.
;; Instead of deleting, I just rename. the function name.
(define rember-old
     (lambda (a lat)
       (cond
         ((null? lat) (quote ()))
         (else (cond
                 ((eq? a (car lat)) (cdr lat))
                 (else (rember-old a (cdr lat))))))))

;; (rember 'team '(I am a team member))
;; (null? lat) => #f
;; (eq? 'team 'I) => #f
;;    (rember 'team '(am a team member))
;;    (eq? 'team 'am) => #f
;;       (rember 'team '(a team member))
;;       (eq? 'team 'a) => #f
;;         (rember 'team '(team member))       ;; retruns (member)
;;         (eq? 'team 'team) => #t => (member)
;;            (rember 'team 'member))
;;            (eq? 'team 'member) => #f
;;              (rember 'team '())  ;; (cdr lat) is empty list.
;;              (null? '()) => #t => returns '()

;; (rember 'team '()) => '()  ;; terminating condition
;; (rember 'team '(member) => '()
;; (rember 'team '(team member)) => '(member)
;; (rember 'team '(a team member)) => '(a member)
;; (rember 'team '(am a team member)) => '(am a member)
;; (rember 'team '(I am a team memeber)) => '(I am a membber)

;; In other words, each successive recursive call returns a
;; replacement list for the input list.

;; new version to keep the left out atoms within the list
;; the answer is trivial when we see it, but difficult
;; while we want to implement it.

(define rember
     (lambda (a lat)
       (cond
         ((null? lat) (quote ()))
         (else (cond
                 ((eq? a (car lat)) (cdr lat))
                 (else (cons (car lat) (rember a (cdr lat)))))))))


;; the following function returns first S-expressions
;; from a list of lists.
(define firsts
     (lambda (l)
       (cond
         ((null? l) (quote()))
         (else (cons (car (car l)) (firsts (cdr l)))))))

;; Given a 'old' atom, 'new' atom and a list 'lat', replace the
;; first occourance of 'old' with 'new'.

;; the above problem statement is not according to definition
;; in the book. I wants to append 'new' atom after 'old' atom.
;; the below code only replaces the first occurance of 'old' with
;; 'new'.
;; hence renaming it.
(define insertR1
     (lambda (old new  lat)
       (cond
         ((null? lat) (quote ()))
         (else (cond
                 ((eq? old (car lat)) (cons new (cdr lat)))
                 (else (cons (car lat) (insertR1 old new (cdr lat)))))))))

;; new version (my version)
(define insertR
     (lambda (old new  lat)
       (cond
         ((null? lat) (quote ()))
         (else (cond
                ((eq? old (car lat)) (cons old (cons new (cdr lat))))
                (else (cons (car lat) (insertR old new (cdr lat)))))))))

;; Trying the same thing. But this time the 'new is 'old.
;; In a way left appending to the left (that's why the name inserrtL)

(define insertL1
     (lambda (old new  lat)
       (cond
         ((null? lat) (quote ()))
         (else (cond
                ((eq? old (car lat)) (cons new (cons old (cdr lat))))
                (else (cons (car lat) (insertL1 old new (cdr lat)))))))))

;; a more elgant way.
;; (cons new lat) is nothing but (cons new (cons old (cdr lat))).
(define insertL
     (lambda (old new  lat)
       (cond
         ((null? lat) (quote ()))
         (else (cond
                ((eq? old (car lat)) (cons new lat))
                (else (cons (car lat) (insertL old new (cdr lat)))))))))

;; substitue is the most trivial (which we started with).
;; refer (insertR1 'old 'new 'lat)
(define subst
     (lambda (old new  lat)
       (cond
         ((null? lat) (quote ()))
         (else (cond
                 ((eq? old (car lat)) (cons new (cdr lat)))
                 (else (cons (car lat) (subst old new (cdr lat)))))))))
;; subst2 takes four parameter.
;; 'new, 'o1, 'o2, and lat.
;; it substitutes the first occurance of 'o1 or 'o2.
;; there are two ways to do this.
;; primitive way as shown below or using the (or clause.

(define subst21
  (lambda ( new o1 o2 lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond
              ((eq? (car lat) o1 ) (cons new (cdr lat)))
              ((eq? (car lat) o2) (cons new (cdr lat)))
              (else (cons (car lat)(subst21 new o1 o2 (cdr lat) ))))))))

;; second version with or
(define subst2
  (lambda ( new o1 o2 lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond ((or (eq? (car lat) o1 ) (eq? (car lat) o2))
                       (cons new (cdr lat)))
              (else ( cons (car lat)(subst2 new o1 o2 (cdr lat) ))))))))

;; multi rember (remove multiple occurance of 'atom
;; my version

(define multirember
     (lambda (a lat)
       (cond
         ((null? lat) (quote ()))
         (else (cond
                 ((eq? a (car lat)) (multirember a (cdr lat)))
                 (else (cons (car lat) (multirember a (cdr lat)))))))))


;; multiple insert same as insertR but
;; inserts 'new' wherever 'old' is found in 'lat'.
;; similar to 'multirember'.

(define multiinsertR
     (lambda (old new  lat)
       (cond
         ((null? lat) (quote ()))
         (else (cond
                ((eq? old (car lat)) (multiinsertR old new (cons old (cons new (cdr lat)))))
                (else (cons (car lat) (insertR old new (cdr lat)))))))))


;; multiinsertL Wrong version
(define multiinsertL1
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     (else
      (cond
       ((eq? old (car lat))
        (cons new (cons old (multiinsertL1 new old lat))))
       (else
        (cons (car lat (multiinsertL1 new old (cdr lat))))))))))

;; my version
(define multiinsertL2
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     (else
      (cond
       ((eq? old (car lat))
        (cons new (cons (multiinsertL2 new old (cdr lat)) old)))
       (else
        (cons (car lat) (multiinsertL2 new old (cdr lat)))))))))

;; the  problem with the above method is discussed in document.

;; my new and final verssion
(define multiinsertL
        (lambda (new old lat)
          (cond
           ((null? lat) (quote ()))
           (else
            (cond
             ((eq? old (car lat))
              (cons new (cons old (multiinsertL new old (cdr lat)))))
             (else
              (cons (car lat) (multiinsertL new old (cdr lat)))))))))
      
;; the code for mutlisubst is trivial
(define multisubst
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     (else
      (cond
       ((eq? old (car lat))
        (cons new (multisubst new old (cdr lat))))
       (else
        (cons (car lat) (multisubst new old (cdr lat)))))))))


;; Note: Till now, we have covered 4 chapters.
;; Here after I wll tell the  chapter number.
;; Chapter 4:  Number Games
;; i++; lol         
(define (add1 x)
  (+ x 1))

;; i--; lol
(define (sub1 x)
  (- x 1))

;; recursive multiplication
;; book uses a special symbol (X).
;; we call it *multi*
(define multi
  (lambda (m n)
    (cond
     ((zero? n) m)
     (else (+ m (multi m (sub1 n)))))))

;; add all numbers in the list
(define addtub
  (lambda (lat)
    (cond
     ((null? lat) 0)
     (else (+ (car lat) (addtub (cdr lat)))))))

;; find the length of the tuple
(define length
  (lambda (lat)
    (cond
     ((null? lat) 0)
     (else (add1 (length (cdr lat)))))))

;; find the position of an atom in a list

(define position
  (lambda (x lat)
    (cond
     ((null? lat) 0)
     ((eq? x (car lat)) (add1 0))
      (else (add1 (position x (cdr lat)))))))

;; find the 'atom at a given position in the list
(define pick
  (lambda (n lat)
    (cond
     ((null? lat) 0)
     ((eq? 1 n) (car lat))
     (else (pick (sub1 n) (cdr lat))))))
          
;; remove the element which is picked by previous function
;; C-x r k removes a rectangular regions (emacs)

(define rempick
   (lambda ( n lat)
     (cond
        ((null? lat) (quote ()))
        ((zero? (sub1 n)) (cdr lat) )
        (else (cons (car lat) (rempick (sub1 n) (cdr lat)))))))

;; remove all occurances of an element in a list
;; we use * notation to represent anything of that type.
(define rember*
  (lambda (x lat)
    (cond
     ((null? lat) (quote ()))
     ((lat? (car lat)) (rember* x (car lat)))
     ((lat? (cdr lat)) (rember* x (cdr lat)))
     ((eq? x (car lat)) (rember* x (cdr lat)))
     (else (cons (car lat) (rember* x (cdr lat)))))))
