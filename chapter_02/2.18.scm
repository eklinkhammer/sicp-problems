;;;; SICP Exercise 2.18
;;; Implement a reverse function

(define (reverse l)
  (if (null? (cdr l))
      (car l)
      (cons (reverse (cdr l)) (car l))))
