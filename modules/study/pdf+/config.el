;;; study/pdf+/config.el -*- lexical-binding: t; -*-

(use-package! org-noter-pdftools
  :when (featurep! +noter)
  :after org-noter
  :config
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))
