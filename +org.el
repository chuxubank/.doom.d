;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

;;;###package org
(setq org-bullets-bullet-list '("■" "◆" "▲" "▶")
      org-publish-project-alist '(("UNGEE"
                                   :base-directory "~/Developer/UNGEE"
                                   :publishing-directory "~/Documents/UNGEE"
                                   :publishing-function org-latex-publish-to-pdf
                                   :recursive t))
      org-startup-with-inline-images t
      org-image-actual-width '(500))
(after! org
  ;; make org src block content indent relate to #+bagin_src block
  (setq org-src-preserve-indentation nil)
  ;; Fontify latex blocks with no color and pretty fonts to prevent org table align mess
  (setq org-highlight-latex-and-related '(latex script entities))
  ;; org link
  (pushnew! org-link-abbrev-alist
            '("wiki-zh" . "https://zh.wikipedia.org/wiki/%s")
            '("wiki"    . "https://en.wikipedia.org/wiki/%s"))
  )

;; org todo
(setq org-log-done 'time)

;; org title
(custom-set-faces
 `(org-level-1 ((t (:inherit outline-1 :height 1.2))))
 `(org-level-2 ((t (:inherit outline-2 :height 1.1)))))

;; org export
(setq org-export-with-toc nil
      org-latex-image-default-width ".6\\linewidth")
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
         (""                "fontspec"  nil)
         ("left=2.5cm, right=2.5cm, top=2cm, bottom=2cm" "geometry" nil)))
