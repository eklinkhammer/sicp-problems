;; SICP Exercise 1.45
;; Compute the nth roots using fixed-point, average-damp, and the
;; repeated procedure

(define (raise-to-n x n)
  (if (= n 1)
      x
      (* x (raise-to-n x (- n 1)))))

(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (n-th-root x n)
  (fixed-point ((repeated average-damp (- n 1))
		(lambda (y) (/ x (raise-to-n y (- n 1)))))
	       1.0))
