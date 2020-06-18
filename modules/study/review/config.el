;;; study/review/config.el -*- lexical-binding: t; -*-

;;;###package org-drill
(setq org-drill-scope 'file-no-restriction)

(use-package! org-fc
  :after hydra
  :custom
  (org-fc-directories '("~/org"))
  :config
  (require 'org-fc-hydra))

;;;###package org-roam
(setq! org-roam-db-location (expand-file-name "org-roam.db" doom-cache-dir))

(use-package! org-roam-server
  :after org-roam
  :hook
  (org-roam-mode . org-roam-server-mode))

(use-package! bing-dict
  :after org
  :config
  (setq bing-dict-vocabulary-save t
        bing-dict-vocabulary-file (expand-file-name "vocabulary.org" org-directory)))
