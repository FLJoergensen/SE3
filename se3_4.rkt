#lang racket

1.
(max(min 2 (- 2 5)) 0) ; 0
'(+ (- 2 13) 11) ; '(+ (- 2 13) 11)
(cadr '(Alle Jahre wieder)) ; 'Jahre
(cddr '(kommt (das Weihnachtfest))) ; '()
(cdadr '(kommt (das . Weihnachtfest))) ; 'Weihnachtfest
(cons 'Listen '(ganz einfach und)) ; '(Listen ganz einfach und)
(cons 'Paare 'auch) ; '(Paare . auch)
(equal? (list 'Racket 'Prolog 'Java) '(Racket Prolog Java)) ; #t
(eq? (list 'Racket 'Prolog 'Java) (cons 'Racket '(Prolog Java))) ; #f