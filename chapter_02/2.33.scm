;; SICP Exercise 2.34
;; Fill in the blanks, using accumulate (foldr) to define map, append,
;; and length

(define (accumulate op initial sequence)
 (if (null? sequence)
 initial
 (op (car sequence)
     (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
 (cond ((null? tree) nil)
 ((not (pair? tree)) (list tree))
 (else (append (enumerate-tree (car tree))
	       (enumerate-tree (cdr tree))))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
 (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
