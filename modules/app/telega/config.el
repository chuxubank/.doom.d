;;; app/telega/config.el -*- lexical-binding: t; -*-

(use-package! telega
  :commands (telega)
  :config
  (add-hook 'telega-load-hook 'telega-mode-line-mode))
