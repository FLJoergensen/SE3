#lang racket

;1
;;TODO
(define miau 'Plueschi)
(define katze miau)
(define tiger 'miau)
(define (welcherNameGiltWo PA PB)
  (let ((PA 'Sam)
        (PC PA))
    PC))
(define xs1 '(0 2 3 miau katze))
(define xs2 (list miau katze))
(define xs3 (cons katze miau))
;2.1
(define (Fak v)
  (cond ((> v 0) (* v (Fak (- v 1))))
        ((= v 0) 1)
        (else (error "v element aus N"))))
(define (FakLowRAM v)
  (Fak2 0 v))
(define (Fak2 v e)
  (cond ((> v 0) (* v (Fak (- v 1))))
        ((= v 0) (Fak2 1 (- e 1)))
        (else (error "v element aus N"))))
;2.2
;; TODO
(define (pow r n)
  (cond ((> n 0) (* (pow r (- n 1)) r))
        ((= n 0) 1)))
(define (pow2 r n)
  (cond ((odd? n) (* (pow r (- n 1)) r))
        ((even? n) (sqr (pow r (/ n 2))))
        ((= n 0) 1)))
;2.3
;;TODO
;2.4
;;TODO
;3
;;TODO