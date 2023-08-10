;; Disable Startup
(setq inhibit-startup-message t)

;(load-theme 'deeper-blue t)
;(load-theme 'manoj-dark t)
;(load-theme 'doom-ir-black y)
(global-display-line-numbers-mode 1)

;; Remove Headers
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Remove Scroll Bar
(scroll-bar-mode -1)

;; Autopair mode for "" () {} []
(electric-pair-mode 1)
(show-paren-mode)
show-paren-style

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

;; Try packages
(use-package try
  :ensure t)

;; Auto complete based on emacs builtins and buffer text
;; (use-package auto-complete
;;     :ensure t
;;     :init
;; 	(ac-config-default)
;; 	(global-auto-complete-mode t)
;;     :config
;; 	(define-key ac-mode-map (kbd "M-RET") 'auto-complete) ;; Alt Enter for show options
;; 	(ac-set-trigger-key "TAB"))

;; Evil mode for vim keybing
(use-package evil
    :ensure t
    :init
	(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
	(setq evil-want-keybinding nil)
    :config
	(evil-mode 1))

;; Evil collection, more keybind configs for others plugins like neotree
(use-package evil-collection
  :after evil
  :ensure t
  :config
    (evil-collection-init))

;; Use vim keybinds for org files org-ageda
(add-to-list 'load-path "~/.config/emacs/plugins/evil-org-mode")
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

;; Undo tree with evil system
(use-package undo-tree
  :ensure t
  :after evil
  :diminish
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo")))
    (evil-set-undo-system 'undo-tree)
    (global-undo-tree-mode 1))
;; undo-tree-visualize

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
	    "a" '(org-agenda :wk "Org Agenda")
	    "t" '(vterm :wk "Terminal vterm")
	    "n" '(treemacs :wk "Treemacs"))
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
	;; Move between tabs
	(dt/leader-keys
	    "l" '(centaur-tabs-forward :wk "Move forward tab")
	    "h" '(centaur-tabs-backward :wk "Move backward tab"))
	(dt/leader-keys
	    "s" '(:ignore t :wk "Slime")
	    "sa" '(sly :wk "Open Slime")
	    "se" '(sly-eval-last-expression :wk "Slime eval last expression")
	    "sd" '(sly-eval-defun :wk "Slime eval defun"))
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
	;;(setq centaur-tabs--buffer-show-groups t)
    :bind
	("C-<prior>" . centaur-tabs-backward)
	("C-<next>" . centaur-tabs-forward))

;; CONFIG MY ORG MODE
(use-package org
  :config
    (setq org-ellipsis " ⤵")
    ;; Org Agenda
    (setq org-agenda-files '("~/Org" "~/Desktop/SRS"))
    (setq org-agenda-start-with-log-mode t)
    (setq org-log-done 'time)
    (setq org-priority-faces '((65 :foreground "#ff5555")
			    (66 :foreground "#f1fa8c")
			    (67 :foreground "#50fa7b")))
    ;; in this case I'm logging TODO and DONE states
    (setq org-todo-keywords
	'((sequence "TODO(t!)" "NEXT(n)" "WAIT(w)" "|" "DONE(d!)" "CANC(c!)")))
    ;; I prefer to log TODO creation also
    (setq org-treat-insert-todo-heading-as-state-change nil)
    ;; Change name of tasks on org-agenda
    ;;(setq org-agenda-prefix-format '(
	;;(agenda  . " • %-10T%?-12t% s"))) ;; file name + org-agenda-entry-type
	;;(agenda  . "  • %T %?-12t % s")))
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
    :init (setq org-habit-graph-column 60)
    :config
    (org-habit-toggle-habits)
    (setq org-habit-show-habits-only-for-today t)
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
    :init (rainbow-delimiters-mode))

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

;; More functions for ivy show description
(use-package ivy-rich
  :ensure t
  :config (ivy-rich-mode 1))

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

;; Terminal emulator
(use-package vterm
    :ensure t)

;; Complete Anything
;; Using this we don't need anymore auto-complete package
(use-package company
    :ensure t
    :init (global-company-mode)
    :config
	(setq company-minimum-prefix-length 2)
	;; Be careful - Change color of company pop up
	(custom-set-faces
	 '(company-tooltip ((t (:background "#111" :foreground "#fff"))))
	 '(company-tooltip-selection ((t (:background "#444")))))
    :bind
    ("C-<return>" . company-complete))

;; treemacs file explorer
(use-package treemacs
  :ensure t)

;; Git
(use-package magit
  :ensure t)

;; LSP config
(use-package lsp-mode
  :ensure t
  :after (java-mode)
  :hook
  (java-mode . lsp))

(use-package lsp-java
  :ensure t
  :init
    (setq lsp-java-java-path "/opt/jdk/jdk-20.0.2/bin/java"))

;; LISP
(use-package sly
  :ensure t
  :init
    (setq inferior-lisp-program "sbcl"))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Set default browser eww
;;(setq browse-url-browser-function 'eww-browse-url)
(setq browse-url-browser-function 'w3m-browse-url)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#000000" "#ff6c60" "#A8FF60" "#FFFFB6" "#96CBFE" "#FF73FD" "#C6C5FE" "#f6f3e8"])
 '(custom-safe-themes
   '("1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" default))
 '(evil-mode t)
 '(exwm-floating-border-color "#5B6268")
 '(fci-rule-color "#5B6268")
 '(highlight-tail-colors
   ((("#101909" "#A8FF60" "green")
     . 0)
    (("#131319" "#C6C5FE" "brightcyan")
     . 20)))
 '(ispell-dictionary nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#96CBFE"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#A8FF60"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(objed-cursor-color "#ff6c60")
 '(package-selected-packages
   '(cmake-mode yasnippet-snippets which-key w3m vterm use-package-chords undo-tree try treemacs-tab-bar sly rainbow-delimiters quickrun projectile org-super-agenda org-habit-stats org-drill org-bullets neotree magit lsp-ui lsp-java ivy-rich helm-swoop helm-lsp helm-descbinds general flycheck exec-path-from-shell evil-org evil-collection eglot doom-themes counsel company centaur-tabs auto-complete all-the-icons))
 '(pdf-view-midnight-colors (cons "#f6f3e8" "#000000"))
 '(rustic-ansi-faces
   ["#000000" "#ff6c60" "#A8FF60" "#FFFFB6" "#96CBFE" "#FF73FD" "#C6C5FE" "#f6f3e8"])
 '(vc-annotate-background "#000000")
 '(vc-annotate-color-map
   (list
    (cons 20 "#A8FF60")
    (cons 40 "#c5ff7c")
    (cons 60 "#e2ff99")
    (cons 80 "#FFFFB6")
    (cons 100 "#f7ea9a")
    (cons 120 "#f0d57e")
    (cons 140 "#E9C062")
    (cons 160 "#f0a695")
    (cons 180 "#f78cc9")
    (cons 200 "#FF73FD")
    (cons 220 "#ff70c8")
    (cons 240 "#ff6e94")
    (cons 260 "#ff6c60")
    (cons 280 "#cf615a")
    (cons 300 "#9f5855")
    (cons 320 "#6f4e4f")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
