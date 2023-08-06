;; Disable Startup
(setq inhibit-startup-message t)

;; Load themes
;(load-theme 'deeper-blue t)
;(load-theme 'manoj-dark t)
(global-display-line-numbers-mode 1)

;; Remove Headers
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Remove Scroll Bar
(scroll-bar-mode -1)

;; Autopair mode for "" () {} []
(electric-pair-mode 1)

;; Wrap
;;(global-visual-line-mode t)

;; Keep Cursor position on scroll
;(setq scroll-preserve-screen-position nil)

;; Linear Scroll with whell
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))
    mouse-wheel-progressive-speed nil ;; Remove acceleration
    mouse-wheel-follow-mouse 't) ;; Scroll under mouse

;; Scroll line by line when cursor bottom
(setq scroll-step 1
      scroll-margin 5 ;;Offset for cursor
      scroll-conservatively  10000)

;; Move backup files to specific folder
(setq backup-directory-alist '(("." . "~/.saves")))

;; Config package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Granted use package
(unless (package-installed-p 'use-package)
    (package-install 'use-package))

;; Auto complete based on emacs builtins and buffer text
(use-package auto-complete
    :ensure t
    :init
	(ac-config-default)
	(global-auto-complete-mode t)
    :config
	(define-key ac-mode-map (kbd "M-RET") 'auto-complete) ;; Alt Enter for show options
	(ac-set-trigger-key "TAB"))

;; Evil mode for vim keybing
(use-package evil
    :ensure t
    :init
	(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
	(setq evil-want-keybinding nil)
    :config
	(evil-mode 1))

;; Use vim keybinds for org files org-ageda
(use-package evil-org
  :ensure t)
(use-package evil-org-agenda
  :ensure t)

;; Evil collection, more keybind configs for others plugins like neotree
(use-package evil-collection
  :after evil
  :ensure t
  :config
    (evil-collection-init)
    (evil-collection-init))

;; Undo tree with evil system
(use-package undo-tree
  :ensure t
  :after evil
  :diminish
  :config
    (evil-set-undo-system 'undo-tree)
    (global-undo-tree-mode 1))
;; undo-tree-visualize

;; Use vim keybings on Org files like org-agenda
(use-package evil-org-mode
  :ensure t)

;; Easy way to set new keybings
(use-package general
    :ensure t
    :config
	(general-evil-setup) ;; Setup for evil
	(general-create-definer dt/leader-keys ;; New pre-key
	    :states '(normal insert visual emacs)
	    :keymaps 'override
	    :prefix "SPC"
	    :global-prefix "M-SPC")
	;; Keys for interactions and specials
	(dt/leader-keys
	    "." '(find-file :wk "Find File")
	    "fc" '((lambda () (interactive) (find-file "~/.config/emacs/init.el")) :wk "Config File")
	    "TAB TAB" '(comment-line :wk "Comment Lines")
	    "a" '(org-agenda :wk "Org Agenda"))
	;; Keys for interections with buffer
	(dt/leader-keys
	    "b" '(:ignore t :wk "Buffer")
	    "bb" '(switch-to-buffer :wk "Switch to buffer")
	    "bd" '(kill-this-buffer :wk "Kill this buffer")
	    "bn" '(next-buffer :wk "Change to next buffer")
	    "bp" '(previous-buffer :wk "Change to previous buffer"))
	;; keys for evaluetions
	(dt/leader-keys
	    "e" '(:ignore t :wk "Evaluete")
	    "eb" '(eval-buffer :wk "Evaluete buffer")
	    "ed" '(eval-defun :wk "Evaluete defun containing or after point")
	    "es" '(eval-last-sexp :wk "Evaluete elisp expression before point")
	    "ee" '(eval-expression :wk "Evaluete and elisp expression")
	    "er" '(eval-region :wk "Evaluete elisp in region"))
)

;; PopUp show commands for current key set
(use-package which-key 
    :ensure t
    :init
	(which-key-mode 1)
    :config
	(setq which-key-sparator " > ")
	(which-key-setup-minibuffer) ;; use minibuffer
	(setq which-key-separator " → " ))

;; Tabs for buffers
(use-package centaur-tabs
    :ensure t
    :demand
    :config
	(centaur-tabs-mode t)
	(setq centaur-tabs-set-icons t)
    :bind
	("C-<prior>" . centaur-tabs-backward)
	("C-<next>" . centaur-tabs-forward))

;; CONFIG MY ORG MODE
(use-package org
  :config
    (setq org-ellipsis " ⤵")
    ;; Org Agenda
    (setq org-agenda-files '("~/Org"))
    (setq org-agenda-start-with-log-mode t)
    (setq org-log-done 'time)
    (setq org-log-into-drawer t)

    (setq org-agenda-custom-commands
	  '(
	    ("d" "Demo block agenda"
	     (
	      (todo "TODO"
		    ((org-agenda-overriding-header "Tasks TODO")
		     (org-agenda-span 1)))
	      (agenda ""
		      ((org-agenda-span 1)
		       (org-agenda-overriding-header "\nDaily agenda\n")
		       (org-agenda-day-face-function (lambda (date) 'org-agenda-date))
		       (org-agenda-format-date "%A %-e %B %Y - day: %j")))
	      ))))
  )
;; Org Agenda Habit
(use-package org-habit-stats
    :ensure t
    :config
    (org-habit-toggle-habits)
    (setq org-habit-graph-column 80)
    )



;; Toc org
(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

;; Config org-bullets
(use-package org-bullets
    :config
	(add-hook 'org-mode-hook (lambda ()
				(org-bullets-mode 1)
				(org-indent-mode))))

;; Set Theme when go to config el file
(add-hook 'emacs-lisp-mode (lambda ()
			     (load-theme 'doom-ir-black)))

(use-package rainbow-delimiters
    :ensure t
    :config (rainbow-delimiters-mode))

;; Neotree
(use-package neotree
    :ensure t
    :after all-the-icons
    :config
	(setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;; Icons to use with neotree
(use-package all-the-icons
    :ensure t)

(use-package doom-themes
    :ensure t
    :config
	;; Global settings (defaults)
	(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
		doom-themes-enable-italic t) ; if nil, italics is universally disabled
	(load-theme 'doom-ir-black t)

	;; Enable flashing mode-line on errors
	(doom-themes-visual-bell-config)
	;; Enable custom neotree theme (all-the-icons must be installed!)
	(doom-themes-neotree-config)
	;; or for treemacs users
	(setq doom-themes-treemacs-theme "doom-ir-black") ; use "doom-colors" for less minimal icon theme
	(doom-themes-treemacs-config)
	;; Corrects (and improves) org-mode's native fontification.
	(doom-themes-org-config))

(use-package org-drill
  :ensure t
  :config
    (setq org-drill-use-visible-cloze-face-p t)
    (setq org-drill-hide-item-headings-p t)
    (setq org-capture-templates
	`(("u"
	    "Task: Read this URL"
	    entry
	    (file+headline "tasks.org" "Articles To Read")
	    ,(concat "* TODO Read article: '%:description'\nURL: %c\n\n")
	    :empty-lines 1
	    :immediate-finish t)

	    ("w"
	    "Capture web snippet"
	    entry
	    (file+headline "~/Desktop/SRS/Livros.org" "Inbox")
	    ,(concat "* Fact: '%:description'        :"
		    (format "%s" org-drill-question-tag)
		    ":\n:PROPERTIES:\n:DATE_ADDED: %u\n:SOURCE_URL: %c\n:END:\n\n%i\n%?\n")
	    :empty-lines 1
	    :immediate-finish t)
	    ;; ...other capture templates...
	))
  )

;; Mini buffer for completition commands
;; With ivy we don't need which key
;; Easy to search a command
(use-package ivy
    :ensure t
    :init (ivy-mode)
    :config
	(setq ivy-use-virtual-buffers nil)
	(setq ivy-count-format "(%d/%d)"))

;; Counsel use ivy for more beuty and usefull include show keybind after command
(use-package counsel
    :ensure t
    :after ivy
    :init (counsel-mode)
    :config
	(setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) "")) ;; Remove ^ when call M-x
;; The character ^ is used to show only commands who STARTED with input

;; Fix Backward
;;Eclipse-like C-backspace
(defun my-kill-back ()
  (interactive)
  (if (bolp)  ; beginnning of line, just delete 1
      (backward-delete-char 1)
    (if (string-match "[^[:space:]]" (buffer-substring (point-at-bol) (point)))
        ; There's a word on the line, delete it
        (backward-kill-word 1)
      (delete-region (point-at-bol) (point))))) ; all whitespace, delete itk
(global-set-key [C-backspace] 'my-kill-back)


;; (setq initial-buffer-choice 'org-agenda)
(add-hook 'emacs-startup-hook (lambda ()
				(progn
				  (org-agenda nil "d")
				  (delete-other-windows)
				  (split-window-right)
				  (find-file "~/.config/emacs/init.el")
				  (evil-window-rotate-upwards))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-org-agenda evil-org evil-org-mode org-habit-stats cmake-mode yasnippet-snippets which-key use-package-chords undo-tree rainbow-delimiters quickrun projectile org-drill org-bullets neotree lsp-ui lsp-java helm-swoop helm-lsp helm-descbinds general flycheck exec-path-from-shell evil-collection doom-themes counsel company centaur-tabs auto-complete all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
