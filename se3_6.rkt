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

(define (Insertion-Sort xs comp)
  (cond ((empty? xs) (display xs) '())
        ((comp (car xs) (cadr xs)) (display xs) (cons (car xs) (Insertion-Sort (cdr xs) comp)))
        (else (cons (cadr xs) (Insertion-Sort (cons (car xs) (cddr xs)) comp)))))