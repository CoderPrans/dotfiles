
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
(setq initial-frame-alist
      '((top . 0) (left . 0)
	(width . 105) (height . 32)))
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq tab-always-indent 'complete)
(defalias 'yes-or-no-p 'y-or-n-p)
;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))



					; Backup
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq backup-directory-alist
      `(("." . "~/.emacs.d/backup")))


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
		     evil
		     cider
		     magit
		     winum
		     paredit
		     prettier
		     rjsx-mode
		     flycheck
		     projectile
		     smartparens
		     geiser-chicken
		     cyberpunk-theme
		     typescript-mode
		     exec-path-from-shell
		     )))
  (dolist (p my-packages)
    (unless (package-installed-p p)
      (package-refresh-contents)
      (package-install p))
    (add-to-list 'package-selected-packages p)))


					; IDO
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

(defun ido-vertical ()
  "Vertical IDO options."
  (setq ido-decorations
	'("\n-> " "" "\n   " "\n   ..."
	  "[" "]" " [No match]"
	  " [Matched]" " [Not readable]"
	  " [Too big]" " [Confirm]"))
  (define-key
    ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key
    ido-completion-map (kbd "C-p") 'ido-prev-match))

(add-hook 'ido-setup-hook 'ido-vertical)


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
      evil-mode-line-format 'before
      evil-normal-state-cursor '(box "orange")
      evil-emacs-state-cursor '(box "purple"))


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

					; Exec Path From Shell

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


					; Flycheck
(add-hook 'after-init-hook
	  #'global-flycheck-mode)
;; workaround for slow eslint --print-config
(with-eval-after-load 'flycheck
  (advice-add 'flycheck-eslint-config-exists-p
	      :override (lambda() t)))

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint
          (and root
               (expand-file-name "node_modules/.bin/eslint"
                                 root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

					; Syntax
(add-to-list 'auto-mode-alist '("\\.js\\'"    . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"    . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;;(add-hook 'js2-mode-hook (lambda () (setq mode-name "JS2")))


					; Prettier

(add-hook 'rjsx-mode-hook #'prettier-mode)


					; Appearance
;; (deftheme default-black
;;   "Customized default theme.")
;; (custom-theme-set-faces
;;  'default-black
;;  '(default ((t (:background "Black" :foreground "White"))))
;;  '(hl-line ((nil (:background "#222"))))
;;  '(highlight ((nil (:background "#222"))))
;;  '(region ((nil (:background "#463740"))))
;;  '(ido-subdir ((nil (:foreground "Gray"))))
;;  '(ido-only-match ((nil (:foreground "LimeGreen"))))
;;  '(ido-first-match ((nil (:foreground "LimeGreen"))))
;;  '(font-lock-comment-face ((nil (:foreground "#7a7a7a"))))
;;  '(mode-line ((nil (:foreground "Black" :background "DarkGray")))))
;; (enable-theme 'default-black)
(add-to-list 'default-frame-alist
             '(font . "Cascadia Mono PL-10"))
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
(global-set-key (kbd "C-c C-h") 'winner-undo)
(global-set-key (kbd "C-c C-l") 'winner-redo)


					; More bindings
(defun open-init-el ()
  "Open init file."
  (interactive)
  (find-file
   (expand-file-name "init.el" user-emacs-directory)))

(defun ido-M-x ()
  "Use ido for Meta x."
  (interactive)
  (call-interactively
   (intern (ido-completing-read
	    "M-x "
	    (all-completions "" obarray 'commandp)))))

(global-set-key "\M-x" 'ido-M-x)
(global-set-key (kbd "C-c i") 'open-init-el)
(global-set-key (kbd "C-M-/") 'indent-region)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-iso-lefttab>") 'previous-buffer)
(global-set-key (kbd "C-c f") 'toggle-frame-fullscreen)
