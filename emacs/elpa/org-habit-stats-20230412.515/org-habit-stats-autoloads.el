;;; org-habit-stats-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "org-habit-stats" "org-habit-stats.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from org-habit-stats.el

(autoload 'org-habit-stats-update-properties "org-habit-stats" "\
Set stats of habit at point as org properties." t nil)

(autoload 'org-habit-stats-view-habit-at-point "org-habit-stats" "\
Open an org-habit-stats buffer for the habit at point in a file." t nil)

(autoload 'org-habit-stats-view-habit-at-point-agenda "org-habit-stats" "\
Open an org-habit-stats buffer for the habit at point in agenda buffer." t nil)

(autoload 'org-habit-stats-view-next-habit "org-habit-stats" "\
From org-habit-stats buffer, view next habit in file or agenda." t nil)

(autoload 'org-habit-stats-view-previous-habit "org-habit-stats" "\
From org-habit-stats buffer, view previous habit in file or agenda." t nil)

(autoload 'org-habit-stats-exit "org-habit-stats" "\
Kill org-habit-stats buffer and the internal calendar buffer." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-habit-stats" '("org-habit-stats-")))

;;;***

;;;### (autoloads nil nil ("org-habit-stats-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-habit-stats-autoloads.el ends here
