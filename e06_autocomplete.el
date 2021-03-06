
(require 'auto-complete-config nil 'noerror)
;(require 'auto-complete-config)
;(require 'auto-complete)
;;(load "auto-complete")
(global-auto-complete-mode t) ;; ac all mode
(global-auto-composition-mode 1)
(ac-flyspell-workaround)    ;; conflict with flyspell
(setq
      ac-auto-start 3 ; nil ;; t conflict with ESS, complete form fourth character, t=2
      ac-trigger-key "C-<tab>" ;;ac-auto-start nil + ac-trigger-key "TAB"
      ac-delay 0.01 ;; 0.1 fast for fisrt complete ; tiem setting very import to R
      ac-auto-show-menu 0.3 ;; tiem setting very import to R ;; 候補が出るまでの時間 default 0.8
      ;;ac-show-menu-immediately-on-auto-complete t
      ac-candidate-limit 10 ;; nil
      ac-use-comphist t ;; sort Candidate
      ac-menu-height 12 ;;12 Max height for complete candidate menu
      ac-ignore-case 'smart
      ac-fuzzy-enable t ;; Fuzzy mode
      ac-dwim t    ;; t DO What I mean nil pop-ups with docs even if a word is uniquely completed
      )

(require 'pos-tip)
 (setq ac-use-quick-help t)
 (setq ac-quick-help-delay 0.01)
 (setq ac-quick-help-use-pos-tip-p t)
; (ac-quick-help-prefer-pos-tip)
                                         ;(setq ac-setup t)
   (setq ac-quick-help-height 12)
   (setq ac-quick-help-scroll-down t)

   ;; ac-Popup background colors

   (set-face-attribute 'ac-candidate-face nil   :background "#00222c" :foreground "light gray") ;; pop menu
   (set-face-attribute 'ac-selection-face nil   :background "SteelBlue4" :foreground "white") ;; seletced pop menu
   (set-face-attribute 'popup-tip-face    nil   :background "LightGoldenrod1"  :foreground "black") ;;pop help

;; ----------------------------------------------------------------
;; 0.2.0 Popup and Show color of "Colorword or Hex code" with C-c p
;; ----------------------------------------------------------------
(require 'cl)
(require 'popup)
(defvar popup-color-string
(let ((x 9) (y 3))
(mapconcat 'identity
(loop with str = (make-string x ?\ ) repeat y collect str)
"\n"))
"*String displayed in tooltip.")
(defun popup-color-at-point ()
"Popup color specified by word at point."
(interactive)
(let ((word (word-at-point))
(bg (plist-get (face-attr-construct 'popup-tip-face) :background)))
(when word
(unless (member (downcase word) (mapcar #'downcase (defined-colors)))
(setq word (concat "#" word)))
(set-fackek-background 'popup-tip-face word)
(message "%s: %s"
(propertize "Popup color"
'face `(:background ,word))
(propertize (substring-no-properties word)
'face `(:foreground ,word)))
(popup-tip popup-color-string)
(set-face-background 'popup-tip-face bg))))
(global-set-key (kbd "C-c p") 'popup-color-at-point)

(require 'ac-math)
(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
               ac-sources)))
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
(setq ac-math-unicode-in-math-p t) ;;use unicode input

(when (executable-find "look")
  (defun my-ac-look ()
    "list of look command output"
    (interactive)
    (unless (executable-find "look")
      (error "This is no look command"))
    (let ((search-word (thing-at-point 'word)))
      (with-temp-buffer
        (call-process-shell-command "look" nil t 0 search-word)
        (split-string-and-unquote (buffer-string) "\n"))))

  (defun ac-complete-look ()
    (interactive)
    (let ((ac-menu-height 50)
          (ac-candidate-limit t))
      (auto-complete '(ac-source-look))))

  (defvar ac-source-look
    '((candidates . my-ac-look)
      (requires . 2)))

(global-set-key (kbd "M-h") 'ac-complete-look))
(push 'ac-source-look ac-sources)

(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'tex-mode)
(add-to-list 'ac-modes 'ess-mode)
(add-to-list 'ac-modes 'R-mode)
(add-to-list 'ac-modes 'graphviz-mode)
(add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-modes 'LaTeX-mode)
;; (setq ac-modes
;;       (append ac-modes '(org-mode objc-mode jde-mode sql-mode ess-mode
;;                                   change-log-mode text-mode
;;                                   makefile-gmake-mode makefile-bsdmake-mo
;;                                   autoconf-mode makefile-automake-mode)))

;; (add-to-list 'ac-dictionary-directories (expand-file-name
   ;;              "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict"))
   ;; (setq ac-comphist-file (expand-file-name
   ;;              "~/.emacs.d/ac-comphist.dat"))
   (setq ac-comphist-file "~/.emacs.d/share/ac-comphist.dat")
   (setq ac-use-comphist t)
   (set-default 'ac-sources
              '(ac-source-semantic
                ac-source-R
                ac-source-R-args
                ac-source-R-objects
                ac-source-rcodetools
                ac-source-yasnippet
                ac-source-words-in-buffer
                ac-source-words-in-all-buffer
                ;ac-source-css-property
                ac-source-abbrev
                ac-source-dabbrev
                ac-source-math-unicode
                ac-source-math-latex
                ac-source-latex-commands
                ac-source-dictionary
                ac-source-look
                ac-source-imenu
                ac-source-features
                ac-source-functions
                ac-source-variables
                ac-source-symbols
                ac-source-files-in-current-dir
                ac-source-filename))
(ac-config-default) ; make above work.

;; Motion
      ;;;ac-disable-faces (quote (font-lock-comment-face font-lock-doc-face))
  (setq ac-use-menu-map t)    ;; Keybinding
  (setq ac-trigger-commands
        (cons 'backward-delete-char-untabify ac-trigger-commands))

  (define-key ac-menu-map (kbd "C-n") 'ac-next)
  (define-key ac-menu-map (kbd "C-p") 'ac-previous)
  ;(define-key ac-menu-map (kbd "j")   'ac-next)
  ;(define-key ac-menu-map (kbd "k")   'ac-previous)
 ; (define-key ac-menu-map (kbd "l")   'ac-stop)
  (define-key ac-menu-map (kbd "henkan")   'ac-complete)
  ;(define-key ac-menu-map (kbd "SPC") 'ac-stop)
  (define-key ac-completing-map (kbd "C-g")   'ac-stop)
  (define-key ac-completing-map (kbd "M-RET") 'ac-stop)
  (define-key ac-completing-map (kbd "C-RET") 'ac-stop)
;(define-key ac-completing-map (kbd "M-/")   'ac-stop)
                                          ;(define-key ac-completing-map "\M-n" nil) ;; was ac-next

  ;(define-key ac-completing-map "\M-p" nil) ;; was ac-previous
  (define-key ac-completing-map (kbd "<tab>") nil)
  ;;(define-key ac-completing-map (kbd "RET") nil) ; return
  ;; (define-key ac-completing-map (kbd "<tab>") 'ac-complete)
  ;(define-key ac-completing-map [tab] 'ac-complete)

;(define-key ac-completing-map (kbd "RET") nil) ; return での補完禁止
(setf (symbol-function 'yas-active-keys)
      (lambda ()
        (remove-duplicates
         (mapcan #'yas--table-all-keys (yas--get-snippet-tables)))))
  (define-key ac-completing-map (kbd "C-c q h") 'ac-quick-help)
  (define-key ac-mode-map (kbd "C-c l q h") 'ac-last-quick-help)
  (define-key ac-mode-map (kbd "C-c l h ") 'ac-last-help)

(require 'company)
 (autoload 'company-mode "company" nil t)
 (setq company-idle-delay 0.8)  ; delay autocompletion popup shows; nil
 (setq company-minimum-prefix-length 4)

 (setq company-echo-delay 0)  ; remove annoying blinking
 (setq company-display-style 'pseudo-tooltip)
 (setq company-tooltip-delay 0)
 (setq company-tooltip-limit 10)
 (setq company-auto-expand t)
 (setq company-auto-complete t)

 (setq company-show-numbers t)
 (setq company-transformers '(company-sort-by-occurrence))
 (setq company-complete-on-edit t)
 (setq company-begin-commands '(self-insert-command
                                org-self-insert-command
                                ;c-electric-lt-gt
                                ;c-electric-colon
                                )) ; start autocompletion only after typing

 (add-hook 'after-init-hook 'global-company-mode)

 ;; this will show a lot of garbage, use it only necessary
 (add-to-list 'company-backends 'company-ispell) ; make company work as a dictionary
 (defalias 'ci 'company-ispell)

   ;; put most often used completions at stop of list
; (setq company-backends '(company-dabbrev
                       ; (company-keywords company-dabbrev-code)
                       ; company-files))
   (setq company-dabbrev-time-limit 0.01)
   (setq company-dabbrev-downcase nil)
   (setq company-dabbrev-ignore-case nil)
   (setq company-dabbrev-other-buffers t)
 ;  (setq company-dabbrev-minimum-length 2)

(eval-after-load "company"
  '(progn
     (custom-set-faces
      '(company-preview
        ((t (:foreground "darkgray" :underline t))))
      '(company-preview-common
        ((t (:inherit company-preview))))
      '(company-tooltip
        ((t (:background "lightgray" :foreground "black"))))
      '(company-tooltip-selection
        ((t (:background "steelblue" :foreground "white"))))
      '(company-tooltip-common
        ((((type x)) (:inherit company-tooltip :weight bold))
         (t (:inherit company-tooltip))))
      '(company-tooltip-common-selection
        ((((type x)) (:inherit company-tooltip-selection :weight bold))
         (t (:inherit company-tooltip-selection)))))
     (define-key company-active-map "\C-q" 'company-search-candidates)
     (define-key company-active-map "\C-e" 'company-filter-candidates)
     ))

;;; WIP, somewhat usable
(require 'company)
(require 'pos-tip)

(defun company-quickhelp-frontend (command)
  "`company-mode' front-end showing documentation in a
  `pos-tip' popup."
  (pcase command
    (`post-command (company-quickhelp--set-timer))
    (`hide
     (company-quickhelp--cancel-timer)
     (pos-tip-hide))))

(defun company-quickhelp--show ()
  (company-quickhelp--cancel-timer)
  (let* ((selected (nth company-selection company-candidates))
         (doc-buffer (company-call-backend 'doc-buffer selected))
         (ovl company-pseudo-tooltip-overlay))
    (when (and ovl doc-buffer)
      (with-no-warnings
        (let* ((width (overlay-get ovl 'company-width))
               (col (overlay-get ovl 'company-column))
               (extra (- (+ width col) (company--window-width))))
          (pos-tip-show (with-current-buffer doc-buffer (buffer-string))
                        nil
                        nil
                        nil
                        300
                        80
                        nil
                        (* (frame-char-width)
                           (- width (length company-prefix)
                              (if (< 0 extra) extra 1)))))))))

(defvar company-quickhelp--timer nil
  "Quickhelp idle timer.")

(defcustom company-quickhelp--delay 0.5
  "Delay, in seconds, before the quickhelp popup appears.")

(defun company-quickhelp--set-timer ()
  (when (null company-quickhelp--timer)
    (setq company-quickhelp--timer
          (run-with-idle-timer company-quickhelp--delay nil
                               'company-quickhelp--show))))

(defun company-quickhelp--cancel-timer ()
  (when (timerp company-quickhelp--timer)
    (cancel-timer company-quickhelp--timer)
    (setq company-quickhelp--timer nil)))

;;;###autoload
(define-minor-mode company-quickhelp-mode
  "Provides documentation popups for `company-mode' using `pos-tip'."
  :global t
  (if company-quickhelp-mode
      (push 'company-quickhelp-frontend company-frontends)
    (setq company-frontends
          (delq 'company-quickhelp-frontend company-frontends))
    (company-quickhelp--cancel-timer)))

(provide 'company-quickhelp)
(require 'company-quickhelp)

(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-common-hook
               'python-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
                   'org-mode-hook
                   'LaTeX-mode-hook
             ;  'text-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook))
  (add-hook hook 'company-mode))

(add-hook 'org-mode-hook
                  (lambda ()
                        (company-mode)
                        (set (make-local-variable 'company-backends)
                                 '((
                                        company-dabbrev
                                        company-dabbrev-code
                                        company-ispell
                                        company-files
                                        company-yasnippet
                                        ))
                                 )))

;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
(setq company-tooltip-flip-when-above t)
;; default keybinding is in company.el
;; Company-abort
(define-key company-active-map "\e\e\e"           'company-abort)
;(define-key company-active-map [return]           'company-abort)
(define-key company-active-map (kbd "<C-return>") 'company-abort)
(define-key company-active-map (kbd "\C-g")       '(lambda ()
                                                     (interactive)
                                                     (company-abort)))
;(define-key company-active-map (kbd "l")         'company-abort)
(define-key company-active-map (kbd "henkan")         'company-abort)
;(define-key company-active-map (kbd "<SPC>")      'company-abort) ; space
;; (progn
;;     (defun my-company-pass-key (arg)
;;       "Pass a key out of company-mode"
;;       (interactive "P")
;;       (company-abort)
;;       (kbd arg)
;;       ))
;; (define-key company-active-map (kbd "SPC")    'my-company-pass-key)
;; Company-select
(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
;(define-key company-active-map (kbd "j")   'company-select-next)
;(define-key company-active-map (kbd "k")   'company-select-previous)
;(define-key company-active-map (kbd "C-j")  'company-select-next)
;(define-key company-active-map (kbd "C-k")  'company-select-previous)
;;(define-key company-active-map (kbd "<down>") 'company-select-next)  ;0
;;(define-key company-active-map (kbd "<up>") 'company-select-previous);0

 ;; Company-Complete
;(define-key company-active-map "\t"                       'company-complete)
(define-key company-mode-map "\t" nil)
(define-key company-mode-map [(backtab)]                   'company-complete-common)
(global-set-key [(control tab)] 'company-complete-common)
;; (eval-after-load                                           'company
;;                                                            '(progn
;;               (define-key company-mode-map (kbd "<S-TAB>") 'company-complete)))
(define-key company-active-map (kbd "<down>") 'company-select-next-or-abort)
(define-key company-active-map (kbd "<up>")   'company-select-previous-or-abort)
;  (define-key company-active-map [tab]                    'company-complete-selection)
;  (define-key company-active-map (kbd "S-TAB")            'company-complete-common)
(define-key company-active-map [mouse-1]                   'company-complete-mouse)
(define-key company-active-map [mouse-3]                   'company-select-mouse)

(define-key company-active-map [down-mouse-1] 'ignore)
(define-key company-active-map [down-mouse-3] 'ignore)
(define-key company-active-map [mouse-1]      'ignore)
(define-key company-active-map [mouse-3]      'ignore)
(define-key company-active-map [up-mouse-1]   'ignore)
(define-key company-active-map [up-mouse-3]   'ignore)

(define-key company-active-map "" 'company-complete-selection) ;space to skip
(define-key company-active-map ""            'company-complete) ; space
(define-key company-active-map (kbd "<home>") 'company-show-doc-buffer)
(define-key company-active-map (kbd "\C-d")   'company-show-doc-buffer)
(define-key company-active-map (kbd "<f1>")  'company-show-doc-buffer)
;(define-key company-active-map (kbd "\C-h")   'company-show-doc-buffer)
;(define-key company-active-map (kbd "\C-w")   'company-show-location)
(define-key company-active-map (kbd "\C-l")   'company-show-location)
;(define-key company-active-map (kbd "\C-v")   'company-show-location)

(define-key company-active-map "\C-s"         'company-search-candidates)
(define-key company-active-map "\C-\M-s"      'company-filter-candidates)

(when (require 'yasnippet nil t)
  (setq yas-trigger-key "TAB")
  (yas-global-mode 1))

;;(require 'auto-complete-yasnippet)
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
yas/ido-prompt
yas/completing-prompt))
(defun ac-yasnippet-candidate ()
  (let ((table (yas/get-snippet-tables major-mode)))
    (if table
      (let (candidates (list))
            (mapcar (lambda (mode)
              (maphash (lambda (key value)
                (push key candidates))
              (yas/snippet-table-hash mode)))
            table)
        (all-completions ac-prefix candidates)))))


(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (candidate-face . ac-candidate-face)
    (selection-face . ac-selection-face)
    ;(candidate-face . ac-yasnippet-candidate-face)
    ;(selection-face . ac-yasnippet-selection-face)
)
  "Source for Yasnippet.")
(provide 'auto-complete-yasnippet)

;; (add-hook 'org-mode-hook
;;               (lambda ()
;;               ;; yasnippet
;;               (make-variable-buffer-local 'yas/trigger-key)
;;               (setq yas/trigger-key [tab])
;;               (define-key yas/keymap [tab] 'yas/next-field-group)
(defun yas/org-very-safe-expand ()
            (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))
;Then, tell Org mode what to do with the new function:
(add-hook 'org-mode-hook
                    (lambda ()
                 (make-variable-buffer-local 'yas/trigger-key)
                 (setq yas/trigger-key [tab])
                 (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
                 (define-key yas/keymap [tab] 'yas/next-field)))

(require 'r-autoyas)
(add-hook 'ess-mode-hook 'r-autoyas-ess-activate)

;;; company-ESS.el --- R Completion Backend for Company-mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2014

;; Author:  <Lompik@ORION>
;; Keywords: extensions, matching

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:



(require 'cl-lib)
(require 'company)
(require 'ess)


(defun ess-R-my-get-rcompletions (symb)
  "Call R internal completion utilities (rcomp) for possible completions.
"
  (let* (

         ;; (opts1 (if no-args "op<-rc.options(args=FALSE)" ""))
         ;; (opts2 (if no-args "rc.options(op)" ""))
         (comm (format ".ess_get_completions(\"%s\", %d)\n"
                       (ess-quote-special-chars symb)
                       (length symb))))
    (ess-get-words-from-vector comm)))

(defun ess-company-args (symb)
  "Get the args of the function when inside parentheses."
  (when  ess--funname.start ;; stored by a coll to ess-ac-start-args
    (let ((args (nth 2 (ess-function-arguments (car ess--funname.start))))
          (len (length symb)))
      (delete "..." args)
      (mapcar (lambda (a) (concat a ess-ac-R-argument-suffix))
              args))))


(defun ess-company-candidates ( symb)
  (let ((args (ess-company-args symb))
        (comps (cdr (ess-R-my-get-rcompletions symb))))

    (if args
        (setq comps (append
                     (delq nil (mapcar (lambda (x)
                                         (if (string-match symb x)
                                             x)) args))
                     comps)))
    comps))

(defun ess-company-start-args () ;SAme as ess-ac-start-args
  "Get initial position for args completion"
  (when (and ess-local-process-name
             (not (eq (get-text-property (point) 'face) 'font-lock-string-face)))
    (when (ess--funname.start)
      (if (looking-back "[(,]+[ \t\n]*")
          (point)
        (ess-symbol-start)))))


(defun ess-company-start ()
  (when (and ess-local-process-name
             (get-process ess-local-process-name))
                                        ;(buffer-substring-no-properties (ess-ac-start) (point))
    (let ((start (or (ess-company-start-args)  (ess-symbol-start))))
      (when start
        (buffer-substring-no-properties start (point))))))

                                        ;(company-grab-symbol)

(defun ess-R-get-typeof (symb)
  "Call R internal completion utilities (typeof) for possible completions.
"
  (let* ( ;; (opts1 (if no-args "op<-rc.options(args=FALSE)" ""))
         ;; (opts2 (if no-args "rc.options(op)" ""))
         (comm (format "typeof(%s)\n"
                       symb)))
    (format " %.3s" (car (ess-get-words-from-vector comm)))))

(defun ess-company-create-doc-buffer (syms)
  (let ((doc (ess-ac-help syms)))
    (company-doc-buffer doc)))


(defun company-ess-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))

  (cl-case command
    (interactive (company-begin-backend 'company-ess-backend))
    (prefix (ess-company-start))
    (candidates (ess-company-candidates arg))
    (doc-buffer (ess-company-create-doc-buffer arg))
    ;(meta (funcall ess-eldoc-function) )
    ;(annotation (ess-R-get-typeof arg))
    (sorted t) ; get arguments on top of the list
    (duplicates nil)
    ))

;(add-hook 'ess-mode-hook (lambda ()
;                          (set (make-local-variable 'company-backends) '(company-ess))
;                          (company-mode)))

(add-to-list 'company-backends 'company-ess-backend)

;(remove-hook 'completion-at-point-functions 'ess-R-object-completion)
; FIXME: Is this required ?


(provide 'company-ess)
;;; company-ESS.el ends here
(require 'company-ess)

;; smartparens global
(require 'smartparens-config)
(smartparens-global-mode t)

;; highlights matching pairs
(show-smartparens-global-mode t)

;; Key bindigs like paredit mode
;;(sp-use-paredit-bindings)
(--each sp--html-modes
(eval-after-load (symbol-name it) '(require 'smartparens-html)))
(eval-after-load "latex" '(require 'smartparens-latex))
(eval-after-load "tex-mode" '(require 'smartparens-latex))
(eval-after-load "lua-mode" '(require 'smartparens-lua))
(eval-after-load "ruby-mode" '(require 'smartparens-ruby))
(eval-after-load "enh-ruby-mode" '(require 'smartparens-ruby))

(sp-local-tag 'emacs-lisp-mode "`" "`" "'" :actions '(wrap))
(sp-local-tag 'org-mode "*" "*" "*" :actions '(wrap))
(sp-local-tag 'org-mode "=" "=""=" :actions '(wrap))
(sp-local-tag 'org-mode "~" "~""~" :actions '(wrap))
