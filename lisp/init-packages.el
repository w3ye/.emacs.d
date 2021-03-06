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
;; Works with counsel (counsel-mx enhancement)
(use-package smex)
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

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))
;; NOTE: Make sure to configure the Github token before using - Magit Forge
(use-package forge)

;; Install company(auto-complete)
(use-package company
  :after lsp-mode
  :hook ((emacs-lisp-mode . company-mode)
	 (lisp-mode . company-mode))
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
	(("C-c s s" . company-yasnippet))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  :config
  (setq company-backends '(company-yasnippet)))
(use-package company-box
  :hook (company-mode . company-box-mode))

;; Install flycheck (syntax check)
(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(use-package emojify
  :hook (after-init . global-emojify-mode))

(use-package yasnippet
  :init (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config
  (yas-reload-all))
(yas-global-mode 1)
(use-package yasnippet-snippets
  :after yasnippet)
(use-package origami
  :hook (prog-mode . origami-mode))

(use-package impatient-mode)
(use-package simple-httpd
  :config
  (setq httpd-port 5500))
(use-package htmlize)

(use-package markdown-mode
   :ensure t
   :commands (markdown-mode gfm-mode)
   :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
   :init (setq markdown-command "multimarkdown"))
(use-package web-mode)
(use-package format-all)

(provide 'init-packages)
;;; init-packages.el ends here
