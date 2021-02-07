;;; study/review/config.el -*- lexical-binding: t; -*-

(use-package! org-drill
  :commands #'org-drill)

(use-package! org-fc
  :when (featurep! +fc)
  :commands #'org-fc-dashboard
  :config
  (require 'org-fc-hydra))

(use-package! org-media-note
  :when (featurep! +media-note)
  :hook (org-mode . org-media-note-mode))

(use-package! anki-editor
  :when (featurep! +anki)
  :commands #'anki-editor-insert-note
  :custom
  (anki-editor-latex-style 'mathjax))

(use-package! org-roam-server
  :when (featurep! +roam-server)
  :after org-roam
  :config
  (defun org-roam-server-open()
    "Open org-roam server in browser."
    (interactive)
    (smartparens-global-mode -1)
    (org-roam-server-mode 1)
    (smartparens-global-mode 1)
    (browse-url-default-browser (format "http://localhost:%d" org-roam-server-port))))
