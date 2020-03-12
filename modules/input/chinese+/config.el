;;; input/chinese+/config.el -*- lexical-binding: t; -*-

;;;###package pyim
(setq-default pyim-punctuation-translate-p '(no yes auto)
              pyim-english-input-switch-functions
              '(pyim-probe-program-mode
                pyim-probe-auto-english
                pyim-probe-org-latex-mode))
(after! pyim
  (setq pyim-page-tooltip 'posframe))

;;;###package pangu-spacing
(global-pangu-spacing-mode t)
(setq pangu-spacing-real-insert-separtor t)

;;;###package liberime
(setq liberime-user-data-dir (expand-file-name "rime/" doom-local-dir))
(add-hook! 'liberime-after-start-hook
  (liberime-select-schema "luna_pinyin_simp")
  (setq pyim-default-scheme 'rime-quanpin))

;;;###package org
(setq org-latex-compiler "xelatex"
      org-preview-latex-default-process 'xdvsvg)
(after! org
  (add-to-list 'org-latex-packages-alist '("" "ctex" t ("xelatex")))
  (add-to-list 'org-preview-latex-process-alist '(xdvsvg :programs ("xelatex" "dvisvgm")
                                                         :description "xdv > svg"
                                                         :message "you need to install the programs: xelatex and dvisvgm."
                                                         :use-xcolor t
                                                         :image-input-type "xdv"
                                                         :image-output-type "svg"
                                                         :image-size-adjust (1.7 . 1.5)
                                                         :latex-compiler ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
                                                         :image-converter ("dvisvgm %f -n -b min -c %S -o %O"))))


(map!
 "s-i" #'pyim-convert-string-at-point
 "s-l" #'liberime-load)
