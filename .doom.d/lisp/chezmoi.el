;;; chezmoi.el --- summary -*- lexical-binding: t -*-

;; Author: Harrison Pielke-Lombardo
;; Maintainer: Harrison Pielke-Lombardo
;; Version: 1.0.0
;; Package-Requires: ((emacs "26.1") magit)
;; Homepage: http://www.github.com/tuh8888/chezmoi.el
;; Keywords: vc


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:

(require 'magit)

(defvar chezmoi-use-chezmoi2 nil)



(defvar chezmoi-apply-command
  (if
      (or (shell-command-to-string "chezmoi2 --")
          (strinp-match-p (regexp-quote "\s2.*") (shell-command-to-string "chezmoi --version")))
      "chezmoi2 apply"
     "chezmoi apply"))

(defun chezmoi-is-managed (file))


(defun chezmoi-apply-file (file)
  "use chezmoi apply on the given file"
  (if
      (and
       (chezmoi-use-chezmoi2)
       (shell-command))
      (shell-command (string-join '(chezmoi-command "apply" file) " "))))

(defun chezmoi-apply-current-buffer ()
  (interactive
   (not
    (null ())))
  (chezmoi-apply-file (buffer-file)))


(defun chezmoi-get-changed-files ()

  "return a list of all files that have been changed"
  (let
      (( diff-matches
         (s-match-strings-all "\\+\\{3\\} b\\(.*?$\\)"
                              (shell-command-to-string
                               "chezmoi diff --format git --no-pager"))))
    (mapcar '(lambda (match)(format "~%s"  (nth 1 match))) diff-matches)))

(chezmoi-get-changed-files)



;;; chezmoi.el ends here
