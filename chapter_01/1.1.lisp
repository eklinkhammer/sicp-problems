;;;; SICP Chapter 1.1 The Elements of Programming

;;; Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (square-two-bigger x y z)
  (sum-of-squares (get-bigger x y)
                  (get-bigger z
                              (get-smaller x y))))

(define (get-bigger x y)
  (cond ((> x y) x)
      (else y)))

(define (get-smaller x y)
  (cond ((> x y) y)
      (else x)))

(define (sum-of-squares x y) (+ (square x) (square y)))
(define (square x) (* x x))

;;; Exercise 1.7: Write a new good-enough? test that returns true if the different between guess is some (small) fraction
;;;  of the new guess

(define (good-enough? old-guess new-guess)
  (> (* new-guess 0.000001) (abs (- new-guess old-guess))))

;;; Exercise 1.8: Write a function to approximate Newton's method for cube roots
(define (cube-root x)
  (cube-root-iter 0.0 1.0 x))

(define (cube-root-iter old-guess new-guess x)
  (if (good-enough? old-guess new-guess)
      new-guess
      (cube-root-iter new-guess
                      (improve-cube new-guess x)
                      x)))

(define (improve-cube guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))
