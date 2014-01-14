;; This is just a helper.  It's a procedure that takes two operands and
;; returns the sum of their squares.
(define (sos a b) (+ (* a a) (* b b)))

;; A procedure that takes three numbers as arguments and returns the sum of
;; the squares of the two larger numbers.
;;
;; Sum-Of-Squares-Of-Two-Larger.
;;
(define (sosotl a b c)
  (cond ((and (> a c) (> b c)) (sos a b))
        ((and (> b a) (> c a)) (sos b c))
        (else (sos a c))))

;; Some test cases.
(print (sosotl 1 2 3)) ;; 13
(print (sosotl 2 2 3)) ;; 13
(print (sosotl 2 3 3)) ;; 18
(print (sosotl 3 2 3)) ;; 18
(print (sosotl 3 3 2)) ;; 18
(print (sosotl 3 3 3)) ;; 18
