;; Python Changes / Hooks
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)                
(setq python-shell-interpreter "/usr/bin/python3.5")
(add-hook 'python-mode-hook' auto-fill-mode)
