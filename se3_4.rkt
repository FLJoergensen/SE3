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
(define (string-repeat i str)
  (s-r i str ""))
(define (s-r i str resu)
  (cond ((< i 1) resu)
        (else (s-r (- i 1) str (string-append resu str)))))
(define (stringlist->string xs)
  (cond ((empty? xs) "")
        (else string-append (car xs) " " (stringlist->string (cdr xs)))))
(define (B-E-T str)
  (stringlist->string (Buchstabieren-eines-Textes str)))
(define (Buchstabieren-eines-Textes text)
  (BeT (string->list (string-upcase text)) tabelle '()))
(define (transE v dict)
  (let ((r (translate v dict)))
    (cond ((void? r) '())
          (else  r))))
(define (BeT textList dict res)
  (cond ((empty? textList) res)
        (else (BeT (cdr textList) dict (append res (transE (car textList) dict))))))
(define (notfallmeldung schiffsname rufzeichen position notfallzeit notfallart weitere-angaben)
  (string-append  (string-repeat 3 "MAYDAY ") "\n"
                  "HIER IST " "\n"
                  (string-repeat 3 (string-append schiffsname " ")) (B-E-T rufzeichen) "\n"
                  "MAYDAY " schiffsname " ICH BUCHSTABIERE " (B-E-T schiffsname) "\n"
                  "RUFZEICHEN " (B-E-T rufzeichen) "\n"
                  "NOTFALLPOSITION " position "\n"
                  "NOTFALLZEIT " notfallzeit "\n"
                  notfallart "\n"
                  weitere-angaben "\n"
                  "ICH SENDE DEN TRÄGER ---" "\n"
                  schiffsname " " (B-E-T rufzeichen) "\n"
                  "OVER" "\n"))
;2.2
(display (notfallmeldung "BABETTE" "DEJY" "UNGEFAEHR 10 SM NORDOESTLICH LEUCHTTURM KIEL" "1000 UTC" "SCHWERER WASSEREINBRUCH WIR SINKEN"
                         "KEINE VERLETZTEN\nVIEW MANN GEHEN IN DIE RETTUNGSINSEL\nSCHNELLE HILFE ERFORDERLICH"))
(display (notfallmeldung "AMIRA" "AMRY" "53°56’N, 006°31’E" "1640 UTC" "KENTERUNG IN SCHWERER SEE, SCHIFF SINKT" 
                         "15 MANN AN BORD, SCHIFF IST 15 METER LANG, ROTER RUMPF"))
