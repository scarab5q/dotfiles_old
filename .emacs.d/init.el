
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


;
; evil packages
;

(straight-use-package 'evil)


; evil org mode
(straight-use-package 'evil-org)

; evil magit
(straight-use-package 'evil-magit)

; commenting with evil
(straight-use-package 'evil-commentary)
(straight-use-package 'evil-surround)

; finding bugs
(straight-use-package 'bug-hunter)

; golden-ratio
(straight-use-package 'golden-ratio)

; centered cursor
(straight-use-package 'centered-cursor-mode)

; linting
(straight-use-package 'flycheck)

; keybindings
(straight-use-package 'general)

(straight-use-package 'magit)
(straight-use-package 'company)
(straight-use-package 'company-lsp)

;; TODO look up snails !
;; (straight-use-package 'snails)

;; its like helm but less excessive
(straight-use-package 'ivy)
(straight-use-package 'counsel)
(straight-use-package 'swiper)

; Snippets
(straight-use-package 'yasnippet-snippets)
(straight-use-package 'auto-yasnippet)
(straight-use-package 'yasnippet)

;; lisp / scheme / clojure development
(straight-use-package 'clojure-mode)
(straight-use-package 'cider)
(straight-use-package 'slime)

;; shows what keys can come next
(straight-use-package 'which-key)
(straight-use-package 'linum-relative)
(straight-use-package 'imenu)
(straight-use-package 'neotree)


(straight-use-package 'highlight-indent-guides)

(straight-use-package 'org-projectile)
(straight-use-package 'projectile)

(straight-use-package 'swiper)

; buffer / window management
(straight-use-package 'avy)
(straight-use-package 'ace-window)
(straight-use-package 'hydra)




;;  ____            _        ____       _   _   _
;; | __ )  __ _ ___(_) ___  / ___|  ___| |_| |_(_)_ __   __ _ ___
;; |  _ \ / _` / __| |/ __| \___ \ / _ \ __| __| | '_ \ / _` / __|
;; | |_) | (_| \__ \ | (__   ___) |  __/ |_| |_| | | | | (_| \__ \
;; |____/ \__,_|___/_|\___| |____/ \___|\__|\__|_|_| |_|\__, |___/
;;                                                      |___/

;; turns off the bars at the top
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

; use version control
(setq version-control t )


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

(ivy-mode 1)
(counsel-mode)
(setq ivy-display-style 'fancy)
(setq ivy-use-selectable-prompt t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-initial-inputs-alist nil)
(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))


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

; golden ratio
(golden-ratio-mode 1)
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
		select-window-5)))

; semantic-mode
; TODO find out what this actually does

(semantic-mode)

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

;;; --- Packages
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

 "fe" '(:ignore t :which-key "emacs Functions")
 "fed" '(lambda () (interactive) (find-file "~/.emacs.d/emacs.org") :which-key "Open emacs.org")
 "fer" '(lambda () (interactive) 'tangle-init)

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
 "wv" 'evil-split-buffer
 "w;" 'evil-window-vsplit
 )


