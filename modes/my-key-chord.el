
(require 'key-chord)
(key-chord-mode 1)

;; Max time delay between two key presses to be considered a key chord
(setq key-chord-two-keys-delay 0.1) ; default 0.1
   
;; Max time delay between two presses of the same key to be considered a key chord.
;; Should normally be a little longer than `key-chord-two-keys-delay'.
(setq key-chord-one-key-delay 0.2) ; default 0.2


;;; (key-chord-define-global "hj"     'undo)
;;; (key-chord-define-global "SPC pp"  'helm-projectile-switch-to-buffer)

;;; (global-set-key (kbd "SPC") 'helm-projectile-switch-to-buffer)

(general-define-key
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
  "'" '(iterm-focus :which-key "iterm")
  "?" '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
  "/" '(counsel-ag :wich-key "ag")
  "TAB" '(spacemacs/alternate-buffer :which-key "last buffer")
  "." '(avy-goto-word-or-subword-1  :which-key "go to word")
  "SPC" '(counsel-M-x :which-key "M-x")
  "pp" '(helm-projectile-switch-project :which-key "Switch Project")
  "pf" '(helm-projectile-find-file :which-key "find files in the Project")
  "sp" '(helm-projectile-grep :which-key "find files in the Project")
  "pr" '(helm-projectile-recentf :which-key "recent in the Project")
  "bb" '(helm-buffers-list :which-key "buffer list")
  )


(defhydra hydra-buffer-menu (global-map "<SPC>")
  "
                Buffers :
  "
  ("n" next-buffer "next" :color red)
  ("b" ivy-switch-buffer "switch")
  ("B" ibuffer "ibuffer")
  ("p" previous-buffer "prev" :color red)
  ("C-b" buffer-menu "buffer menu")
  ("N" evil-buffer-new "new")
  ("d" kill-this-buffer "delete" :color red)
  ;; don't come back to previous buffer after delete
  ("D" (progn (kill-this-buffer) (next-buffer)) "Delete" :color red)
  ("s" save-buffer "save" :color red))











