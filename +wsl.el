;;; +wsl.el -*- lexical-binding: t; -*-

(defconst IS-WSL1 (string-match "-Microsoft" operating-system-release))
(defconst IS-WSL2 (string-match "-microsoft" operating-system-release))
(defconst IS-WSL (or IS-WSL1 IS-WSL2))

(defun wsl-open (file)
  (shell-command (format "%s '%s'" "wsl-open" file)))

(when IS-WSL
  (after! org
    (add-to-list 'org-file-apps '("\\.x?html?\\'" . (lambda (file link) (wsl-open file))))))
