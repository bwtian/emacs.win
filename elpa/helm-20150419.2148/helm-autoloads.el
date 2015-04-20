;;; helm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "helm" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm.el"
;;;;;;  "13a34b15618efe12910f4083d39ccf85")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm.el

(autoload 'helm-define-multi-key "helm" "\
In KEYMAP, define key sequence KEY for function list FUNCTIONS.
Each function run sequentially each time the key KEY is pressed.
If DELAY is specified switch back to initial function of FUNCTIONS list
after DELAY seconds.
The functions in FUNCTIONS list are functions with no args.
e.g
  (defun foo ()
    (message \"Run foo\"))
  (defun bar ()
    (message \"Run bar\"))
  (defun baz ()
    (message \"Run baz\"))

\(helm-define-multi-key global-map \"<f5> q\" '(foo bar baz) 2)

Each time \"<f5> q\" is pressed the next function is executed, if you wait
More than 2 seconds, next hit will run again the first function and so on.

\(fn KEYMAP KEY FUNCTIONS &optional DELAY)" nil nil)

(autoload 'helm-multi-key-defun "helm" "\
Define NAME as a multi-key command running FUNS.
After DELAY seconds the FUNS list is reinitialised.
See `helm-define-multi-key'.

\(fn NAME DOCSTRING FUNS &optional DELAY)" nil t)

(put 'helm-multi-key-defun 'lisp-indent-function '2)

(autoload 'helm-define-key-with-subkeys "helm" "\
Allow defining in MAP a KEY and SUBKEY to COMMAND.

This allow typing KEY to call COMMAND the first time and
type only SUBKEY on subsequent calls.

Arg MAP is the keymap to use, SUBKEY is the initial short keybinding to
call COMMAND.

Arg OTHER-SUBKEYS is an alist specifying other short keybindings
to use once started.
e.g:

\(helm-define-key-with-subkeys global-map
   (kbd \"C-x v n\") ?n 'git-gutter:next-hunk '((?p . git-gutter:previous-hunk)))


In this example, `C-x v n' will run `git-gutter:next-hunk'
subsequent hits on \"n\" will run this command again
and subsequent hits on \"p\" will run `git-gutter:previous-hunk'.

Arg MENU is a string to display in minibuffer
to describe SUBKEY and OTHER-SUBKEYS.
Arg EXIT-FN specify a function to run on exit.

Any other keys pressed run their assigned command defined in MAP
and exit the loop running EXIT-FN if specified.

NOTE: SUBKEY and OTHER-SUBKEYS bindings support
only char syntax actually (e.g ?n)
so don't use strings, vectors or whatever to define them.

\(fn MAP KEY SUBKEY COMMAND &optional OTHER-SUBKEYS MENU EXIT-FN)" nil nil)

(put 'helm-define-key-with-subkeys 'lisp-indent-function '1)

(autoload 'helm-debug-open-last-log "helm" "\
Open helm log file of last helm session.
If `helm-last-log-file' is nil, switch to `helm-debug-buffer' .

\(fn)" t nil)

(autoload 'helm "helm" "\
Main function to execute helm sources.

Keywords supported:
:sources :input :prompt :resume :preselect
:buffer :keymap :default :history :allow-nest

Extra LOCAL-VARS keywords are supported, see below.

PLIST is a list like (:key1 val1 :key2 val2 ...) or
\(&optional sources input prompt resume
            preselect buffer keymap default history).

Basic keywords are the following:

:sources

A list of sources used for this session.  It also accepts a
symbol, interpreted as a variable of a helm source
i.e (a symbol can be passed instead of a list of sources).
It also accepts an alist representing a helm source, which is
detected by (assq 'name ANY-SOURCES).
NOTE: In this case the source is embedded in the helm command and
have no symbol name, so it is not reachable from outside.
It will be referenced in `helm-sources' as a whole alist.

:input

Temporary value of `helm-pattern', ie. initial input of minibuffer.

:prompt

Prompt other than \"pattern: \".

:resume

If t, Resurrect previously instance of `helm'.  Skip the initialization.
If 'noresume, this instance of `helm' cannot be resumed.

:preselect

Initially selected candidate.  Specified by exact candidate or a regexp.

:buffer

`helm-buffer' instead of *helm*.

:keymap

`helm-map' for current `helm' session.

:default

A default argument that will be inserted in minibuffer with \\<minibuffer-local-map>\\[next-history-element].
When nil or not present `thing-at-point' will be used instead.
If `helm-maybe-use-default-as-input' is non--nil display will be
updated using :default arg as input unless :input is specified,
which in this case will take precedence on :default
This is a string or a list, in this case the car of the list will
be used as initial default input, but you will be able to cycle in this
list with \\<minibuffer-local-map>\\[next-history-element].

:history

By default all minibuffer input is pushed to `minibuffer-history',
if an argument HISTORY is provided, input will be pushed to HISTORY.
History element should be a symbol.

:allow-nest

Allow running this helm command within a running helm session.

Of course, conventional arguments are supported, the two are same.

\(helm :sources sources :input input :prompt prompt :resume resume
       :preselect preselect :buffer buffer :keymap keymap :default default
       :history history)

and

\(helm sources input prompt resume preselect buffer keymap default history)

are the same.

However the use of non keyword args is deprecated and should not be used.

Other keywords are interpreted as local variables of this helm session.
The `helm-' prefix can be omitted.  For example,

\(helm :sources 'helm-source-buffers-list
       :buffer \"*buffers*\" :candidate-number-limit 10)

means starting helm session with `helm-source-buffers'
source in *buffers* buffer and set variable `helm-candidate-number-limit'
to 10 as session local variable.

\(fn &key SOURCES INPUT PROMPT RESUME PRESELECT BUFFER KEYMAP DEFAULT HISTORY ALLOW-NEST OTHER-LOCAL-VARS)" nil nil)

(autoload 'helm-other-buffer "helm" "\
Simplified interface of `helm' with other `helm-buffer'.
Call `helm' with only ANY-SOURCES and ANY-BUFFER as args.

\(fn ANY-SOURCES ANY-BUFFER)" nil nil)

;;;***

;;;### (autoloads nil "helm-adaptive" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-adaptive.el"
;;;;;;  "e958abf91c7aaeec437223f547658723")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-adaptive.el

(autoload 'helm-reset-adaptive-history "helm-adaptive" "\
Delete all `helm-adaptive-history' and his file.
Useful when you have a old or corrupted `helm-adaptive-history-file'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-apt" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-apt.el"
;;;;;;  "5e3c3feddc56d0affdc9f39d2c2fab90")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-apt.el

(autoload 'helm-apt "helm-apt" "\
Preconfigured `helm' : frontend of APT package manager.
With a prefix arg reload cache.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-bookmark" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-bookmark.el"
;;;;;;  "798ed86579e7948380aead2ff1470ba3")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-bookmark.el

(autoload 'helm-bookmarks "helm-bookmark" "\
Preconfigured `helm' for bookmarks.

\(fn)" t nil)

(autoload 'helm-pp-bookmarks "helm-bookmark" "\
Preconfigured `helm' for bookmarks (pretty-printed).

\(fn)" t nil)

(autoload 'helm-filtered-bookmarks "helm-bookmark" "\
Preconfigured helm for bookmarks (filtered by category).
Optional source `helm-source-bookmark-addressbook' is loaded
only if external library addressbook-bookmark.el is available.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-buffers" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-buffers.el"
;;;;;;  "b4f03298cfb9d8b8da25a3c51f242cb4")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-buffers.el

(autoload 'helm-buffers-list "helm-buffers" "\
Preconfigured `helm' to list buffers.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-color" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-color.el"
;;;;;;  "a3b84d90e7992568f72ddd85eaa6eb86")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-color.el

(autoload 'helm-colors "helm-color" "\
Preconfigured `helm' for color.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-command" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-command.el"
;;;;;;  "c8b3d0ea4ab3e5988082ca683c513180")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-command.el

(autoload 'helm-M-x "helm-command" "\
Preconfigured `helm' for Emacs commands.
It is `helm' replacement of regular `M-x' `execute-extended-command'.

Unlike regular `M-x' emacs vanilla `execute-extended-command' command,
the prefix args if needed, are passed AFTER starting `helm-M-x'.

You can get help on each command by persistent action.

\(fn ARG &optional COMMAND-NAME)" t nil)

;;;***

;;;### (autoloads nil "helm-config" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-config.el"
;;;;;;  "38eef429a5aa384fbf662c1dd8860b89")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-config.el

(autoload 'helm-configuration "helm-config" "\
Customize `helm'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-dabbrev" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-dabbrev.el"
;;;;;;  "7a1e99928fe4eff8f5eac72a16505f4e")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-dabbrev.el

(autoload 'helm-dabbrev "helm-dabbrev" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-elisp" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-elisp.el"
;;;;;;  "eceddcf9e2d92e4ac18212b552d8c2fb")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-elisp.el

(autoload 'helm-lisp-completion-at-point "helm-elisp" "\
Helm lisp symbol completion at point.

\(fn)" t nil)

(autoload 'helm-complete-file-name-at-point "helm-elisp" "\
Complete file name at point.

\(fn &optional FORCE)" t nil)

(autoload 'helm-lisp-indent "helm-elisp" "\


\(fn)" t nil)

(autoload 'helm-lisp-completion-or-file-name-at-point "helm-elisp" "\
Complete lisp symbol or filename at point.
Filename completion happen if string start after or between a double quote.

\(fn)" t nil)

(autoload 'helm-apropos "helm-elisp" "\
Preconfigured helm to describe commands, functions, variables and faces.

\(fn)" t nil)

(autoload 'helm-manage-advice "helm-elisp" "\
Preconfigured `helm' to disable/enable function advices.

\(fn)" t nil)

(autoload 'helm-locate-library "helm-elisp" "\


\(fn)" t nil)

(autoload 'helm-timers "helm-elisp" "\
Preconfigured `helm' for timers.

\(fn)" t nil)

(autoload 'helm-complex-command-history "helm-elisp" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-elisp-package" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-elisp-package.el"
;;;;;;  "bd88da0004723f64d168e7b8dd647173")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-elisp-package.el

(autoload 'helm-list-elisp-packages "helm-elisp-package" "\


\(fn ARG)" t nil)

(autoload 'helm-list-elisp-packages-no-fetch "helm-elisp-package" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-elscreen" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-elscreen.el"
;;;;;;  "4af962f15ac2a545f0c14fa4808fb46b")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-elscreen.el

(autoload 'helm-elscreen "helm-elscreen" "\
Preconfigured helm to list elscreen.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-eshell" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-eshell.el"
;;;;;;  "84fa9460510eaaa21cb3f440ed761e20")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-eshell.el

(autoload 'helm-esh-pcomplete "helm-eshell" "\
Preconfigured helm to provide helm completion in eshell.

\(fn)" t nil)

(autoload 'helm-eshell-history "helm-eshell" "\
Preconfigured helm for eshell history.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-eval" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-eval.el"
;;;;;;  "3f4ade238b3222dddfc23e051add76bf")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-eval.el

(autoload 'helm-eval-expression "helm-eval" "\
Preconfigured helm for `helm-source-evaluation-result'.

\(fn ARG)" t nil)

(autoload 'helm-eval-expression-with-eldoc "helm-eval" "\
Preconfigured helm for `helm-source-evaluation-result' with `eldoc' support.

\(fn)" t nil)

(autoload 'helm-calcul-expression "helm-eval" "\
Preconfigured helm for `helm-source-calculation-result'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-external" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-external.el"
;;;;;;  "7b084ff2631d9395f0a178459e298104")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-external.el

(autoload 'helm-run-external-command "helm-external" "\
Preconfigured `helm' to run External PROGRAM asyncronously from Emacs.
If program is already running exit with error.
You can set your own list of commands with
`helm-external-commands-list'.

\(fn PROGRAM)" t nil)

;;;***

;;;### (autoloads nil "helm-files" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-files.el"
;;;;;;  "3dd9e43e720ac7b51faee70b693ce203")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-files.el

(autoload 'helm-browse-project "helm-files" "\
Browse files and see status of project with its vcs.
Only HG and GIT are supported for now.
Fall back to `helm-find-files' or `helm-browse-project-find-files'
if current directory is not under control of one of those vcs.
With a prefix ARG browse files recursively, with two prefix ARG
rebuild the cache.
If the current directory is found in the cache, start
`helm-browse-project-find-files' even with no prefix ARG.
NOTE: The prefix ARG have no effect on the VCS controlled directories.

Need dependencies for VCS:
<https://github.com/emacs-helm/helm-ls-git.git>
and
<https://github.com/emacs-helm/helm-mercurial-queue/blob/master/helm-ls-hg.el>.

\(fn ARG)" t nil)

(autoload 'helm-find "helm-files" "\
Preconfigured `helm' for the find shell command.

\(fn ARG)" t nil)

(autoload 'helm-find-files "helm-files" "\
Preconfigured `helm' for helm implementation of `find-file'.
Called with a prefix arg show history if some.
Don't call it from programs, use `helm-find-files-1' instead.
This is the starting point for nearly all actions you can do on files.

\(fn ARG)" t nil)

(autoload 'helm-for-files "helm-files" "\
Preconfigured `helm' for opening files.
Run all sources defined in `helm-for-files-preferred-list'.

\(fn)" t nil)

(autoload 'helm-multi-files "helm-files" "\
Same as `helm-for-files' but allow toggling from locate to others sources.

\(fn)" t nil)

(autoload 'helm-recentf "helm-files" "\
Preconfigured `helm' for `recentf'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-font" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-font.el"
;;;;;;  "b03646310b0eba1596e536b2d21df17f")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-font.el

(autoload 'helm-select-xfont "helm-font" "\
Preconfigured `helm' to select Xfont.

\(fn)" t nil)

(autoload 'helm-ucs "helm-font" "\
Preconfigured helm for `ucs-names' math symbols.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-grep" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-grep.el"
;;;;;;  "0cdd5d023f62aa81ff0817c494349a82")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-grep.el

(autoload 'helm-goto-precedent-file "helm-grep" "\
Go to precedent file in helm grep/etags buffers.

\(fn)" t nil)

(autoload 'helm-goto-next-file "helm-grep" "\
Go to precedent file in helm grep/etags buffers.

\(fn)" t nil)

(autoload 'helm-grep-run-save-buffer "helm-grep" "\
Run grep save results action from `helm-do-grep-1'.

\(fn)" t nil)

(autoload 'helm-grep-mode "helm-grep" "\
Major mode to provide actions in helm grep saved buffer.

Special commands:
\\{helm-grep-mode-map}

\(fn)" t nil)

(autoload 'helm-gm-next-file "helm-grep" "\


\(fn)" t nil)

(autoload 'helm-gm-precedent-file "helm-grep" "\


\(fn)" t nil)

(autoload 'helm-grep-mode-jump "helm-grep" "\


\(fn)" t nil)

(autoload 'helm-grep-mode-jump-other-window-forward "helm-grep" "\


\(fn)" t nil)

(autoload 'helm-grep-mode-jump-other-window-backward "helm-grep" "\


\(fn)" t nil)

(autoload 'helm-grep-mode-jump-other-window "helm-grep" "\


\(fn)" t nil)

(autoload 'helm-do-grep "helm-grep" "\
Preconfigured helm for grep.
Contrarily to Emacs `grep', no default directory is given, but
the full path of candidates in ONLY.
That allow to grep different files not only in `default-directory' but anywhere
by marking them (C-<SPACE>). If one or more directory is selected
grep will search in all files of these directories.
You can also use wildcard in the base name of candidate.
If a prefix arg is given use the -r option of grep (recurse).
The prefix arg can be passed before or after start file selection.
See also `helm-do-grep-1'.

\(fn)" t nil)

(autoload 'helm-do-zgrep "helm-grep" "\
Preconfigured helm for zgrep.

\(fn)" t nil)

(autoload 'helm-do-pdfgrep "helm-grep" "\
Preconfigured helm for pdfgrep.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-help" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-help.el"
;;;;;;  "f9f03101611c6560fb0569c405c689e9")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-help.el

(autoload 'helm-documentation "helm-help" "\
Helm documentation.
With a prefix arg refresh the documentation.

Find here the documentation of all sources actually documented.

\(fn ARG)" t nil)

(autoload 'helm-help "helm-help" "\
Help of `helm'.

\(fn)" t nil)

(autoload 'helm-buffer-help "helm-help" "\
Help command for helm buffers.

\(fn)" t nil)

(autoload 'helm-ff-help "helm-help" "\
Help command for `helm-find-files'.

\(fn)" t nil)

(autoload 'helm-read-file-name-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-generic-file-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-grep-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-pdfgrep-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-etags-help "helm-help" "\
The help function for etags.

\(fn)" t nil)

(autoload 'helm-ucs-help "helm-help" "\
Help command for `helm-ucs'.

\(fn)" t nil)

(autoload 'helm-bookmark-help "helm-help" "\
Help command for bookmarks.

\(fn)" t nil)

(autoload 'helm-esh-help "helm-help" "\
Help command for `helm-find-files-eshell-command-on-file'.

\(fn)" t nil)

(autoload 'helm-buffers-ido-virtual-help "helm-help" "\
Help command for ido virtual buffers.

\(fn)" t nil)

(autoload 'helm-moccur-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-top-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-apt-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-el-package-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-M-x-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-imenu-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-color-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-semantic-help "helm-help" "\


\(fn)" t nil)

(autoload 'helm-kmacro-help "helm-help" "\


\(fn)" t nil)

(defvar helm-buffer-mode-line-string '("Buffer(s)" "\\<helm-buffer-map>\\[helm-buffer-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct" "String displayed in mode-line in `helm-source-buffers-list'"))

(defvar helm-color-mode-line-string '("Colors" "\\<helm-color-map>\\[helm-color-help]:Help/\\[helm-color-run-insert-name]:Insert name/\\[helm-color-run-insert-rgb]:Insert RGB/with shift: Kill"))

(defvar helm-buffers-ido-virtual-mode-line-string '("Killed Buffer(s)" "\\<helm-buffers-ido-virtual-map>\\[helm-buffers-ido-virtual-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct" "String displayed in mode-line in `helm-source-buffers-list'"))

(defvar helm-ff-mode-line-string "\\<helm-find-files-map>\\[helm-ff-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct" "\
String displayed in mode-line in `helm-source-find-files'")

(defvar helm-read-file-name-mode-line-string "\\<helm-read-file-map>\\[helm-read-file-name-help]:Help C/\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct" "\
String displayed in mode-line in `helm-source-find-files'.")

(defvar helm-generic-file-mode-line-string "\\<helm-generic-files-map>\\[helm-generic-file-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend" "\
String displayed in mode-line in Locate.")

(defvar helm-grep-mode-line-string "\\<helm-grep-map>\\[helm-grep-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend" "\
String displayed in mode-line in `helm-do-grep'.")

(defvar helm-pdfgrep-mode-line-string "\\<helm-pdfgrep-map>\\[helm-pdfgrep-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend" "\
String displayed in mode-line in `helm-do-pdfgrep'.")

(defvar helm-etags-mode-line-string "\\<helm-etags-map>\\[helm-etags-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct" "\
String displayed in mode-line in `helm-etags-select'.")

(defvar helm-ucs-mode-line-string "\\<helm-ucs-map>\\[helm-ucs-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct" "\
String displayed in mode-line in `helm-ucs'.")

(defvar helm-bookmark-mode-line-string '("Bookmark(s)" "\\<helm-bookmark-map>\\[helm-bookmark-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct") "\
String displayed in mode-line in `helm-source-buffers-list'")

(defvar helm-occur-mode-line "\\<helm-map>\\[helm-help]:Help \\<helm-occur-map>\\[helm-occur-run-query-replace-regexp]:Query replace regexp \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(defvar helm-moccur-mode-line "\\<helm-moccur-map>\\[helm-moccur-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(defvar helm-comp-read-mode-line "\\<helm-comp-read-map>C/\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-help]:Help \\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct")

(defvar helm-top-mode-line "\\<helm-top-map>\\[helm-top-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(defvar helm-apt-mode-line "\\<helm-apt-map>\\[helm-apt-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(defvar helm-el-package-mode-line "\\<helm-el-package-map>\\[helm-el-package-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(defvar helm-M-x-mode-line "\\<helm-M-x-map>\\[helm-M-x-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(defvar helm-imenu-mode-line "\\<helm-imenu-map>\\[helm-imenu-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(defvar helm-semantic-mode-line "\\<helm-semantic-map>\\[helm-semantic-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(autoload 'helm-describe-helm-attribute "helm-help" "\
Display the full documentation of HELM-ATTRIBUTE.
HELM-ATTRIBUTE should be a symbol.

\(fn HELM-ATTRIBUTE)" t nil)

;;;***

;;;### (autoloads nil "helm-imenu" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-imenu.el"
;;;;;;  "63f6d6ce80da1dc94b62848e38a9aa0f")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-imenu.el

(autoload 'helm-imenu "helm-imenu" "\
Preconfigured `helm' for `imenu'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-info" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-info.el"
;;;;;;  "ff5f7c493bab708272b3f22d0cb99fe0")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-info.el

(autoload 'helm-info-at-point "helm-info" "\
Preconfigured `helm' for searching info at point.
With a prefix-arg insert symbol at point.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-locate" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-locate.el"
;;;;;;  "4f655d5fc3836682897d9e00e2cfba23")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-locate.el

(autoload 'helm-locate-read-file-name "helm-locate" "\


\(fn PROMPT)" nil nil)

(autoload 'helm-locate "helm-locate" "\
Preconfigured `helm' for Locate.
Note: you can add locate options after entering pattern.
See 'man locate' for valid options and also `helm-locate-command'.

You can specify a local database with prefix argument ARG.
With two prefix arg, refresh the current local db or create it
if it doesn't exists.
Many databases can be used: navigate and mark them.
See also `helm-locate-with-db'.

To create a user specific db, use
\"updatedb -l 0 -o db_path -U directory\".
Where db_path is a filename matched by
`helm-locate-db-file-regexp'.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-man" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-man.el"
;;;;;;  "45bd75a29492dfdfe145302d819f5ddc")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-man.el

(autoload 'helm-man-woman "helm-man" "\
Preconfigured `helm' for Man and Woman pages.
With a prefix arg reinitialize the cache.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-misc" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-misc.el"
;;;;;;  "abf879cafbb149f42e37c176df8f4e38")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-misc.el

(autoload 'helm-browse-menubar "helm-misc" "\
Helm interface to the menubar using lacarte.el.

\(fn)" t nil)

(autoload 'helm-world-time "helm-misc" "\
Preconfigured `helm' to show world time.

\(fn)" t nil)

(autoload 'helm-insert-latex-math "helm-misc" "\
Preconfigured helm for latex math symbols completion.

\(fn)" t nil)

(autoload 'helm-ratpoison-commands "helm-misc" "\
Preconfigured `helm' to execute ratpoison commands.

\(fn)" t nil)

(autoload 'helm-stumpwm-commands "helm-misc" "\


\(fn)" t nil)

(autoload 'helm-mini "helm-misc" "\
Preconfigured `helm' lightweight version (buffer -> recentf).

\(fn)" t nil)

(autoload 'helm-minibuffer-history "helm-misc" "\
Preconfigured `helm' for `minibuffer-history'.

\(fn)" t nil)

(autoload 'helm-comint-input-ring "helm-misc" "\
Predefined `helm' that provide completion of `comint' history.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-mode" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-mode.el"
;;;;;;  "adccfaf8c1ecbf4ce990dc3f5e640679")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-mode.el

(autoload 'helm-comp-read "helm-mode" "\
Read a string in the minibuffer, with helm completion.

It is helm `completing-read' equivalent.

- PROMPT is the prompt name to use.

- COLLECTION can be a list, vector, obarray or hash-table.
  It can be also a function that receives three arguments:
  the values string, predicate and t. See `all-completions' for more details.

Keys description:

- TEST: A predicate called with one arg i.e candidate.

- INITIAL-INPUT: Same as input arg in `helm'.

- PRESELECT: See preselect arg of `helm'.

- DEFAULT: This option is used only for compatibility with regular
  Emacs `completing-read' (Same as DEFAULT arg of `completing-read').

- BUFFER: Name of helm-buffer.

- MUST-MATCH: Candidate selected must be one of COLLECTION.

- REVERSE-HISTORY: When non--nil display history source after current
  source completion.

- REQUIRES-PATTERN: Same as helm attribute, default is 0.

- HISTORY: A list containing specific history, default is nil.
  When it is non--nil, all elements of HISTORY are displayed in
  a special source before COLLECTION.

- INPUT-HISTORY: A symbol. the minibuffer input history will be
  stored there, if nil or not provided, `minibuffer-history'
  will be used instead.

- CASE-FOLD: Same as `helm-case-fold-search'.

- DEL-INPUT: Boolean, when non--nil (default) remove the partial
  minibuffer input from HISTORY is present.

- PERSISTENT-ACTION: A function called with one arg i.e candidate.

- PERSISTENT-HELP: A string to document PERSISTENT-ACTION.

- MODE-LINE: A string or list to display in mode line.
  Default is `helm-comp-read-mode-line'.

- KEYMAP: A keymap to use in this `helm-comp-read'.
  (the keymap will be shared with history source)

- NAME: The name related to this local source.

- EXEC-WHEN-ONLY-ONE: Bound `helm-execute-action-at-once-if-one'
  to non--nil. (possibles values are t or nil).

- VOLATILE: Use volatile attribute (enabled by default).

- SORT: A predicate to give to `sort' e.g `string-lessp'.

- FC-TRANSFORMER: A `filtered-candidate-transformer' function.

- HIST-FC-TRANSFORMER: A `filtered-candidate-transformer'
  function for the history source.

- MARKED-CANDIDATES: If non--nil return candidate or marked candidates as a list.

- NOMARK: When non--nil don't allow marking candidates.

- ALISTP: (default is non--nil) See `helm-comp-read-get-candidates'.

- CANDIDATES-IN-BUFFER: when non--nil use a source build with
  `helm-candidates-in-buffer' which is much faster.
  Argument VOLATILE have no effect when CANDIDATES-IN-BUFFER is non--nil.

Any prefix args passed during `helm-comp-read' invocation will be recorded
in `helm-current-prefix-arg', otherwise if prefix args were given before
`helm-comp-read' invocation, the value of `current-prefix-arg' will be used.
That's mean you can pass prefix args before or after calling a command
that use `helm-comp-read' See `helm-M-x' for example.

\(fn PROMPT COLLECTION &key TEST INITIAL-INPUT DEFAULT PRESELECT (buffer \"*Helm Completions*\") MUST-MATCH FUZZY REVERSE-HISTORY (requires-pattern 0) HISTORY INPUT-HISTORY (case-fold helm-comp-read-case-fold-search) (del-input t) (persistent-action nil) (persistent-help \"DoNothing\") (mode-line helm-comp-read-mode-line) (keymap helm-comp-read-map) (name \"Helm Completions\") CANDIDATES-IN-BUFFER EXEC-WHEN-ONLY-ONE QUIT-WHEN-NO-CAND (volatile t) SORT (fc-transformer (quote helm-cr-default-transformer)) HIST-FC-TRANSFORMER MARKED-CANDIDATES NOMARK (alistp t))" nil nil)

(defvar helm-mode nil "\
Non-nil if Helm mode is enabled.
See the command `helm-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-mode'.")

(custom-autoload 'helm-mode "helm-mode" nil)

(autoload 'helm-mode "helm-mode" "\
Toggle generic helm completion.

All functions in Emacs that use `completing-read'
or `read-file-name' and friends will use helm interface
when this mode is turned on.
However you can modify this behavior for functions of your choice
with `helm-completing-read-handlers-alist'.

Called with a positive arg, turn on unconditionally, with a
negative arg turn off.
You can turn it on with `helm-mode'.

Some crap emacs functions may not be supported,
e.g `ffap-alternate-file' and maybe others
You can add such functions to `helm-completing-read-handlers-alist'
with a nil value.

Note: This mode is incompatible with Emacs23.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-net" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-net.el"
;;;;;;  "0ac205c69dc1d804d2f43aa204ab4073")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-net.el

(autoload 'helm-surfraw "helm-net" "\
Preconfigured `helm' to search PATTERN with search ENGINE.

\(fn PATTERN ENGINE)" t nil)

(autoload 'helm-google-suggest "helm-net" "\
Preconfigured `helm' for google search with google suggest.

\(fn)" t nil)

(autoload 'helm-yahoo-suggest "helm-net" "\
Preconfigured `helm' for Yahoo searching with Yahoo suggest.

\(fn)" t nil)

(autoload 'helm-wikipedia-suggest "helm-net" "\
Preconfigured `helm' for Wikipedia lookup with Wikipedia suggest.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-org" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-org.el"
;;;;;;  "e867bbb6ee361c074a72bd58b37aca1c")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-org.el

(autoload 'helm-org-agenda-files-headings "helm-org" "\


\(fn)" t nil)

(autoload 'helm-org-in-buffer-headings "helm-org" "\


\(fn)" t nil)

(autoload 'helm-org-capture-templates "helm-org" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-regexp" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-regexp.el"
;;;;;;  "0fd21e3b82a7fcd1bdca7c7ea898c4e7")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-regexp.el

(autoload 'helm-moccur-run-save-buffer "helm-regexp" "\
Run grep save results action from `helm-do-grep-1'.

\(fn)" t nil)

(autoload 'helm-moccur-mode "helm-regexp" "\
Major mode to provide actions in helm moccur saved buffer.

Special commands:
\\{helm-moccur-mode-map}

\(fn)" t nil)

(autoload 'helm-regexp "helm-regexp" "\
Preconfigured helm to build regexps.
`query-replace-regexp' can be run from there against found regexp.

\(fn)" t nil)

(autoload 'helm-occur "helm-regexp" "\
Preconfigured helm for Occur.

\(fn)" t nil)

(autoload 'helm-occur-from-isearch "helm-regexp" "\
Invoke `helm-occur' from isearch.

\(fn)" t nil)

(autoload 'helm-multi-occur "helm-regexp" "\
Preconfigured helm for multi occur.

  BUFFERS is a list of buffers to search through.
With a prefix arg, reverse the behavior of
`helm-moccur-always-search-in-current'.
The prefix arg can be set before calling `helm-multi-occur'
or during the buffer selection.

\(fn BUFFERS)" t nil)

(autoload 'helm-multi-occur-from-isearch "helm-regexp" "\
Invoke `helm-multi-occur' from isearch.

With a prefix arg, reverse the behavior of
`helm-moccur-always-search-in-current'.
The prefix arg can be set before calling
`helm-multi-occur-from-isearch' or during the buffer selection.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-ring" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-ring.el"
;;;;;;  "eb393b48afffded29ab147aa452912b0")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-ring.el

(autoload 'helm-mark-ring "helm-ring" "\
Preconfigured `helm' for `helm-source-mark-ring'.

\(fn)" t nil)

(autoload 'helm-global-mark-ring "helm-ring" "\
Preconfigured `helm' for `helm-source-global-mark-ring'.

\(fn)" t nil)

(autoload 'helm-all-mark-rings "helm-ring" "\
Preconfigured `helm' for `helm-source-global-mark-ring' and `helm-source-mark-ring'.

\(fn)" t nil)

(autoload 'helm-register "helm-ring" "\
Preconfigured `helm' for Emacs registers.

\(fn)" t nil)

(autoload 'helm-show-kill-ring "helm-ring" "\
Preconfigured `helm' for `kill-ring'.
It is drop-in replacement of `yank-pop'.

First call open the kill-ring browser, next calls move to next line.

\(fn)" t nil)

(autoload 'helm-execute-kmacro "helm-ring" "\
Keyboard macros with helm interface.
Define your macros with `f3' and `f4'.
See (info \"(emacs) Keyboard Macros\") for detailed infos.
This command is useful when used with persistent action.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-semantic" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-semantic.el"
;;;;;;  "c9c9c653da998e3d17b0d8f17a6d3ee4")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-semantic.el

(autoload 'helm-semantic "helm-semantic" "\
Preconfigured `helm' for `semantic'.
If ARG is supplied, pre-select symbol at point instead of current

\(fn ARG)" t nil)

(autoload 'helm-semantic-or-imenu "helm-semantic" "\
Run `helm' with `semantic' or `imenu'.
If ARG is supplied, pre-select symbol at point instead of current
semantic tag in scope.

If `semantic-mode' is active in the current buffer, then use
semantic for generating tags, otherwise fall back to `imenu'.
Fill in the symbol at point by default.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-sys" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-sys.el"
;;;;;;  "fcced1d94521473159ec225240cfd3d0")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-sys.el

(autoload 'helm-top "helm-sys" "\
Preconfigured `helm' for top command.

\(fn)" t nil)

(autoload 'helm-list-emacs-process "helm-sys" "\
Preconfigured `helm' for emacs process.

\(fn)" t nil)

(autoload 'helm-xrandr-set "helm-sys" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-tags" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-tags.el"
;;;;;;  "43b4e7e0a025576e4f4ee73d826f89f4")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-tags.el

(autoload 'helm-etags-select "helm-tags" "\
Preconfigured helm for etags.
If called with a prefix argument or if any of the tag files have
been modified, reinitialize cache.

This function aggregates three sources of tag files:

  1) An automatically located file in the parent directories, by `helm-etags-get-tag-file'.
  2) `tags-file-name', which is commonly set by `find-tag' command.
  3) `tags-table-list' which is commonly set by `visit-tags-table' command.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-utils" "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-utils.el"
;;;;;;  "5de486d3c4ed558fd026badd4c59a5a9")
;;; Generated autoloads from ../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-utils.el

(autoload 'helm-show-all-in-this-source-only "helm-utils" "\
Show only current source of this helm session with all its candidates.
With a numeric prefix arg show only the ARG number of candidates.

\(fn ARG)" t nil)

(autoload 'helm-display-all-sources "helm-utils" "\
Display all sources previously hidden by `helm-set-source-filter'.

\(fn)" t nil)

(autoload 'helm-quit-and-find-file "helm-utils" "\
Drop into `helm-find-files' from `helm'.
If current selection is a buffer or a file, `helm-find-files'
from its directory.

\(fn)" t nil)

(autoload 'helm-w32-shell-execute-open-file "helm-utils" "\


\(fn FILE)" t nil)

(autoload 'helm-yank-text-at-point "helm-utils" "\
Yank text at point in `helm-current-buffer' into minibuffer.
If `helm-yank-symbol-first' is non--nil the first yank
grabs the entire symbol.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-adaptive.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-aliases.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-apt.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-autoloads.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-bookmark.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-buffers.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-color.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-command.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-config.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-dabbrev.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-elisp-package.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-elisp.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-elscreen.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-eshell.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-eval.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-external.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-files.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-font.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-grep.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-help.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-imenu.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-info.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-locate.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-man.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-match-plugin.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-misc.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-mode.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-net.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-org.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-pkg.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-plugin.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-regexp.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-ring.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-semantic.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-source.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-sys.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-tags.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm-utils.el"
;;;;;;  "../../../../../Users/phd/.emacs.d/elpa/helm-20150419.2148/helm.el")
;;;;;;  (21812 51490 243000 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; helm-autoloads.el ends here
