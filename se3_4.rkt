#lang racket

;1
;(max(min 2 (- 2 5)) 0) ; 0
;'(+ (- 2 13) 11) ; '(+ (- 2 13) 11)
;(cadr '(Alle Jahre wieder)) ; 'Jahre
;(cddr '(kommt (das Weihnachtfest))) ; '()
;(cdadr '(kommt (das . Weihnachtfest))) ; 'Weihnachtfest
;(cons 'Listen '(ganz einfach und)) ; '(Listen ganz einfach und)
;(cons 'Paare 'auch) ; '(Paare . auch)
;(equal? (list 'Racket 'Prolog 'Java) '(Racket Prolog Java)) ; #t
;(eq? (list 'Racket 'Prolog 'Java) (cons 'Racket '(Prolog Java))) ; #f

;2.1
#|
    <notmeldung> ::= <maydaymal3><ueberschrift><notfallort><notfallart><hilfeleistung><peilzeichen><unterschrift><over>
    <maydaymal3> ::= <mayday> <mayday> <mayday>
    <mayday := "MAYDAY "
    <ueberschrift> ::= <hierist> <schiffnamemal3> <rufzeichen> <zusammenfassung>
    <zusammenfassung> ::= "MAYDAY "<schiffname>" ICH BUCHSTABIERE "<snamechars>" "<rufzeichen>
    <snamechars> ::= <string>
    <schiffnamemal3>::= <schiffname> <schiffname> <schiffname>
    <schiffname> ::= <wort>
    <notfallort> ::= <standort><zeitpunkt>
    <notfallart> ::= <string>
    <hilfeleistung> ::= <string>
    <peilzeichen> ::= "ICH SENDE DEN TRÄGER --"
    <unterschrift> ::= <wort>" "<rufzeichen>
    <rufzeichen> ::= "RUFZEICHEN" <wort> <wort> <wort> <wort>
    <standort> ::= "NOTALLPOSITION "<string>
    <zeitpunkt> ::= "NOTFALLZEIT "<zeit>" UTC"
    <zeit> ::= <stunde><minute>
    <stunde> ::= 0<ziffer> | 1<ziffer> | 2<stundenziffer>
    <minute> ::= 0<ziffer> | 1<ziffer> | 2<ziffer> | 3<ziffer> | 4<ziffer> | 5<ziffer>
    <ziffer> ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
    <stundenziffer> ::= "0" | "1" | "2" | "3"
    <string> ::= <wort> | <wort>" "<string>
    <wort> ::= <buchstabe> | <buchstabe><wort>
    <over> ::= "OVER"
|#
;2.2
(define tabelle '((#\A "Alfa")
                  (#\B "Bravo")
                  (#\C "Charlie")
                  (#\D "Delta")
                  (#\E "Echo")
                  (#\F "Foxtrott")
                  (#\G "Golf")
                  (#\H "Hotel")
                  (#\I "India")
                  (#\J "Juliett")
                  (#\K "Kilo")
                  (#\L "Lima")
                  (#\M "Mike")
                  (#\N "November")
                  (#\O "Oscar")
                  (#\P "Papa")
                  (#\Q "Quebec")
                  (#\R "Romeo")
                  (#\S "Sierra")
                  (#\T "Tango")
                  (#\U "Uniform")
                  (#\V "Viktor")
                  (#\W "Wiskey")
                  (#\X "X-ray")
                  (#\Y "Yankee")
                  (#\Z "Zulu")
                  (#\0 "Nadazero")
                  (#\1 "Unaone")
                  (#\2 "Bissotwo")
                  (#\3 "Terrathree")
                  (#\4 "Kartefour")
                  (#\5 "Pantafive")
                  (#\6 "Socisix")
                  (#\7 "Setteseven")
                  (#\8 "Oktoeight")
                  (#\9 "Novenine")
                  (#\, "Decimal")
                  (#\. "Stop")
                  (#\space #\space)))
(define (translate v dict)
  (let ((r (assoc v dict)))
    (cond ((not (equal? r #f)) (cdr r)))))

