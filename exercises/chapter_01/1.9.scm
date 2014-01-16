;; These are used by the functions below.
(define (inc x) (+ x 1))
(define (dec x) (- x 1))

;; Below I define the (+ a b) procedures within procedure blocks so their
;; operator overrides don't affect our (inc x) function above.  This also
;; prevents them from affecting each other.
;;
;; Don't know another way of creating scope in scheme yet.

;; This first function is what's described by the book as a recursive process.
;; It needs to keep track of a chain of operations to unwind all the way up
;; the call stack.
;;
;; (+ 4 5)
;; (inc (+ (dec 4) 5))
;; (inc (+ 3 5))
;; (inc (inc (+ (dec 3) 5)))
;; (inc (inc (+ 2 5)))
;; (inc (inc (inc (+ (dec 2) 5))))
;; (inc (inc (inc (+ 1 5))))
;; (inc (inc (inc (inc (+ (dec 1) 5)))))
;; (inc (inc (inc (inc (+ 0 5)))))
;; (inc (inc (inc (inc 5))))
;; (inc (inc (inc 6)))
;; (inc (inc 7))
;; (inc 8)
;; 9
(define (part-1)
  (define (+ a b)
    (if (= a 0)
      b
      (inc (+ (dec a) b))))
  +)

;; The second function is what's described by the book as an iterative
;; process.  It uses tail recursion and doesn't need to keep state on the
;; stack.
;;
;; (+ 4 5)
;; (+ (dec 4) (inc 5))
;; (+ 3 6)
;; (+ (dec 3) (inc 6))
;; (+ 2 7)
;; (+ (dec 2) (inc 7))
;; (+ 1 8)
;; (+ (dec 1) (inc 8))
;; (+ 0 9)
;; 9
(define (part-2)
  (define (+ a b)
    (if (= a 0)
      b
      (+ (dec a) (inc b))))
  +)

;; This takes one of our generated (+ a b) procedures and uses it to print the
;; result of (+ 4 5), which is the example in the exercise.
(define (verify +) (print (+ 4 5)))

(verify (part-1))
(verify (part-2))
