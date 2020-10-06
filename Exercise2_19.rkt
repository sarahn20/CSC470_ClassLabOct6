(define number->bintree
  (lambda (num)
    (list num (list) (list))))

(define current-element
  (lambda (bintree)
    (car bintree)))

(define move-to-left-son
  (lambda (bintree)
    (cadr bintree)))

(define move-to-right-son
  (lambda (bintree)
    (caddr bintree)))

(define at-leaf?
  (lambda (val)
    (if (null? val) #t #f)))

(define insert-to-left
  (lambda (num bintree)
    (list (car bintree) (if (at-leaf? (move-to-left-son bintree))
                            (number->bintree num)
                            (insert-to-left (current-element (move-to-left-son bintree))(number->bintree num)))
                            (caddr bintree))))

(define insert-to-right
  (lambda (num bintree)
    (list (car bintree) (cadr bintree) (if (at-leaf? (move-to-right-son bintree))
                            (number->bintree num)
                            (insert-to-right (current-element (move-to-right-son bintree))(number->bintree num))))))

;(number->bintree 13)
(define t1 (insert-to-right 14 (insert-to-left 12 (number->bintree 13))))
t1
;(move-to-left-son t1)
;(current-element (move-to-left-son t1))
;(at-leaf? (move-to-right-son (move-to-left-son t1)))
;(insert-to-left 15 t1)
