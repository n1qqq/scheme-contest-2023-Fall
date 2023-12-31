;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: 
;;;    The Logo of my Favorite Band, Poppin'Party
;;;
;;; Description:
;;;    Poppin'Party is
;;;    My Favorite, Forever
;;;    Daisuki Dayo!

(define (letter-P)
    (forward 195)
    (roundy-turn right 45 0.2)
    (roundy-turn right 45 0.5)
    (forward 60)
    (roundy-turn right 10 1.75)
    (roundy-turn right 20 1.5)
    (roundy-turn right 100 1.2)
    (roundy-turn right 20 1.5)
    (roundy-turn right 10 1.75)
    (roundy-turn right 5 2.25)
    (roundy-turn right 5 3)
    (forward 30)
    (left 80)
    (forward 60)
    (roundy-turn right 60 0.2)
    (roundy-turn right 90 .6)
)

(define (roundy-turn left/right deg step) (
    if (> deg 0) (begin 
        (left/right 1) 
        (forward step) 
        (roundy-turn left/right (- deg 1) step) 
)))

(define (star! actual-length deg-L step-L deg-R step-R index) (
    if (< index 5) (begin
        (forward actual-length)
        (roundy-turn left deg-L step-L)
        (forward actual-length)
        (roundy-turn right deg-R step-R)
        (star! actual-length deg-L step-L deg-R step-R (+ 1 index))
)))



;;; Some Math

;;; Basic Formulas
; arc-length = radius * theta-in-radians
; theta-in-rad = theta-in-deg * pi / 180
; hidden-radius = arc-length / theta-in-rad 
;                            = (step * theta-in-deg) / (theta-in-deg * pi / 180)
; length-cut-off = hidden-radius * tan(theta / 2)
; actual-length = base-length - length-cut-off-L - length-cut-off-R

;;; Procedure
; choose 225 as base length, 0.75 as base step
; re-alignment wrto the window
;     x = 0.5 * 300 * sqrt(3); y = x * tan(0.5 * pi * 3 / 5)
;     then move y upward at least 64.344, and move x rightward
; deg-L = 2 * (180 * 3 / 5 - 180 / 5 - 6 - 6) / 2    ; the outer angle is the actual one
; deg-R = 180 - (180 / 5 + 6 + 6)
; actual-length-1 = 225-tan(pi/6)*135/pi-tan(66*pi/180)*135/pi = 103.673879

; choose diff-in-radii = 6
; step-L-2 = diff-in-radii * (pi / 180) + base-step = 0.85472
; step-R-2 = 0.75 - 6 * (pi / 180) = 0.64528

; dist1 = diff-in-radii * 3.5 = 21
; step-R-3 = 0.75 - (21 + 6) * (pi / 180) = 0.383481
; step-L-3 = 1.5 - (0.75 - 27 * (pi / 180)) = 1.116519

; dist2 = dist1 * 2.5 = 52.5
; calculate coordinate, got approximately
;     x* = -21, y* = -186

; finally, shrink the very first star



(define (draw) 
    (pu) 
        (setpos -100 -200) (lt 6)
    (pd)
(color "#FF3377")
    (begin_fill)
        (star! 103.673879 60 0.75 132 0.75 0)
    (end_fill)
    (rt 90) (fd 6) (lt 90)
(color "#FFFFFF")
    (begin_fill)
        (star! 103.673879 60 0.85472 132 0.64528 0)
    (end_fill)
    (rt 90) (fd 21) (lt 90)
(color "#FF3377")
    (begin_fill)
        (star! 103.673879 60 1.221239 132 0.278761 0)
    (end_fill)
    (pu)
        (setpos -31 -96) (lt 6)
    (pd)
(color "#FFFFFF")
    (begin_fill)
        (letter-P)
    (end_fill)
    (setpos 0 10) (seth -9)
(color "#FF3377")
    (begin_fill)
        (star! 20.734776 60 0.13125 132 0.13125 0)
    (end_fill)
    (ht)
    (exitonclick)
)

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)
