;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Misaka"
      user-mail-address "chuxubank@qq.com"

      doom-scratch-initial-major-mode 'lisp-interaction-mode
      doom-theme 'doom-dracula
      display-line-numbers-type 'relative)

;;
;;; UI

(when IS-WINDOWS
  (setq doom-font (font-spec :family "Fira Code")
        doom-unicode-font (font-spec :family "DengXian")))

(when IS-LINUX
  (setq doom-font (font-spec :family "Fira Code")
        doom-unicode-font (font-spec :family "Noto Sans CJK SC"))
  (pushnew! doom-unicode-extra-fonts "Noto Color Emoji"))

(when IS-MAC
  (setq doom-font (font-spec :family "Fira Code" :size 16)
        doom-unicode-font (font-spec :family "PingFang SC"))
  (pushnew! doom-unicode-extra-fonts "Apple Color Emoji"))


;;
;;; Modules

;;;###package projectile
(setq projectile-project-search-path '("~/Developer"))

;;;###package magit
(setq magit-repository-directories '(("~/Developer" . 3))
      magit-clone-url-format "https://%h/%n.git")

;;;###package format-all
(appendq! +format-on-save-enabled-modes '(nxml-mode html-mode))

;;;###package pdf-tools
(setq pdf-view-use-unicode-ligther nil)

;;;###package org-roam
(setq org-roam-directory "~/roam"
      org-roam-link-auto-replace nil)
(after! org-roam
  (setq org-roam-db-location (expand-file-name "org-roam.db" doom-cache-dir)))

(load! "+org")
(load! "+latex")
(load! "+map")
