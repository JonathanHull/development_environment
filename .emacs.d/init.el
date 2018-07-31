;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/config/emacs.el" t)
(load "~/.emacs.d/config/python.el" t)
(load "~/.emacs.d/config/org.el" t)
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
 '(package-selected-packages (quote (circe minimap pdf-tools magit jedi evil)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "light gray" :foreground "black" :slant oblique :weight ultra-bold)))))
