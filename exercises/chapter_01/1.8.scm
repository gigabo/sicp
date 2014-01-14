(define (cube-root x)

  ;; The only difference here from the (better-enough? guess) procedure for
  ;; sqrt is we're cubing the guess instead of squaring it.
  (define (good-enough? guess)
    (< (abs (- (* guess guess guess) x)) (* guess .001)))

  ;; This is just based on the formula given for the exercise.
  (define (improve guess)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

  ;; This is the same as sqrt-iter, just with a different name.
  (define (cube-root-iter guess)
    (if (good-enough? guess)
      guess
      (cube-root-iter (improve guess))))

  ;; Kick-off.
  (cube-root-iter 1.0))

(print (cube-root  1.0)) ;; 1.0
(print (cube-root  8.0)) ;; 2.0000049116755
(print (cube-root 27.0)) ;; 3.00000054106418
