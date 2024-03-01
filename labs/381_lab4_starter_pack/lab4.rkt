#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4		;
;										;
;  < Bennett Hamilton >					 	;
;  < hamibenn@oregonstate.edu >	                	;
;										;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (member? e lst)
  ; Check if the list is empty
  (if (null? lst)
      #f                         ; if the list is empty, e is not a member, return false
      (if (eq? e (car lst))
          #t                     ; if e is equal to the first element, it's a member 
          (member? e (cdr lst))  ; otherwise, iterate the rest of the list
      )
  )
) 

(define (set? lst) 
  ; complete this function definition 
)

(define (union lst1 lst2)
  ; complete this function definition
)

(define (intersect lst1 lst2)
  ; complete this function definition
)

(define (difference lst1 lst2)
  ; complete this function definition
)

;;; (define (flatten lst1 lst2)
;;;   ; complete this function definition
;;; )

;;;;;;;;;;;;;;;;;
;  DO NOT EDIT  ;
;;;;;;;;;;;;;;;;;
; enables testing via piping in stdin
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))