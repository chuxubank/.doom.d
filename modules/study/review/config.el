;;; study/review/config.el -*- lexical-binding: t; -*-

(use-package! org-drill
  :commands #'org-drill)

(use-package! org-fc
  :when (modulep! +fc)
  :commands #'org-fc-dashboard
  :config
  (require 'org-fc-hydra))

(use-package! org-media-note
  :when (modulep! +media-note)
  :hook (org-mode . org-media-note-mode))

(use-package! anki-editor
  :when (modulep! +anki)
  :commands #'anki-editor-insert-note
  :custom
  (anki-editor-latex-style 'mathjax))

(use-package! org-roam-server
  :when (modulep! +roam-server)
  :commands #'org-roam-server-open
  :init
  (defun org-roam-server-open()
    "Open org-roam server in browser."
    (interactive)
    (smartparens-global-mode -1)
    (org-roam-server-mode 1)
    (smartparens-global-mode 1)
    (browse-url-default-browser (format "http://localhost:%d" org-roam-server-port))))
