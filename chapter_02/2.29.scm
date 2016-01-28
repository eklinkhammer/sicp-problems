;;; SICP Exercise 2.29

;; Provided Code
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; Define selectors for mobile and branch
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch))

;; Using selectors, write function total weight that returns the total
;; weight of a mobile
(define (mobile? structure) (pair? structure))

(define (weight-branch branch)
  (if (mobile? (branch-structure branch))
      (weight-mobile (branch-structure branch))
      (branch-structure branch)))

(define (weight-mobile mobile)
  (+ (weight-branch (left-branch mobile))
     (weight-branch (right-branch mobile))))

;; Write a function balanced. A mobile is balanced if the torque
;; (length * weight) of each subtree is the same AND if every subtree
;; is also balanced.

(define (balanced-branch? branch)
  (if (mobile? (branch-structure branch))
      (balanced? (branch-structure branch))
      #t))
(define (balanced? mobile)
  (define (torque branch)
    (* (branch-length branch) (weight-branch branch)))
  (let ((lbranch (left-branch mobile))
	(rbranch (right-branch mobile)))
    (and (= (torque lbranch) (torque rbranch))
	 (balanced-branch? lbranch)
	 (balanced-branch? rbranch))))
