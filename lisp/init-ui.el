;;; init-ui.el --- init the ui
;;; Commentary:
;;; Code:
;; Install all-the-icons so doom-modeline will work
(use-package all-the-icons)

(use-package gruvbox-theme)

(use-package doom-themes
  :init
  (load-theme 'doom-dracula t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 14)))

(use-package centaur-tabs
  :demand
  :init
  (setq centaur-tabs-enable-key-bindings t)
  :hook
  ((dired-mode . centaur-tabs-local-mode)
   (eshell-mode . centaur-tabs-local-mode))
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-height 38
	centaur-tabs-style "wave"
	centaur-tabs-set-icons t
	centaur-tabs-set-bar 'left
	centaur-tabs-set-modified-marker t
	centaur-tabs-cycle-scope 'tabs))
(use-package xterm-color)
(setq compilation-environment '("TERM=xterm-256color"))
(defun my/advice-compilation-filter (f proc string)
  (funcall f proc (xterm-color-filter string)))
(advice-add 'compilation-filter :around #'my/advice-compilation-filter)


(provide 'init-ui)
;;; init-ui.el ends here
