;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jack"
      user-mail-address "jackmdenny@gmail.com")

;; defaults taken from
;; https://tecosaur.github.io/emacs-config/config.html#rudimentary-configuration

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…")               ; Unicode ellispis are nicer than "...", and also save /precious/ space

(display-time-mode 1)                             ; Enable time in the mode-line

(if (equal "Battery status not available"
           (battery))
    (display-battery-mode 1)                        ; On laptops it's nice to know how much power you have
  (setq password-cache-expiry nil))               ; I can trust my desktops ... can't I? (no battery = desktop)

(global-subword-mode 1)                           ; Iterate through CamelCase words
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-vibrant)
;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/Dropbox/my_notes/org")
(setq org-journal-dir "~/Dropbox/my_notes/org/journal/")
(setq org-agenda-file-regexp "\\`[^.].*\\.org'\\|[0-9]+$")

(setq org-journal-enable-agenda-integration 't)

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:

(setq display-line-numbers-type 'relative)
;; (use-package! evil-colemak-basics
;;   :after evil
;;   :config
;;   (setq evil-colemak-basics-rotate-t-f-j t))


;; (use-package! zoom
;;    :hook (doom-first-input  zoom-mode)
;;    :config
;;    (setq zoom-size '(0.7 . 0.7)
;;          zoom-ignored-major-modes '(dired-mode vterm-mode help-mode helpful-mode rxt-help-mode help-mode-menu org-mode)
;;          zoom-ignored-buffer-names '("*doom:scratch*" "*info*" "*helpful variable: argv*")
;;          zoom-ignored-buffer-name-regexps '("^\\*calc" "\\*helpful variable: .*\\*")
;;          zoom-ignore-predicates (list (lambda () (< (count-lines (point-min) (point-max)) 20)))))

;; Deft
(setq deft-directory "~/Dropbox/my_notes/deft")

(use-package! undo-tree
  :config
  (global-undo-tree-mode))

(map!
 :desc "; is the new :" :n ";" 'evil-ex
 :desc ": is the new ;" :n ":" 'evil-snipe-repeat
 :desc "redo" :n "U" 'undo-tree-redo
 :desc "undo" :n "u" 'undo-tree-undo)

(add-hook 'lispy-mode-hook #'lispyville-mode)
(add-hook 'emacs-lisp-mode-hook #'lispy-mode)
(after! lsp-rust
  (setq lsp-rust-server 'rust-analyzer))

(setq projectile-project-search-path '("~/google_drive/sheffield/"
                                       "~/google_drive/projects/"
                                       "~/projects/"))

;; (load! "lisp/chezmoi" doom-private-dir)
(setq projectile-ignored-projects '("~/doom-emacs/.local/straight/repos/" "/tmp"))

(defun projectile-ignored-project-function (filepath)
  "return t if FILEPATH is in any ignored project"  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))

(defun concat-with-spaces (&rest args)
  (mapconcat 'identity args " "))

(defun projectile-ignored-project-function (filepath)
  "Return t if FILEPATH is within any of `projectile-ignored-projects'"
  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))

;; (load! "lisp/chezmoi" doom-private-dir)

;; (:prefix ("d" . "dotfiles")
;;  :desc "chezmoi find" "f" 'chezmoi|find
;;  :desc "chezmoi write" "w" 'chezmoi-write-current-file
;;  :desc "chezmoi git status" "g" 'chezmoi|magit-status)

(map!
 :leader
 :desc "shell command!" :n  "!" 'shell-command
 :desc "M-x" :n  ";" 'execute-extended-command
 :desc "eval" :n  ":" 'pp-eval-expression)
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
