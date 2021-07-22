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

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
(general-define-key
 "C-M-j" 'counsel-switch-buffer)

(use-package evil-nerd-commenter
  :bind ("C-/" . evilnc-comment-or-uncomment-lines))

;; yasnippet keybinds, since autocomplete uses <tab>
;; yasnippet now use C-return to use snippet
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<C-return>") 'yas-expand)

(define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
(define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward)
(provide 'global-keybinds)
;;; global-keybinds.el ends here
