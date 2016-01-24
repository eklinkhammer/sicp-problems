;;;; SICP Exercise 2.2
;;; Consider the problem of representing line segments in a
;;; plane. Each segment is represented with a pair of points: a
;;; starting point and ending point. Define a constructor make-segment
;;; and selectors start-segment and end-segment that define the
;;; representation of segments in terms of points. Furthermore, a
;;; point can be represented as a pair of numbers: the x and y
;;; coordinates. Accordingly, specify a constructor make-point and
;;; selectors x-point and y-point that define this
;;; representation. Finally, using your selectors and constructors,
;;; define a procedure midpoint-segment that takes a line segment and
;;; returns a point.


;; Segment
(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

;; Point
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (midpoint-segment seg)
  (define (average x y)
    (/ (+ x y) 2))
  (let ((mid-x (average (x-point (start-segment seg))
			(x-point (end-segment seg))))
	(mid-y (average (y-point (start-segment seg))
			(y-point (end-segment seg)))))
    (make-point mid-x mid-y)))



;; Provided Helper Function
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
