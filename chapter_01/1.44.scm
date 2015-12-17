;; SICP Exercise 1.44
;; Write a procedure smooth that takes as input a procedure f and
;; returns a procedure that computed the smoothed f, a function g
;; where g(x) = the average of f(x-dx), f(x), f(x+dx)

(define (smooth f dx)
  (define (average a b c)
    (/ (+ a b c) 3))
  (lambda (x) (average (f (- x dx))
		       (f x)
		       (f (+ x dx)))))

(define (n-fold-smoothed n f dx)
  (repeated n (smooth f dx)))
