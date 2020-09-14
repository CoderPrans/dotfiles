; install packages
(package-initialize)
(require 'package)

(eval-when-compile
  (require 'use-package))

;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/load/")
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

; essential settings  
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode -1)
(setq display-line-numbers-type t)
; line numbering
(global-display-line-numbers-mode)
(setq display-line-numbers-type t)
(set-face-attribute 'default t :font "Hack Nerd Font-12")

(global-hl-line-mode t)

;evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package ample-theme
  :ensure t)

(load-theme 'ample t)
(define-key evil-ex-map "e" 'find-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e41c5149ce1347e28a7d0948d92befbba3a5ad450ac0bb75035c1e83408623b4" default))
 '(package-selected-packages
   '(use-package powerline-evil ir-black-theme danneskjold-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
