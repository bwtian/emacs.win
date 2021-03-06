
(setq org-export-babel-evaluate nil)
(setq org-export-with-timestamps nil)
(setq org-export-with-todo-keywords nil)
(setq org-export-latex-hyperref-format "\\ref{%s}")
(setq org-export-with-sub-superscripts nil) ;; ^:nil
(setq org-export-allow-BIND 1)
(setq org-babel-latex-htlatex "htlatex")
  (defmacro by-backend (&rest body)
    `(case (if (boundp 'backend) (org-export-backend-name backend) nil) ,@body))
;; (setq org-export-preserve-breaks t)
;; (setq org-export-with-section-numbers nil)
;;(setq org-export-latex-hyperref-format "\\ref{%s}:{%s}")
