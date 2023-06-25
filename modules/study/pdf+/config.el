;;; study/pdf+/config.el -*- lexical-binding: t; -*-

(use-package! org-noter-pdftools
  :when (modulep! +noter)
  :after (org-noter pdf-annot)
  :config
  (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note))

(use-package! pdf-continuous-scroll-mode
  :when (modulep! +scroll)
  :hook pdf-view-mode)
