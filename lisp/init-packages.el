(use-package restart-emacs)

;; Install ivy, swiper and counsel
(use-package ivy
  :bind (:map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1))
(use-package swiper
  :after (ivy)
  :hook (after-init . ivy-mode)
  :bind (("C-s" . swiper)))
(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

;; Detail info on ivy
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; Install drag-sftuff
(use-package drag-stuff
  ;; Move line/code up/down
  :bind ("<M-up>" . drag-stuff-up)
  :bind ("<M-down>" . drag-stuff-down))

;; Install which-key
(use-package which-key
  :defer nil
  :config (which-key-mode))

;; Install ace-window (window management)
(use-package ace-window
  :bind (("M-o" . 'ace-window)))

;; Coloured parenthesis
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map))
;; More options for projectile
(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package magit)
;; NOTE: Make sure to configure the Github token before using - Magit Forge
(use-package forge)

(provide 'init-packages)
