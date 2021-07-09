
					; Defaults
(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(scroll-bar-mode -1)
(column-number-mode 1)
;; (global-hl-line-mode 1)
;; (global-display-line-numbers-mode)
(set-default
 'indicate-empty-lines t)

(setq initial-frame-alist
      '((top . 0) (left . 0)
	(width . 85) (height . 32)))
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq tab-always-indent 'complete)
(defalias 'yes-or-no-p 'y-or-n-p)


					; IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


					; Customized backup
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq backup-directory-alist `(("." . "~/.emacs.d/backup")))


					; Package repos
(require 'package)
(package-initialize)

(add-to-list 'package-archives
	     '("melpa" .
	       "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" .
	       "https://stable.melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/load/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/load")


					; Packages
(defvar my-packages
  '(ag
    evil
    cider
    magit
    winum
    paredit
    prettier
    flycheck
    projectile
    smartparens
    cyberpunk-theme
    typescript-mode
    exec-path-from-shell
    ))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-refresh-contents)
    (package-install p))
  (add-to-list 'package-selected-packages p))

;; shell path
;; (exec-path-from-shell-initialize)


					; Syntax
(add-to-list 'auto-mode-alist
	     '("\\.jsx\\'" . javascript-mode))
(add-to-list 'auto-mode-alist
	     '("\\.tsx\\'" . typescript-mode))


					; Evil
(evil-mode 1)
(setq evil-move-cursor-back nil
      evil-move-beyond-eol t
      evil-want-fine-undo t
      evil-mode-line-format 'before
      evil-normal-state-cursor '(box "orange")
      evil-emacs-state-cursor  '(box "purple"))


					; SmartParens
(require 'smartparens-config)
(add-hook 'after-init-hook #'smartparens-global-mode)
(global-set-key (kbd "C->") 'sp-forward-slurp-sexp)
(global-set-key (kbd "C-<") 'sp-forward-barf-sexp)


					; Projectile
(projectile-mode +1)
(setq projectile-create-missing-test-files t)
(define-key projectile-mode-map
  (kbd "C-c p") 'projectile-command-map)


					; Flycheck
(add-hook 'after-init-hook
	  #'global-flycheck-mode)
;; workaround for slow eslint --print-config
(with-eval-after-load 'flycheck
  (advice-add 'flycheck-eslint-config-exists-p
	      :override (lambda() t)))


					; Prettier
;; (add-hook 'after-init-hook
;; 	  #'global-prettier-mode)


					; Appearance
(load-theme 'cyberpunk t)
;; (add-to-list 'default-frame-alist
;; 	     '(font . "Hack-10"))


					; Winum mode
(winum-mode 1)
(global-set-key (kbd "C-c 1") 'winum-select-window-1)
(global-set-key (kbd "C-c 2") 'winum-select-window-2)
(global-set-key (kbd "C-c 3") 'winum-select-window-3)
(global-set-key (kbd "C-c 4") 'winum-select-window-4)
(global-set-key (kbd "C-c 5") 'winum-select-window-5)
(global-set-key (kbd "C-c 6") 'winum-select-window-6)


					; Winner mode
(winner-mode 1)
(global-set-key (kbd "C-c C-h") 'winner-undo)
(global-set-key (kbd "C-c C-l") 'winner-redo)


					; More bindings
(defun open-init-el ()
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))

(global-set-key (kbd "C-c i") 'open-init-el)
(global-set-key (kbd "C-c k") 'kill-this-buffer)

