
;; Inline Images 
    (add-hook 'org-mode-hook 'org-display-inline-images) 
    ;; Inline Images for Babel
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)   
    ;; Inline Images for Screenshot
    ;;(require 'org-screenshot)
    ;; iImage
  ;; -- Display images in org mode
  ;; enable image mode first
  (iimage-mode)
  ;; add the org file link format to the iimage mode regex
  (add-to-list 'iimage-mode-image-regex-alist
               (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]") 1))
  ;; add a hook so we can display images on load
  (add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))
  ;; function to setup images for display on load
  (defun org-turn-on-iimage-in-org ()
    "display images in your org file"
    (interactive)
    (turn-on-iimage-mode)
    (set-face-underline-p 'org-link nil))
  ;; function to toggle images in a org bugger
  (defun org-toggle-iimage-in-org ()
    "display images in your org file"
    (interactive)
    (if (face-underline-p 'org-link)
        (set-face-underline-p 'org-link nil)
        (set-face-underline-p 'org-link t))
'(org-export-latex-inline-image-extensions (quote ("pdf" "jpeg" "jpg" 
"png" "ps" "eps" "svg")))
    (call-interactively 'iimage-mode))
  ;; I have this function bound to C-l with a call like this:
  (define-key org-mode-map (kbd "C-S-a") 'org-archive-subtree)
  (defun my-svg-graphics (contents backend info)
  (when (eq backend 'latex)
  (replace-regexp-in-string "\\`\\\\includegraphics.+\\({.+\.svg}\\)"
       "\\\\includesvg\1" contents))
)
;(add-to-list 'org-export-filter-link-functions 'my-svg-graphics)

    ;; (defun do-org-show-all-inline-images ()
    ;; (interactive)
    ;; (org-display-inline-images t t))
    ;; (global-set-key (kbd "C-c C-x C-v")
    ;;               'do-org-show-all-inline-images)

    ;; (setq org-export-htmlize-output-type 'css)
