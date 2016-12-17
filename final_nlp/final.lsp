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
(setq A-CD '(ATRANS ACTOR ( A-Filler ) OBJECT (O-filler) TO ( T-filler )))


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
  (setf (get 'clock 'Category) 'OBJECT)

(defun main ()
  ;; variables to use for the program
  (prog (sentence CD  3_word_IS_OBJECT 4_word_IS_OBJECT trans_sentence
    ERROR_NOT_LOCATION ERROR_NOT_TO ERROR_NOT_HUMAN ERROR_NOT_PTRANS_NOR_ATRANS
    ERROR_NOT_OBJECT )

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
      ;;check if is human
        ((eq 'HUMAN (get (first_word sentence) 'Category))
            ;; Set actor in CD
            (setq CD ( fill_actor CD (first_word sentence)))
            (if(not (eq 'to (third sentence) )) (go ERROR_NOT_TO)
              ;;else exit-----------------------------
              ;;Check if 4 is article
              (if (eq 'ARTICLE (get (fourth_word sentence) 'Category)  )
                ;; check if 5th word is location
                (if (eq 'LOCATION (get (fifth_word sentence) 'Category) )
                  (setq CD ( fill_location CD (fifth_word sentence)))
                  ;;ELSE check if 4th word is location
                  (go ERROR_NOT_LOCATION)
                )
                (if (eq 'LOCATION (get (fourth_word sentence) 'Category))
                    ;; full P-TRANS
                   (setq CD ( fill_location CD (fourth_word sentence)))
                  ;;Else if is 4th word is not location
                   (go ERROR_NOT_LOCATION)
                 )
              );; end of if to check location and article
            );;end of if-else to check "to"
          );; end of check for Human
        ;;Check if is atrans,
        (T (go ERROR_NOT_HUMAN)));;End of condition (Else statement HUMAN)

      )
      ;;check if is transitive
      ((eq 'ATRANS (get (second_word sentence) 'Category))
        (setq CD A-CD)
        (cond
        ;;check if is human
          ((eq 'HUMAN (get (first_word sentence) 'Category))
              ;; Set actor in CD
              (setq CD ( fill_actor CD (first_word sentence)))
                ;;Check if 3rd word is article
                (if (eq 'ARTICLE (get (third_word sentence) 'Category)  )
                  ;; check if 4th word is object
                  (if (eq 'OBJECT (get (fourth_word sentence) 'Category) )
                    ;;fourth word is object
                    (go 4_word_IS_OBJECT)
                    (go ERROR_NOT_OBJECT)
                  )
                  ;;ELSE check if 3rd word is object
                  (if (eq 'OBJECT (get (third_word sentence) 'Category))
                     (go 3_word_IS_OBJECT)
                     ;;Else if is 3th word is not object
                     (go ERROR_NOT_OBJECT)
                   )
                );; end of if to check object and article


            );; end of check for Human
          ;;Check if is atrans,
          (T (go ERROR_NOT_HUMAN)));;End of condition (Else statement HUMAN)
      )
      (T (go ERROR_NOT_PTRANS_NOR_ATRANS))
    )
    ;;for Ptrans, print CD
    (princ CD)
    ;;translate to japanese
    (P_translate CD trans_sentence)

                    (ABORT)
    3_word_IS_OBJECT
        (setq CD ( fill_object CD (third_word sentence)))
        (if (eq 'to (fourth_word sentence) )
          (if(eq 'HUMAN (get (fifth_word sentence ) 'Category))
            (setq CD ( fill_to CD (fifth_word sentence)))
            (go ERROR_NOT_HUMAN))
          (go ERROR_NOT_TO )
        )
        ;;ATRANS Pass CD to translate
        (print CD)
        (A_translate CD trans_sentence)
                    (ABORT)
    4_word_IS_OBJECT
        (setq CD ( fill_object CD (fourth_word sentence)))
        (if (eq 'to (fifth_word sentence) )
          (if(eq 'HUMAN (get (sixth_word sentence ) 'Category))
            (setq CD ( fill_to CD (sixth_word sentence)))
            (go ERROR_NOT_HUMAN))
          (go ERROR_NOT_TO))
          ;; Atrans Pass to Translate
            (princ CD)
            (A_translate CD trans_sentence)

;;-------------------Handling ERRORS-------------------------------------
                    (ABORT)
                    ;;handle when there is no object
    ERROR_NOT_OBJECT (princ "ERROR::NOT OBJECT TYPE")
                    (princ CD)
                    (ABORT)
                    ;;handle when there is no article
    ERROR_NOT_ARTICLE (princ "ERROR::NOT ARTICLE TYPE")
                    (princ CD)
                    (ABORT)
                    ;;handle when there is no location
    ERROR_NOT_LOCATION (princ "ERROR::NOT LOCATION TYPE")
                    (princ CD)
                    (ABORT)
                    ;;handle no human
    ERROR_NOT_HUMAN (princ "ERROR::NOT HUMAN TYPE")
                    (princ CD)
                    (ABORT)
                    ;;handle not having to
    ERROR_NOT_TO (princ "ERROR::NOT TO TYPE")
                    (princ CD)
                    (ABORT)
                    ;;handle no verb 
    ERROR_NOT_PTRANS_NOR_ATRANS(princ "ERROR::NOT ATRANS NOR PTRANS TYPE")
                    ;;(princ CD)
                    (ABORT)
  )
)
;;--------------------------function to translate-----
(defun A_translate(CD trans_sentence)
  (terpri)
  ;;generate actor
  (setq trans_sentence (third_word CD))
  ;;followed by wa
  (setq trans_sentence (append trans_sentence '(wa)))
  ;;generate To
  (setq trans_sentence (append trans_sentence (seventh_word CD)))
  ;;followed by ni
  (setq trans_sentence (append trans_sentence '(ni)))
  ;;generate object
  (setq trans_sentence (append trans_sentence (fifth_word CD)))
  ;;followed by o
  (setq trans_sentence (append trans_sentence '(o)))
  ;;followed by watashita
  (setq trans_sentence (append trans_sentence '(watashita)))
  (princ trans_sentence)
)
(defun P_translate(CD trans_sentence)
  (terpri)
  ;;generate actor
  (setq trans_sentence (third_word CD))
  ;;followed by wa
  (setq trans_sentence (append trans_sentence '(wa)))
  ;;generate To
  (setq trans_sentence (append trans_sentence (fifth_word CD)))
  ;;followed by ni
  (setq trans_sentence (append trans_sentence '(ni)))
  ;;followed by itta
  (setq trans_sentence (append trans_sentence '(itta)))
  (princ trans_sentence)
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
;;Return the seventh element for the sentence/list

(defun seventh_word(sentence)
  (car (cdr (cdr (cdr (cdr (cdr(cdr sentence)))))))
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
