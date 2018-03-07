
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(defvar dotspacemacs-leader-key "SPC"
  "The leader key.")

(add-to-list 'load-path "~/.emacs.d/core/")

(require 'core-keybindings)
(require 'core-use-package-ext)
(require 'core-buffer)

(load "~/.emacs.d/my-loadpackages.el")

(require 'general)

 (load "~/.emacs.d/modes/my-settings.el")
 (load "~/.emacs.d/modes/my-evil.el")
 (load "~/.emacs.d/modes/my-helm.el")
 (load "~/.emacs.d/modes/my-company.el")
 (load "~/.emacs.d/modes/my-web.el")
 (load "~/.emacs.d/modes/my-projectile.el")

 (load "~/.emacs.d/modes/my-tide.el") 
 (load "~/.emacs.d/modes/my-tern.el") 

 (load "~/.emacs.d/modes/my-key-chord.el") 

(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/my-noexternals.el")
))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (yasnippet magit which-key use-package try))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
