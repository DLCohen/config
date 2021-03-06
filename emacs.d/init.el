; No menu bar or scroll bars
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

; No splash screen
(setq inhibit-startup-message t)

; Packages
(require 'package)
;(add-to-list 'package-archives
;	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar my-packages '(clojure-mode
		      nrepl
		      expand-region
		      magit
		      markdown-mode
                      cl-lib
		      php-mode
		      slime
		      yasnippet
		      paredit
                      web-mode
                      color-theme
                      powerline
                      git-gutter))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

; Add top level emacs.d directory to load path
(add-to-list 'load-path "~/.emacs.d")

; Add paths exec-path on the mac
(when (string= system-type "darwin")
  (add-to-list 'exec-path "/usr/local/bin")
  (add-to-list 'exec-path "/Users/kkedrovsky/bin"))

;;    (setenv "PATH" (concat (getenv "PATH") ":/Users/kkedrovsky/bin"))

; start with empty scratch buffer
(setq initial-scratch-message nil)

; use spaces not tabs
(setq-default indent-tabs-mode nil)

; use 2 spaces for indentation by default
(setq c-basic-offset 2)
(setq tab-width 2)

; Fonts
;;(set-default-font "xft:Bitstream Vera Sans Mono-8")
(when (not (string= system-type "darwin"))
  (set-face-attribute 'default nil :font "Droid Sans Mono-10")
  (set-default-font "Droid Sans Mono-10")
  (setq default-frame-alist '((font . "Droid Sans Mono-10"))))

; ido
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; No backup files
(setq make-backup-files nil)

; Key customizations
; (global-set-key [(control delete)] 'ibuffer)
(global-set-key [C-delete] 'ibuffer)
(global-set-key [C-kp-delete] 'ibuffer)
(global-set-key [f1] 'magit-status)
(global-set-key [f2] 'shell)
(global-set-key [f5] 'other-window)
(global-set-key [f8] 'undo)

; Save the buffers
(desktop-save-mode t)

; Solarized theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
; (load-theme 'solarized-dark t)
(load-theme 'tomorrow-night-eighties t)

; Org mode
(setq org-directory "~/bitpocket/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

; Shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(if (string= system-type "darwin")
    (setq explicit-shell-file-name "/usr/local/bin/zsh"))
(setq shell-file-name "zsh")
(setq explicit-bash.exe-args '("--login"))
(setenv "SHELL" shell-file-name)

; Magit
(require 'magit)

; Git gutter
(global-git-gutter-mode t)

; Yasnippet
(require 'yasnippet)

; Tramp
(require 'tramp)
(setq tramp-default-method "ssh")
; (add-to-list 'tramp-remote-process-environment "IN_TRAMP_MODE=t")

;; The following two lines enable editing remote files as root
; (add-to-list 'tramp-default-proxies-alist
; 	     '(nil "\\`root\\'" "/ssh:%h:"))
; (add-to-list 'tramp-default-proxies-alist
; 	     '((regexp-quote (system-name)) nil nil))

; Markdown mode
(setq auto-mode-alist
  (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

; PHP and Drupal modes
; (setq drupal-ide-load-path (concat user-emacs-directory "drupal/drupal-init.el"))
; (autoload 'drupal-ide drupal-ide-load-path "Start IDE for PHP & Drupal development" t)
; Not sure why flymake is required by php-mode but it is...
(require 'flymake)
(require 'php-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\.php$" . web-mode))
(add-hook 'php-mode-hook 'php-enable-drupal-coding-style)

; SCSS
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

; Clojure mode
(require 'clojure-mode)

; Expand region mode
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

; Paredit
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook    'enable-paredit-mode)

; Powerline
(require 'powerline)
(powerline-default)

; Emacs server
(server-start)

; custom variables DO NOT EDIT
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
