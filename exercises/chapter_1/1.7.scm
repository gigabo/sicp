;; This is a modified sqrt function that takes an extra operand which lets us
;; opt-in to our improved (good-enough? guess) procedure.
(define (sqrt x do-better?)

  ;; Here's the original (good-enough? guess) procedure.
  ;; This uses a fixed target threshold to qualify a guess as good enough.
  ;; The trouble with this is very large or very small values.
  (define (good-enough? guess)
    (< (abs (- (* guess guess) x)) .001))

  ;; Here's our modified (better-enough? guess) procedure.
  ;; It uses a variable target threshold that's based on a fraction of the
  ;; guess itself, so it scales with the input value.
  (define (better-enough? guess)
    (< (abs (- (* guess guess) x)) (* guess .001)))

  ;; Newton's method.
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))

  ;; Here we're going to use a conditional predicate that is itself the result
  ;; of a conditional expression predicated on our do-better? operand we've
  ;; added to the (sqrt x) procedure.
  (define (sqrt-iter guess)
    (if ((if do-better? better-enough? good-enough?) guess)
      guess
      (sqrt-iter (improve guess))))

  ;; Kick off with an initial guess.
  (sqrt-iter 1.0))

;; First with the old procedure.
(print (sqrt 1.0      #f)) ;; 1.0
(print (sqrt 4.0      #f)) ;; 2.00000009292229
(print (sqrt 0.000001 #f)) ;; 0.0312606555254453

;; Then with the new procedure.
(print (sqrt 1.0      #t)) ;; 1.0
(print (sqrt 4.0      #t)) ;; 2.00000009292229
(print (sqrt 0.000001 #t)) ;; 0.00129619159270688 (better, indeed)
