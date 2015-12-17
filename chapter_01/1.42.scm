;; SICP Exercise 1.42
;; Define function compose such that (compose f g) = f . g

(define (compose f g)
  (lambda (x) (f (g x))))

;; Should be 49
((compose (lambda (x) (* x x))
	  (lambda (x) (+ 1 x)))
	  6)
