;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Misaka"
      user-mail-address "chuxubank@qq.com"

      doom-scratch-initial-major-mode 'lisp-interaction-mode
      doom-theme 'doom-dracula
      display-line-numbers-type 'relative
      display-time-day-and-date t)

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
  (pushnew! doom-unicode-extra-fonts "Apple Color Emoji")
  (mac-auto-operator-composition-mode 1))

(defadvice! +display-time-on-fullscreen-a (&rest _)
  :after #'toggle-frame-fullscreen
  (if (equal 'fullboth (frame-parameter nil 'fullscreen))
      (display-time-mode 1)
    (display-time-mode -1)))

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
(add-hook! 'elfeed-search-mode-hook 'elfeed-update)
(defadvice elfeed (after configure-elfeed-feeds activate)
  "Make elfeed-org autotags rules works with elfeed-protocol."
  (setq elfeed-protocol-tags elfeed-feeds
        elfeed-feeds (list
                      (list "fever+https://chuxubank@chuxubank-miniflux.herokuapp.com"
                            :api-url "http://chuxubank-miniflux.herokuapp.com/fever/"
                            :password '(password-store-get "miniflux/fever/chuxubank")))))

(load! "+org")
(load! "+latex")
(load! "+map")
(load! "+wsl")
