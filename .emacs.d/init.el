;essential settings  
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;(fringe-mode -1)
(global-display-line-numbers-mode)
(setq backup-directory-alist `(("." . "~/.emacs.d/backup")))
;(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(ido-mode 1)
(show-paren-mode 1)
(column-number-mode 1)
;(global-auto-revert-mode 1)
(global-hl-line-mode 1)

(require 'package)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/load/")
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'custom-theme-load-path "/home/pranav/.emacs.d/load")

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
 (require 'use-package))

(use-package evil
 :ensure t
 :config
 (evil-mode 1))

(use-package cider
  :ensure t)

(use-package paredit
  :ensure t)

(use-package cyberpunk-theme
 :ensure t)
(load-theme 'cyberpunk t)

(winner-mode 1)
(global-set-key (kbd "C-c C-h") 'winner-undo)
(global-set-key (kbd "C-c C-l") 'winner-redo)

(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(cyberpunk-theme paredit cider evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
