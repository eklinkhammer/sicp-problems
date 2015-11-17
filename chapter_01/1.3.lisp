;; Summation function
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

;; Term and next functions
(define (cube x) (* x x x))
(define (inc a) (+ a 1))
(define (id a) a)
(define (plus-4 a) (+ a 4))
(define (pi-term a)
  (+ (/ 1.0 
        (* a 
           (+ a 2)))))

;; Summations
(define (sum-ints a b) (sum id a inc b))
(define (sum-cubes a b) (sum cube a inc b))
(define (sum-pi a b) (sum pi-term a plus-4 b))

;; Integral approximation
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;; Exercise 1.29 - Simpson's Rule
;; Integral of f(x) can be approximated by (h/3)(y_0 + 4y_1 + 2y_2 + 4y_3 + .. + 4y_n-1 + y_n]
(define (divisible? n x)
  (zero? (remainder n x)))

(define (simpson-term f a k h n)
  (define (y f a k h)
    (f (+ a (* k h))))
  (cond ((or (= k n)
            (= k 0))
         (y f a k h))
        ((divisible? k 2) (* 2 (y f a k h)))
        (else (* 4 (y f a k h)))))

;; n is the number of steps
(define (simpson-integral f a b n)
  (define (h a b n)
    (/ (- b a) n))
  (define (simpson-term-one-arg x)
    (simpson-term f a x (h a b n) n))
  (* (/ (h a b n) 3)
     (sum simpson-term-one-arg 0 inc n)))

;; Exercise 1.30 - Iterative Sum
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

;; Exercise 1.31 - Product, factorical in terms of product
(define (product term a next b)
  (if (> a b)
    1 
    (* (term a)
       (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product id 1 inc n))

(define (pi-term x)
  (if (divisible? x 2)
    (/ (+ x 2) (+ x 1))
    (/ (+ x 1) (+ x 2))))

(define (pi-approx n)
  (exact->inexact (* 4 (product-iter pi-term 1 inc n))))

;; Exercise 1.32 - Accumulator
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

(define (acc-sum term a next b)
  (accumulate + 0 term a next b))

(define (acc-mult term a next b)
  (accumulate * 1 term a next b))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a)
            (combiner (term a) result))))
  (iter a null-value))

;; Exercise 1.33 - Filtering
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a)
            (if (filter a) 
              (combiner (term a) result)
              result))))
  (iter a null-value))

(define (sum-even term a next b)
  (filtered-accumulate + 0 term a next b even?))

(define (sum-even-nums a b)
  (sum-even id a inc b))
