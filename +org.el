;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(setq org-superstar-headline-bullets-list '("#")
      org-startup-with-inline-images t
      org-image-actual-width '(500)
      org-log-done 'time
      org-export-with-toc nil
      org-publish-project-alist
      '(("UNGEE"
         :base-directory "~/Developer/UNGEE"
         :publishing-directory "~/Documents/UNGEE"
         :publishing-function org-latex-publish-to-pdf
         :recursive t)))

(after! org
  (setq +org-capture-todo-file "inbox.org"
        org-agenda-files (directory-files-recursively org-directory (rx ".org" eos)))
  (pushnew! org-modules 'org-habit)
  (pushnew! org-link-abbrev-alist
            '("wiki-zh" . "https://zh.wikipedia.org/wiki/%s")
            '("wiki"    . "https://en.wikipedia.org/wiki/%s")))

;; org noter
(setq org-noter-default-notes-file-names nil)

;; org title
(custom-set-faces
 `(org-level-1 ((t (:inherit outline-1 :height 1.2))))
 `(org-level-2 ((t (:inherit outline-2 :height 1.1)))))

;; org latex
(setq org-latex-compiler "xelatex"
      org-latex-image-default-width ".6\\linewidth")
(setq! org-latex-packages-alist
       '(("" "ctex" t ("xelatex"))
         ("" "booktabs" nil)
         ("" "enumitem" nil)
         ("" "fontspec" nil)
         ("" "pgfplots" t)
         ("left=2.5cm, right=2.5cm, top=2cm, bottom=2cm" "geometry" nil)))

;; org preview
(setq org-preview-latex-default-process 'dvisvgm
      org-preview-latex-process-alist
      '((dvisvgm :programs ("xelatex" "dvisvgm")
                 :description "xdv > svg"
                 :message "you need to install the programs: xelatex and dvisvgm."
                 :image-input-type "xdv"
                 :image-output-type "svg"
                 :image-size-adjust (1.7 . 1.5)
                 :latex-compiler ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
                 :image-converter ("dvisvgm %f -n -b min -c %S -o %O"))
        (imagemagick :programs("xelatex" "convert")
                     :description "pdf > png"
                     :message "you need to install the programs: xelatex and imagemagick."
                     :image-input-type "pdf"
                     :image-output-type "png"
                     :image-size-adjust (1.0 . 1.0)
                     :latex-compiler ("xelatex -interaction nonstopmode -output-directory %o %f")
                     :image-converter ("convert -density %D -trim -antialias %f -quality 100 %O"))))
