;; SICP Exercise 2.35
;; Use accumulate to solve polynomials according to Horner's rule
;; Fill in this blank

;; Lambda function is applied to current term and the result of
;; accumulating the rest of list
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) ( +
						  (* x higher-terms)
						  this-coeff))
 0
 coefficient-sequence))
