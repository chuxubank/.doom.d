;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

;;;###package org
(setq org-bullets-bullet-list '("■" "◆" "▲" "▶")
      org-preview-latex-default-process 'dvisvgm
      org-publish-project-alist '(("UNGEE"
                                   :base-directory "~/Developer/UNGEE"
                                   :publishing-directory "~/Documents/UNGEE"
                                   :publishing-function org-latex-publish-to-pdf
                                   :recursive t))
      org-startup-with-inline-images t
      org-image-actual-width '(500)
      )
(after! org
  (setq org-src-preserve-indentation nil) ; make org src block content indent relate to #+bagin_src block
  (setq org-highlight-latex-and-related '(latex script entities)) ; Fontify latex blocks with no color and pretty fonts to prevent org table align mess
  )

;;;###package org-drill
(setq org-drill-scope 'file-no-restriction)

;; org title
(custom-set-faces
 `(org-level-1 ((t (:inherit outline-1 :height 1.2))))
 `(org-level-2 ((t (:inherit outline-2 :height 1.1)))))

;; org export
(setq org-export-with-toc nil
      org-latex-image-default-width ".6\\linewidth"
      )
(setq! org-latex-default-packages-alist
       '(("AUTO"            "inputenc"  t ("pdflatex"))
         ("T1"              "fontenc"   t ("pdflatex"))
         (""                "graphicx"  t)
         (""                "grffile"   t)
         (""                "longtable" nil)
         (""                "wrapfig"   nil)
         (""                "rotating"  nil)
         ("normalem"        "ulem"      t)
         (""                "amsmath"   t)
         (""                "textcomp"  t)
         (""                "amssymb"   t)
         (""                "capt-of"   nil)
         ("colorlinks=true" "hyperref"  nil)
         (""                "booktabs"  nil)
         (""                "enumitem"  nil)
         (""                "fontspec"  nil))
       org-preview-latex-process-alist
       '((dvipng :programs
                 ("latex" "dvipng")
                 :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
                 (1.0 . 1.0)
                 :latex-compiler
                 ("latex -interaction nonstopmode -output-directory %o %f")
                 :image-converter
                 ("dvipng -D %D -T tight -o %O %f"))
         (dvisvgm :programs
                  ("xelatex" "dvisvgm")
                  :description "xdv > svg" :message "you need to install the programs: xelatex and dvisvgm." :use-xcolor t :image-input-type "xdv" :image-output-type "svg" :image-size-adjust
                  (1.7 . 1.5)
                  :latex-compiler
                  ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
                  :image-converter
                  ("dvisvgm %f -n -b min -c %S -o %O"))
         (imagemagick :programs
                      ("latex" "convert")
                      :description "pdf > png" :message "you need to install the programs: xelatex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
                      (1.0 . 1.0)
                      :latex-compiler
                      ("xelatex -interaction nonstopmode -output-directory %o %f")
                      :image-converter
                      ("convert -density %D -trim -antialias %f -quality 100 %O"))))
