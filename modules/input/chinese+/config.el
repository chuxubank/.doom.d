;;; input/liberime/config.el -*- lexical-binding: t; -*-

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
(add-hook! 'after-liberime-load-hook
  (liberime-select-schema "luna_pinyin_simp")
  (setq pyim-default-scheme 'rime-quanpin))

(map!
 "s-i" #'pyim-convert-string-at-point
 "s-l" #'liberime-load)
