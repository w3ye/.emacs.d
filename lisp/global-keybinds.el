;;; global-keybinds.el --- sets global keybinds for emacs
;;; Commentary:
;;; Code:
;; Getting rid of the startup warning
(setq evil-want-keybinding nil)
;; keymapping plugin
(use-package general)

;; Install hydra
(use-package hydra)

;; vim mode
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybindings nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;; Move the cursor to the warped line instead of jumping to the next line
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line))
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(general-define-key
 "C-M-j" 'counsel-switch-buffer)

(use-package evil-nerd-commenter
  :bind ("C-/" . evilnc-comment-or-uncomment-lines))

(provide 'global-keybinds)
;;; global-keybinds.el ends here
