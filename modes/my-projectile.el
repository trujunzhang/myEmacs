
;;; projectile
(projectile-mode)

(defun helm/init-helm-projectile ()
  (use-package helm-projectile
    :commands (helm-projectile-switch-to-buffer
               helm-projectile-find-dir
               helm-projectile-dired-find-dir
               helm-projectile-recentf
               helm-projectile-find-file
               helm-projectile-grep
               helm-projectile
               helm-projectile-switch-project)
    :init
    (progn
      ;; needed for smart search if user's default tool is grep
      ;; (defalias 'spacemacs/helm-project-do-grep 'helm-projectile-grep)
      ;;(defalias
      ;;  'spacemacs/helm-project-do-grep-region-or-symbol
      ;;  'helm-projectile-grep)
      ;; overwrite projectile settings
      (spacemacs|use-package-add-hook projectile
        :post-init
        (progn
          (setq projectile-switch-project-action 'helm-projectile)
          (spacemacs/set-leader-keys
            "pb"  'helm-projectile-switch-to-buffer
            "pd"  'helm-projectile-find-dir
            "pf"  'helm-projectile-find-file
            "pF"  'helm-projectile-find-file-dwim
            "ph"  'helm-projectile
            "pp"  'helm-projectile-switch-project
            "pr"  'helm-projectile-recentf
            "sgp" 'helm-projectile-grep))))))

(helm/init-helm-projectile)



(setq projectile-completion-system 'helm)
(helm-projectile-on)

;;; set default project



