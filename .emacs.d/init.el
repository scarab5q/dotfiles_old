
;;; Code
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;;                  _
;; _ __   __ _  ___| | ____ _  __ _  ___  ___
;;| '_ \ / _` |/ __| |/ / _` |/ _` |/ _ \/ __|
;;| |_) | (_| | (__|   < (_| | (_| |  __/\__ \
;;| .__/ \__,_|\___|_|\_\__,_|\__, |\___||___/
;;|_|                         |___/

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

(use-package exec-path-from-shell)
; (exec-path-from-shell-initialize))

(use-package avy)
(use-package smex)
(use-package imenu)
(use-package rust-mode)
(use-package cargo)
(use-package auto-compile)             ; auto-compile .el files
(use-package jedi)                     ; auto-completion for python
(use-package neotree)


(use-package evil
  :demand t
  :init ;; tweak evil's configuration before loading it
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-integreation t)
  (setq evil-search-wrap t)
  :config ;; tweak evil after loading it

  (dolist (mode '(package-menu-mode
		  flycheck-error-list-mode))
    (add-to-list 'evil-emacs-state-modes mode))
  (evil-mode))

					; evil org mode
(use-package evil-org)

					;(use-package evil-org-agenda)

					; evil magit
(use-package evil-magit)

					; commenting with evil
(use-package evil-commentary)
(use-package evil-surround)

					; finding bugs
(use-package bug-hunter)

					; golden-ratio
(use-package golden-ratio
  :ensure t
  :diminish golden-ratio-mode
  :init
  :config
  (setq golden-ratio-auto-scale t)
  (setq golden-ratio-extra-commands
	(append golden-ratio-extra-commands
		'(ace-window
		  evil-window-left
		  evil-window-right
		  evil-window-up
		  evil-window-down
		  select-window-1
		  select-window-2
		  select-window-3
		  select-window-4
		  select-window-5))))

					; centered cursor
(use-package centered-cursor-mode)

					; linting
(use-package flycheck)
(flycheck-mode)
(global-flycheck-mode 1)

					; keybindings
(use-package general)

(use-package magit)
(use-package company)
(use-package company-lsp)

;; TODO look up snails !
;; (use-package snails)

;; its like helm but less excessive
(use-package ivy)
(use-package counsel)
(use-package swiper)

					; Snippets
(use-package yasnippet-snippets)
(use-package auto-yasnippet)
(use-package yasnippet)

;; lisp / scheme / clojure development
(use-package clojure-mode)
(use-package cider)
(use-package slime)

;; shows what keys can come next
(use-package which-key)
(which-key-mode)

(use-package linum-relative
  :ensure t
  :config
  (setq linum-relative-current-symbol ""))
(use-package imenu)
(use-package neotree)


(use-package highlight-indent-guides)

(use-package org-projectile)
(use-package projectile)

(use-package swiper)

					; buffer / window management
(use-package avy)
(use-package ace-window)
(use-package hydra)




;;  ____            _        ____       _   _   _
;; | __ )  __ _ ___(_) ___  / ___|  ___| |_| |_(_)_ __   __ _ ___
;; |  _ \ / _` / __| |/ __| \___ \ / _ \ __| __| | '_ \ / _` / __|
;; | |_) | (_| \__ \ | (__   ___) |  __/ |_| |_| | | | | (_| \__ \
;; |____/ \__,_|___/_|\___| |____/ \___|\__|\__|_|_| |_|\__, |___/
;;                                                      |___/

(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )				                                ; don't ask for confirmation when opening symlinked file

(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) )      ;transform backups file name

(setq inhibit-startup-screen t )	                  ; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	                  ; silent bell when you make a mistake
;; turns off the bars at the top
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

					; use version control
(setq version-control t )

					; TODO find out what this does
(electric-quote-mode 1)
(electric-indent-mode 1)

;; white space
(setq show-trailing-whitespace t)

;; scrolling settings
(setq scroll-step           1
      scroll-conservatively 10000)

(setq aw-minibuffer-flag t)
;; (set-face-attribute
;;   'aw-leading-char-face nil
;;   :foreground "deep sky blue"
;;   :weight 'bold
;;   :height 3.0)
;; (set-face-attribute
;;   'aw-mode-line-face nil
;;   :inherit 'mode-line-buffer-id
;;   :foreground "lawn green")
(setq aw-keys '(?a ?s ?d ?f ?j ?k ?l)
      aw-dispatch-always t
      aw-dispatch-alist
      '((?x aw-delete-window "Ace - Delete Window")
	(?c aw-swap-window "Ace - Swap Window")
	(?n aw-flip-window)
	(?v aw-split-window-vert "Ace - Split Vert Window")
	(?h aw-split-window-horz "Ace - Split Horz Window")
	(?m delete-other-windows "Ace - Maximize Window")
	(?g delete-other-windows)
	(?b balance-windows)
	(?u (lambda ()
	      (progn
		(winner-undo)
		(setq this-command 'winner-undo))))
	(?r winner-redo))
      )

;; (when (package-installed-p 'hydra)
;; (defhydra hydra-window-size (:color red)
;;   "Windows size"
;;   ("h" shrink-window-horizontally "shrink horizontal")
;;   ("j" shrink-window "shrink vertical")
;;   ("k" enlarge-window "enlarge vertical")
;;   ("l" enlarge-window-horizontally "enlarge horizontal"))
;; (defhydra hydra-window-frame (:color red)
;;   "Frame"
;;   ("f" make-frame "new frame")
;;   ("x" delete-frame "delete frame"))
;; (defhydra hydra-window-scroll (:color red)
;;   "Scroll other window"
;;   ("n" joe-scroll-other-window "scroll")
;;   ("p" joe-scroll-other-window-down "scroll down"))
;; (add-to-list 'aw-dispatch-alist '(?w hydra-window-size/body) t)
;; (add-to-list 'aw-dispatch-alist '(?o hydra-window-scroll/body) t)
;; (add-to-list 'aw-dispatch-alist '(?\; hydra-window-frame/body) t))
(ace-window-display-mode t)

					; Linting
(global-flycheck-mode 1)

					; centered cursor mode
(centered-cursor-mode)
(global-centered-cursor-mode +1)

(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )				                                ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) )      ;transform backups file name
(setq inhibit-startup-screen t )	                  ; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	                  ; silent bell when you make a mistake


					; ivy
(use-package ivy
  :ensure t
  :demand t
  :config
  (setq ivy-display-style 'fancy)
  (setq ivy-use-selectable-prompt t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-re-builders-alist
	'((t . ivy--regex-fuzzy))))

(ivy-mode 1)
(counsel-mode)


(setq
 yas-verbosity 1                      ; No need to be so verbose
 yas-wrap-around-region t)

					; Evil
(evil-mode)
(evil-commentary-mode)
(setq evil-search-module 'evil-search)
(setq evil-ex-complete-emacs-commands nil)
(setq evil-vsplit-window-right t)
(setq evil-split-window-below t)
(setq evil-want-C-u-scroll t)
(setq evil-want-integreation t)
(setq evil-search-wrap t)

					; centered-cursor
(centered-cursor-mode)


					; semantic-mode
					; TODO find out what this actually does

(semantic-mode)

					; documentation and function hints
(eldoc-mode)

					; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
	  treemacs-deferred-git-apply-delay      0.5
	  treemacs-directory-name-transformer    #'identity
	  treemacs-display-in-side-window        t
	  treemacs-eldoc-display                 t
	  treemacs-file-event-delay              5000
	  treemacs-file-extension-regex          treemacs-last-period-regex-value
	  treemacs-file-follow-delay             0.2
	  treemacs-file-name-transformer         #'identity
	  treemacs-follow-after-init             t
	  treemacs-git-command-pipe              ""
	  treemacs-goto-tag-strategy             'refetch-index
	  treemacs-indentation                   2
	  treemacs-indentation-string            " "
	  treemacs-is-never-other-window         nil
	  treemacs-max-git-entries               5000
	  treemacs-missing-project-action        'ask
	  treemacs-no-png-images                 nil
	  treemacs-no-delete-other-windows       t
	  treemacs-project-follow-cleanup        nil
	  treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
	  treemacs-position                      'left
	  treemacs-recenter-distance             0.1
	  treemacs-recenter-after-file-follow    nil
	  treemacs-recenter-after-tag-follow     nil
	  treemacs-recenter-after-project-jump   'always
	  treemacs-recenter-after-project-expand 'on-distance
	  treemacs-show-cursor                   nil
	  treemacs-show-hidden-files             t
	  treemacs-silent-filewatch              nil
	  treemacs-silent-refresh                nil
	  treemacs-sorting                       'alphabetic-asc
	  treemacs-space-between-root-nodes      t
	  treemacs-tag-follow-cleanup            t
	  treemacs-tag-follow-delay              1.5
	  treemacs-user-mode-line-format         nil
	  treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
		 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  ;; :bind
  ;; (:map global-map
  ;;       ("M-0"       . treemacs-select-window)
  ;;       ("C-x t 1"   . treemacs-delete-other-windows)
  ;;       ("C-x t t"   . treemacs)
  ;;       ("C-x t B"   . treemacs-bookmark)
  ;;       ("C-x t C-t" . treemacs-find-file)
  ;;       ("C-x t M-t" . treemacs-find-tag)))

  (use-package treemacs-evil
    :after treemacs evil
    :ensure t)

  (use-package treemacs-projectile
    :after treemacs projectile
    :ensure t)

  (use-package treemacs-icons-dired
    :after treemacs dired
    :ensure t
    :config (treemacs-icons-dired-mode))

  (use-package treemacs-magit
    :after treemacs magit
    :ensure t)

  (use-package treemacs-persp
    :after treemacs persp-mode
    :ensure t
    :config (treemacs-set-scope-type 'Perspectives))

					; Org Mode
  (setq org-src-tab-acts-natively t)
  (setq org-todo-keywords
	'((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "PROJECT(p)" "SOMEDAY(s)"  "|" "DONE(d)" "CANCELLED(c)")))
  (setq org-todo-keyword-faces
	'(
	  ("TODO" :foreground "orange" :background "nil" :weight bold)
	  ("NEXT" :foreground "white" :background "red" :weight bold)
	  ("WAITING" :foreground "yellow" :background "black")
	  ("PROJECT" :foreground "white" :background "purple")
	  ("SOMEDAY" :foreground "white" :background "dark blue" :weight bold)
	  ("DONE" :foreground "white" :background "dark green" :weight bold)
	  ("CANCELLED" :foreground "white" :background "nil")
	  )
	)
  (setq org-agenda-files (list "~/Dropbox/orgNotes/inbox.org"
			       "~/Dropbox/orgNotes/uni.org"
			       "~/Dropbox/orgNotes/gtg.org"
			       "~/Dropbox/orgNotes/someday.org"
			       "~/Dropbox/orgNotes/calendar.org"))

  (setq org-refile-targets '(("~/Dropbox/orgNotes/gtg.org" :maxlevel . 3)
			     ("~/Dropbox/orgNotes/someday.org" :level . 1)
			     ("~/Dropbox/orgNotes/calendar.org" :maxlevel . 2)))

  (setq org-capture-templates '(("t" "Todo [inbox]" entry (file+headline "~/Dropbox/orgNotes/inbox.org" "Tasks") "* TODO %i%?")
				("c" "Calendar" entry (file "~/Dropbox/orgNotes/calendar.org") "* %i%? \n %U")
				("I" "Idea [someday]" entry (file+headline "~/Dropbox/orgNotes/someday.org" "Idea") "* SOMEDAY %i%?")))

  (setq org-agenda-diary-file "~/Dropbox/orgNotes/diary.org")

  (use-package org-pomodoro
    :ensure t)

  (use-package org-projectile
    ;; :bind (("C-c n p" . org-projectile-project-todo-completing-read)
    ;; 	 ("C-c c" . org-capture))
    :ensure t
    :config
    (progn
      (setq org-projectile-projects-file
	    "/your/path/to/an/org/file/for/storing/projects.org")
      (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
      (push (org-projectile-project-todo-entry) org-capture-templates))
    :ensure t)


  (use-package alert
    :ensure t)
  (use-package request
    :ensure t)

  (use-package toc-org
    :after org
    :init (add-hook 'org-mode-hook #'toc-org-enable))


					; Evil Org Mode
  (setq org-src-preserve-indentation t)
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
	    (lambda ()
	      (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;;  _              _     _           _ _
;; | | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___
;; | |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|
;; |   <  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \
;; |_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
;;           |___/                             |___/


;; Basic Keys

					; TODO - what does general-evil-setup
(general-evil-setup t)

(general-define-key

 :states '(normal emacs motion )
 :keymaps 'override
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "" nil

 "SPC" 'counsel-M-x

 "0" 'neotree
 "!" 'eshell

 "a" '(:ignore t :which-key "applications")

 ;; "ar" 'ranger
 ;; "aw" 'ace-window

 "ao" '(:ignore t :which-key "org")
 "aoc" 'org-capture
 "aoa" 'org-agenda

;;; --- Errors
 "e" '(:ignore t :which-key "errors")

 "el" 'flycheck-list-errors
 "en" 'flycheck-next-error
 "ep" 'flycheck-previous-error

;;;; --- Files
 "f"  '( :ignore t :which-key "files")
 "fs" 'save-buffer
 "ff" 'counsel-find-file
 "fr" 'counsel-recentf
 "fz" 'counsel-fzf
 "fR" 'rename-buffer
kkk
 "fe" '(:ignore t :which-key "emacs Functions")
 "fed" '(lambda () (interactive) (find-file "~/.emacs.d/init.el") :which-key "Open init.el")
 "fer" '(lambda () (interactive) ')

;;; --- Git
 "g" '(:ignore t :which-key "Git")
 "gs" 'magit-status
 "gc" '(:ignore t :which-key "magit commit")
 "gcc" '( (lambda () (interactive) (magit-stage-modified) (magit-commit-create) :which-key "commit all"))

;;; --- Help
 "h" (general-simulate-key "C-h" :which-key "help")
 ;; "hb" 'counsel-descbinds
 ;; "hv" 'counsel-describe-variable
 ;; "hf" 'counsel-describe-function

;;; --- jump
 "j" '(:ignore t :which-key "jump")
 "jj" 'avy-goto-char
 "jc" 'avy-goto-char-2
 "jl" 'avy-goto-line
 "jw" 'avy-goto-word-1

 "t" '(:ignore t :which-key "toggles")
 "tr" 'linum-relative-toggle

 "m" '(:ignore t :major-modes t)

 "M" '(which-key-show-minor-mode-keymap :which-key "Minor mode")

 "o" '(:ignore t :which-key "org")
 "oe" (general-simulate-key "C-c '":which-key "toggle org-src-edit" )

;;; --- Packages
 "P" '(:ignore t :which-key "Packages")
 "Pl" 'package-list-packages

 "s" '(:ignore t :which-key "search")
 "sa" 'counsel-ag
 "sc" 'evil-ex-nohighlight
 "ss" 'swiper

 ;; --- ivy /

 ;; --- Windows
 "w" '(:ignore t :which-key "windows")
 "wa" 'ace-window
 "wd" 'ace-delete-window
 "wx" 'kill-buffer-and-window
 "wh" 'evil-window-left
 "wH" 'evil-window-move-far-left
 "wj" 'evil-window-down
 "wJ" 'evil-window-move-very-bottom
 "wk" 'evil-window-up
 "wK" 'evil-window-move-very-top
 "wl" 'evil-window-right
 "wv" 'evil-window-vsplit
 "w;" 'evil-split-buffer
 )


