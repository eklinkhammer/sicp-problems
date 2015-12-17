;; SICP Exercise 1.41
;; Define a procedure double that takes a procedure of one argument as
;; argument and returns a procedure that applies the original
;; procedure twice. For example, if ince adds 1 to argument, then
;; (double inc) should be a procedure that adds 2. What value is
;; returned by (((double (double double)) inc) 5)

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ 1 x))

(((double (double double)) inc) 5)
