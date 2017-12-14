;#lang racket

(define file "library.txt")
(define num 0)
(define end-of-entry '(#\return #\newline #\return #\newline #\return))
(define eoe-length (length end-of-entry))
(define lib '())

;aux-function to increment global "num"
(define (incr) (set! num (+ num 1)) num)

;creates the association "lib" from the .txt-file "file" using the accumulator "acc"
(define (create-lib)
  (let ((port (open-input-file file)))
    (let loop((char (read-char port)) (entry '()) (acc '()))
      (cond ((eof-object? char)
	    (close-input-port port)
            (set! lib (append acc (list (cons (incr) (reverse entry))))))
            ((and (>= (length entry) eoe-length) (equal? end-of-entry (list-tail (reverse entry) (- (length entry) eoe-length))))  
             (loop (read-char port) '() (append acc (list (cons (incr) (reverse (list-tail entry eoe-length)))))))
	  (else (loop (read-char port) (cons char entry) acc))))))

;displays table of content
(define (toc)
  (display "----CODE LIBRARY SCHEME----\n")
  (let loop-lib((lib lib))
    (if (not (null? lib))
        (let loop-entry((entry (car lib))(entry-title '()))
          (if (eqv? (car entry) #\return)
              (begin
                (display (car (reverse entry-title)))
                (display " - ")
                (display (list->string (cdr (reverse entry-title))))
                (newline)
                (loop-lib (cdr lib)))
              (loop-entry (cdr entry) (cons (car entry) entry-title))))
        (values))))

;displays entry according to user input
(define (display-entry input)
  (newline)
  (display (list->string (cdr (assv input lib)))))

;validates user input
(define (check-input input)
  (cond((eqv? input 'toc)
        (newline)
        (toc)
        (main))
       ((not (number? input))
        (display "\nType in a number or 'toc' for table of content.\n"))
       ((or (> input num)(<= input 0))
        (display "\nNot a valid number for any entry.\n"))
       (else
        (display-entry input)
        (newline)
        (main))))

;main loop
(define (main)
  (cond((null? lib)
          (create-lib)
          (toc)
          (main))
       (else
          (display "\nWhat would you like to read? ")
          (check-input(read))
          (main))))

(main)