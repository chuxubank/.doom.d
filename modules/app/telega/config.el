;;; app/telega/config.el -*- lexical-binding: t; -*-

(use-package! telega
  :commands (telega)
  :config
  (add-hook 'telega-load-hook 'telega-mode-line-mode)
  (set-evil-initial-state!
    '(telega-root-mode
      telega-chat-mode
      telega-image-mode)
    'emacs))
