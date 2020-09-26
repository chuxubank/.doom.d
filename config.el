;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Misaka"
      user-mail-address "chuxubank@qq.com"

      doom-scratch-initial-major-mode 'lisp-interaction-mode
      doom-theme 'doom-dracula
      display-line-numbers-type 'relative)

(use-package! nyan-mode
  :custom
  (nyan-animate-nyancat t)
  (nyan-wavy-trail t)
  :hook
  (doom-modeline-mode . nyan-mode))


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

;; maximized at startup
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

;;;###package pdf-tools
(setq pdf-view-use-unicode-ligther nil)

(load! "+org")
(load! "+latex")
(load! "+wsl")
(load! "+map")
