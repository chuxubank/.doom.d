;;; ~/.doom.d/autoload/org-drill.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +org/drill ()
  "Load and start org drill session"
  (interactive)
  (require 'org-drill)
  (org-drill))
