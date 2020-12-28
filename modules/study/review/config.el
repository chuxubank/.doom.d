;;; study/review/config.el -*- lexical-binding: t; -*-

(use-package! org-drill
  :commands #'org-drill
  :custom
  (org-drill-scope 'agenda))

(use-package! org-fc
  :after (org hydra)
  :config
  (require 'org-fc-hydra))

(use-package! anki-editor
  :when (featurep! +anki)
  :after org
  :custom
  (anki-editor-latex-style 'mathjax))

(use-package! org-roam-server
   :after org-roam
   :config
   (defun org-roam-server-open()
     "Open org-roam server in browser."
     (interactive)
     (browse-url-default-browser (format "http://localhost:%d" org-roam-server-port)))
   (org-roam-server-mode 1))
