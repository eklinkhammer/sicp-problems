;;;; SICP Exercise 2.3

;;; Implement a representation for rectangles in a plane. Include
;;; functions for the area and perimeter of a rectangle. Implement a
;;; different representation for a rectangle, and the area and
;;; perimeter should work without changes (ie, define constructors and
;;; selectors such that area and perimeter can always work).

;; Area and Perimeter (representation agnostic)
(define (area rect)
  (* (height rect) (width rect)))

(define (perim rect)
  (* 2 (+ (height rect) (width rect))))

(define (height rect)
  (- (y-point (top-right rect))
     (y-point (bot-left rect))))
(define (width rect)
  (- (x-point (top-right rect))
     (x-point (bot-left rect))))

;; Representation 1 - the two unconnected points
;; a will always be bottom left, b will be top right
(define (make-rect a b)
  (let ((bot-left (make-point (min (x-point a)
				   (x-point b))
			      (min (y-point a)
				   (y-point b))))
	(top-right (make-point (max (x-point a)
				    (x-point b))
			       (max (y-point a)
				    (y-point b)))))
    (cons bot-left top-right)))

(define (top-right rect) (cdr rect))
(define (bot-left rect) (car rect))
(define (top-left rect)
  (make-point (x-point (bot-left rect))
	      (y-point (top-right rect))))
(define (bot-right rect)
  (make-point (x-point (top-right rect))
	      (y-point (bot-left rect))))

