;;; +font.el -*- lexical-binding: t; -*-

(when IS-WINDOWS
  (setq doom-font (font-spec :family "Fira Code")))

(when IS-LINUX
  (setq doom-font (font-spec :family "Fira Code")
        doom-unicode-font (font-spec :family "Noto Sans CJK SC")))

(when IS-MAC
  (setq doom-font (font-spec :family "Fira Code" :size 16)
        doom-unicode-font (font-spec :family "PingFang SC")))
