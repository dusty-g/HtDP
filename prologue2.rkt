;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname prologue2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (sign x )
  (cond
    [(> x 0) 1]
    [(= x 0) 0]
    [(< x 0) -1]))

(sign -5)


(define (picture-of-rocket.v2 height)
  (cond
    [(<= height (- HEIGHT (/ (image-height ROCKET) 2))) (place-image ROCKET 50 height (empty-scene WIDTH HEIGHT))]
    [(> height (- HEIGHT (/ (image-height ROCKET) 2)))
        (place-image ROCKET 50 (- HEIGHT (/ (image-height ROCKET) 2)) (empty-scene WIDTH HEIGHT))]))

(define HEIGHT 200)
(define WIDTH 100)
(define HORIZONTAL-CENTER (/ WIDTH 2))
(define V 3)
(define (distance t) (* V t))
;; replace the period with rocket image
(define ROCKET .)
(define COLOR "gray")
(define MTSCN (overlay/align "middle" "bottom"
  (rectangle WIDTH 8 "solid" "black")
  (empty-scene WIDTH HEIGHT COLOR)))

(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))
(define (picture-of-rocket.v6 t)
  (cond
    [(<= (distance t) ROCKET-CENTER-TO-TOP) (place-image ROCKET HORIZONTAL-CENTER (distance t) MTSCN)]
    [(> (distance t) ROCKET-CENTER-TO-TOP) (place-image ROCKET HORIZONTAL-CENTER ROCKET-CENTER-TO-TOP MTSCN)]))

(animate picture-of-rocket.v6)
