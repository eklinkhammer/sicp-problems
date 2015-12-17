;; SICP Exercise 1.39
;; Define a procedure (tan-cf x k) that approximates the tangent
;; function based on the formula:
;; tan x = x
;;       1 - x^2
;;          3 - x^2

(define (tan-cf x k)
  (define (square x) (* x x))
  (cont-frac (lambda (i)
		    (if (= i 1)
			x
			(* -1 (square x))))
		  (lambda (i) (- (* 2 i) 1))
		  k))
      

;; tan pi/4 - should be 1
(tan-cf 0.7853981 30)
