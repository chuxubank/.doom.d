;;; ui/beautify/config.el -*- lexical-binding: t; -*-

(use-package! nyan-mode
  :when (modulep! +nyan)
  :custom
  (nyan-animate-nyancat t)
  (nyan-wavy-trail t)
  :hook
  (doom-modeline-mode . nyan-mode))

(use-package! pangu-spacing
  :hook (text-mode . pangu-spacing-mode)
  :config
  ;; Always insert `real' space in org-mode.
  (setq-hook! 'org-mode-hook pangu-spacing-real-insert-separtor t))

(use-package! valign
  :config
  (when (modulep! :app rss)
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
