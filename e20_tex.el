
;; (setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))
(require 'tex-site)   ; invoke the AUCTeX package (LaTeX support)
(if (string-equal system-type "windows-nt")
    (require 'tex-mik))
(setq TeX-file-extensions
      '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))
(setq TeX-default-mode 'LaTeX-mode) ;; Use auctex
(add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))
(setq TeX-force-default-mode t)

(setq TeX-engine 'xetex)  ; or latex, pdftex

;; C-c C-c
    (require 'auctex-latexmk)
    (auctex-latexmk-setup)
   (add-hook 'LaTeX-mode-hook (lambda ()
                              (push 
                               '("LatexMK" "latexmk -pdf -pv -view=pdf -outdir=build %t" TeX-run-TeX nil t
                                 :help "Make pdf output using latexmk.")
                               ;; The -pv option opens pdf-viewer after finishing compiling.
                               ;; The -pdf option tells latexmk to use pdflatex.
                               ;; Could use the -pvc option to continually process the file and check for checks,
                               ;; which creates a type of "WYSIWYG" process. However, the -f option will need to
                               ;; be removed.
                               TeX-command-list)))
 ;; To set the default to use the latexmk instead of LaTeX

;;  (define-key LaTeX-mode-map [s-S-mouse-1] 'TeX-view)
  
      ;;; "latex+DVI+PS+PDF+PDFViewer" routine
    (setq latexBuild (list 
                    (list "zLatex"
      "latex -interaction=nonstopmode -output-directory=./build %s.tex
    bibtex ./build/%s.aux
    makeindex ./build/%s.aux
    makeindex ./build/%s.idx    
    makeglossaries -d ./build/ %    
    latex -interaction=nonstopmode -output-directory=./build %s.tex
    makeindex  ./build/%s.nlo -s  ./build/nomencl.ist -o  ./build/%s.nls
    latex -interaction=nonstopmode -output-directory=./build %s.tex
    dvips ./build/%s.dvi -o ./build/%s.ps
    ps2pdf ./build/%s.ps ./build/%s.pdf
    evince ./build/%s.pdf" 'TeX-run-command nil t)))


   (setq pdflatexBuild (list 
                    (list "aPDFlatex"
   "pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./build  %s.tex
   bibtex ./build/%s.aux    
   makeindex ./build/%s.aux
   makeindex ./build/%s.idx    
   makeglossaries -d ./build %s    
   makeindex  ./build/%s.nlo -s  ./build/nomencl.ist -o  ./build/%s.nls
   pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./build  %s.tex
   makeindex  ./build/%s.nlo -s  ./build/nomencl.ist -o  ./build/%s.nls
   pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./build  %s.tex
   okular build/%s.pdf" 'TeX-run-command nil t)))
 (add-hook 'LaTeX-mode-hook '(lambda ()
                               (setq TeX-command-default "aPDFlatex")))            
(setq biberTexBuild (list 
                    (list "bPDFlatex"
   "pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./build  %s.tex
   bibter ./build/%s.aux    
   makeindex ./build/%s.aux
   makeindex ./build/%s.idx    
   makeglossaries -d ./build %s    
   makeindex  ./build/%s.nlo -s  ./build/nomencl.ist -o  ./build/%s.nls
   pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./build  %s.tex
   makeindex  ./build/%s.nlo -s  ./build/nomencl.ist -o  ./build/%s.nls
   pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./build  %s.tex
   okular build/%s.pdf" 'TeX-run-command nil t)))
 (add-hook 'LaTeX-mode-hook '(lambda ()
                               (setq TeX-command-default "bPDFlatex")))            

    (require 'tex) 
    (setq TeX-command-list (append TeX-command-list latexBuild))
    (setq TeX-command-list (append TeX-command-list pdflatexBuild))
    (setq TeX-command-list (append TeX-command-list biberTexBuild))
    ;; (add-hook 'LaTeX-mode-hook (function (lambda ()
    ;;                                        (add-to-list 'TeX-command-list
    ;;                                                     '("pTeX" "%(PDF)ptex %`%S%(PDFout)%(mode)%' %t"
    ;;                                                       TeX-run-TeX nil (plain-tex-mode) :help "Run ASCII pTeX"))
    ;;                                        (add-to-list 'TeX-command-list
    ;;                                                     '("pLaTeX" "%(PDF)platex %`%S%(PDFout)%(mode)%' %t"
    ;;                                                       TeX-run-TeX nil (latex-mode) :help "Run ASCII pLaTeX"))
    ;;                                        (add-to-list 'TeX-command-list
    ;;                                                     '("acroread" "acroread '%s.pdf' " TeX-run-command t nil))
    ;;                                        (add-to-list 'TeX-command-list
    ;;                                                     '("pdf" "dvipdfmx -V 4 '%s' " TeX-run-command t nil))
    ;;                                        )))

(setq font-latex-fontify-sectioning 1.0) ;フォントサイズの変更を無効化
(setq font-latex-fontify-script nil) ;上付き, 下付きの無効化
  (setq preview-scale-function 1.5)
  (setq preview-image-type 'dvipng)

  (setq TeX-view-program-list
              '(("SumatraPDF" "SumatraPDF.exe %o") ;;Windows
                ("Gsview" "gsview32.exe %o")
                ("Okular" "okular --unique %o")
                ("Evince" "evince %o")    ;; Gnomeers
                ("open" "open %o")
                ("Firefox" "firefox %o")))
  ;; (cond
  ;;  ((eq system-type 'windows-nt)
  ;;   (add-hook 'LaTeX-mode-hook
  ;;             (lambda ()
  ;;               (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
  ;;                                                  (output-dvi "Yap")
  ;;                                                  )))))
  ;;  ((eq system-type 'gnu/linux)
  ;;   (add-hook 'LaTeX-mode-hook
  ;;             (lambda ()
  ;;               (setq TeX-view-program-selection '((output-pdf "Okular")
  ;;                                                  ;(output-dvi "Okular")
  ;;                                                  ;(output-html "open")
  ;;                                                  ))))))
  ;(setq TeX-output-view-style '(("^dvi$" "." "xdvi '%d'")))
   (setq TeX-output-view-style (quote (
                                         ; ("^pdf$" "." "evince %o")
                                          ("^pdf$" "." "Okular")
                                         ("^ps$" "." "gv %o")
                                         ("^dvi$" "." "xdvi %o")
                                        )))
  ;;   (setq tex-dvi-view-command "xdvi")
  ;;   (setq tex-dvi-print-command "dvips")
  ;;   (setq tex-alt-dvi-print-command "dvips")

;; change auto name
;;(setq TeX-auto-local ".auctex")
;;;; put to tmp
;; (setq TeX-auto-local
;;       (expand-file-name
;;        (concat my:user-emacs-temporary-directory ".auctex/auto")))
;; (setq TeX-style-local
;;       (expand-file-name
;;        (concat my:user-emacs-temporary-directory ".auctex/style")))

;(unless (file-exists-p "/etc/emacs/site-start.d/50auctex.el")
 ; (load "auctex.el" nil t)
  ;(load "preview-latex" nil t))
;(load "auctex.el" nil t )
;(load "preview.el" nil t)

(require 'company-math)
(require 'company-auctex)
(company-auctex-init)
(require 'auto-complete-auctex)
(add-hook 'LaTeX-mode-hook 'company-auctex)
(add-hook 'LaTeX-mode-hook 'auto-complete-auctex)

(require 'cdlatex)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

(setq TeX-PDF-mode t)
;(require 'tex)
;(TeX-global-PDF-mode t)
  ;; pdf-model
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-start-server t)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

;;(require 'latex-pretty-symbols)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
    ;;(add-hook 'LaTeX-mode-hook 'longlines-mode)
    (add-hook 'LaTeX-mode-hook 'flyspell-mode)
    (add-hook 'LaTeX-mode-hook 'flycheck-mode)
    (add-hook 'LaTeX-mode-hook 'linum-mode)
    (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
    (add-hook 'LaTeX-mode-hook 'auto-revert-mode)
    (add-hook 'LaTeX-mode-hook 'TeX-fold-mode)
    (add-hook 'LaTeX-mode-hook (lambda () (turn-off-auto-fill)))
    (add-hook 'LaTeX-mode-hook 'turn-on-font-lock)
    ;; (require 'magic-latex-buffer)
    ;; (add-hook 'LaTeX-mode-hook 'magic-latex-buffer)


  ;; Makes sections independently possible

  (setq TeX-parse-self t)
  (setq-default TeX-master t) ;t for not ask 
  ;; Make \ = C-c C-m to start macro
  ;; (setq TeX-electric-escape t)  
   ;;(setq TeX-electric-sub-and-superscript t)
  
  (setq TeX-show-compilation t) ; display compilation windows
  (setq TeX-auto-save t)
  (setq TeX-auto-untabify t)     ; remove all tabs before saving
  (setq TeX-save-query nil)
  (setq completion-ignored-extensions (append completion-ignored-extensions
                                              '(".synctex.gz")))
  ;(setq 
   ;   LaTeX-top-caption-list   ("table" "tabular")
   ;   LaTeX-float                      "tn"
   ;   LaTeX-figure-label               "fig:"
   ;   LaTeX-table-label                "tab:"
   ;   LaTeX-section-label              "sec:")
  (setq LaTeX-default-options '("a4paper"))
  (setq LaTeX-float "!ht")
  (setq LaTeX-indent-level 4)
  (setq LaTeX-item-indent 0)
  (setq LaTeX-brace-indent-level 4)
  (setq TeX-insert-braces t)
  (setq LaTeX-math-menu-unicode t)
;;;; Quotes
;; (defun quote-hook ()
;;   (local-unset-key "\""))
;;   (add-hook 'LaTeX-mode-hook 'quote-hook)

(require 'reftex)
    (setq reftex-default-bibliography '(
                                        ;;"/home/tian/Dropbox/4refs/bib/library.bib"
                                        "/home/tian/SparkleShare/p1402/p1402-cited.bib"
                                        ))
    (setq reftex-file-extensions
          '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
    ;; Make RefTeX faster
  (setq reftex-enable-partial-scans t)
  (setq reftex-keep-temporary-buffers nil)
  (setq reftex-enable-partial-scans t)
  (setq reftex-allow-automatic-rescan nil)
  (setq reftex-use-multiple-selection-buffers t)
  (setq reftex-external-file-finders   
        '(("tex" . "kpsewhich -format=.tex %f")   
          ("bib" . "kpsewhich -format=.bib %f")))
(setq reftex-toc-split-windows-horizontally t) 
(setq reftex-toc-split-windows-horizontally-fraction 0.15) 
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(add-hook 'Tex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode C-c [
(setq reftex-plug-into-AUCTeX t)
(setq reftex-plug-into-auctex t)
(setq reftex-label-alist
      '(
        ("section" ?s "%S" "~\\secref{%s}" (nil . t)
         (regexp "parts?""chapter" "chap." "sections?" "sect?\\." "paragraphs?" "par\\." "\\\\S" "\247" "Teile?" "Kapitel" "Kap\\." "Abschnitte?" "appendi\\(x\\|ces\\)" "App\\." "Anh\"?ange?" "Anh\\."))
        ("figure" ?f "fig:" "~\\ref{%s}" caption
         (regexp "figure?[sn]?" "figs?\\." "Abbildung\\(en\\)?" "Abb\\."))
        ("figure*" ?f nil nil caption)
        ("table" ?t "tab:" "~\\ref{%s}" caption
         (regexp "tables?" "tab\\." "Tabellen?"))
        ("table*" ?t nil nil caption)
        ))
(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
;; Change key bindings
(add-hook 'reftex-mode-hook
 '(lambda ()
               (define-key reftex-mode-map (kbd "\C-cr") 'reftex-reference)
               (define-key reftex-mode-map (kbd "\C-cl") 'reftex-label)
               (define-key reftex-mode-map (kbd "\C-cc") 'reftex-citation)
))

(defun org-mode-reftex-setup ()
  (interactive)
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all)))
(add-hook 'org-mode-hook 'org-mode-reftex-setup)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(define-key org-mode-map (kbd "C-c )") 'reftex-citation)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

(setq org-latex-pdf-process
            '("pdflatex -interaction nonstopmode -output-directory %o %f"
              "bibtex %b"
              "pdflatex -interaction nonstopmode -output-directory %o %f"
              "pdflatex -interaction nonstopmode -output-directory %o %f"))
    ;; (setq org-latex-pdf-process
    ;;         '("pdflatex -interaction nonstopmode -output-directory %o %f"
    ;;           "biber %b"
    ;;           "pdflatex -interaction nonstopmode -output-directory %o %f"
    ;;           "pdflatex -interaction nonstopmode -output-directory %o %f"))
  ;;;; biber
  ;; (setq org-latex-to-pdf-process 
  ;;    '("pdflatex %f" "biber %b" "pdflatex %f" "pdflatex %f"))
;(setq org-latex-to-pdf-process
;'("xelatex -interaction nonstopmode %b"
;"xelatex -interaction nonstopmode %b"))

(add-hook 'yatex-mode-hook 'turn-on-reftex) ; with YaTeX mode
