
;;; (global-set-key (kbd "Tab") 'evil-switch-to-windows-last-buffer) ;; bind "C-x C-b" to ibuffer command


(defun spacemacs/alternate-buffer (&optional window)
  "Switch back and forth between current and last buffer in the
current window."
  (interactive)
  (let ((current-buffer (window-buffer window))
        (buffer-predicate
         (frame-parameter (window-frame window) 'buffer-predicate)))
    ;; switch to first buffer previously shown in this window that matches
    ;; frame-parameter `buffer-predicate'
    (switch-to-buffer
     (or (cl-find-if (lambda (buffer)
                       (and (not (eq buffer current-buffer))
                            (or (null buffer-predicate)
                                (funcall buffer-predicate buffer))))
                     (mapcar #'car (window-prev-buffers window)))
         ;; `other-buffer' honors `buffer-predicate' so no need to filter
         (other-buffer current-buffer t)))))


;;; (define-key evil-normal-state-map (kbd "TAB") 'previous-buffer)

(define-key evil-normal-state-map (kbd "TAB") 'spacemacs/alternate-buffer)


