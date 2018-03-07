
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 114) ; chars
              (height . 60) ; lines
              (background-color . "honeydew")
              ;;
              ))

      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 106)
              (height . 60)
              (background-color . "honeydew")
              ;;
              )))
  (progn
    (setq initial-frame-alist
          '(
            (tool-bar-lines . 0)))
    (setq default-frame-alist
          '(
            (tool-bar-lines . 0)))))

  ;; Auto-save on focus out
  (add-hook 'focus-out-hook 'spacemacs/sooheon-save-all)
