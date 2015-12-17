;; SICP Exercise 1.40
;; Define a procedure cubic that, given coefficients, returns a cubic

(define (cubic a b c)
  (define (cube x) (* x x x))
  (define (square x) (* x x))
  (lambda (x) (+ (cube x)
		 (* a (square x))
		 (* b x)
		 c)))
