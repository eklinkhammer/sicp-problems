;;; SICP Exercise 2.27
;; Write a procedure fringe that takes as argument a tree (represented
;; as a list) and returns a list whose elements are all the leaves of
;; the tree arranged in left-to-right order.

(define (fringe l)
  (cond ((null? l) '())
	((pair? l)
	 (append (fringe (car l)) (fringe (cdr l))))
	(else (list l))))
  
