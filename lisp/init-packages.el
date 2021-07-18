;;; init-packages.el --- Installing packages
;;; Commentary: 
;;; Code:
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

;; Install company (auto-complete)
(use-package company
  :config
  (setq company-dabbrev-code-everywhere t
	company-dabbrev-code-modes t
	company-dabbrev-code-other-buffers 'all
	company-dabbrev-downcase nil
	company-dabbrev-ignore-case t
	company-dabbrev-other-buffers 'all
	company-require-match nil
	company-minimum-prefix-length 2
	company-show-numbers t
	company-tooltip-limit 20
	company-idle-delay 0
	company-echo-delay 0
	company-tooltip-offset-display 'scrollbar
	company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))
;; Install flycheck (syntax check)
(use-package flycheck 
  :hook (prog-mode . flycheck-mode))

(provide 'init-packages)
