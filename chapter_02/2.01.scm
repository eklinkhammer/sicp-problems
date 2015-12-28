;; SICP Exercise 2.1
;; Define a better version of make-rat that handles both positive and
;; negative arguments. If the rational number is negative, only the
;; numerator should be negative.

(define (make-rat n d)
  (define (negative? x)
    (>= 0 x))
  (let ((g (gcd (abs n) (abs d))))
    (if (negative? d)
	(cons (* -1 (/ n g)) (* -1 (/ d g)))
	(cons (/ n g) (/ d g)))))

;; SICP Helper Functions
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (gcd a b)
  (if (= a b)
      a
      (gcd b (remainder a b))))
