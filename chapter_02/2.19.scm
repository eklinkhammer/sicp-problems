;;;; SICP Exercise 2.19
;;; Provide code for functions used in change counting algorithm

(define (except-first-denomination l)
  (cdr l))

(define (no-more? l)
  (null? (car l)))

(define (first-denomination l)
  (car l))
      
;; For the last (1,2) element
;; We check all ways with 1 and all ways with (2)
;; Then, with (2), car is true.
;; Check with 2 (car), and ()
