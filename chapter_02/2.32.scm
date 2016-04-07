;; SICP Exercise 2.32
;; Complete the following definition of a procedure that generates th
;; set of subsets of a set and give a clear explanation of why it
;; works: 

(define (subsets s)
 (if (null? s)
 (list nil)
 (let ((rest (subsets (cdr s))))
   (append rest (map <??> rest)))))

(define (subsets s)
 (if (null? s)
     (list '())
     (let ((rest (subsets (cdr s))))
       (append rest (map (lambda (x)
			     (cons (car s) x))
			 rest)))))

;; The complete list of subsets for a list consists of every possible
;; way to make sublists without the first element, and then everyway
;; to make those sublists but with the first element.
(subsets (list 1 2))
