;;; app/telega/config.el -*- lexical-binding: t; -*-

(after! telega
  (when (featurep! :editor evil)
    (set-evil-initial-state!
      '(telega-root-mode
        telega-chat-mode)
      'emacs))
  (setq telega-symbol-folder "📁"))

(when (featurep! +modeline)
  (setq telega-mode-line-string-format
        '("   "
          (:eval (telega-mode-line-online-status))
          (:eval (when telega-use-tracking-for
                   (telega-mode-line-tracking)))
          (:eval (telega-mode-line-unread-unmuted))
          (:eval (telega-mode-line-mentions 'messages))))
  (add-hook 'telega-load-hook 'telega-mode-line-mode))

(when (featurep! +url-shorten)
  (add-hook 'telega-load-hook 'global-telega-url-shorten-mode))

(when (featurep! +alert)
  (add-hook 'telega-load-hook 'telega-alert-mode))

(when (featurep! +mnz)
  (add-hook 'telega-load-hook 'global-telega-mnz-mode))

(use-package! language-detection
  :when (featurep! +mnz)
  ;; NOTE the `language-detection-string' function is already autoloaded,
  ;; so we can safely defer it.
  :defer t)
