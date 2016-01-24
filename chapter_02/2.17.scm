;;;; SICP Exercise 2.17
;;; Implement a procedure last-pair, that given a non-empty list
;;; returns the last element.
;;; Ex) (last-pair (list 1 2 3 4)) -> 4

(define (last-pair l)
  (if (null? (cdr l))
      (car l)
      (last-pair (cdr l))))
