;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Misaka"
      user-mail-address "chuxubank"

      doom-scratch-initial-major-mode 'lisp-interaction-mode
      doom-theme 'doom-dracula
      display-line-numbers-type 'relative
      display-time-day-and-date t)

;;
;;; UI

(defadvice! +display-time-on-fullscreen-a (&rest _)
  :after #'toggle-frame-fullscreen
  (if (equal 'fullboth (frame-parameter nil 'fullscreen))
      (display-time-mode 1)
    (display-time-mode -1)))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;;
;;; Modules

;;;###package projectile
(setq projectile-project-search-path '("~/Developer"))

;;;###package magit
(setq magit-repository-directories '(("~/Developer" . 3))
      magit-clone-url-format "https://%h/%n.git")

;;;###package format-all
(appendq! +format-on-save-enabled-modes '(nxml-mode html-mode))

;;;###package elfeed
(after! elfeed
  (setq elfeed-search-filter "@2-week-ago -nsfw -buy "))
(add-hook! 'elfeed-search-mode-hook 'elfeed-update)

(load! "+org")
(load! "+latex")
(load! "+map")
(load! "+wsl")
(load! "+font")
