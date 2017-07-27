;;; rpg-short-hand.el --- major mode for editing RPG-SS files. -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2017, by C. R. Brown

;; Author: Christopher R. Brown ( mrlordvondoombraun@gmail.com )
;; Version: 0.0.1
;; Created: 26 JUL 2017
;; Keywords: roleplaying, conversion
;; Homepage: teamawesome3.dlinkddns.com

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 3.

;;; Commentary:

;; short description here

;; full doc on how to use here

(require 'highlight-numbers)
(require 'highlight-escape-sequences)

;;; Syntax Highlighing:
(font-lock-mode t)

;; Define Variables
(defvar rpg-font-lock-keywords nil "first element for 'font-lock-defaults'")

(defvar rpg-syntax-table
  (let ((synTable (make-syntax-table text-mode-syntax-table)))
	(modify-syntax-entry ?\# "<" synTable)
	(modify-syntax-entry ?\# ">" synTable)
	synTable)
  "Syntax table in use in 'rpgss-mode' buffers.")

;; Keyword Categories
(setq rem-ent '("P[0-9]" "E[0-9]" "N[0-9]" "A[0-9]"))
(setq rem-rol '("[0-9]\{1,2}))
(setq rem-ver '("V"))
(setq rem-amm '("\." "\-" "\_" "\*"))
(setq rem-tar '("P[0-9]" "E[0-9]" "N[0-9]" "A[0-9]"))
(setq rem-act '("\>" "\>>" "\)" "\))" "+" "\((" "\(" "\<<" "\<" ))                                                                                                                                                                                                                                                                                                  ))
(setq rem-var '("))
(setq rem-res '("v" "^" "\:" "m" "h" "xx"))
(setq rem-mem '("HP"))

;; Generate REGEX Strings
(setq rem-day-regexp (regexp-opt rem-day 'words))
(setq rem-var-regexp (regexp-opt rem-var 'words))
(setq rem-sub-regexp (regexp-opt rem-sub 'words))
(setq rem-adv-regexp (regexp-opt rem-adv 'words))
(setq rem-dat-regexp (regexp-opt rem-dat 'words))
(setq rem-cmd-regexp (regexp-opt rem-cmd 'words))
(setq rem-exp-regexp (regexp-opt rem-exp 'words))
(setq rem-tag-regexp (regexp-opt rem-tag 'words))
(setq rem-tim-regexp (regexp-opt rem-tag 'words))
(setq rem-mov-regexp (regexp-opt rem-mov 'words))
(setq rem-spe-regexp (regexp-opt rem-spe 'words))
(setq rem-run-regexp (regexp-opt rem-run 'words))
(setq rem-con-regexp (regexp-opt rem-con 'words))
(setq rem-com-regexp (regexp-opt rem-com 'words))
;; Font Locking
;; each category of keyword is given a particular face
(setq rem-font-lock-keywords
      `(
	(,rem-day-regexp . font-lock-string-face)
	(,rem-var-regexp . font-lock-variable-name-face)
	(,rem-sub-regexp . font-lock-type-face)
	(,rem-adv-regexp . font-lock-string-face)
	(,rem-dat-regexp . font-lock-string-face)
	(,rem-exp-regexp . font-lock-warning-face)
        (,rem-tag-regexp . font-lock-type-face)
        (,rem-tim-regexp . font-lock-constant-face)
        (,rem-mov-regexp . font-lock-builtin-face)
        (,rem-cmd-regexp . font-lock-keyword-face)
        (,rem-spe-regexp . font-lock-doc-face)
        (,rem-run-regexp . font-lock-function-name-face)
        (,rem-con-regexp . font-lock-variable-name-face)
	(,rem-com-regexp . font-lock-comment-face)
        ;; note: order above matters, because once colored, that part won't change.
        ;; in general, longer words first
        ))

;;;###autoload
(define-derived-mode remind-mode text-mode "Remind Mode"
  "A major mode for editing Remind files"
  (setq font-lock-defaults '(rem-font-lock-keywords t t nil nil))
  (setq-local comment-start "#")

;; add the mode to the `features' list
(provide 'remind-mode))

;;; remind-mode.el ends here
