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
(define (pow r n)
  (cond ((odd? n) (* (pow r (- n 1)) r))
        ((even? n) (sqr (pow r (/ n 2))))
        ((= n 0) 1)))
;2.3
;TEST
(define (2euler genau)
  (euler 1 genau))
(define (euler v genau)
  (cond ((< (/ v (Fak (- v 1))) genau) (/ v (Fak (- v 1))))
        (else (+ (euler (+ v 1) genau)(/ v (Fak (- v 1)))))))
(define (2eulerEnd genau)
  (eulerEnd 1 genau 0))
(define (eulerEnd c genau v)
  (cond ((< (/ c (Fak (- c 1))) genau) (+ v (/ c (Fak (- c 1)))))
        (else (eulerEnd (+ c 1) genau (+ v (/ c (Fak (- c 1))))))))
;2.4
;;TODO
;3
;;TODO