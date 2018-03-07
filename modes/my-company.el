;;; https://github.com/clojure-emacs/cider/blob/master/doc/code_completion.md

(with-eval-after-load "company"
  (global-company-mode 1)
  (setq company-show-numbers t
        company-selection-wrap-around t
        company-idle-delay nil)
  ;; (company-quickhelp-mode 1)
  (autoload 'company-quickhelp-manual-begin "company-quickhelp"
    "Manually trigger the ‘company-quickhelp’ popup for the active ‘company’ completion candidate." t)
  ;; (define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)
  ;; Use TAB key only for completion selection
  ;; Binds these keys
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
  ;;   (define-key company-active-map (kbd "TAB") 'company-select-next)
  ;;   (define-key company-active-map (kbd "<backtab>") 'company-select-previous)
  ;;   (define-key company-active-map (kbd "RET") nil)
  (company-tng-configure-default)

  ;; Company function modified by RSW to prevent error when completing
  ;; in the minibuffer (uses standard Emacs completion instead since
  ;; company does not support minibuffer completion).
  (defun company-complete ()
    "Insert the common part of all candidates or the current selection.
The first time this is called, the common part is inserted, the second
time, or when the selection has been changed, the selected candidate is
inserted."
    (interactive)
    (if company-mode
        (when (company-manual-begin)
          (if (or company-selection-changed
                  (eq last-command 'company-complete-common))
              (call-interactively 'company-complete-selection)
            (call-interactively 'company-complete-common)
            (setq this-command 'company-complete-common)))
      (completion-at-point)))

  ;; New function by RSW
  (defun company-quit ()
    "Insert any selected completion and quit completing."
    (interactive)
    (when (and company-selection-changed company--manual-action
               (boundp 'company-tng--overlay) company-tng--overlay)
      (company--insert-candidate
       (nth company-selection company-candidates)))
    (company-cancel))

  ;; New function by RSW
  (defun company-select-first ()
    "Select first company completion candidate even if not visible."
    (interactive)
    (when (company-manual-begin)
      (company-set-selection 0)))

  ;; New function by RSW
  (defun company-select-last ()
    "Select last company completion candidate even if not visible."
    (interactive)
    (when (company-manual-begin)
      (company-set-selection (1- company-candidates-length))))

  ;; New function by RSW
  (defun company-select-first-visible ()
    "Select first visible company completion candidate."
    (interactive)
    (when (company-manual-begin)
      (company-set-selection 0)))

  ;; New function by RSW
  (defun company-select-last-visible ()
    "Select last visible company completion candidate."
    (interactive)
    (when (company-manual-begin)
      (company-set-selection (1- company-candidates-length))))

  (define-key company-active-map [return]    'company-quit)
  (define-key company-active-map (kbd "RET") 'company-quit)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-o") 'company-other-backend)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-v") 'company-next-page)
  (define-key company-active-map (kbd "M-v") 'company-previous-page)
  (define-key company-active-map (kbd "C-<") 'company-select-first)
  (define-key company-active-map (kbd "C->") 'company-select-last)
  (define-key company-active-map (kbd "M-<") 'company-select-first)
  (define-key company-active-map (kbd "M->") 'company-select-last)

  (define-key company-search-map [return]    'company-quit)
  (define-key company-search-map (kbd "RET") 'company-quit)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)

  ;; Use numbers 0-9 (in addition to M-<num>) to select company completion candidates
  (mapc (lambda (x) (define-key company-active-map (format "%d" x) 'company-complete-number))
        (number-sequence 0 9)))
(require 'company)


