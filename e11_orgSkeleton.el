
;; C-c C-e t
       (define-skeleton org-skeleton
       "Header info for a emacs-org file."
       "Title: "
       "# -*- mode: org; org-export-babel-evaluate: nil -*- \n"
       "* Header Settings   :noexport: \n"
       "** File Info \n"
       "#+TITLE:" str " \n"
       "#+AUTHOR: Bingwei Tian  \\thanks{bwtian@gmail.com}\\\\  \\small{Kyoto University, Kyoto, Japan} \n"
       "#+EMAIL: bwtian@gmail.com \n"
       "#+DATE: \n"        
       "#+LICENSE: GPLv3 \n"
       "#+LASTEDIT:  \n"
       "#+SEQ_TODO:  TODO(t) DOING(i!) HOLD(h@) | DONE(d) CANCELED(c@) \n"
       "** Org Export Settings \n"  
       "#+STARTUP: overview align indent fold hideblocks hidestars \n"
       "#+STARTUP: nodlcheck oddeven lognotestate latexpreview constSI inlineimages \n"
       "#+OPTIONS: H:4 num:3 toc:2 |:t ::t skip:nil f:t tags:not-in-toc d:(HIDE) \n" 
       "#+OPTIONS: <:t timestamp:t todo:nil tasks:nil author:t creator:t email:nil \n"
       "#+OPTIONS: *:t -:t ^:{} TeX:t LaTeX:t @:t ':t pri:nil \\n:nil \n"
       "#+BABEL: :session *R* :cache yes :tangle yes :exports both \n"
       "#+COLUMNS: %25ITEM %TAGS %PRIORITY %T \n"
       "#+PROPERTY: noweb yes \n"
       "#+EXPORT_SELECT_TAGS:  \n"
       "#+EXPORT_EXCLUDE_TAGS:  noexport \n"
       
       "** Latex Export \n"
       "#+LaTeX_CLASS: article \n"
       "#+LaTeX_CLASS_OPTIONS: [a4paper,times,12pt,listings-bw,microtype] \n"
       "#+LATEX_HEADER: \\usepackage{longtable,tabulary,booktabs,threeparttable,tabularx,graphicx, tikz, float,wrapfig,url,underscore} \n"
       "#+LaTeX_HEADER: \\usepackage{parnotes,amsmath,amssymb,marvosym,wasysym} \n"
       "#+LATEX_HEADER: \\usepackage[citestyle=authoryear-icomp,bibstyle=authoryear,hyperref=true,maxcitenames=3,url=true,backend=biber,natbib=true]{biblatex} \n"
       "#+LATEX_HEADER: \\usepackage[section,below]{placeins} \n"
       "#+LaTeX_HEADER: \\usepackage[dvipsnames,svgnames,table]{xcolor} \n"
       "#+LaTeX_HEADER: \\usepackage[innermargin=1.5in,outermargin=1.25in,vmargin=1.25in]{geometry} \n"
       "#+LATEX_HEADER: \\usepackage[nomain,acronym,xindy,toc]{glossaries}\n"
       "#+LATEX_HEADER: \\hypersetup{colorlinks=true,citecolor=blue,linkcolor=blue,citebordercolor={0 1 0},linktocpage,pdfstartview=FitH,anchorcolor=blue,filecolor=blue,menucolor=blue,urlcolor=blue} \n"
       "#+LATEX_HEADER: \\linespread{1.3} \n"
      
   ;;    * Template Checklist [13/13]                             :noexport:
   ;; - [X] Revise #+TITLE:
   ;; - [X] Indicate #+AUTHOR:
   ;; - [X] Add #+EMAIL:
   ;; - [X] Revise banner source block [3/3]
   ;;   - [X] Add link to a useful language web site
   ;;   - [X] Replace "Language" with language name
   ;;   - [X] Find a suitable graphic and use it to link to the language
   ;;     web site
   ;; - [X] Write an Introduction
   ;; - [X] Describe Requirements and Setup
   ;; - [X] Replace "Language" with language name in Org Mode Features for Language Source Code Blocks
   ;; - [X] Specify Org Mode Configuration
   ;; - [X] Describe Header Arguments
   ;; - [X] Describe support for Sessions
   ;; - [X] Describe Result Types
   ;; - [X] Describe Other differences from supported languages
   ;; - [X] Provide brief Examples of Use
   ;; - [X] paper  chenck list 
  "* Abstract  :ignoreheading: \n"
       "#+BEGIN_ABSTRACT\n"
       "Abstract：\n"
       "#+END_ABSTRACT\n"
    )
       (global-set-key [C-S-f1] 'org-skeleton)

   (define-skeleton latex-skeleton
     "Default LaTeX file initial contents."
     "Title: "
     "\\usepackage[nomain,acronym,xindy,toc]{glossaries}\n\n"
     "\\input{xGlossary}\n\n"
     "\\makeglossaries\n\n"
     "\\documentclass[a4paper]{article}\n\n"
     "\\title{}\n"
     "\\author{Bingwei Tian\\thanks{bwtian@gmail.com}}\n"
     "\\date{\\today}\n\n"
     "\\begin{document}\n\n"
     "\\maketitle\n"
     "\\begin{abstract}\n\n"
     "\\end{abstract}\n\n"
     "%\\tableofcontents\n\n"
     "\\section{Introduction}\n\n"
     "\\bibliography{}\n\n"
     "\\end{document}\n\n"
    )
   (global-set-key [C-S-f2] 'latex-skeleton)
(define-skeleton latex-org
    "Default rnw file initial contents."
    "Title: "

"#+HEADER: :exports results \n" 
"#+HEADER: :imagemagick yes :iminoptions -density 600 :imoutoptions -geometry 400 "
"#+HEADER: :fit yes :noweb yes :headers '(\"\\usepackage{tikz}\")"
"#+HEADER: :file (by-backend (html \"tree.svg\") (t 'nil))"
"#+HEADER: :results (by-backend (pdf \"latex\") (t \"raw\"))"
"#+NAME: "str" \n"
"#+BEGIN_SRC latex \n"
"<<>> \n"
"#+END_SRC \n"
   )
  (global-set-key [S-f2] 'latex-org)

  (define-skeleton rnw
    "Default rnw file initial contents."
    "Title: "
    "\\documentclass[a4paper]{artie}\n\n"
    "\\title{}\n"
    "\\author{Bingwei Tian\\thanks{bwtian@gmail.com}}\n"
    "\\date{\\today}\n\n"
    "\\begin{document}\n\n"
    "\\maketitle\n"
    "\\begin{abstract}\n\n"
    "\\end{abstract}\n\n"
    "%\\tableofcontents\n\n"
    "<<setup,include=FALSE>>=\n"
    "opts_chunk$set(echo=FALSE,results='asis',fig.align='center',fig.width=8,out.width='.8\\\\paperwidth',fig.pos='!ht',warning=FALSE)
  knit_hooks$set(crop = hook_pdfcrop)\n"
    "@\n\n"
    "\\section{Introduction}\n\n"
    "\\bibliography{}\n\n"
    "\\end{document}\n\n"
   )
  (global-set-key [C-S-f3] 'rnw)

      (define-skeleton comment-skeleton
      "Input #+BEGIN_COMMENT #+END_COMMENT in org-mode"
      ""
      "#+BEGIN_COMMENT\n"
      _"\n"
      "#+END_COMMENT\n")
      (global-set-key [C-ccc] 'comment-skeleton)
;;;; R skeleton
      (define-skeleton R-skeleton
      "Input R babel in org-mode"
      ""
      "#+HEADER: :cache yes :tangle yes :noweb yes :colnames yes :var \n"
      "#+HEADER: :export both :results output graphics :width 400 :height 300\n"
      "#+NAME: R:"str" \n"
      "#+BEGIN_SRC R :session :file ./"str".png  \n"
      ;;"###############################################################################\n"
      ;;"## R code chunk:\n"
      ;;"###############################################################################\n"
      ;; "#+ Rmd chunk \n"
      ;; "#' R Spin comments \n"
      _"\n"
      _"\n"
      "#+END_SRC\n"

      "#+CAPTION: Table/figure name Out put of above code\n"
      "#+NAME: fig:"str"  \n"
      "#+RESULTS: R:"str"  \n"
      )
      (global-set-key [C-S-f4] 'R-skeleton)

      (define-skeleton comment1-skeleton
      "Input code blockers in org-mode"
      ""
      "# #####################################################################\n"
      "# #\n"
      "# #####################################################################\n")
      (global-set-key [C-S-f5] 'comment1-skeleton)

      (define-skeleton comment2-skeleton
      "Input code blockers in org-mode"
      ""
      "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n"
      "%% R code chunk: \n"
      "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n")
      (global-set-key [C-S-f6] 'comment2-skeleton)

      (define-skeleton comment3-skeleton
      "Input code blockers in org-mode"
      ""
      "# =====================================================================\n"
      "# \n"
      "# =====================================================================\n")
      (global-set-key [C-S-f7] 'comment3-skeleton)

      (define-skeleton markdown-skeleton
      "Input code blockers for markdown"
      ""
      "# \n"
      "========================================================\n")
      (global-set-key [C-S-f8] 'markdown-skeleton)

      (define-skeleton latexEnd-skeleton
      "Input end to latex sub file"
      ""
      _"\n"
    "%%% Local Variables: \n"
    "%%% mode: latex \n"
    "%%% mode: outline-minor \n"
    "%%% coding: utf-8 \n"
    "%%% TeX-master: \"../main\" \n"
    "%%% TeX-engine: xetex \n"
    "%%% TeX-PDF-mode: t \n"
    "%%% End: \n")
     (global-set-key [C-S-f9] 'latexEnd-skeleton)

      (define-skeleton fig-skeleton
      "Input NAME and CAPTION in org-mode"
      ""
      "#+CAPTION: \n"
      "#+NAME: fig:study-area  \n"
      "#+NAME: tab:basic-data  \n"
      "#+tblname: basic-data \n"
      "\\begin{table}[h!]\n"
      "\\centering\n"
      "  \\caption{}\n"
      "  \\label{tab:}\n"
      "<<>>=\n"
      "kable(,row.names=FALSE,booktabs=TRUE)\n"
      "@\n"
      "\\end{table}\n"
      )
      (global-set-key [C-S-f10] 'fig-skeleton)

;;; Tex-Equation
      (define-skeleton texEq-skeleton
      "Input texEq babel in tex-mode"
      ""
      "\begin{equation}\label{eq:"str"} \n"
      _"\n"
      "\end{equation} \n"
      "\myequations{\gls{"str"}}\n"
      )
      (global-set-key [C-S-f11] 'texFig-skeleton)
      (define-skeleton dot-skeleton
      "Input Emacs-lisp babel in org-mode"
      ""
      "#+NAME: dot:"str"\n"
      "#+HEADER: :cache yes :tangle yes :exports none\n"
      "#+HEADER: :results output graphics\n"
      "#+BEGIN_SRC dot :file ./"str".svg \n"
      ""
      "digraph { \n"
               "rankdir=LR; \n"
                
               "fontname=\"Times\"; \n"
               "fontsize = 12; \n"
               "splines = false; \n"
               "ranksep = 0.5; \n"
               "nodesep = 0.5; \n"
               "edge[constraint=false]; \n"
               "node [shape = box] \n"
               "//1. set node \n"
               _"\n"
               "//2. set path \n"
               _"\n"
               "A -> B \n" 
               "//3. set rank \n"
               "{rank = same; A, B} \n"
              "}\n"
      "" 
      "#+END_SRC\n"

      "#+CAPTION: Table/figure name Out put of above code\n"
      "#+NAME: fig:"str" \n"
      "#+RESULTS: dot:"str" \n"
      )
      (global-set-key [C-S-f12] 'dot-skeleton)
