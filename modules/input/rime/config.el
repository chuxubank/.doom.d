;;; input/rime/config.el -*- lexical-binding: t; -*-

(use-package! rime
  :commands #'toggle-input-method
  :init
  (setq rime-user-data-dir "~/rime"
        rime-translate-keybindings
        '("<C-delete>" "C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))
  (when IS-MAC
    (setq rime-librime-root "~/librime/dist"))
  :custom
  (default-input-method "rime")
  (rime-inline-predicates '(rime-predicate-space-after-cc-p
                            rime-predicate-current-uppercase-letter-p))
  :config
  (when (featurep! +posframe)
    (setq rime-show-candidate 'posframe
          rime-cursor "˰"
          rime-posframe-style 'vertical))
  (when (featurep! :editor meow)
    (setq rime-disable-predicates '(meow-normal-mode-p
                                    meow-motion-mode-p
                                    meow-keypad-mode-p)))
  (when (featurep! :editor evil)
    (setq rime-disable-predicates 'rime-predicate-evil-mode-p))

  (appendq! rime-disable-predicates '(rime-predicate-hydra-p
                                      rime-predicate-ace-window-p
                                      rime-predicate-prog-in-code-p
                                      rime-predicate-org-latex-mode-p
                                      rime-predicate-org-in-src-block-p
                                      rime-predicate-after-ascii-char-p
                                      rime-predicate-tex-math-or-command-p
                                      rime-predicate-punctuation-line-begin-p
                                      rime-predicate-punctuation-after-space-cc-p))

  (map! (:map rime-mode-map
         "C-`" #'rime-send-keybinding
         "M-i" #'rime-force-enable)
        (:map rime-active-mode-map
         "<tab>" #'rime-inline-ascii)))
