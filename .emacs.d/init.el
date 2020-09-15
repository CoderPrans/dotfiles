; install packages
(package-initialize)
(require 'package)

(eval-when-compile
  (require 'use-package))

;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/load/")
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'default-frame-alist '(font . "Hack Nerd Font-10"))

; essential settings  
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode -1)
(global-display-line-numbers-mode)
(setq display-line-numbers-type t)
(ido-mode 1)
(show-paren-mode 1)
(column-number-mode 1)
(global-auto-revert-mode 1)
(global-hl-line-mode 1)

; enable transient mark mode
(transient-mark-mode 1)
;; org mode configuration
;; enable org mode
(require 'org)
;; make org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


;evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package helm
  :ensure t)

(use-package ir-black-theme
  :ensure t)

(load-theme 'ir-black t)
(define-key evil-ex-map "e" 'find-file)

(use-package helm
  :init
    (require 'helm-config)
    (setq helm-split-window-in-side-p t
          helm-move-to-line-cycle-in-source t)
  :config 
    (helm-mode 1) ;; Most of Emacs prompts become helm-enabled
    (helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
    (global-set-key (kbd "C-x b") 'helm-buffers-list) ;; List buffers ( Emacs way )
    (define-key evil-ex-map "l" 'helm-buffers-list) ;; List buffers ( Vim way )
    (global-set-key (kbd "C-x r b") 'helm-bookmarks) ;; Bookmarks menu
    (global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
    (define-key evil-ex-map "e" 'helm-find-files) ;; List buffers ( Vim way )
    (global-set-key (kbd "M-c") 'helm-calcul-expression) ;; Use Helm for calculations
    (global-set-key (kbd "C-s") 'helm-occur)  ;; Replaces the default isearch keybinding
    (global-set-key (kbd "C-h a") 'helm-apropos)  ;; Helmized apropos interface
    (global-set-key (kbd "M-x") 'helm-M-x)  ;; Improved M-x menu
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)  ;; Show kill ring, pick something to paste
  :ensure t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(use-package key-chord ir-black-theme helm gruvbox-theme flatland-theme flatland-black-theme evil danneskjold-theme ample-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:extend t :background "#222" :underline nil)))))
