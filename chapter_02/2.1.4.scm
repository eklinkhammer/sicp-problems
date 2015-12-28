;;;; SICP Extended Exercise: Interval Arithmetic
;;;; Exercises 2.7 - 2.16

;;; SICP Code
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))

;;; Helper Print
(define (print-interval int)
  (newline)
  (display "Lower bound: ")
  (display (lower-bound int))
  (display " Upper bound: ")
  (display (upper-bound int)))

;;; Exercise 2.7
;;; Define selectors upper-bound and lower-bound
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

;;; Exercise 2.8
;;; Define a sub-interval procedure analogous to div-interval
(define (sub-interval x y)
  (add-interval x
		(make-interval (* -1 (upper-bound y))
			       (* -1 (lower-bound y)))))

;;; Exercise 2.9
;;; Define a width procedure, and show that addition and subtraction
;;; results in widths that are functions of the inputs, but that the
;;; width of multiplication and division does not necessarily.

(define (width interval)
  (abs (/ (- (upper-bound interval) (lower-bound interval))
	  2)))

;; width interval a +- width interval b ___ width interval a +-b
;; abs (upper - lower / 2) +- abs (upper - lower) / 2 ___ abs (upper
;; +- upper - lower +- lower) / 2

(define one-to-five (make-interval 1 5))
(define six-to-ten (make-interval 6 10))
(+(width one-to-five) (width six-to-ten))
;; 4
(width (add-interval one-to-five six-to-ten))
;; 4

(* (width one-to-five) (width six-to-ten))
;; 4
(width (mul-interval one-to-five six-to-ten))
;; 22

;;; Exercise 2.10
;;; Modify division to check for a range that goes over zero
(define (div-interval x y)
  (if (and (> (upper-bound y) 0) (< (lower-bound y) 0))
      (error "Error. Range over 0")
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))

;;; Exercise 2.11
;;; By checking signs, it is possible to break mul-interval into 9
;;; cases, of which only one requires more than two multiplications

;; au > 0, al > 0, bu > 0, bl > 0 -> xu = au * bu, xl = al * bl
;; au > 0, al > 0, bu > 0, bl < 0 -> xu = au * bu, xl = au * bl
;; au > 0, al > 0, bu < 0, bl < 0 -> xu = al * bu, xl = au * bl
;; au > 0, al < 0, bu > 0, bl > 0 -> xu = au * bu, xl = al * bu

;; au > 0, al < 0, bu > 0, bl < 0 -> xu = au * bu or al * bl
;;                                   xl = au * bl or al * bu

;; au > 0, al < 0, bu < 0, bl < 0 -> xu = bl * al, xl = bl * au
;; au < 0, al < 0, bu > 0, bl > 0 -> xu = au * bl, xl = al * bu
;; au < 0, al < 0, bu > 0, bl < 0 -> xu = al * bl, xl = bu * al
;; au < 0, al < 0, bu < 0, bl < 0 -> xu = bl * al, xl = au * bu

;; Not worth writing all of the cases out

;; SICP Given Code
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;;; Exercise 2.12
;;; Implement a constructor and selector for make-center with
;;; percentages

(define (make-center-percent c p)
  (make-center-width c (* c p)))

(define (percent i)
  (/ (width i) (center i)))


