;; This one's driving me batty.  Gonna have to come back to it.
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(print (A 1 10)) ;; 1<<10
(print (A 2  4)) ;; 1<<16
(print (A 3  3)) ;; 1<<16

;; The following procedures are all partial applications of (A x y), defined
;; above.  The value of x is fixed (curried), and the input to the new
;; procedure becomes the value of y.

;; This procedure just doubles its input.  It hits the second branch of (A)'s
;; cond on the first iteration every time.
;; It reduces to:
;; (* 2 n)
(define (f n) (A 0 n))

;; This is 2**n (except when n == 0).
;; (A 1 n)
;; (A 0 (A 1 (- n 1)))
;; (A 0 (A 0 (A 1 (- n 2))))
;; ...
(define (g n) (A 1 n))

;; Wut.
(define (h n) (A 2 n))

(print (h 0)) ;; 0
(print (h 1)) ;; 1<<1
(print (h 2)) ;; 1<<2
(print (h 3)) ;; 1<<4
(print (h 4)) ;; 1<<16
(print (h 5)) ;; 1<<??
