#lang racket

;1.1
(define tabelle '(("A" "Alfa")
                  ("B" "Bravo")
                  ("C" "Charlie")))

;1.2
(define (Text->p text tabelle)
  (t->p (string->list text) tabelle '()))
(define (t->p liste tab ergebnis)
  (cond ((empty? liste) ergebnis)
        (else (cons (tabellenSurch (car liste) tabelle) ergebnis))))
(define (tabellenSurchAll surch tabelle ergebnisListe)
  (cond ((empty? tabelle) ergebnisListe)
        ((equal? surch (caar tabelle)) (tabellenSurch surch (cdr tabelle) (cons (cdar tabelle) ergebnisListe)))
        (else (tabellenSurch surch (cdr tabelle) ergebnisListe))))
(define (tabellenSurch surch tabelle)
  (cond ((empty? tabelle) null)
        ((equal? surch (caar tabelle)) (cons (cdar tabelle) '()))
        (else (tabellenSurch surch (cdr tabelle)))))

;1.3
(define (UP chr)
  (char-upcase chr))

;1.4
(define (Buchstabieren-eines-Textes text)
  (Text->p text tabelle))