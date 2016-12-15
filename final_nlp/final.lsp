;;Author: Aurelio Arango
;;cs571


;;   P-CD should be setqed to:
;;               		 (PTRANS
;;          	   			ACTOR	( A-filler )
;;        	      			TO  		( T-filler ))
;;set P-CD
(setq P-CD '(PTRANS ACTOR ( A-Filler ) TO ( T-filler )))

;;   A-CD should be setqed to:
;;               		 (ATRANS
;;          	   			ACTOR	  ( A-filler )
;;                    OBJECT  (O-filler)
;;        	      		TO  		( T-filler ))
;;set A-CD
(setq A-CD '(PTRANS ACTOR ( A-Filler ) OBJECT (O-filler) TO ( T-filler )))


;;Setting Part of Speech (POS)
;;Add <HUMAN>
  (setf  (get 'Mary 'Category) 'HUMAN)
  (setf  (get 'John 'Category) 'HUMAN)
  (setf  (get 'Peter 'Category) 'HUMAN)
  (setf  (get 'Haley 'Category) 'HUMAN)
;; add <PTRANS>
  (setf (get 'went 'Category) 'PTRANS)
  (setf (get 'played 'Category) 'PTRANS)
  (setf (get 'flew 'Category) 'PTRANS)
  (setf (get 'stayed 'Category) 'PTRANS)
;; add <ATRANS>
  (setf (get 'gave 'Category) 'ATRANS)
  (setf (get 'sold 'Category) 'ATRANS)
;; add <LOCATION>
  (setf (get 'school 'Category) 'LOCATION)
  (setf (get 'work 'Category) 'LOCATION)
  (setf (get 'library 'Category) 'LOCATION)
  (setf (get 'museum 'Category) 'LOCATION)
;;add <ARTICLES>
  (setf (get 'A 'Category) 'ARTICLE)
  (setf (get 'AN 'Category) 'ARTICLE)
  (setf (get 'THE 'Category) 'ARTICLE)
;;add <object>
  (setf (get 'book 'Category) 'OBJECT)
  (setf (get 'sold 'Category) 'OBJECT)

(defun main ()
  ;; variables to use for the program
  (prog (sentence property CD noun2 PTRANS ERROR ERROR_NOT_HUMAN)
    ;;first get a sentence from the user
    (princ "Hi, give me a sentence in parenthesis: ")
    (setq sentence (read))
    ;;get the second element from the sentence
    ;;check its property
        ;;#DEBUG----(princ (get (second_word sentence) 'Category))
    (cond
    ;;if equals to ptrans
    ((eq 'PTRANS (get (second_word sentence) 'Category))
      (setq CD P-CD)
      (cond
        ((eq 'HUMAN (get (first_word sentence) 'Category))
            (princ "IT IS HUMAN") )

        (T (go ERROR_NOT_HUMAN))
        )

      )



    )

    ERROR_NOT_HUMAN(princ "ERROR::NOT HUMAN TYPE")
                    (ABORT)



    ;;(princ A-CD)
    ;;blank line
    (terpri)
    ;;(princ P-CD)
    (terpri)
    ;;(setq P-CD ( fill_actor P-CD (first_word sentence)))
    ;;(princ (is_this_type (first_word sentence) 'HUMAN) )
    (terpri)
    ;;(princ P-CD)
    (terpri)
    (princ "IT WORKS!!!!")
  )
)
;;-------------------------------get words-------------------
;;Returns the fist element of the sentence.
(defun first_word(sentence)
  (car sentence)
)
;;Return the second element of the sentence
(defun second_word(sentence)
  (car (cdr sentence))
)
;;Return the third element of the sentence
(defun third_word(sentence)
  (car (cdr (cdr sentence)))
)
;;Return the fourth element of the sentence
(defun fourth_word(sentence)
  (car (cdr (cdr (cdr sentence))))
)
;;Return the fifth element of the sentence
(defun fifth_word(sentence)
  (car (cdr (cdr (cdr (cdr sentence)))))
)
;;Return the sixth element of the sentence
(defun sixth_word(sentence)
  (car (cdr (cdr (cdr (cdr (cdr sentence))))))
)
;;-------------------------------fill Actor-------------------
;;Return the sixth element of the sentence
(defun fill_actor(CD actor)
  (subst actor 'A-filler CD )
)
;;--------------------fill-location---------------------------
(defun fill_location(CD location)
  (subst location 'T-filler CD )
)
;;--------------------fill-object-----------------------------
(defun fill_object(CD object)
  (subst object 'O-filler CD )
)
;;--------------------fill-to---------------------------------
(defun fill_to(CD to)
  (subst to 'T-filler CD )
)
;;-------------------------is-this-type-----------------------
;;This function checks if the words has a type
(defun is_this_type (word type)
  (eq type (get word 'Category ))
)
