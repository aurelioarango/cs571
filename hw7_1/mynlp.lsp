;;   P-CD should be setqed to:
;;               		 (PTRANS
;;          	   			ACTOR	( A-filler )
;;        	      			TO  		( T-filler ))

;; do setfs for many different words with the Category property value being a slot in the CD.
;; add here more ACTOR words
        (setf  (get 'Mary 'Category) 'ACTOR)
        (setf  (get 'John 'Category) 'ACTOR)
        (setf  (get 'Peter 'Category) 'ACTOR)
        (setf  (get 'Haley 'Category) 'ACTOR)
;; add here more TO words
        (setf (get 'school 'Category) 'TO)
        (setf (get 'work 'Category) 'TO)
        (setf (get 'library 'Category) 'TO)
        (setf (get 'museum 'Category) 'TO)
;; add here more verbs in past tense
        (setf (get 'went 'Category) 'PTRANS)
        (setf (get 'played 'Category) 'PTRANS)
        (setf (get 'flew 'Category) 'PTRANS)
        (setf (get 'stayed 'Category) 'PTRANS)

;; This program will fill the P-CD with user's words.  No syntax analysis.

(defun main ()
  (prog (verb   )
   ;; prompt "give me the verb of the sentence"
   (princ "Hi, give me the verb of a sentence: ")
   (setq verb (read))
   ;; make sure it is a PTRANS verb
   (if (eq 'PTRANS (get verb 'Category)) ;;(princ "Well done")
      ;; prompt "give me the next noun of the sentence"
      (princ "give the noun of the sentence")
      ()
      ;; retrieve its category to determime the slot and then fill the P-CD with the word (use subst)

   )



   ;; prompt "give me the next noun for the sentence"
   ;; retrieve its category to determime the slot and then fill the P-CD with the word (use subst)

   ;; errors should result in an error message and exit
   ;; display the P-CD

   )
)
