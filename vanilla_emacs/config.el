(use-package emacs
  :preface
  (defvar ian/indent-width 4) ; change this value to your preferred width
  (defvar scarab5q/emacs-init-file "~/vanilla_emacs/init.el")
  (defvar scarab5q/emacs-dir "~/vanilla_emacs")
  (defvar scarab5q/hezmoi-source-path (shell-command-to-string "chezmoi source-path"))
  (defvar scarab5q/chezmoi-emacs-dir(shell-command-to-string( concat "chezmoi source-path" scarab5q/emacs-dir)))
  (defvar scarab5q/chezmoi-emacs-init-file (shell-command-to-string(concat "chezmoi source-path " scarab5q/emacs-init-file)))
  :config
  (setq frame-title-format '("sweet ~")
        ring-bell-function 'ignore       ; minimise distraction
        frame-resize-pixelwise t
        default-directory scarab5q/chezmoi-emacs-dir)
  (tool-bar-mode -1)
  (menu-bar-mode -1)

  ;; make if functions indent correctly
  ;; (put 'if 'lisp-indent-form nil)

  ;; better scrolling experience
  (setq scroll-margin 0
        scroll-conservatively 101 ;
        scroll-preserve-screen-position t
        auto-window-vscroll nil)

  ;; Always use spaces for indentation
  (setq-default indent-tabs-mode nil
                tab-width ian/indent-width))

