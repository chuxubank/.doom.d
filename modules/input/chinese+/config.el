;;; input/chinese+/config.el -*- lexical-binding: t; -*-

(use-package! rime
  :custom
  (default-input-method "rime")
  (rime-librime-root (expand-file-name "librime/dist" doom-local-dir))
  (rime-user-data-dir (expand-file-name "rime" doom-local-dir))
  (rime-show-candidate 'posframe)
  (rime-posframe-style 'vertical)
  (rime-cursor "˰")
  (rime-disable-predicates '(rime-predicate-evil-mode-p
                             rime-predicate-after-ascii-char-p
                             rime-predicate-prog-in-code-p
                             rime-predicate-org-latex-mode-p)))

(use-package! pangu-spacing
  :hook (text-mode . pangu-spacing-mode)
  :config
  ;; Always insert `real' space in org-mode.
  (setq-hook! 'org-mode-hook pangu-spacing-real-insert-separtor t))

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

(map! :map rime-mode-map
      "C-`" 'rime-send-keybinding
      "s-i" 'rime-force-enable)
