;; SICP Exercise 1.35
;; Show that the golden ratio is a fixed point of the transformation
;;  x |-> 1 + 1/x, and use this fact to compute phi by means of the
;;  fixed point procedure

(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))
