;;; +map.el -*- lexical-binding: t; -*-

;;;###package evil
(setq! evil-disable-insert-state-bindings t)

;;;###package evil-collection
(set-evil-initial-state! '(pdf-annot-list-mode)
  'emacs)
(evil-collection-init '(osx-dictionary))

(map! :i "C-SPC" nil
      :i "C-@" nil
      (:after evil-org :map evil-org-mode-map
       :i "C-l" nil
       :i "C-h" nil
       :i "C-k" nil
       :i "C-j" nil))

(map! :i "C-M-i" #'+company/complete
      (:leader
       (:prefix-map ("a" . "app")
        (:when (featurep! :app eaf)
         :desc "EAF"             "e" #'eaf)
        (:when (featurep! :app telega)
         :desc "Telega"          "t" #'telega)
        (:when (featurep! :app leetcode)
         :desc "LeetCode"        "l" #'leetcode))

       (:prefix-map ("d" . "dictionary")
        (:when (featurep! :study dict)
         :desc "Bing"            "b" #'bing-dict-brief)
        (:when (featurep! :study dict +anki)
         :desc "Anki"            "a" #'anki-vocabulary)
        (:when (and (featurep! :tools lookup +dictionary) IS-MAC)
         :desc "OSX"             "o" #'osx-dictionary-search-input)))

      (:map help-map
       "dU" #'doom/upgrade)

      (:when (featurep! :input chinese+)
       (:map rime-mode-map
        "C-`" #'rime-send-keybinding
        "C-i" #'rime-force-enable)))
