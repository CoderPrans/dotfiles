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
;(global-hl-line-mode 1)

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
 :ensure t)
(evil-mode 1)

(use-package cider
  :ensure t)

(use-package paredit
  :ensure t)

(use-package ag
  :ensure t)

(use-package typescript-mode
  :ensure t)

(use-package projectile
  :ensure t)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-,") 'projectile-command-map)

(use-package cyberpunk-theme
 :ensure t)
(load-theme 'cyberpunk t)
(add-to-list 'default-frame-alist '(font . "Hack Nerd Font-10"))

(winner-mode 1)
(global-set-key (kbd "C-c C-h") 'winner-undo)
(global-set-key (kbd "C-c C-l") 'winner-redo)

(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" default))
 '(fci-rule-color "#383838")
 '(package-selected-packages
   '(smart-mode-line typescript-mode cyberpunk-theme projectile ag paredit cider evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
