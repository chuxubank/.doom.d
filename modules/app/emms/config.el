;;; app/emms/config.el -*- lexical-binding: t; -*-

(use-package! emms
  :defer t
  :config
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/Music/"))

(use-package! ncm
  :when (modulep! +ncm)
  :defer t)
