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
(add-hook! 'after-liberime-load-hook
  (liberime-select-schema "luna_pinyin_simp")
  (setq pyim-default-scheme 'rime-quanpin))

;;;###package org
(setq org-latex-compiler "xelatex")
(after! org
  (add-to-list 'org-latex-packages-alist
               '("" "ctex" t ("xelatex"))))

(map!
 "s-i" #'pyim-convert-string-at-point
 "s-l" #'liberime-load)
