;;; Essential Emacs configuration
;;; Dominique Béréziat

;; Emacs configuration
;;;;;;;;;;;;;;;;;;;;;;
(tool-bar-mode 0)
(tab-bar-mode 1)
(electric-pair-mode)
(electric-indent-mode)
(column-number-mode)
(global-auto-revert-mode)
(global-unset-key (kbd "C-x C-q"))
(setq inhibit-startup-screen t
      inhibit-startup-buffer-menu t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(setq require-final-newline t)

;; Package configuration
;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq-default package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa-stable" . "https://melpa.org/packages/") t)
(setq-default load-prefer-newer t)
(package-initialize)

;; bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package t))

;; Org-mode configuration
(use-package org
  :init
  (setq org-directory "~/org") ; defaut value
  (setq org-default-notes-file "~/org/notes.org")
  (setq org-agenda-files (file-expand-wildcards "~/org/*.org"))
  (if (not (file-directory-p org-directory))
      (make-directory org-directory))
  :bind (("C-c a" . org-agenda)
	 ("C-c c" . org-capture))
  )

(require 'org-tempo)

(use-package org-modern
  :ensure t
  :init
  (setq org-modern-fold-stars
   '(("◉" . "◉") (" ○" . " ○") ("  ◈" . "  ◈") ("   ◇" . "   ◇")
     ("    ▸" . "    ▾")))
  :config
  (global-org-modern-mode))
(setq org-ellipsis "⤵")

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t)
   (makefile . t)
   (gnuplot . t)
   (perl . t)
   (python . t)
   (C . t)
   (ditaa . t)
   (calc . t)
   (sed . t)
   (matlab . t)
   (ruby . t)
   (julia . t)
   )
 )


;; customize variables in a separate file
(setq custom-file "~/.emacs.d/customize.el")
