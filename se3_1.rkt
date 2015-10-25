#lang racket

;1.1
;;Grad->Bogen
(define (DegToRad v)
  (* v (/ pi 180)))
;;Bogen->Grad
(define (RadToDeg v)
  (* v (/ 180 pi)))

;1.2
(define (my-acos a)
  (* 2 (atan (sqrt (/ (- 1 x) (+ 1 x))))))

;1.3
(define (nmTokm v)
  (* v 1.852))

;2.1
(define (AdistanzAB A B)
  (nmTokm (* (cosdg (car A) (car B) (deltaL A B)) 60)))
(define (Acosdg PA PB d)
  (+ (* (sin PA) (sin PB))(* (* (cos PA) (cos PB)) (cos d))))
(define (AdeltaL A B)
  (abs (dL (car(cdr A)) (car(cdr B)))))
(define (dL LA LB)
  (cond((> LA LB) (- LA LB))
        ((< LA LB) (- LB LA))
        (else 0)))
(define (NewOrt breite NS laenge EW)
  (list (cond ((eq? NS "S") (* breite -1))
              (else breite))
        (cond ((eq? EW "W") (* laenge -1))
              (laenge))))
;2.1 neu
(define (Distanz ALaenge ANS ABreite AEW BLaenge BNS BBreite BEW)
  (
(define (distanzAB A B)
  (nmTokm (* 60
             (RadToDeg (acos (cosdg A B))))))
(define (cosdg a b)
  (+ (* (sin (B a)) (sin (B b)))
     (* (cos (B a)) (cos (B b)) (cos (deltaL a b)))))
(define (L Ort)
  (car (cdr Ort)))
(define (B Ort)
  (car Ort))
(define (deltaL A B)
  (cond ((< (L A) (L B)) (- (L B) (L A)))
        ((> (L A) (L B)) (- (L A) (L B)))
        (else 0)))
;2.2
;(Anfangskurs (NewOrt 10 "N" 20 "W") (NewOrt 55 "S" 0 "E") "W")
(define (Anfangskurs A B EW)
  (cond ((eq? EW "W")(- 360 (ar A B)))
        ((eq? EW "E") (ar A B))
        (else (error "EW ist nicht E oder W"))))
(define (ar A B)
  (acos (/ (- (sin (car B)) (* (cosdg (car A) (car B) (deltaL A B)) (sin (car A))))
           (* (cos (car A)) (sin (acos (cosdg (car A) (car B) (deltaL A B))))))))
;2.3
;(GradToHimmel 20)
;v ist eine belibige zahl
(define (GradToHimmel v)
  (cond((> v 360) (GradToHimmel (- v 360)))
       ((< v 0) (GradToHimmel (+ v 360)))
       ((< v 11.25) "N")
       ((< v 33.75) "NNE")
       ((< v 56.25) "NE")
       ((< v 78.75) "ENE")
       ((< v 101.25) "E")
       ((< v 123.75) "ESE")
       ((< v 146.25) "SE")
       ((< v 168.75) "SSE")
       ((< v 191.25) "S")
       ((< v 213.75) "SSW")
       ((< v 236.25) "SW")
       ((< v 258.75) "WSW")
       ((< v 281.25) "W")
       ((< v 303.75) "WNW")
       ((< v 326.25) "NW")
       ((< v 348.75) "NNW")
       ((< v 371.25) "N")))
