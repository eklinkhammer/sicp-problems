;;;; SICP Exercise 2.6

;;; Representing numbers as procedures

;; SICP Provided Functions

;; Zero returns a function that, given a function, returns a function
;; that applies the parameter function zero times.
(define zero (lambda (f) (lambda (x) x)))

;; Add-1, given a church-numeral, returns a function that takes a
;; function as an argument. It then returns a function that applies
;; the argument function once to the result of applying it
;; church numeral number of times to the argument input.
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (inc n)
  (+ n 1))

(define one (add-1 zero))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

;; Adding church numerals means applying a function a certain number
;; of times. Each church numeral, when called with a function, returns
;; a function that applies that function a certain number of
;; times. Therefore, if a is a church numeral, (a f) is the
;; application of function f the value of the numeral times. Calling
;; that applied function with a value returns a value that can be
;; subsequently used by a church numeral. 
(define (add-church m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))
