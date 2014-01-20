;; This is a primimitive expression.  It is a number literal representing
;; the number 10.  If it were put into the REPL, the result of the
;; expression would be 10.
10

;; This is a combination.  It is a sum of the operands.  The REPL would
;; print 12.
(+ 5 4 3)

;; Another combination.  Difference of operands.  REPL prints 8.
(- 9 1)

;; Combination for division of operands.  REPL prints 3.
(/ 6 2)

;; This is an addition combination whose operands are themselves arithmetic
;; combinations.  The result is 6.
(+ (* 2 4) (- 4 6))

;; This binds the value 3 to the symbol a.  The REPL doesn't print anything as
;; the result of this definition definition.  I guess the definition
;; doesn't evaluate to the defined value.
(define a 3)

;; This binds the result of immediate execution of the addition of 1 to the
;; current value to a to the symbol b.  This is not a compound procedure
;; definition.  REPL doesn't print anything, but b is bound to the value 4.
(define b (+ a 1))

;; A pretty simple arithmetic expression involving the two newly defined
;; symbols.  Result is 19, and is printed by REPL.
(+ a b (* a b))

;; This is a predicate combination.  Result is #f, which is printed by REPL.
(= a b)

;; This if expression has a compound conditional with two predicate
;; combinations.  The expression evaluates to the value of b if the
;; conditional is true, or the value of a if it's false.  In this case the
;; conditional evaluates true, so the REPL prints 4.
(if (and (> b a) (< b (* a b)))
  b
  a)

;; This cond expression has two conditional expressions and a default value.
;; The second conditional expression evaluates true, so the result of the cond
;; expression is the resulting sum.  The REPL prints 16.
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

;; This expression is a sum with one operand that is the result of an if
;; expression.  The REPL prints 6.
(+ 2 (if (> b a) b a))

;; Similar to above.  Arithmetic combination with one operand being the result
;; of a cond.  The product of b and 1 + a.  REPL prints 16.
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
