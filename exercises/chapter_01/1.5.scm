;; So, this is an infinite loop (actually infinite recursion, presumably with
;; tail-call optimization).  If it gets evaluated that's game over.
(define (p) (p))

;; This test returns zero if the first operand is zero, otherwise it returns
;; the second operand.
(define (test x y)
  (if (= x 0)
    0
    y))

;; OK, so if this expression is evaluated in normal order then both operands
;; are fully evaluated and resolved to their resulting values, then the
;; operator is applied to those values.  Because the evaluation of the second
;; operand is an infinite loop, though, this will never finish.
;;
;; If, however the expression is evaluated in applicative order then the
;; second operand is never needed, so it's never evaluated and the result of
;; the expression is a quick 0.
(test 0 (p))
