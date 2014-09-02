;; author: Hua Liang [Stupid ET]
;; Time-stamp: <2014-09-02 14:20:06 星期二 by Hua Liang>

;; ==================== lisp ====================
(require 'slime)
(require 'slime-autoloads)

(slime-setup '(slime-fancy))
(setq slime-contribs '(slime-fancy))

;; From http://d.hatena.ne.jp/tsz/20091222/1261492959
(defvar ac-slime-modes
  '(lisp-mode))

(defun ac-slime-candidates ()
  "Complete candidates of the symbol at point."
  (if (memq major-mode ac-slime-modes)
      (let* ((end (point))
	     (beg (slime-symbol-start-pos))
	     (prefix (buffer-substring-no-properties beg end))
	     (result (slime-simple-completions prefix)))
	(destructuring-bind (completions partial) result
	  completions))))

(defvar ac-source-slime
  '((candidates . ac-slime-candidates)
    (requires-num . 3)))

(add-hook 'lisp-mode-hook (lambda ()
			    (slime-mode t)
			    (push 'ac-source-slime ac-sources)
			    (auto-complete-mode)))

(setq inferior-lisp-program "sbcl")
;; -------------------- lisp --------------------


;; (provide 'my-lisp-settings)
