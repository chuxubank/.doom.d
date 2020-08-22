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
  :after org
  :custom
  (anki-editor-latex-style 'mathjax))

(use-package! anki-vocabulary
  :defer t
  :bind (:map doom-leader-map
         ("d" . #'anki-vocabulary))
  :custom
  (anki-vocabulary-deck-name "Inbox")
  (anki-vocabulary-model-name "AutoCopy")
  (anki-vocabulary-field-alist '(("Front" . "${expression:单词}")
                                 ("Back" . "${sentence_bold:标粗的原文例句}")))
  )

;;;###package org-roam
(setq! org-roam-db-location (expand-file-name "org-roam.db" doom-cache-dir))

(use-package! bing-dict
  :after org
  :config
  (setq bing-dict-vocabulary-save t
        bing-dict-show-thesaurus 'both
        bing-dict-vocabulary-file (expand-file-name "vocabulary.org" org-directory))
  :bind ("C-c d" . #'bing-dict-brief))
