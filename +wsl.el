;;; +wsl.el -*- lexical-binding: t; -*-

(defconst IS-WSL1 (string-match "-Microsoft" operating-system-release))
(defconst IS-WSL2 (string-match "-microsoft" operating-system-release))
(defconst IS-WSL (or IS-WSL1 IS-WSL2))

;; https://vxlabs.com/2020/03/07/patch-emacs-org-open-file-using-advice/
;; fix org-open-file for wsl by temporarily replacing start-process-shell-command with call-process-shell-command
;; if we don't do this, emacs on WSL will block forever trying to open exported file with windows handler
(defun wsl-fix-org-open-file (orig-org-open-file &rest args)
  ;; temporarily replace function,
  ;; see https://endlessparentheses.com/understanding-letf-and-how-it-replaces-flet.html
  (cl-letf (((symbol-function 'start-process-shell-command) #'call-process-shell-command))
    (apply orig-org-open-file args)))

(when IS-WSL
  (advice-add #'org-open-file :around #'wsl-fix-org-open-file))
