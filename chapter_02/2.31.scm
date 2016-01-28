;; SICP Exercise 2.31
;; Write a function tree map

;; test
(square-tree
 (list 1
 (list 2 (list 3 4) 5)
 (list 6 7)))

(define (tree-map f tree)
  (map (lambda (subtree)
	 (if (pair? subtree)
	     (tree-map f subtree)
	     (f subtree)))
       tree))

(define (square x) (* x x))

(define (square-tree x) (tree-map square x))
