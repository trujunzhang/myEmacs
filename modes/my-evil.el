
;; https://www.emacswiki.org/emacs/Evil
 (require 'evil)
 (evil-mode 1)

;; evil plugins
;; https://github.com/emacs-evil/evil-surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


;;; https://juanjoalvarez.net/en/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/

;;; Leader key
;;; In order to define an use a <leader> prefix for your personal shortcuts you have to install the package evil-leader and put lines like these on your .emacs (I use comma as a leader key):

(require 'evil-leader)

(global-evil-leader-mode)
(evil-leader/set-leader ",")

;;; Later, I found that the key didn’t work on some modes (like when editing the .emacs file in emacs-lisp-mode), but the package FAQ solved the problem, you have to add this before the global-evil-leader-mode setting:

(setq evil-leader/in-all-states 1)
