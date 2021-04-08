;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(setq org-superstar-headline-bullets-list '("#")
      ;; make sure you have installed the ttf version unifont
      org-superstar-prettify-item-bullets t
      org-pretty-entities t
      org-startup-with-inline-images t
      org-image-actual-width '(500)
      org-log-done 'time
      org-export-with-toc nil
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t

      org-mobile-directory "~/org-mobile"
      org-taskjuggler-reports-directory ".reports"
      org-publish-project-alist '(("Study"
                                   :base-directory "~/Developer/Study"
                                   :publishing-directory "~/PDFs/Study"
                                   :publishing-function org-latex-publish-to-pdf
                                   :recursive t)))

(after! org
  (setq +org-capture-todo-file "inbox.org")
  (pushnew! org-modules 'org-habit)
  (pushnew! org-link-abbrev-alist
            '("wiki-zh" . "https://zh.wikipedia.org/wiki/%s")
            '("wiki"    . "https://en.wikipedia.org/wiki/%s")))

;;;###package org-roam
(setq org-roam-directory "~/org-roam"
      org-roam-link-auto-replace nil
      +org-roam-open-buffer-on-find-file nil)

;;;###package org-noter
(setq org-noter-default-notes-file-names nil)

;;
;;; latex
(setq org-latex-compiler "xelatex"
      org-latex-image-default-width ".6\\linewidth")
(setq! org-latex-packages-alist
       '(("" "ctex" t ("xelatex"))
         ("" "booktabs" nil)
         ("" "enumitem" nil)
         ("" "fontspec" nil)
         ("" "pgfplots" t)
         ("left=2.5cm, right=2.5cm, top=2cm, bottom=2cm" "geometry" nil)))

;;;###package smartparens
(after! smartparens
  (sp-with-modes '(org-mode)
    (sp-local-pair "$" "$")
    (sp-local-pair "\\[" "\\]")))

;;
;;; preview
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
