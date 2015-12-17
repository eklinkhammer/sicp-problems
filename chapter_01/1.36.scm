;; SICP Exercise 1.36
;; Modify fixed-point so that it prints the sequence of approximations
;;  it generates, using the newline and display primitives shown. Then
;;  find a solution to x^x = 1000 by finding a fixed-point of x |->
;;  log(1000)/log(x). Compare the number of stops this takes with and
;;  without average damping. (Note, you can't start with a guess of
;;  1).
(define tolerance 0.00001)

(define (fixed-point-output f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess attempt)
    (newline)
    (display "Attempt number: ")
    (display attempt)
    (display " ")
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next (+ 1 attempt)))))
  (try first-guess 1))

(define (x-to-x first-guess)
  (fixed-point-output (lambda (x) (/ (log 1000) (log x))) first-guess))

(define (average a b)
  (/ (+ a b) 2))

(define (with-dampening first-guess)
  (fixed-point-output (lambda (x) (average x
				    (/ (log 1000) (log x))))
	       first-guess))

;; 34 attempts
(x-to-x 2)

;; 9 attempts
(with-dampening 2)

;; Converging happened faster with dampening
