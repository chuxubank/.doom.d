;;; +wsl.el -*- lexical-binding: t; -*-

(defconst IS-WSL1 (string-match "-Microsoft" operating-system-release))
(defconst IS-WSL2 (string-match "-microsoft" operating-system-release))
(defconst IS-WSL (or IS-WSL1 IS-WSL2))

(when IS-WSL
  (defun wsl-browse-url-chrome (url &optional _new-window)
    (shell-command (concat "chrome.exe " url)))
  (setq browse-url-browser-function 'wsl-browse-url-chrome))
