;;; lsp.el --- init lsp
;;; Commentary:
;;; Code:
(defun ye/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((js-mode . lsp-deferred)
   (html-mode . lsp-deferred)
   (css-mode . lsp-deferred)
   (python-mode . lsp-deferred)
   (ruby-mode . lsp-deferred)
   (lsp-mode . ye/lsp-mode-setup))
  :config
  (lsp-enable-which-key-integration t)
  :custom
  (setq lsp-enable-snippet t))

(use-package lsp-ivy)

;; Enhance lsp ui
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :after lsp
  :bind (:map evil-normal-state-map
	      ("C-x m" . treemacs)))
(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package emmet-mode
  :hook ((sgml-mode . emmet-mode)
	 (css-mode . emmet-mode)))

(provide 'lsp)
;;; lsp.el ends here
