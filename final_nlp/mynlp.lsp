;;Modified by Aurelio Arango

;;   P-CD should be setqed to:
;;               		 (PTRANS
;;          	   			ACTOR	( A-filler )
;;        	      			TO  		( T-filler ))

;;(setq P-CD (PTRANS ACTOR(A-filler) TO (T-filler) ))

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
  (prog (verb noun1 noun2 PTRANS_ERROR NOUN_ERROR  )
  (setq P-CD '(PTRANS ACTOR ( A-Filler ) TO ( T-filler )))

  ;;(princ P-CD)

   ;; prompt "give me the verb of the sentence"
   (princ "Hi, give me the verb of a sentence: ")
   (setq verb (read))
   ;;blank line
   (terpri)
   ;; make sure it is a PTRANS verb
   ;;(if (eq 'PTRANS (get verb 'Category)) ;;(princ "Well done")
    ;;(princ (get verb 'Category))
       ;; retrieve its category to determine the slot and then fill the P-CD with the word (use subst)
    ;;(setq P-CD (subst verb 'PTRANS P-CD ))

   ;;)

   (cond
   ((eq 'PTRANS (get verb 'Category)) (setq P-CD (subst verb 'PTRANS P-CD )))
   (T (go PTRANS_ERROR))
   )

   (terpri)
   ;;(princ P-CD)
   ;; prompt "give me the next noun of the sentence"

   (princ "give the noun of the sentence ")
    (setq noun1 (read))
   (cond
   ;; retrieve its category to determine the slot and then fill the P-CD with the word (use subst)
    ((eq 'TO (get noun1 'Category)) (setq P-CD (subst noun1 'T-filler P-CD ))  )
    ((eq 'ACTOR (get noun1 'Category)) (setq P-CD (subst noun1 'A-filler P-CD ))  )
    (T (go NOUN_ERROR))
   )
   (terpri)

   ;; prompt "give me the next noun for the sentence"
   ;; retrieve its category to determine the slot and then fill the P-CD with the word (use subst)

   (princ "give me the next noun for the sentence ")
    (setq noun1 (read))
   (cond
   ;; retrieve its category to determine the slot and then fill the P-CD with the word (use subst)
    ((eq 'TO (get noun1 'Category)) (setq P-CD (subst noun1 'T-filler P-CD ))  )
    ((eq 'ACTOR (get noun1 'Category)) (setq P-CD (subst noun1 'A-filler P-CD ))  )
    (T (go NOUN_ERROR))
   )
   (terpri)
   ;; display the P-CD
   (princ P-CD)
   ;;quit main
   (ABORT)
   ;; errors should result in an error message and exit
   NOUN_ERROR (princ "Noun not found")
          (ABORT)
   PTRANS_ERROR (princ "Verb not found")
          (ABORT)
   )
)
