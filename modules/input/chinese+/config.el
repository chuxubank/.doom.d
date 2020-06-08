;;; input/chinese+/config.el -*- lexical-binding: t; -*-

(use-package! rime
  :custom
  (default-input-method "rime")
  (rime-user-data-dir (expand-file-name "rime" doom-local-dir))
  (rime-show-candidate 'posframe)
  (rime-posframe-style 'vertical)
  (rime-cursor "˰")
  (rime-disable-predicates '(rime-predicate-evil-mode-p
                             rime-predicate-prog-in-code-p
                             rime-predicate-org-latex-mode-p
                             rime-predicate-org-in-src-block-p
                             rime-predicate-after-ascii-char-p
                             rime-predicate-tex-math-or-command-p
                             rime-predicate-punctuation-line-begin-p
                             rime-predicate-punctuation-after-space-cc-p)))
(when IS-MAC
  (setq! rime-librime-root (expand-file-name "librime/dist" doom-local-dir)))

(use-package! pangu-spacing
  :hook (text-mode . pangu-spacing-mode)
  :config
  ;; Always insert `real' space in org-mode.
  (setq-hook! 'org-mode-hook pangu-spacing-real-insert-separtor t))

(map! :map rime-mode-map
      "C-`" 'rime-send-keybinding
      "s-i" 'rime-force-enable)
