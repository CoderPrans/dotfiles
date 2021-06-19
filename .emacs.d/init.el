
;; Essentials
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode)
(show-paren-mode 1)
(column-number-mode 1)
(global-hl-line-mode 1)
(setq ring-bell-function 'ignore)

;; IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Customized backup
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq backup-directory-alist `(("." . "~/.emacs.d/backup")))

(require 'package)
(package-initialize)

;; Add package repos
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/load/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/load")

;; Install packages
(defvar my-packages '(ag
		      evil
		      cider
		      magit
		      paredit
		      prettier
		      web-mode
		      flycheck
		      projectile
		      python-mode
		      cyberpunk-theme
		      typescript-mode
		      exec-path-from-shell
		      ))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-refresh-contents)
    (package-install p))
  (add-to-list 'package-selected-packages p))

;; ;; shell path
;; (exec-path-from-shell-initialize)

;; Js/Tsx modes
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;; Web Mode
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; Evil
(evil-mode 1)
(setq evil-move-beyond-eol t)

;; Projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-,") 'projectile-command-map)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
; workaround for slow eslint --print-config
(with-eval-after-load 'flycheck
  (advice-add 'flycheck-eslint-config-exists-p :override (lambda() t)))

;; Prettier
(add-hook 'after-init-hook #'global-prettier-mode)

;; Appearance
(load-theme 'cyberpunk t)
(add-to-list 'default-frame-alist '(font . "Hack-10"))

;; Winner mode
(winner-mode 1)
(global-set-key (kbd "C-c C-h") 'winner-undo)
(global-set-key (kbd "C-c C-l") 'winner-redo)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" default))
 '(fci-rule-color "#383838")
 '(package-selected-packages
   '(nov flycheck org-present epresent python-mode web-mode magit cyberpunk-theme projectile ag paredit cider evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
