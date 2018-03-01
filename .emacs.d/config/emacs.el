;; packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (paganini)))
 '(custom-safe-themes
   (quote
    ("f146cf0feba4fed38730de65e924e26140b470a4d503287e9ddcf7cca0b5b3f0" "c3e4944ae0a7f2e34b8af78f77250f3a47557373cf8c48bb89a36d86f97c9279" default)))
 '(font-latex-fontify-script nil)
 '(inhibit-startup-screen t)
 '(minimap-hide-scroll-bar nil)
 '(minimap-highlight-line nil)
 '(minimap-width-fraction 0.04)
 '(minimap-window-location (quote right))
 '(show-paren-mode t)
 '(jdee-server-dir "/home/jonathan/.emacs.d/jdee-server"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "light gray" :foreground "black" :slant oblique :weight ultra-bold)))))

;; Emacs GUI options
(desktop-save-mode 1)
(column-number-mode)
(setq-default fill-column 80)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'paganini t)
(global-linum-mode t)
;(menu-bar-mode -1)
(tool-bar-mode -1)

;; general text editing - toggle auto-fill-mode
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;;move between windows shortcuts
;;(global-set-key (kbd "s-<up>") 'windmove-up)
;;(global-set-key (kbd "s-<down>") 'windmove-down)
;;(global-set-key (kbd "s-<left>") 'windmove-left)
;;(global-set-key (kbd "s-<right>") 'windmove-right)

;; WindMove - move between windows with key-shortcuts
(windmove-default-keybindings 'meta)

;; Highlight parenthesis
(show-paren-mode)

;; Spellcheck - flyspell mode
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
 '(lambda() (set-fill-column 80)))
;; Default tab width
(setq tab-width 4)

;; Latex autocomplete
(add-hook 'latex-mode-hook
		  '(lambda() (set-fill-column 80)))

;; Evil modei
(add-to-list 'load-path "~/.emacs.d/elpa/evil-1.2.13")
(require 'evil)
(evil-mode 1)

;; Test
(add-to-list 'load-path "~/.emacs.d/elpa")

(package-initialize)
(set-face-attribute 'default nil :height 117)
