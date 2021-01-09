;;; input/chinese+/config.el -*- lexical-binding: t; -*-

(use-package! rime
  :custom
  (default-input-method "rime")
  (rime-user-data-dir (expand-file-name "rime" doom-local-dir))
  (rime-show-candidate 'posframe)
  (rime-posframe-style 'vertical)
  (rime-cursor "˰")
  (rime-disable-predicates '(rime-predicate-hydra-p
                             rime-predicate-evil-mode-p
                             rime-predicate-ace-window-p
                             rime-predicate-prog-in-code-p
                             rime-predicate-space-after-cc-p
                             rime-predicate-org-latex-mode-p
                             rime-predicate-org-in-src-block-p
                             rime-predicate-after-ascii-char-p
                             rime-predicate-tex-math-or-command-p
                             rime-predicate-punctuation-line-begin-p
                             rime-predicate-punctuation-after-ascii-p
                             rime-predicate-current-uppercase-letter-p
                             rime-predicate-punctuation-after-space-cc-p)))

(when IS-MAC
  (setq rime-user-data-dir "~/Library/Rime/"
        rime-librime-root (expand-file-name "dist" rime-user-data-dir)))

(when IS-LINUX
  (setq rime-user-data-dir "~/.config/ibus/rime/"))

(use-package! pangu-spacing
  :hook (text-mode . pangu-spacing-mode)
  :config
  ;; Always insert `real' space in org-mode.
  (setq-hook! 'org-mode-hook pangu-spacing-real-insert-separtor t))

(use-package! valign
  :when (featurep! +valign)
  :config
  (when (featurep! :app rss)
    (defun elfeed-search-print-valigned-entry (entry)
      "Print valign-ed ENTRY to the buffer."
      (let* ((date (elfeed-search-format-date (elfeed-entry-date entry)))
             (date-width (car (cdr elfeed-search-date-format)))
             (title (or (elfeed-meta entry :title) (elfeed-entry-title entry) ""))
             (title-faces (elfeed-search--faces (elfeed-entry-tags entry)))
             (feed (elfeed-entry-feed entry))
             (feed-title
              (when feed
                (or (elfeed-meta feed :title) (elfeed-feed-title feed))))
             (tags (mapcar #'symbol-name (elfeed-entry-tags entry)))
             (tags-str (mapconcat
                        (lambda (s) (propertize s 'face 'elfeed-search-tag-face))
                        tags ","))
             (title-width (- (window-width) 10 elfeed-search-trailing-width))
             (title-column (elfeed-format-column
                            title (elfeed-clamp
                                   elfeed-search-title-min-width
                                   title-width
                                   elfeed-search-title-max-width)
                            :left))
             (align-to (* (+ date-width 2 (min title-width elfeed-search-title-max-width))
                          (default-font-width))))
        (insert (propertize date 'face 'elfeed-search-date-face) " ")
        (insert (propertize title-column 'face title-faces 'kbd-help title) " ")
        (valign--put-overlay (1- (point)) (point) 'display (valign--space align-to))
        (when feed-title
          (insert (propertize feed-title 'face 'elfeed-search-feed-face) " "))
        (when tags
          (insert "(" tags-str ")"))))

    (setq elfeed-search-print-entry-function #'elfeed-search-print-valigned-entry)))
