;;;; SICP Chapter 1.2 The Elements of Programming

;;; Exercise 1.11 Write a procedure that computes f by means of both a recursive and 
;;; iterative process, where f(n) = n if n < 3 and f(n-1) + 2*f(n-2) + 3*f(n-3) otherwise

;; Recursive Solution
(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (- n 1))
                 (* 2 (f-rec (- n 2)))
                 (* 3 (f-rec (- n 3)))))))

;; Iterative Solution
(define (f-iter n)
  (cond ((< n 3) n)
        (else (f-iter-helper 0 1 2 3 n))))

(define (f-iter-helper fn-3 fn-2 fn-1 n target)
  (cond ((= n target) (get-fn fn-3 fn-2 fn-1))
        (else (f-iter-helper fn-2 fn-1 (get-fn fn-3 fn-2 fn-1) (+ n 1) target))))

(define (get-fn fn-3 fn-2 fn-1)
  (+ (* 3 fn-3) (* 2 fn-2) fn-1))

;; Pascal's Triangle
(define (pascal row col)
  (cond ((or (= col 0) (= col row)) 1)
        (else (+ (pascal (- row 1) col)
                 (pascal (- row 1) (- col 1))))))