(defun my-ido-find-dired ()
  "Find a recent directory using Ido."
  (interactive)
  (let ((dir (ido-completing-read
              "Choose recent directory: "
              (delete-dups (mapcar  'file-name-directory recentf-list)) nil t)))
    (when dir
      (find-file dir))))

(defun my-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(defun chezmoi-load-init ()
    (interactive)
  "checks to see  if the source and destination of chezmoi are in sync, if they are in sync then it loads the file if not then it asks if the user want's to stay get in synand then loads the file "
  (if (= 1 (shell-command "chezmoi verify"))
      ( if (y-or-n-p "You haven't chezmoi apply-ed do you want to do that ? ")
          (progn
            (shell-command "chezmoi apply")
            (load-file scarab5q/emacs-init-file))
          (progn
            (messges "chezmoi not applied")
            (if (y-or-n-p "Do you want to load init.el anyway ? ")
                (load-file "~/.config/emacs/init.el")
                (messages "init.el not loaded"))))
      (load-file( "/vanilla_emacs/init.el"))))

(display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(setq bookmark-default-file "~/.emacs.d/bookmarks")  ;;define file to use.
(setq bookmark-save-flag 1)  ;save bookmarks to .emacs.bmk after each entry

(use-package "startup"
  :ensure nil
  :config (setq inhibit-startup-screen t))

(use-package delsel
  :ensure nil
  :config (delete-selection-mode +1))

(use-package scroll-bar
  :ensure nil
  :config (scroll-bar-mode -1))

(use-package simple
  :ensure nil
  :config (column-number-mode +1))

(use-package "window"
  :ensure nil
  :preface
  (defun ian/split-and-follow-horizontally ()
    "Split window below."
    (interactive)
    (split-window-below)
    (other-window 1))
  (defun ian/split-and-follow-vertically ()
    "Split window right."
    (interactive)
    (split-window-right)
    (other-window 1))
  :config
  (global-set-key (kbd "C-x 2") #'ian/split-and-follow-horizontally)
  (global-set-key (kbd "C-x 3") #'ian/split-and-follow-vertically))

(use-package files
  :ensure nil
  :config
  (setq confirm-kill-processes nil
        create-lockfiles nil ; don't create .# files (crashes 'npm start')
        make-backup-files nil))

;; (use-package autorevert
;;   :hook (after-init . global-auto-revert-mode)
;;   :config
;;   (setq auto-revert-interval 0.1
;;         auto-revert-verbose nil
;;         global-auto-revert-non-file-buffers t))
;; (use-package autorevert
;;   :ensure nil
;;   :config
;;   (global-auto-revert-mode +1)
;;   (setq auto-revert-interval 2
;;         auto-revert-check-vc-info t
;;         global-auto-revert-non-file-buffers t
;;         auto-revert-verbose nil))

(use-package eldoc
  :ensure nil
  :diminish eldoc-mode
  :config
  (setq eldoc-idle-delay 0.4))

;; C, C++, and Java
(use-package cc-vars
  :ensure nil
  :config
  (setq-default c-basic-offset ian/indent-width)
  (setq c-default-style '((java-mode . "java")
                          (awk-mode . "awk")
                          (other . "k&r"))))

;; Python (both v2 and v3)
(use-package python
  :ensure nil
  :config (setq python-indent-offset ian/indent-width))

(use-package mwheel
  :ensure nil
  :config (setq mouse-wheel-scroll-amount '(2 ((shift) . 1))
                mouse-wheel-progressive-speed nil))

(use-package paren
  :ensure nil
  :init (setq show-paren-delay 0)
  :config (show-paren-mode +1))

(use-package frame
  :preface
  (defun ian/set-default-font ()
    (interactive)
    (when (member "Consolas" (font-family-list))
      (set-face-attribute 'default nil :family "Consolas"))
    (set-face-attribute 'default nil
                        :height 120
                        :weight 'normal))
  :ensure nil
  :config
  (setq initial-frame-alist '((fullscreen . maximized)))
  (ian/set-default-font))

(use-package ediff
  :ensure nil
  :config
  (setq ediff-window-setup-function #'ediff-setup-windows-plain)
  (setq ediff-split-window-function #'split-window-horizontally))

(use-package elec-pair
  :ensure nil
  :hook (prog-mode . electric-pair-mode))

(use-package whitespace
  :ensure nil
  :hook (before-save . whitespace-cleanup))

(use-package dired
  :ensure nil
  :config
  (setq delete-by-moving-to-trash t)
  (eval-after-load "dired"
    #'(lambda ()
        (put 'dired-find-alternate-file 'disabled nil)
        (define-key dired-mode-map (kbd "RET") #'dired-find-alternate-file))))

(use-package cus-edit
  :ensure nil
  :config
  (setq custom-file (concat user-emacs-directory "to-be-dumped.el")))

(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/"))
(load-theme 'wilmersdorf t) ; an orginal theme created by me.

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo
        dashboard-banner-logo-title "Welcome Back Jack"
        dashboard-items nil
        dashboard-set-footer nil))

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

(use-package highlight-escape-sequences
  :hook (prog-mode . hes-mode))

(use-package evil
  :diminish undo-tree-mode
  :init
  (setq evil-want-C-u-scroll t
        evil-want-keybinding nil
        evil-shift-width ian/indent-width)
  :hook (after-init . evil-mode)
  :preface
  (defun ian/save-and-kill-this-buffer ()
    (interactive)
    (save-buffer)
    (kill-this-buffer))
  :config
  (with-eval-after-load 'evil-maps ; avoid conflict with company tooltip selection
    (define-key evil-insert-state-map (kbd "C-n") nil)
    (define-key evil-insert-state-map (kbd "C-p") nil))
  (evil-ex-define-cmd "q" #'kill-this-buffer)
  (evil-ex-define-cmd "wq" #'ian/save-and-kill-this-buffer))

(use-package general
  :config
  (general-evil-setup t)


  (general-create-definer scarab5q/normal-mode-map
    :keymaps 'normal)

  (general-create-definer scarab5q/leader-key-def
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (general-create-definer scarab5q/major-mode-key-def
    :prefix "SPC m"
    :non-normal-prefix "C-SPC m")

  (general-create-definer dw/ctrl-c-keys
    :prefix "C-c"))

(scarab5q/leader-key-def
  "SPC" 'counsel-find-file

  ":" 'pp-eval-expression
  ";" 'execute-extended-command
  "0" 'dired
  "!" 'term ;; TODO fix terminal colours and stuff
            ;; this may help
            ;; https://unix.stackexchange.com/questions/111541/passing-escape-sequences-to-shells-within-ansi-term-in-emacs

  "a" '(:ignore t :which-key "applications")
  "ao" '(:ignore t :which-key "org")
  "aoc" 'org-capture
  "aoa" 'org-agenda

  "b" '(:ignore t :which-key "buffers")
  "bk" 'kill-current-buffer
  "bd" 'kill-buffer
  "bb" 'switch-buffer



  ;; - Errors
  "e" '(:ignore t :which-key "errors")

  "el" 'flycheck-list-errors
  "en" 'flycheck-next-error
  "ep" 'flycheck-previous-error

  ;; -- Files
  "f"  '( :ignore t :which-key "files")
  "fb" '( :ignore t :which-key "bookmarks")
  "fbb" 'bookmark-jump
  "fd" 'my-ido-find-dired

  "fe" '(:ignore t :which-key "emacs Functions")
  "fed" '(lambda () (interactive) (find-file (concat scarab5q/chezmoi-source-path "/vanilla_emacs/config.org")) :which-key "Open config.org")
  "fer" 'chezmoi-load-init


  "ff" 'find-file
  "fr" 'my-ido-find-file
  "fR" 'rename-buffer
  "fs" 'save-buffer
  ;; "fz" '-fzf

  ;; -- Git
  "g" '(:ignore t :which-key "git")
  "gs" 'magit-status
  "gc" '(:ignore t :which-key "magit commit")
  "gcc" '( (lambda () (interactive) (magit-stage-modified) (magit-commit-create) :which-key "commit all"))

  ;; -- Help
  "h" (general-simulate-key "C-h" :which-key "help")
  ;; "hb" 'counsel-descbinds
  ;; "hv" 'counsel-describe-variable
  ;; "hf" 'counsel-describe-function

  ;; -- jump
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


  ;; --- Window s
  "w" '(:ignore t :which-key "windows")
  "wa" 'ace-window
  "wd" 'evil-window-delete
  "wx" 'kill-buffer-and-window
  "wh" 'evil-window-left
  "wH" 'evil-window-move-far-left
  "wj" 'evil-window-down
  "wJ" 'evil-window-move-very-bottom
  "wk" 'evil-window-up
  "wK" 'evil-window-move-very-top
  "wl" 'evil-window-right
  "wv" 'evil-window-vsplit
  "w;" 'evil-split-buffer)
         ;;



(scarab5q/normal-mode-map
  ";" 'evil-ex
  ":" 'evil-repeat-find-char
  "L" 'evil-end-of-line
  "H" 'evil-beginning-of-line
  "Q" 'evil-execute-macro)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-company-use-tng nil)
  (evil-collection-init))

(use-package evil-commentary
  :after evil
  :diminish
  :config (evil-commentary-mode +1))

(use-package projectile
  :diminish projectile-mode
  :init
  :custom
  (setq projectile-keymap-prefix (kbd "C-c C-p"))
  :config
  (projectile-global-mode)
  (scarab5q/leader-key-def
    "p" '(projectile-keymap-prefix :which-key "projectile")
    "ps" 'projectile-save-project-buffers
    "pp" 'projectile-switch-project
    "pf" 'projectile-find-file
    "pd" 'projectile-dired
    "pr" 'projectile-ripgrep))

(use-package magit
  :bind ("C-x g" . magit-status)
  :config (add-hook 'with-editor-mode-hook #'evil-insert-state))
(use-package magit-todos
  :config
  (magit-todos-mode)  )

(use-package ido
  :config
  (ido-mode +1)
  (setq ido-use-virtual-buffers t)

  ;; ; temporary replacement for ido-vertical
  ;; (if (version< emacs-version "25")
  ;;     (progn
  ;;       (make-local-variable 'ido-separator)
  ;;       (setq ido-separator "\n"))
  ;;   (progn
  ;;     (make-local-variable 'ido-decorations)
  ;;     (setf (nth 2 ido-decorations) "\n")))

  (setq ido-everywhere t
        ido-enable-flex-matching t))

;; BUG against Emacs 27.1: temporary disable and use above snippet instead
(use-package ido-vertical-mode
  :config
  (ido-vertical-mode +1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down))

(use-package ido-completing-read+ :config (ido-ubiquitous-mode +1))

(use-package flx-ido :config (flx-ido-mode +1))
(use-package amx :config (amx-mode 1))

(use-package ido
  :config
  (ido-mode +1)
  (setq ido-use-virtual-buffers t)

  ;; ; temporary replacement for ido-vertical
  ;; (if (version< emacs-version "25")
  ;;     (progn
  ;;       (make-local-variable 'ido-separator)
  ;;       (setq ido-separator "\n"))
  ;;   (progn
  ;;     (make-local-variable 'ido-decorations)
  ;;     (setf (nth 2 ido-decorations) "\n")))

  (setq ido-everywhere t
        ido-enable-flex-matching t))

;; BUG against Emacs 27.1: temporary disable and use above snippet instead
(use-package ido-vertical-mode
  :config
  (ido-vertical-mode +1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down))

(use-package ido-completing-read+ :config (ido-ubiquitous-mode +1))

(use-package flx-ido :config (flx-ido-mode +1))
(use-package amx :config (amx-mode 1))

(use-package ripgrep)

(use-package company
  :diminish company-mode
  :hook (prog-mode . company-mode)
  :config
  (global-company-mode)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-frontends '(company-pseudo-tooltip-frontend ; show tooltip even for single candidate
                            company-echo-metadata-frontend))
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)))

(use-package flycheck :config (global-flycheck-mode +1))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package org
  :config
  (setq org-src-tab-acts-natively t)
  (scarab5q/leader-key-def
    "o" '(:ignore :which-key "Org mode")

    "ao" '(:ignore t :which-key "org application")

    "aoc" 'org-capture
    "aoa" 'org-agenda)

  (scarab5q/major-mode-keymap
   :keymap 'org-mode-map
   :wk-full-keys nil

   "" '(:ignore :which-key "org mode")
   "ee" 'org-edit-special )

  :hook '((org-mode . visual-line-mode)
          (org-mode . org-indent-mode)))


(use-package org-bullets :hook (org-mode . org-bullets-mode))

(use-package lispy
  :init
  (setq lispy-key-theme '(oleh special lispy c-digits))
  :config
    (setq lispy-no-permanent-semantic t)
    (setq lispy-delete-backward-recenter nil)
    (setq lispy-helm-columns '(70 100))
    ()
    (setq lispy-avy-style-symbol 'at-full))


(use-package lispyville
  :init
  (general-add-hook '(emacs-lisp-mode-hook lisp-mode-hook) #'lispyville-mode) :config
  (lispyville-set-key-theme '(operators c-w additional)))

(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode))
  :init
  (add-hook 'clojure-mode-hook #'yas-minor-mode)
  (add-hook 'clojure-mode-hook #'linum-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'smartparens-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'eldoc-mode)
  (add-hook 'clojure-mode-hook #'idle-highlight-mode))

(use-package cider
  :ensure t
  :defer t
  :init (add-hook 'cider-mode-hook #'clj-refactor-mode)
  :diminish subword-mode
  :config
  (setq nrepl-log-messages t
        cider-repl-display-in-current-window t
        cider-repl-use-clojure-font-lock t
        cider-prompt-save-file-on-load 'always-save
        cider-font-lock-dynamically '(macro core function var)
        nrepl-hide-special-buffers t
        cider-overlays-use-font-lock t)
  (cider-repl-toggle-pretty-printing))

(use-package cider-eval-sexp-fu
  :defer t)

(use-package clj-refactor
  :defer t
  :ensure t
  :diminish clj-refactor-mode
  :config (cljr-add-keybindings-with-prefix "C-c C-m"))


(use-package smartparens
  :defer t
  :ensure t
  :diminish smartparens-mode
  :init
  (setq sp-override-key-bindings
        '(("C-<right>" . nil)
          ("C-<left>" . nil)
          ("C-)" . sp-forward-slurp-sexp)
          ("M-<backspace>" . nil)
          ("C-(" . sp-forward-barf-sexp)))
  :config
  (sp-use-smartparens-bindings)
  (sp--update-override-key-bindings)
  :commands (smartparens-mode show-smartparens-mode))

(use-package markdown-mode
  :hook (markdown-mode . visual-line-mode))

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
         ("\\.css\\'"   . web-mode)
         ("\\.jsx?\\'"  . web-mode)
         ("\\.tsx?\\'"  . web-mode)
         ("\\.json\\'"  . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2) ; HTML
  (setq web-mode-css-indent-offset 2)    ; CSS
  (setq web-mode-code-indent-offset 2)   ; JS/JSX/TS/TSX
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))))

(use-package diminish
  :demand t)

(recentf-mode 1)
(setq
 recentf-exclude '(".*_flymake.*" ".ftp:.*" ".sudo:.*" "~/.emacs.d/tmp/*")
 recentf-keep '(file-remote-p file-readable-p)
 recentf-max-saved-items 100  ; this was set to 500, and things were slow
 recentf-save-file "~/vanilla_emacs/save-recentf.el"
 recentf-max-menu-items 25)

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode +1)
  (setq which-key-idle-delay 0.4
        which-key-idle-secondary-delay 0.4))

(use-package exec-path-from-shell
  :config (when (memq window-system '(mac ns x))
            (exec-path-from-shell-initialize)))

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (scarab5q/normal-mode-map
    "u" 'undo-tree-undo
    "U" 'undo-tree-redo)

  (scarab5q/leader-key-def
    "u" 'undo-tree-visualize)

  (scarab5q/normal-mode-map
    :keymaps undo-tree-visualizer-mode-map
    "h"  'undo-tree-visualize-switch-branch-left
    "j"  'undo-tree-visualize-redo
    "k"  'undo-tree-visualize-undo
    "l"  'undo-tree-visualize-switch-branch-right
    "q"  'undo-tree-visualizer-abort))

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (scarab5q/normal-mode-map
    "u" 'undo-tree-undo
    "U" 'undo-tree-redo)

  (scarab5q/leader-key-def
    "s" 'undo-tree-visualize)

  (scarab5q/normal-mode-map
    :keymaps undo-tree-visualizer-mode-map
    "h"  'undo-tree-visualize-switch-branch-left
    "j"  'undo-tree-visualize-redo
    "k"  'undo-tree-visualize-undo
    "l"  'undo-tree-visualize-switch-branch-right
    "q"  'undo-tree-visualizer-abort))
