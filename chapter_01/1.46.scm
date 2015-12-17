;; SICP Exercise 1.46
;; Rewrite sqrt and fixed-point in terms of iterative-improve

(define (iterative-improve good-enough? next)
  (define (helper guess)
    (if (good-enough? guess (next guess))
	guess
	(helper (next guess))))
  (lambda (guess) (helper guess)))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (x y) (< (abs (- x y))
				       tolerance))
		      (lambda ) first-guess))
		     

(define (sqrt x)
  ((iterative-improve (lambda (x y) (< (abs (- x y))
				       tolerance))
		      (lambda (guess) (average guess
					       (/ 
