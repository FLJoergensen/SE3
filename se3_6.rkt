#lang racket
#|Aufgabe 1:
Kopfstück: ist linaer weil mit der Funktion nur eine Rekursion aufgeruefen wird und direkt, 
           da in Kopfstück wieder Kopfstück aufgerufen wird
Endstück: Genauso wie in Kopfstück, ruft sich die Funktion nur selbst auf
Merge: Ist eine Baumrekursion, da im else-Zweig sich merge zweimal selbst aufruft. 
       Es ist direkt da merge nur merge rekursiv aufruft.
Merge-sort: Ist geschachtelt, da in der merge Rekursion auf merge-sort zurückgegriffen wird. 
            Außerdem ist es Baumrekursiv und indirekt, da versch. Rekursive Funktionen aufgerufen werden.
|#

(require racket/trace)

(define (sorted? xs comp)
  (cond ((empty? (cdr xs)) #t)
        ((comp (car xs) (cadr xs)) (sorted? (cdr xs) comp))
        (else #f)))
(define (IS xs comp c)
  (cond ((sorted? xs comp) xs)
        (else (IS (Insertion-Sort xs comp) comp (- c 1)))))
(define (Insertion-Sort xs comp)
  (cond ((empty? (cdr xs))  xs)
        ((comp (car xs) (cadr xs)) (cons (car xs) (Insertion-Sort (cdr xs) comp)))
        (else (cons (cadr xs) (Insertion-Sort (cons (car xs) (cddr xs)) comp)))))

;(trace Insertion-Sort)
(trace IS)
(IS '(2 3 5 1 6 9 8 7 4) < 9)
(IS '(9 3 5 4 6 2 8 7 1) < 9)
(IS '(9 8 7 6 5 4 3 2 1) < 9)