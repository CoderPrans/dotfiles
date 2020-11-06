;essential settings  
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;(fringe-mode -1)
(global-display-line-numbers-mode)
(setq display-line-numbers-type t)
(setq backup-directory-alist `(("." . "~/.emacs.d/backup")))
;(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(ido-mode 1)
(show-paren-mode 1)
(column-number-mode 1)
(global-auto-revert-mode 1)
(global-hl-line-mode 1)

;(require 'org)

; require and initialize packages
(require 'package)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/load/")
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
  '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))

(add-to-list 'custom-theme-load-path "/home/pranav/.emacs.d/load")
;; (load-theme 'leuven-dark t)
;; (load-theme 'cyberpunk t)

; require use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;(eval-when-compile
;  (require 'use-package))
;evil mode
;(use-package evil
;  :ensure t
;  :config
;  (evil-mode 1))
;(define-key evil-ex-map "e" 'find-file)

;; CIDER
(use-package cider
  :ensure t)

;; ;; COMPANY
;; (use-package company
;;   :ensure t)

;; PAREDIT
(use-package paredit
  :ensure t)
 
;; MAGIT
(use-package magit
  :ensure t)

;; FZF
(use-package fzf
  :ensure t)

;; ;; PROJECTILE
;; (use-package projectile
;;   :ensure t)
;; (projectile-mode +1)

;; CYBERPUNK-THEME
(use-package cyberpunk-theme
 :ensure t)
(load-theme 'cyberpunk t)

;; WINNER MODE
(winner-mode 1)
(global-set-key (kbd "C-c C-h") 'winner-undo)
(global-set-key (kbd "C-c C-l") 'winner-redo)

;; HELM
(use-package helm
  :ensure t)

(use-package helm
  :init
    (require 'helm-config)
    (setq helm-split-window-in-side-p t
          helm-move-to-line-cycle-in-source t)
  :config 
    (helm-mode 1) ;; prompts become helm-enabled
    (helm-autoresize-mode 1) ;;resizes
    (global-set-key (kbd "C-x b") 'helm-buffers-list)
;    (define-key evil-ex-map "l" 'helm-buffers-list)
    (global-set-key (kbd "C-x r b") 'helm-bookmarks)
;    (global-set-key (kbd "C-x C-f") 'helm-find-files)
;    (define-key evil-ex-map "e" 'helm-find-files)
    (global-set-key (kbd "M-c") 'helm-calcul-expression)
    (global-set-key (kbd "C-s") 'helm-occur)
    (global-set-key (kbd "C-h a") 'helm-apropos)
    (global-set-key (kbd "M-x") 'helm-M-x)  ;; M-x menu
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  :ensure t)

(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

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
   '("0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2d40e8de2c676ec749cf13a0a48e35a8b678a056dc397ffe8de4424dfa69d460" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "378d52c38b53af751b50c0eba301718a479d7feea5f5ba912d66d7fe9ed64c8f" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "890a1a44aff08a726439b03c69ff210fe929f0eff846ccb85f78ee0e27c7b2ea" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "f2c35f8562f6a1e5b3f4c543d5ff8f24100fae1da29aeb1864bbc17758f52b70" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" default))
 '(fci-rule-color "#383838")
 '(package-selected-packages
   '(magit paredit company cider ample-theme zenburn-theme use-package solarized-theme shrink-path org-bullets memoize leuven-theme helm exwm evil cyberpunk-theme color-theme-sanityinc-solarized autothemer)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
