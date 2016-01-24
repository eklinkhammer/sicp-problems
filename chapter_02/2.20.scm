;;;; SICP Exercise 2.20
;;; Write a function same-parity, that returns a filtered list where
;;; a number is in the output list if its parity is the same as the
;;; initial element in the input list

(define (same-parity x . xs)
  (define (filter l pred)
    (if (null? l)
	()
	(if (pred (car l))
	    (cons (car l) (filter (cdr l) pred))
	    (filter (cdr l) pred))))
  (if (even? x)
      (cons x (filter xs even?))
      (cons x (filter xs odd?))))
