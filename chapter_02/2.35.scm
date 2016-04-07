;; SICP Exercise 2.36
;; Redfine count leaves (from section 2.2.2)
;; Use an accumulate to count the number of leaves
;; Convert the tree into a list, map values to 1's, and sum

(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (tree-to-list t))))


(define (tree-to-list tree)
  (cond ((null? tree) '())
	((pair? tree) (append (tree-to-list (car tree))
			      (tree-to-list (cdr tree))))
	(else (list tree))))
