;; Here's our recursive solution.
(define (f_recursive n)
  (cond ((< n 3) n)
        (else (+
          (f_recursive (- n 1))
          (f_recursive (- n 2))
          (f_recursive (- n 3))))))

;; This one's iterative.
(define (f_iterative n)
  (define (iter a b c n)
    (cond ((= n 0) a)
          (else (iter b c (+ a b c) (- n 1)))))
  (iter 0 1 2 n))

(define (test f)
  (print (f 0))
  (print (f 1))
  (print (f 2))
  (print (f 3))
  (print (f 4))
  (print (f 5))
  (print (f 6))
  (print (f 7)))

(test f_recursive)
(test f_iterative)
