;; SICP Exercise 1.37
;; Define a procedure cont-frac such that evaluating (cont-frac n d k)
;; compures the value of the k-term finite continued fraction. Check
;; your procedure by approximating 1/phi. Part b: Write both
;; recursively and iteratively

(define (cont-frac n d k)
  (define (cont-frac-helper n d k max-k)
    (let ((Ni (n k))
	  (Di (d k)))
      (if (= k max-k)
	  (/ Ni Di)	  
	  (/ Ni
	     (+ Di
		(cont-frac-helper n d (+ 1 k) max-k))))))
  (cont-frac-helper n d 1 k))

;; With a better understanding of scope
(define (cont-frac n d k)
  (define (frac-helper i)
    (if (= i k)
	(/ (n i) (d i))
	(/ (n i) (+ (d i)
		    (frac-helper (+ 1 i))))))
  (frac-helper 1))

;; Check for procedure
(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   20)

;; Iterative procedure
(define (cont-frac-iter n d k)
  (define (cont-frac-iter-helper k sum)
    (let ((Ni (n k))
	  (Di (n k)))
      (if (> k 1)
	  (let ((sum (/ Ni (+ Di sum))))
	    (cont-frac-iter-helper (- k 1) sum))
	  (/ Ni (+ Di sum)))))
  (cont-frac-iter-helper k 0))

(cont-frac-iter (lambda (i) 1.0)
		(lambda (i) 1.0)
		20)
