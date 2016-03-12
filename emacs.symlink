;; Initialize package manager
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))
;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))
;; Activate installed packages
(package-initialize)
;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'evil
                          'magit
                          'gruvbox-theme
                          'powerline
                          'evil-leader
                          'color-theme-approximate
                          'fill-column-indicator
                          'airline-themes
			  'elpy
			  'helm
                          'diminish
                          'lorem-ipsum
                          'multi-term
                          'xclip
                          ;; 'company-quickhelp
                          'neotree)
                          ;; 'slime
                          ;; 'evil-tabs
                          ;; 'auto-complete
                          ;; 'python-mode
                          ;; 'powerline-evil
                          ;; 'diminish


;; ===================
;; Fix key binding bug
;; ===================
;; Page up and tab key bindings
(setq evil-want-C-u-scroll t)
(setq evil-want-C-i-jump nil)


;; ==============
;; Emacs settings
;; ==============
;; Don't create backup files
;; (setq make-backup-files nil)
;; Supress welcome screen
(setq inhibit-startup-message t)
;; Line number on and add bar
(global-linum-mode t)
;;(setq linum-format "%4d \u2502 ")
(setq linum-format "%4d\u2502")
; Don't show menu bar
(menu-bar-mode 0)
;; Gruvbox theme
(load-theme 'gruvbox t)
;; Tabs are evil. Use spaces instead
(setq-default indent-tabs-mode nil)
;; Mouse mode
(xterm-mouse-mode t)
;; Show the clock
(display-time-mode t)
;; Show the batter percentage
(display-battery-mode t)
;; Manage backup and autosave files
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backupfiles")))
(setq auto-save-file-name-transforms
            `((".*" "~/.emacs.d/backupfiles" t)))
;; Gui Emacs defaults
(toggle-frame-fullscreen)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(font . "Inconsolata for Powerline-12"))
;; Highlight current line
(global-hl-line-mode t)
;; ;; Set the default split window direction
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)

;; Add a color column at column 80
;; (add-hook 'python-mode-hook (lambda ()
;; 			      (turn-on-auto-fill)
;; 			      (fci-mode)
;;   			      (set-fill-column 80)))

;; ========================
;; Custom keyboard bindings
;; ========================
;; Window movement
(global-set-key (kbd "C-h")  'windmove-left)
(global-set-key (kbd "C-j")  'windmove-down)
(global-set-key (kbd "C-k")  'windmove-up)
(global-set-key (kbd "C-l")  'windmove-right)


;; ================
;; Package settings
;; ================
;; Evil Mode settings
(require 'evil)
(evil-mode t)

;; Powerline/airline settings
(require 'powerline)
(powerline-default-theme)
(require 'airline-themes)
(load-theme 'airline-dark t)

;; Evil Leader settings
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "s" 'save-buffer)
(evil-leader/set-key "q" 'kill-buffer-and-window)
(evil-leader/set-key "nt" 'neotree-toggle)
(evil-leader/set-key "cc" 'comment-or-uncomment-region)
(evil-leader/set-key "!" 'elpy-shell-switch-to-shell)
(evil-leader/set-key "git" 'magit-status)

;; Neotree settings
(defvar neo-theme 'ascii)
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
	    (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
	    (define-key evil-normal-state-local-map (kbd "D") 'neotree-delete-node)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)))

;; Elpy
(elpy-enable)

;; Color theme approximate
(color-theme-approximate-on)

;; Helm
(require 'helm)

;; Diminish
(require 'diminish)
(diminish 'undo-tree-mode)
(diminish 'elpy-mode)

;; Multi-term
(require 'multi-term)
(setq multi-term-program "/usr/bin/zsh")

;; Xclip mode
;; (require 'xclip)
(xclip-mode 1)

;; Fill Column Indicator
;; (require 'fill-column-indicator)
;; (fci-mode)

;; Different default color for company completion
;; (require 'color)
  
  ;; (let ((bg (face-attribute 'default :background)))
  ;;   (custom-set-faces
  ;;    `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
  ;;    `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
  ;;    `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
  ;;    `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
  ;;    `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))
;; ================
;; Custom variables
;; ================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(airline-display-directory nil)
 '(airline-utf-glyph-branch 57504)
 '(airline-utf-glyph-linenumber 57505)
 '(airline-utf-glyph-subseparator-right 57523)
 '(battery-mode-line-format " [%t remaining]")
 '(company-quickhelp-mode t)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(elpy-test-nose-runner-command (quote ("nosetests" "--nocapture")))
 '(elpy-test-runner (quote elpy-test-nose-runner))
 '(python-shell-interpreter "ipython"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(company-tooltip ((t (:background "steel blue"))))
;;  '(company-tooltip-annotation ((t (:background "steel blue" :foreground "dark green" :weight bold))))
;;  '(company-tooltip-common ((t (:background "blue" :foreground "brightwhite" :underline t))))
;;  '(company-tooltip-common-selection ((t (:background "brightwhite" :foreground "red" :underline t))))
;;  '(company-tooltip-selection ((t (:background "wheat" :foreground "dark green"))))
;;  '(flymake-errline ((t (:foreground "red")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:foreground "red" :weight bold)))))
