;;; app/telega/config.el -*- lexical-binding: t; -*-

(use-package! telega
  :commands telega
  :config
  (setq telega-symbol-folder "📁")
  (when (featurep! :editor evil +everywhere)
    (map! (:map telega-msg-button-map
           "k" nil
           "l" nil
           :n "yl" #'telega-msg-copy-link
           :n "C-j" #'telega-button-forward
           :n "C-k" #'telega-button-backward
           :n "q" #'telega)
          (:map telega-chat-mode-map
           :n "C-j" #'telega-button-forward
           :n "C-k" #'telega-button-backward
           :n "q" #'telega)
          (:map telega-root-mode-map
           :n "q" #'bury-buffer))))

(when (featurep! +modeline)
  (setq telega-symbol-online-status (propertize "✈" 'face 'success)
        telega-mode-line-string-format
        '((:eval (telega-mode-line-online-status))
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
