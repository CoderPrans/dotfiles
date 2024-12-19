;; Performance tweaks for modern machines
(setq gc-cons-threshold 100000000) ; 100 mb
(setq read-process-output-max (* 1024 1024)) ; 1mb


					; Defaults

(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(scroll-bar-mode -1)
(column-number-mode 1)
(set-default
 'indicate-empty-lines t)

;; (global-hl-line-mode 1)
;; (global-display-line-numbers-mode)
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq tab-always-indent 'complete)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Add unique buffer names in the minibuffer where there are many
;; identical files. This is super useful if you rely on folders for
;; organization and have lots of files with the same name,
;; e.g. foo/index.ts and bar/index.ts.
(require 'uniquify)

(electric-pair-mode t)
(show-paren-mode 1)
(savehist-mode t)
(recentf-mode t)
(global-auto-revert-mode t)

(setq uniquify-buffer-name-style 'forward
      window-resize-pixelwise t
      frame-resize-pixelwise t
      load-prefer-newer t
      backup-by-copying t
      auto-save-default nil
      create-lockfiles nil
      ;; Backups are placed into your Emacs directory, e.g. ~/.config/emacs/backups
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      custom-file (expand-file-name "custom.el" user-emacs-directory))

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;; Prefer spaces to tabs
(setq-default indent-tabs-mode nil)



					; Package Repos
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
(let ((my-packages '(ag
		     fzf
		     evil
                     corfu
		     cider
		     magit
		     winum
                     eglot
                     helpful
                     vertico
		     paredit
                     marginalia
                     ef-themes
		     smartparens
                     evil-collection
		     cyberpunk-theme
                     exec-path-from-shell
		     )))
  (dolist (p my-packages)
    (unless (package-installed-p p)
      (package-refresh-contents)
      (package-install p))
    (add-to-list 'package-selected-packages p)))


					; Exec Path From Shell

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


                                        ; Vertico
(vertico-mode)
(setq vertico-cycle t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq completion-styles '(basic substring partial-completion flex))


                                        ; Marginalia
(marginalia-mode)


                                        ; Corfu
(global-corfu-mode)
(setq corfu-auto t)
(setq corfu-auto-delay 0)
(setq corfu-auto-prefix 0)
(setq completion-styles '(basic))


                                        ; Eglot
(require 'eglot)
(define-key eglot-mode-map (kbd "C-c d") 'eglot-find-implementation)
(define-key eglot-mode-map (kbd "C-c .") 'eglot-code-action-quickfix)

(setq eglot-server-command '("clojure-lsp"))
(setq eglot-auto-config t)
(add-hook 'eglot-mode-hook 'eglot-ensure-server-running)
(add-hook 'clojure-mode-hook 'eglot-ensure)


                                        ; Helpful
(require 'helpful)
(define-key helpful-mode-map (kbd "C-h f") #'helpful-callable)
(define-key helpful-mode-map (kbd "C-h v") #'helpful-variable)
(define-key helpful-mode-map (kbd "C-h k") #'helpful-key)
(define-key helpful-mode-map (kbd "C-c C-d") #'helpful-at-point)
(define-key helpful-mode-map (kbd "C-h F") #'helpful-function)
(define-key helpful-mode-map (kbd "C-h C") #'helpful-command)


					; Org
(defun org--scheme ()
  "Load scheme for org-babel."
  (org-babel-do-load-languages
   'org-babel-load-languages
   (add-to-list
    'org-babel-load-languages '(scheme . t))))

(add-hook 'org-mode-hook 'org--scheme)


					; Evil
(evil-mode 1)
(setq evil-move-cursor-back nil
      evil-move-beyond-eol t
      evil-want-fine-undo t
      evil-want-keybinding nil
      evil-want-integration t
      evil-mode-line-format 'before
      evil-highlight-closing-parent-at-point-states nil
      evil-normal-state-cursor '(box "orange")
      evil-emacs-state-cursor '(box "purple"))


                                        ; Paredit
(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'paredit-mode)

					; SmartParens
(require 'smartparens-config)
(add-hook 'after-init-hook #'smartparens-global-mode)
(global-set-key (kbd "C->") 'sp-forward-slurp-sexp)
(global-set-key (kbd "C-<") 'sp-forward-barf-sexp)


					; Syntax
(add-to-list 'auto-mode-alist '("\\.js\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))


					; Appearance
(set-face-attribute 'default nil :font "Monospace" :height 120)
;; (add-to-list 'default-frame-alist
;;              '(font . "Monaco-13"))

(load-theme 'cyberpunk t)


					; Winum mode
(winum-mode 1)
(global-set-key (kbd "M-1") 'winum-select-window-1)
(global-set-key (kbd "M-2") 'winum-select-window-2)
(global-set-key (kbd "M-3") 'winum-select-window-3)
(global-set-key (kbd "M-4") 'winum-select-window-4)
(global-set-key (kbd "M-5") 'winum-select-window-5)
(global-set-key (kbd "M-6") 'winum-select-window-6)


					; Winner mode
(winner-mode 1)
(global-set-key (kbd "C-c h") 'winner-undo)
(global-set-key (kbd "C-c l") 'winner-redo)


					; More bindings
(defun open-init-el ()
  "Open init file."
  (interactive)
  (find-file
   (expand-file-name "init.el" user-emacs-directory)))

(global-set-key (kbd "C-c i") 'open-init-el)
(global-set-key (kbd "C-M-/") 'indent-region)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-iso-lefttab>") 'previous-buffer)
(global-set-key (kbd "C-c f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-u") (lambda() (interactive) (scroll-down-command 16)))
(global-set-key (kbd "C-d") (lambda() (interactive) (scroll-up-command 16)))
