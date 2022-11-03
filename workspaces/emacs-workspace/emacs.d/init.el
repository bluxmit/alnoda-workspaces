;; emacs configuration suited for terminal use
(xterm-mouse-mode 1)

(global-set-key [mouse-5] 'scroll-up-command)
(global-set-key [mouse-4] 'scroll-down-command)
(pixel-scroll-mode 1)

(add-to-list 'load-path "~/.emacs.d")

(add-to-list 'custom-theme-load-path "/home/abc/.emacs.d/themes")
(load-theme 'nord t)

(load "/home/abc/.emacs.d/init-packages")

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(scroll-bar-mode 1)
(tool-bar-mode 1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)