(setq gnutls-algorithm-priority "NORMAL:-VERSION-TLS1.3")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (whiteboard)))
 '(custom-safe-themes
   (quote
    ("e8b353658a70b481107c9f51ae20a115b6a23dcb22a6daa15b99ddc552726561" default)))
 '(org-agenda-files (quote ("~/Dropbox/note/eg.org")))
 '(package-selected-packages (quote (evil slime ##))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; system
(setq vc-follow-symlinks t)

;; backup
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; splash
(setq inhibit-splash-screen t)

;; window
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)

;; line
(global-linum-mode)

;; syntax
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'zenburn)

;; bell
(setq visible-bell t)

;; SLIME
(setq inferior-lisp-program "/usr/bin/clisp")

;; ParEdit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
    (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
    (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
    (add-hook 'ielm-mode-hook #'enable-paredit-mode)
    (add-hook 'lisp-mode-hook #'enable-paredit-mode)
    (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
    (add-hook 'scheme-mode-hook #'enable-paredit-mode)

;; Evil
(require 'evil)
(evil-mode)

;; Org-mode
(setq org-src-fontify-natively t)
