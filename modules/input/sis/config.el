;;; input/sis/config.el -*- lexical-binding: t; -*-

(use-package! sis
  :config
  (when IS-MAC
    (sis-ism-lazyman-config
     "com.apple.keylayout.ABC"
     "com.apple.inputmethod.SCIM.ITABC"))
  (setq sis-default-cursor-color "white")
  (sis-global-cursor-color-mode t)
  (sis-global-context-mode t)
  (sis-global-inline-mode t)
  (when (featurep! :editor meow)
    (add-hook! '(meow-normal-mode-hook
                 meow-keypad-mode-hook
                 meow-motion-mode-hook)
               #'sis-set-english)))
