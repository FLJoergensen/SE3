#lang racket

(require se3-bib/butterfly-module)

;(show-butterfly 'red 'stripes 'curved 'rhomb)
;(show-butterfly 'yellow 'stripes 'straight 'hexagon)
;(show-butterfly 'blue 'dots 'curly 'ellipse)

;Wir speichern alle Merkmale, die ein Schmetterling haben kann jeweils in einer Liste.
;Die Dominanz ist durch die Reihenfolge der Elemente in der Liste geordnet.
;In der Liste wird mit der dominantesten Art eines Merkmals begonnen.
(define musterung '(punkte streifen sterne))
(define fluegelfarbe '(rot gruen blau gelb))
(define fluegelform '(rhombisch hexagonal elliptisch))
(define fuehlerform '(gerade gekruemmt geschweift))

(define (gibrezesList x xs)
  (cond ((empty? xs) '())
        ((equal? x (car xs)) xs)
        (else (gibrezesList x (cdr xs)))))
(define (gibdominant x1 x2 xs)
  (cond ((empty? xs) (cons x1 x2))
        ((equal? x1 (car xs)) (cons x1 x2))
        ((equal? x2 (car xs)) (cons x2 x1))
        (else (gibdominant x1 x2 (cdr xs)))))
