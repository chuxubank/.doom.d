;;; app/telega/config.el -*- lexical-binding: t; -*-

(use-package! telega
  :commands (telega)
  :bind (:map doom-leader-map
         ("a t" . #'telega))
  :config
  (add-hook 'telega-load-hook 'telega-mode-line-mode))
