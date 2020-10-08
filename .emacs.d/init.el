;essential settings  
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;(fringe-mode -1) 
;(global-display-line-numbers-mode)
;(setq display-line-numbers-type t)
(setq backup-directory-alist `(("." . ".emacs")))
(ido-mode 1)
(show-paren-mode 1)
(column-number-mode 1)
(global-auto-revert-mode 1)
(global-hl-line-mode 1)

; enable transient mark mode
;(transient-mark-mode 1)
;; org mode configuration
;; enable org mode
(require 'org)

; require and initialize packages
(require 'package)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/load/")
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
  '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))

; require use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;(eval-when-compile
;  (require 'use-package))

;evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(define-key evil-ex-map "e" 'find-file)

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package helm
  :ensure t)

(use-package cyberpunk-theme
  :ensure t)

(load-theme 'cyberpunk t)

(use-package helm
  :init
    (require 'helm-config)
    (setq helm-split-window-in-side-p t
          helm-move-to-line-cycle-in-source t)
  :config 
    (helm-mode 1) ;; prompts become helm-enabled
    (helm-autoresize-mode 1) ;;resizes
    (global-set-key (kbd "C-x b") 'helm-buffers-list)
    (define-key evil-ex-map "l" 'helm-buffers-list)
    (global-set-key (kbd "C-x r b") 'helm-bookmarks)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (define-key evil-ex-map "e" 'helm-find-files)
    (global-set-key (kbd "M-c") 'helm-calcul-expression)
    (global-set-key (kbd "C-s") 'helm-occur)
    (global-set-key (kbd "C-h a") 'helm-apropos)
    (global-set-key (kbd "M-x") 'helm-M-x)  ;; M-x menu
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  :ensure t)


(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;(use-package doom-modeline
;  :ensure t
;  :init (doom-modeline-mode 1))


;(require 'exwm)
;(require 'exwm-config)
;(exwm-config-default)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-safe-themes
   '("830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" default))
 '(fci-rule-color "#383838"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
