;;; quickrun-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "quickrun" "quickrun.el" (0 0 0 0))
;;; Generated autoloads from quickrun.el

(autoload 'quickrun-set-default "quickrun" "\
Set `key' as default key in programing language `lang'.

\(fn LANG KEY)" nil nil)

(autoload 'quickrun-select-default "quickrun" "\
Update the default." t nil)

(autoload 'quickrun-add-command "quickrun" "\
Not documented.

\(fn KEY ALIST &key DEFAULT MODE OVERRIDE)" nil nil)

(function-put 'quickrun-add-command 'lisp-indent-function 'defun)

(autoload 'quickrun "quickrun" "\
Run commands quickly for current buffer.

With universal prefix argument(C-u), select command-key,
With double prefix argument(C-u C-u), run in compile-only-mode.

\(fn &rest PLIST)" t nil)

(autoload 'quickrun-select "quickrun" "\
Run commands after selecting the backend." t nil)

(autoload 'quickrun-with-arg "quickrun" "\
Run commands quickly for current buffer with arguments.

\(fn ARG)" t nil)

(autoload 'quickrun-region "quickrun" "\
Run commands with specified region.

\(fn START END)" t nil)

(autoload 'quickrun-replace-region "quickrun" "\
Run commands with specified region and replace.

\(fn START END)" t nil)

(autoload 'quickrun-eval-print "quickrun" "\
Run commands with specified region and replace.

\(fn START END)" t nil)

(autoload 'quickrun-compile-only "quickrun" "\
Exec only compilation." t nil)

(autoload 'quickrun-compile-only-select "quickrun" "\
Run commands after selecting the backend." t nil)

(autoload 'quickrun-shell "quickrun" "\
Run commands in shell for interactive programs." t nil)

(autoload 'quickrun-autorun-mode "quickrun" "\
`quickrun' after saving buffer.

If called interactively, enable Quickrun-Autorun mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'anything-quickrun "quickrun" "\
Run quickrun with `anything'." t nil)

(autoload 'helm-quickrun "quickrun" "\
Run quickrun with `helm'." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "quickrun" '("helm-quickrun-" "quick")))

;;;***

;;;### (autoloads nil nil ("quickrun-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; quickrun-autoloads.el ends here
