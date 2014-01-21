;; This was fun.

;; Here's the recursive procedure that returns a value in Pascal's Triangle
;; given a row and column.
(define (pascal row col)
  (cond ((= col 0) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

;; Here's a function that draws n rows of Pascal's Triangle.
(define (draw n)

  (define (pad m)
    (cond ((not (= m 0))
           (display " ")
           (pad (- m 1)))))

  (define (do_col row col)
    (display (pascal row col))
    (cond ((< col row)
           (display " ")
           (do_col row (+ col 1)))
          (else (display "\n"))))

  (define (do_row row)
    (pad (- n row))
    (do_col row 0)
    (cond ((< row n) (do_row (+ row 1)))))

  (do_row 0))

;; This is pretty.
(draw 4)
