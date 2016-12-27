(require 'package)

(add-to-list 'package-archives
             '("melpa" ."http://melpa.org/packages/") t)

;; activate all the packages (in particular autoloads)
(package-initialize)

;; being behind bars isnt fun for me
(menu-bar-mode -1)
(tool-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; set transparency
;; (set-frame-parameter (selected-frame) 'alpha '(99 100))
;; (add-to-list 'default-frame-alist '(alpha 99 100))

;; disable blinking cursor
(blink-cursor-mode -1)

;; the only kind of bell that I would listen to is "The Devision Bell"
(setq ring-bell-function 'ignore)

;; I have seen it too many time. It is no more.
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; making up my face
(set-face-attribute 'default nil :font "Droid Sans Mono")
(set-face-attribute 'default (selected-frame) :height 109)


;; bind eshell
(global-set-key (kbd "C-x e") 'eshell)

;; split window in two because two is better then onej
(split-window-right)

;; I don't care how do you talk to me as long as it is utf-8
(prefer-coding-system 'utf-8)

;; Do not use tabs for indentation
(setq-default indent-tabs-mode nil)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; show me the time
(display-time-mode t)

;; coursor you won't hide from me no more
(set-cursor-color "red")
(add-hook 'prog-mode-hook 'hl-line-mode)
(setq default-frame-alist
      '((cursor-color . "red")))

;; Highlight incremental search
(setq search-highlight t)
(transient-mark-mode t)

;; Disable backups
(setq backup-inhibited t)

;; disable auto save
(setq auto-save-default nil)

;; some staff
(global-set-key [f2] 'comment-region)
(global-set-key [f3] 'uncomment-region)
(global-set-key [f4] 'goto-line)
(global-set-key [f5] 'indent-region)

;; line numbers
(add-hook 'prog-mode-hook 'linum-mode)

;; white space display
;; (add-hook 'prog-mode-hook 'whitespace-mode)

;; javascript indent
(setq js-indent-level 2)

;; exit with f9
(global-unset-key (kbd "C-x C-c"))
(global-set-key [f12] 'save-buffers-kill-emacs)

;; load local inits
(load "~/.emacs.d/local-init.el")

;; .h files to be treated as cpp code
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(require 'use-package)

(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))

;; become evil
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  :chords (:map evil-insert-state-map
                ("jk" . evil-normal-state)
                ("kj" . evil-normal-state)))

(use-package solarized-theme
  :disabled t
  :ensure t
  :config
  (load-theme 'solarized-dark t))

(use-package atom-one-dark-theme
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package evil-magit
  :ensure t)

(use-package ido
  :ensure t
  :config (ido-mode +1))

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-ruby)
  (smartparens-global-mode)
  (show-smartparens-global-mode t))

(use-package evil-smartparens
  :ensure t
  :config
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))

(use-package projectile
  :ensure t
  :bind ("C-c p" . projectile-command-map)
  :config
  (projectile-global-mode +1))

(use-package aggressive-indent
  :ensure t)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state))

(use-package fic-mode
  :ensure t
  :config (add-hook 'prog-mode-hook 'fic-mode))

(use-package elm-mode
  :ensure t
  :config
  (add-hook 'elm-mode-hook #'elm-oracle-setup-ac)
  (setq elm-foramt-on-save t))

(use-package dtrt-indent
  :ensure t
  :config (dtrt-indent-mode 1))

(use-package p4
  :ensure t)

(use-package go-mode
  :ensure t
  :init
  (add-hook 'before-save-hook 'gofmt-before-save))
