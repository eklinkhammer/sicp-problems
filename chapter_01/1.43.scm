;; SICP  Exercise 1.43
;; If f is a numerical function and n is a positive integer, then we
;; can form the nth repeated application of f, which is defined to be
;; the function whose value at x is f(f(...(f(x))...))

(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (define (repeated-helper g i)
    (if (= i n)
	g
	(repeated-helper (compose f g) (+ 1 i))))
  (repeated-helper f 1))

;; 625
((repeated (lambda (x) (* x x)) 2) 5)
