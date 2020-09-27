;;; +map.el -*- lexical-binding: t; -*-

;;;###package evil
(setq! evil-disable-insert-state-bindings t)
(set-evil-initial-state!
  '(osx-dictionary-mode
    pdf-annot-list-mode)
  'emacs)

(map! :i "C-SPC" nil
      (:after ivy :map ivy-minibuffer-map
       "C-SPC" nil)
      (:after counsel :map counsel-ag-map
       "C-SPC" nil)
      (:after evil-org :map evil-org-mode-map
       :i "C-l" nil
       :i "C-h" nil
       :i "C-k" nil
       :i "C-j" nil))

(map! (:leader
       :prefix-map ("a" . "app")
       (:when (featurep! :app eaf)
        :desc "EAF"             "e" #'eaf)
       (:when (featurep! :app telega)
        :desc "Telega"          "t" #'telega)
       (:when (featurep! :app leetcode)
        :desc "LeetCode"        "l" #'leetcode))

      (:map help-map
       "dU" #'doom/upgrade)

      (:when (featurep! :input chinese+)
       (:map rime-mode-map
        "C-`" #'rime-send-keybinding
        "C-i" #'rime-force-enable)))