;;; app/telega/config.el -*- lexical-binding: t; -*-

(use-package! telega
  :defer t
  :config
  (when (featurep! :editor evil)
    (set-evil-initial-state!
      '(telega-root-mode
        telega-chat-mode
        telega-edit-file-mode
        telega-image-mode
        telega-webpage-mode)
      'emacs))
  (when IS-MAC
    (setq telega-symbol-folder "📁")))

(use-package! telega-url-shorten
  :when (featurep! +url-shorten)
  :after telega
  :config
  (global-telega-url-shorten-mode))

(use-package! telega-alert
  :when (featurep! +alert)
  :after telega
  :config
  (alert-add-rule :category "telega"
                  :mode 'telega-chat-mode))

(use-package! telega-mnz
  :when (featurep! +mnz)
  :commands #'telega-mnz-attach-region-as-code
  :after telega
  :init
  (define-key telega-prefix-map (kbd "'") #'telega-mnz-attach-region-as-code)
  :config
  (global-telega-mnz-mode))

(use-package! language-detection
  :when (featurep! +mnz)
  :after telega-mnz)
