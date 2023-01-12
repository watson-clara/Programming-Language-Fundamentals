#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4		;
;										;
;  < Clara Watson >					 	;
;  < watsoncl@oregonstate.edu >	                	;
;										;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; determines if an element e is part of list 
(define (member? e lst)
  (if (null? lst) #f ; checks if list is empty 
    (cond ((equal? e (car lst)) #t) ;determines if an element e is part of list
      (else (member? e (cdr lst))))) ; else check next
)

; checks whether its argument lst 
; contains duplicates or not
(define (set? lst) 
  (if (null? lst) #t ; checks if list is empty 
    (cond  ((member? (car lst) (cdr lst)) #f) ; if contains no duplicates
      (else (set? (cdr lst))))) ; else check next
)

; takes the set union of 
; list lst1 and list lst2 
; and returns a list 
; representing the mathematical union of the two lists
(define (union lst1 lst2)
  (if (null? lst1) lst2 ; checks if list is empty 
    ; check if is in lists 
    (cond ((member? (car lst1) lst2) (union (cdr lst1) lst2)) 
      ; create a union with element in lists
      (else (union (cdr lst1) (cons (car lst1) lst2)))))
)

; takes the set intersection of lst1 and lst2
; and returns a list representing
; the mathematical intersection of the two lists
(define (intersect lst1 lst2)
  (if (null? lst1) null ; checks if list is empty 
    ; check if first memeber of lst1 is in lst2 
    (cond ((member? (car lst1) lst2) (cons (car lst1) (intersect (cdr lst1) lst2))) ; if true add to list
      (else (intersect (cdr lst1) lst2)))) ; if false run again on next
)

; takes the set difference of  lst1 minus lst2 
; and returns a list representing
; the mathematical difference of the two lists
(define (difference lst1 lst2)
  (if (null? lst1) null ; checks if list is empty 
  ; check if first memeber of lst1 is in lst2 
    (cond ((member? (car lst1) lst2) (difference (cdr lst1) lst2)) ; if true add to difference 
      (else (cons (car lst1) (difference (cdr lst1) lst2))))) ; if not then go through next 
)

; takes lst1 and lst2 and returns a new list
; that contains all elements in both lists, 
; but eliminates any embedded lists 
; while retaining the elements from those embedded lists
(define (flatten lst1 lst2)
   (if (null? lst1) null ; checks if list is empty 
   (if (null? lst2) null  ; checks if list is empty 
   (append (flat lst1)(flat lst2)))) ; flatten one list at a time and then put back together as flat
)
; helper function
(define (flat lst)
    (cond (list? lst) (append (flat (car lst)) (flat (cdr lst))) ; if the element is also a list run again for element 
    (else (list lst))) ; otherwise save it to flattened list 
)


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