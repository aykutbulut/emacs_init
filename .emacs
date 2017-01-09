;;(setq column-number-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; go mode, not installed yet
;;(setq load-path (cons "/home/aykut/opt/go/misc/emacs" load-path))
;;(require 'go-mode-load)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ===== Set the highlight current line minor mode =====
;; In every buffer, the line which contains the cursor will be fully
;; highlighted
;;(global-hl-line-mode t)

;; ========== Prevent Emacs from making backup files ==========
(setq make-backup-files nil)

;; emacs color themes
;;(add-to-list 'load-path "~/.emacs.d/lisp/")
;; (require 'color-theme)
;; (color-theme-initialize)
;;(color-theme-retro-green &optional COLOR FUNC)
;;(color-theme-calm-forest)
;;(color-theme-charcoal-black)
;;(color-theme-clarity)
;;(color-theme-classic)
;;(color-theme-comidia)
;;(color-theme-dark-blue2)
;;(color-theme-dark-laptop)
;;(color-theme-euphoria)
;;(color-theme-gnome2)
;;(color-theme-hober &optional PREVIEW)
;;(color-theme-infodoc)
;;(color-theme-lawrence)
;;(color-theme-oswald)
;;(color-theme-subtle-hacker)
;;(color-theme-taming-mr-arneson)
;;(color-theme-tty-dark)


(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format (cond
		 ((not prefix) "%m/%d/%Y")
		 ((equal prefix '(4)) "%Y-%m-%d")
		 ((equal prefix '(16)) "%A, %d. %B %Y")))
	(system-time-locale "de_DE"))
    (insert (format-time-string format))))

(global-set-key (kbd "C-c d") 'insert-date)

;; package repos
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
;; package repos
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "https://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa.org/packages/")))

;; (require 'package)
;; (add-to-list 'package-archives
;;	     '("melpa" . "http://melpa.org/packages/") t)


(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;;(set-face-background 'default "black")
;;(set-face-foreground 'default "blue")

(setq-default fill-column 79)
;; font size
(set-face-attribute 'default nil :height 100)

;; encription for e-mails
(require 'epa-file)
(epa-file-enable)

;; To automatically fill comments but not code in ProgrammingModes
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (auto-fill-mode 1)
	    (set (make-local-variable 'fill-nobreak-predicate)
		 (lambda ()
		   (not (eq (get-text-property (point) 'face)
			    'font-lock-comment-face))))))


(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
