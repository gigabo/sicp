;; This is a great, except when new-if expressions are evaluated in normal
;; order both non-predicate operands are evaluated, whereas with the built in
;; if operator only one result clause operand is evaluated.
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;; This recursive solution for Newton's method has a base case that's meant to
;; be reached when the (good-enough? guess x) expression evaluates true.
;; Unfortunately, with the (new-if) procedure defined above, the recursion
;; case will always be evaluated, so we'll hit infinite recursion.
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
