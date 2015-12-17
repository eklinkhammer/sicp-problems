;; SICP Exercise 1.38
;; Write a program that uses your cont-frac procedure to approximate
;; e, based on an Euler expansion where e - 2 = a continuted fraction
;; expansion such that Ni = 1 for all i and Di are 1, 2, 1, 1, 4, 1,
;; 1, 6, 1, 1, 8, ...


(define (mod3? x)
  (= 0 (modulo x 3)))

(define (d i)
  (if (= i 1)
      1
      (if (mod3? (- i 2))
	  (+ 2
	     (* 2
		(/ (- i 2) 3)))
	  1)))

(define (e-approx depth)
  (+ 2
     (cont-frac (lambda (i) 1.0)
		d
		depth)))
