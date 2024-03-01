#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4		;
;										;
;  < Bennett Hamilton >					 	;
;  < hamibenn@oregonstate.edu >	                	;
;										;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (member? e lst)
  (if (null? lst)               ; if the list is empty, e is not a member, return false
      #f                         
      (if (eq? e (car lst))     ; if e is equal to the first element, it's a member, return true
          #t                     
          (member? e (cdr lst)) ; otherwise, iterate the rest of the list
      )
  )
) 

(define (set? lst) 
  (if (null? lst)                       ; if the list is empty, it's a set, return true
      #t
      (if (member? (car lst) (cdr lst)) ; if the first element is a member of the rest of the list, it's not a set
          #f
          (set? (cdr lst))              ; otherwise, iterate the rest of the list
      )
  ) 
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