(setq gnutls-algorithm-priority "NORMAL:-VERSION-TLS1.3")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
 '(package-selected-packages (quote (slime ##))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; line
(global-linum-mode)

;; syntax
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'zenburn)

;; bell
(setq visible-bell t)

;; SLIME
(setq inferior-lisp-program "/usr/bin/clisp")
