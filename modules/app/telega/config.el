;;; app/telega/config.el -*- lexical-binding: t; -*-

(use-package! telega
  :defer t
  :config
  (add-hook! 'telega-load-hook
             'telega-mode-line-mode
             'global-telega-url-shorten-mode
             'global-telega-mnz-mode)
  (when (featurep! :editor evil)
    (set-evil-initial-state!
      '(telega-root-mode
        telega-chat-mode
        telega-edit-file-mode
        telega-image-mode
        telega-webpage-mode)
      'emacs)))
