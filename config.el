;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Misaka"
      user-mail-address "chuxubank@qq.com"

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

(if IS-WINDOWS
    (setq doom-font (font-spec :family "Fira Code")
          doom-unicode-font (font-spec :family "DengXian"))
  (setq doom-font (font-spec :family "Fira Code" :size 16)))

;; maximized at startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))


;;
;;; Keybinds

(map! :leader
      "h d U" #'doom/upgrade)

(map! :after evil-org
      :map evil-org-mode-map
      :i "C-l" nil
      :i "C-h" nil
      :i "C-k" nil
      :i "C-j" nil)


;;
;;; Modules

;;;###package projectile
(setq projectile-project-search-path '("~/Developer"))

;;;###package magit
(setq magit-repository-directories '(("~/Developer" . 3))
      magit-clone-url-format "https://%h/%n.git")

;;;###package evil
(setq! evil-disable-insert-state-bindings t)
(set-evil-initial-state!
  '(osx-dictionary-mode
    pdf-annot-list-mode)
  'emacs)

;;;###package format-all
(appendq! +format-on-save-enabled-modes '(nxml-mode html-mode))


(load! "+org")
(load! "+latex")
