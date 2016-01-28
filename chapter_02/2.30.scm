;; SICP Exercise 2.30
;;  Define a procedure square-tree analogous to the square-list
;;  procedure of exercise 2.21.

(square-tree
 (list 1
 (list 2 (list 3 4) 5)
 (list 6 7)))

;; Without map
(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) '())
	((pair? tree) (cons (square-tree (car tree))
			    (square-tree (cdr tree))))
	(else (square tree))))

;; with map
(define (square-tree tree)
  (map (lambda (subtree)
	 (if (pair? subtree)
	     (square-tree subtree)
	     (square subtree)))
       tree))
