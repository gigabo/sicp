;; This is a cool one.  The operator is the result of an if expression, while
;; the operands are fixed.  If the second operand is negative, it's subtracted
;; from the first.  If it's positive it's added.
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(print (a-plus-abs-b 1  1)) ;; 2
(print (a-plus-abs-b 1 -1)) ;; 2
