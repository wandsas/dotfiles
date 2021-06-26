;;;; My .emacs file.
;;;; Oldest change:  27dec2001  +leah+
;;;; Last refactoring:  20jul2014  +leah+
;;;; Last change:  11aug2020  +leah+

;; (occur "^;;;") for an overview.

;; Be resilient of missing packages.
;; 20jul2014  +leah+
(defmacro require-soft (name &rest body)
  `(if (require ,name nil t)
       (progn ,@body)
     (message "Could not load \"%s\", skipping..." ,name)))

;; Load package.el
;; 20jul2014  +leah+
;; 13sep2020  +leah+
(require-soft 'package
  (package-initialize)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t))

;; Put own keybindings into minor mode
;; 31aug2014  +leah+
(define-minor-mode leah2-keys-mode
  "Global minor mode for leah2's custom key bindings

This ensures no major mode overrides the keybindings, while still
making them easy to toggle.  Also, all defined keybindings can be listed here:

\\{leah2-keys-mode-map}"
  :init-value t
  :keymap (make-sparse-keymap))
(defun leah2-define-key (key def)
  (define-key leah2-keys-mode-map (kbd key) def))    

;;; Adapt load-path

(add-to-list 'load-path "~/.emacs.d")

;;; General customization

;; Don't indent with tabs
;; (thanks to slyphon)
(setq-default indent-tabs-mode nil)

;; ...except if they are already used
;; 12may2016  +leah+
(defun guess-tab-settings ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward "^\t" 8192 t)
      (setq indent-tabs-mode t)
      (set (make-local-variable 'c-basic-offset) tab-width)
      (set (make-local-variable 'sh-indentation) tab-width)
      (set (make-local-variable 'sh-basic-offset) tab-width)
      (set (make-local-variable 'standard-indent) tab-width)
      (set (make-local-variable 'cperl-indent-level) tab-width)
      (message "File uses tabs for indentation"))))
(add-hook 'find-file-hook 'guess-tab-settings)
(setq tabify-regexp "^\t* [ \t]+")  ;; only initial whitespace

;; Sometimes we need to.
(defun new-c-lineup-arglist (langelem)
  (save-excursion
    (goto-char (cdr langelem))
    (setq syntax (car (car (c-guess-basic-syntax))))
    (while (or (eq syntax 'arglist-intro)
               (or (eq syntax 'arglist-cont)
                   (eq syntax 'arglist-cont-nonempty)))
      (forward-line -1)
      (setq syntax (car (car (c-guess-basic-syntax)))))
    (beginning-of-line)
    (re-search-forward "[^ \t]" (c-point 'eol))
    (goto-char (+ (match-beginning 0) 4))
    (vector (current-column))))

(c-add-style "openbsd"
             '("bsd"
               (c-ignore-auto-fill . '(string))
               (c-subword-mode . 0)
               (c-basic-offset . 8)
               (c-label-minimum-indentation . 0)
               (c-offsets-alist .
                                ((arglist-intro . new-c-lineup-arglist)
                                 (arglist-cont . new-c-lineup-arglist)
                                 (arglist-cont-nonempty . new-c-lineup-arglist)
                                 (arglist-close . 0)
                                 (substatement-open . 0)
                                 (statement-cont . *)
                                 (case-label . 0)
                                 (knr-argdecl . *)))
               (fill-column . 80)
               (tab-width . 8)
               (indent-tabs-mode . t)))

;; Default input method is rfc1345.
;; Enable with C-\, greek letters are &X*.
;; 18jun2007  +leah+
(setq default-input-method "rfc1345")

(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'eval-expression 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)

;; 18sep2016  +leah+
(global-eldoc-mode 0)

;;; Packages

;; Load EasyPG/EasyPG Assistant
;; 20jul2014  +leah+
;; 01jan2020  +leah+
(require-soft 'epa-file
  (epa-file-enable))
(require-soft 'epa-mail
  (epa-global-mail-mode 1))
(require-soft 'epg-config
  (setq mml2015-use 'epg
	epg-gpg-program "gpg2"
        epg-user-id "E6F6848A1B95EE313CF5B7EE95FF633C90A8F025"
        mml2015-encrypt-to-self t
        mml2015-sign-with-sender t
        mm-verify-option 'never	      ; slow smime,  25jul2020  +leah+
        mm-decrypt-option 'always))

;; Load BBDB -- Insidious Big Brother Database
;; 31oct2003  +leah+
(require-soft 'bbdb
  (bbdb-initialize 'gnus 'message))

;; Load AUCTeX
;; 27feb2005  +leah+
;; 30nov2005  +leah+
(require-soft 'tex-site
  (require-soft 'preview)
  (setq tex-dvi-view-command "evince")
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

;; Use MuPDF as previewer
;; 18oct2012  +leah+
  (eval-after-load 'tex
    '(add-to-list 'TeX-view-program-list
                  '("mupdf" ("mupdfwrap" (mode-io-correlate " -p %(outpage)") " %o"))))
  (eval-after-load 'tex
    '(add-to-list 'TeX-view-program-selection
                  '(output-pdf "mupdf")))

;; Then use TeX-engine-set.
;; 04nov2010  +leah+
  (eval-after-load 'tex
    '(add-to-list 'TeX-engine-alist '(luatex "LuaTeX" "luatex --jobname='%s'" "lualatex --jobname='%s'" "luatex")))

;; Parse TeXStudio magic comments
;; 01may2019  +leah+
  (defun TeX-parse-magic-comment ()
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (save-match-data
	(while (re-search-forward "% !TeX \\([a-zA-Z]+\\) *= *\\(.*\\)$" nil t)
          (pcase (match-string 1)
            ((or "program" "TS-program")
             (pcase (match-string 2)
               ("latex" (TeX-engine-set 'default))
               ("pdflatex" (TeX-engine-set 'default))
               ("xelatex" (TeX-engine-set 'xetex))
               ("luatex" (TeX-engine-set 'luatex))
               ("lualatex" (TeX-engine-set 'luatex))
               (_ (message "unknown TeX program %s" (match-string 2)))))
            ((or "root" "texroot")
             (setq TeX-master (match-string 2)))
            (_
             (message "unknown !TeX comment %s" (match-string 1))))))))
  (eval-after-load 'tex
    '(add-to-list 'LaTeX-mode-hook 'TeX-parse-magic-comment))
  )

;; Use nXML for XML, XHTML and XSL.
;; 11sep2003  +leah+
(require 'nxml-mode)
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
	    auto-mode-alist))

;; Require Org
;; 01nov2004  +leah+
;; 09feb2010  +leah+
(setq org-startup-truncated nil)

;; Use cperl-mode
;; 15dec2019  +leah+
(add-to-list 'auto-mode-alist '("\\.pl$" . cperl-mode))
(eval-after-load 'cperl-mode
  '(add-hook 'cperl-mode-hook (lambda ()
				(cperl-set-style "PerlStyle"))))

;; haskell-mode
;; 19nov2005  +leah+
;; 17apr2012  +leah+
;; 08may2015  +leah+
;; 11apr2018  +leah+  back to inf-haskell
(require-soft 'haskell-mode
  (require 'inf-haskell)
  (add-hook 'haskell-mode-hook 'inf-haskell-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
  (add-to-list 'auto-mode-alist '("\\.l?hs$" . haskell-mode)))

;; go-mode
;; 11nov2012  +leah+
(require-soft 'go-mode
  (add-hook 'go-mode-hook 'subword-mode)
  (add-hook 'go-mode-hook #'(lambda () (setq fill-column 79)))
  (add-to-list 'auto-mode-alist '("\\.go$" . go-mode)))

;; js2-mode
(require-soft 'js2-mode
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; bibtex
;; 08mar2014  +leah+
(add-hook 'bibtex-mode-hook #'(lambda () (setq fill-column 79)))

;; tuareg
;; 09aug2013  +leah+
(require-soft 'tuareg
  (add-to-list 'auto-mode-alist '("\\.ml[iylp]?\\'" . tuareg-mode))
  (autoload 'ocamldebug "ocamldebug" "Run the Caml debugger" t))

;; magit
;; 09feb2010  +leah+
;; 11feb2015  +leah+
;; 24jul2015  +leah+
;; 14sep2020  +leah+
(require-soft 'magit
  (setq magit-last-seen-setup-instructions "1.4.0")
  (leah2-define-key "C-x g" 'magit-status)
  (define-key magit-mode-map "c" 'magit-commit)
  (define-key magit-mode-map "\C-w" nil)
  (define-key magit-mode-map "\M-w" nil)
  (define-key magit-status-mode-map "P" 'magit-push-current-to-upstream)
  (define-key magit-status-mode-map "c" 'magit-commit-create)

  ;; 10nov2020  +leah+
  (defun leah2-goto-git-prefix ()
    "Replace the current minibuffer with the prefix to the git repository, if we are in one."
    (interactive)
    (let ((toplevel (magit-toplevel (minibuffer-completion-contents))))
      (if toplevel
	  (progn
            (delete-minibuffer-contents)
            (insert (abbreviate-file-name toplevel)))
	(message "Not in a git repo"))))
  (define-key minibuffer-local-map (kbd "M-g") 'leah2-goto-git-prefix)
  )

;; fzf
;; 12dec2020  +leah+
(require-soft 'fzf
  (leah2-define-key "C-c C-f" 'fzf-git-files))

;; elscreen
;; 14feb2010  +leah+
(setq elscreen-prefix-key "\C-z")
(require-soft 'elscreen
  (elscreen-start)
  (leah2-define-key "<M-left>" 'elscreen-previous)
  (leah2-define-key "<M-right>" 'elscreen-next)
  (leah2-define-key "C-z C-z" 'elscreen-toggle))

;; proof general
;; 10mar2014  +leah+
(load "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el" t nil t)
(load "/home/leah/src/ssreflect-1.5/pg-ssr.el" t nil t)
;; 17nov2014  +leah+
(add-hook 'coq-mode-hook 
          #'(lambda ()
              (show-paren-mode -1)
              (setq coq-double-hit-enable t)
              (define-key coq-mode-map (kbd ".") 'coq-terminator-insert)))

;; M-x shell setup
;; 11sep2012  +leah+
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-filter)
(add-hook 'shell-mode-hook #'(lambda ()
                               (setq comint-process-echoes t)))

;; nroff
;; 25jul2016  +leah+
;; Don't use nroff-electric-newline, it leaves trailing whitespace.
(require-soft 'nroff-mode
  (define-key nroff-mode-map "\n" 'electric-newline-and-maybe-indent))

;; 18sep2016  +leah+
(require-soft 'evil
  (global-undo-tree-mode 0))

;; ws-butler
;; 14nov2018  +leah+
(require-soft 'ws-butler
  (add-hook 'c-mode-hook #'ws-butler-mode))

;; recentf auto save
;; 16nov2018  +leah+
(setq recentf-auto-cleanup 'never
      recentf-auto-save-timer (run-with-idle-timer 600 t 'recentf-save-list))

;; 19mar2020  +leah+
(require-soft 'jsonnet-mode)

;; gerbil + treadmill
;; 11oct2020  +leah+
;(require-soft 'gerbil
;  (add-to-list 'load-path "~/src/emacs-treadmill")
;  (require-soft 'treadmill
;    (add-hook 'gerbil-mode-hook #'treadmill-gerbil-mode)
;    (define-key treadmill-gerbil-mode-map (kbd "C-c TAB") nil)  ;; unbind, clashes
;    (setq treadmill-interpreter-name "gxi")))

;; gerbil + slime
;; 16oct2020  +leah+
(require-soft 'gerbil
  (require-soft 'slime
    (add-hook 'gerbil-mode-hook 'slime-mode)))

;; CIDER
;; 09dec2020  +leah+
(require-soft 'cider
  (define-key cider-mode-map (kbd "C-c C-;") 'cider-pprint-eval-last-sexp-to-comment))

;; orgalist
;; 26oct2020  +leah+
(require-soft 'orgalist
  (setq orgalist-separated-items nil)
  (define-key orgalist-mode-map (kbd "M-<left>") nil)
  (define-key orgalist-mode-map (kbd "M-<right>") nil)
  (define-key orgalist-mode-map (kbd "S-<up>") orgalist--maybe-move-up)
  (define-key orgalist-mode-map (kbd "S-<down>") orgalist--maybe-move-down)
  (define-key orgalist-mode-map (kbd "S-<left>") orgalist--maybe-outdent-tree)
  (define-key orgalist-mode-map (kbd "S-<right>") orgalist--maybe-indent-tree))

;;; Own Packages

;; Blogging for leahblogs
;; 10apr2004  +leah+
;; updated 16jun2004  +leah+
;; unneeded 20jun2004  +leah+
;; Nukumi2 25nov2004  +leah+
(require-soft 'nukumi2
  (setq nukumi2-blogs '(("leahblogs" "~/prj/leahblogs")))

  (defun nukumi2-insert-now-playing ()
    "Insert a ``now playing''-line of the current iTunes song."
    (interactive)
    (insert (shell-command-to-string "~/bin/now-playing"))))

;; trivium
(require-soft 'trivium)

;; nota bene
;; 04mar2010  +leah+
(require-soft 'nb
  (leah2-define-key "<f11>" 'nb))

(defun insert-curtab ()
  "Insert the currently active Firefox tab."
  (interactive)
  (insert (substring (shell-command-to-string "~/bin/curtab") 0 -1)))

(defun insert-zot ()
  "Insert the currently actve Zotero item."
  (interactive)
  (insert (substring (shell-command-to-string "~/bin/curzot") 0 -1)))

(defun insert-zot-pdf ()
  "Insert the currently actve Zotero PDF item."
  (interactive)
  (insert (substring (shell-command-to-string "~/bin/curzotpdf") 0 -1)))

;; 01jan2017  +leah+
(defun leah ()
  "Fix my name"
  (interactive)
  (save-excursion
    (dolist (r '(("Christian Neukirchen <chneukirchen@gmail.com>" .
		  "Leah Neukirchen <leah@vuxu.org>")
		 ("chneukirchen@gmail.com" . "leah@vuxu.org")
		 ("chneukirchen.org" . "leahneukirchen.org")
		 ("Christian Neukirchen" . "Leah Neukirchen")
		 ("+chris+" . "+leah+")
		 ("chris2" . "leah2")))
      (goto-char (if (and transient-mark-mode mark-active)
		     (region-beginning)
		   (point-min)))
      (while (search-forward (car r) 
			     (if (and transient-mark-mode mark-active)
				 (region-end)
			       (point-max)) 
			     t)
	(replace-match (cdr r) nil t)))))

;;; Key bindings

;; Make C-c SPC run `delete-horizontal-space'.
(leah2-define-key "C-c SPC" 'delete-horizontal-space)

;; Evaluate and insert elisp expression.
;; 24feb2021  +leah+
(leah2-define-key "C-c C-e" 'eval-print-last-sexp)

;; C-c C-j to join lines.
;; 25jul2011  +leah+
(leah2-define-key "C-c C-j" 'delete-indentation)

;; Inserting smart newlines/formatting the rest of the paragraph.
;; 18mar2014  +leah+
(defun fill-remaining-paragraph ()
  (interactive)
  (delete-horizontal-space)
  (unless (bolp)
    (insert "\n"))
  (insert "\n")
  (fill-paragraph)
  (delete-char -1))
(leah2-define-key "M-RET" 'fill-remaining-paragraph)

;; Put each sentence of the paragraph into its own, word-wrapped line.
;; 07feb2018  +leah+
(defun leah2-fill-sentences ()
  (interactive)
  (save-excursion
    (forward-paragraph -1)
    (let ((start (point))
          (stop  (save-excursion
                   (forward-paragraph 1)
                   (backward-sentence)
                   (forward-sentence)
                   (point))))
       (while (< (point) stop)
          (forward-sentence)
          (unless (eolp)
            (delete-horizontal-space)      
            (insert "\n"))
          (fill-region start (point))
          (forward-whitespace 1)
          (setq start (point))))))
(leah2-define-key "M-Q" 'leah2-fill-sentences)

;; Make C-c TAB work like dabbrev-expand.
;; 27feb2002  +leah+
(leah2-define-key "C-c TAB" 'dabbrev-expand)

;; Run `calculator' with C-c c
(leah2-define-key "C-c c" 'calculator)

;; occur in isearch.  by zenspider.
;; 27dec2006  +leah+
(define-key isearch-mode-map (kbd "C-o") ; occur easily inside isearch
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

;; Emacs21 changes these.
;; 28aug2002  +leah+
(leah2-define-key "<home>" 'beginning-of-buffer)
(leah2-define-key "<end>" 'end-of-buffer)

;; Vim-like * on C-. and C-,
;; 09mar2007  +leah+
(defun search-forward-word (direction)
  (interactive "p")
  (let ((word (current-word t))
        (pos (point)))
    (when word
      (if (= 1 direction)
          (forward-word)
        (backward-word))
      (let ((found
             (if (= 1 direction)
                 (search-forward-regexp (concat "\\_<" word "\\_>")
                                        (point-max) t)
               (search-backward-regexp (concat "\\_<" word "\\_>")
                                       (point-min) t))))
      (if found
          (goto-char (match-beginning 0))
        (goto-char pos)
        (message "Not found: %s" word))))))

(defun search-backward-word (direction)
  (interactive "p")
  (search-forward-word (- direction)))

(leah2-define-key "C-." 'search-forward-word)
(leah2-define-key "C-," 'search-backward-word)

;; Interactively replace two regexp with each other.
;; from http://lists.gnu.org/archive/html/help-gnu-emacs/2005-11/msg00740.html
;; 07may2015  +leah+
(defun query-swap-regexp (regexp-a regexp-b)
  "Swap A and B regexp matches in current buffer or region."
  (interactive "sFirst regexp: \nsSecond regexp: ")
  (let ((match-a (save-excursion (re-search-forward regexp-a nil t)
                 (match-string 0)))
        (match-b (save-excursion
                 (re-search-forward regexp-b nil t)
                 (match-string 0))))
    (query-replace-regexp
     (concat "\\(\\(" regexp-a "\\)\\|" regexp-b "\\)")
     `(replace-eval-replacement 
       replace-quote 
       (if (match-string 2) ,match-b ,match-a))
     nil 
     (if (and transient-mark-mode mark-active) (region-beginning))
     (if (and transient-mark-mode mark-active) (region-end)))))

;; Toggle comments with C-;
;; 09aug2013  +leah+
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(leah2-define-key "C-;" 'toggle-comment-on-line)

;; Make C-^ run `speedbar-get-focus'
;; 29mar2002  +leah+
;; 14feb2010  +leah+
(leah2-define-key "C-^" 'speedbar-get-focus)
(leah2-define-key "C-`" 'speedbar-get-focus)

;; Override C-u to clear minibuffer
;; http://unix-kb.cat-v.org/
;; 17mar2011  +leah+
(define-key minibuffer-local-map (kbd "C-u") 'kill-whole-line)

;; Don't yank when using M-DEL in minibuffer.
;; 17dec2020  +leah+
(defun leah2-backward-delete-word (arg)
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))

(define-key minibuffer-local-map (kbd "M-DEL") 'leah2-backward-delete-word)

;; C-M-y to paste X11 clipboard
;; C-M-w to kill into X11 clipboard
;; 10feb2021  +leah+
(leah2-define-key "C-M-y" 'clipboard-yank)
(leah2-define-key "C-M-w" 'clipboard-kill-ring-save)

;; Override C-u and C-w in comint-mode
;; 21apr2012  +leah+
(require-soft 'comint
  (define-key comint-mode-map "\C-u" 'comint-kill-input)
  (define-key comint-mode-map "\C-w" 'backward-kill-word))

;; Transpose symbols, not words.
;; 17aug2014  +leah+
(require-soft 'thingatpt
  (defun transpose-symbols (arg)
    (interactive "*p")
    (transpose-subr 'forward-symbol arg))
  (leah2-define-key "M-t" 'transpose-symbols))

;; sam(1)-like M-!
;; 14aug2014  +leah+
(defvar bang-last-command "")
(make-variable-buffer-local 'bang-last-command)

(defun bang (command beg end)
  "Smartly execute string COMMAND in inferior shell.

When COMMAND starts with
  <  the output of COMMAND replaces the current selection
  >  COMMAND is run with the current selection as input
  |  the current selection is filtered through COMMAND
  !  COMMAND is simply executed (same as without any prefix)

Inside COMMAND, % is replaced with the current file name."
  (interactive (list
                (read-shell-command "Bang command: ")
                (if mark-active (region-beginning) (point-min))
                (if mark-active (region-end) (point-max))))
  (when (equal command "")
    (error "No command given: use ! for last command."))
  (if (equal command "!")
      (bang bang-last-command beg end)
    (setq bang-last-command command)
    (let* ((command (replace-regexp-in-string
                   "\\\\?%"
                   #'(lambda (match)
                       (if (equal match "\\%")
                           "%"
                         (shell-quote-argument buffer-file-name)))
                   command))
         (first-char (elt command 0))
         (rest-command (substring command 1)))
    (cond
     ((eq first-char ?<)
      (kill-region beg end)
      (shell-command rest-command t shell-command-default-error-buffer)
      (exchange-point-and-mark))
     ((eq first-char ?>)
      (shell-command-on-region beg end rest-command nil nil 
                               shell-command-default-error-buffer t)
      (with-current-buffer "*Shell Command Output*"
        (kill-ring-save (point-min) (point-max))))
     ((eq first-char ?|)
      (shell-command-on-region beg end rest-command t t
                               shell-command-default-error-buffer t))
     ((eq first-char ?!)
      (shell-command rest-command nil shell-command-default-error-buffer)
      (with-current-buffer "*Shell Command Output*"
        (kill-ring-save (point-min) (point-max))))
     (t
      (shell-command command nil shell-command-default-error-buffer)
      (with-current-buffer "*Shell Command Output*"
        (kill-ring-save (point-min) (point-max))))))))

(leah2-define-key "M-!" 'bang)
(leah2-define-key "<f5>" 'bang)

;; copying lines and incrementing
;; 23oct2018  +leah+
(defun leah2-next-day (date)
  (format-time-string "%Y-%m-%d" 
		      (time-add (date-to-time (concat date " 00:00"))
				(days-to-time 1))))

(defun leah2-smart-increment (str)
  (replace-regexp-in-string
   "\\([0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]\\|[0-9]+\\)\\(.*\\)"
   #'(lambda (str) (concat (if (cl-search "-" (match-string 1 str))
			       (leah2-next-day (match-string 1 str))
			     (number-to-string 
			      (1+(string-to-number (match-string 1 str)))))
			   (match-string 2 str)))
   str))

(defun leah2-copy-above-increment ()
  (interactive)
  (let ((line (save-excursion
		(forward-line -1)
		(thing-at-point 'line))))
    (move-beginning-of-line 1)
    (insert (leah2-smart-increment line))))

(leah2-define-key "M-j" 'leah2-copy-above-increment)

;(require-soft 'deadgrep
;  (defalias 'rg 'deadgrep)
;  (defun deadgrep-glance-result-other-window ()
;    "Goto the search result at point, opening in another window,
;  but keep focus on this window."
;    (interactive)
;    (save-selected-window
;      (deadgrep--visit-result #'find-file-other-window)))
;  (define-key deadgrep-mode-map (kbd "v") #'deadgrep-glance-result-other-window))
(require-soft 'counsel
  (defalias 'rg 'counsel-rg)
  (leah2-define-key "C-c r" 'counsel-rg)
  (leah2-define-key "C-c f" 'counsel-fzf)
  (leah2-define-key "C-c s" 'swiper)
  (define-key ivy-minibuffer-map (kbd "M-w")
    #'(lambda ()
	"Copy selected element."
	(interactive)
        (execute-kbd-macro (kbd "M-o w"))))
  (setq counsel-fzf-cmd "fd --type f | fzf -f \"%s\"")  ; a lot faster
  (define-key ivy-occur-grep-mode-map (kbd "v") #'ivy-occur-press))

;; select successively bigger sexps
;; 10dec2020  +leah+
(defun leah2-magic-mark-sexp (p)
  (interactive "d")
  (if (eq ?\) (char-before (point)))
    (up-list 1)
    (if (eq ?\) (char-after (point)))
      (forward-char)
      (forward-sexp)))
  (mark-sexp -1))

(leah2-define-key "C-=" 'leah2-magic-mark-sexp)

;; transpose up/down sexps "by grabbing them at the )"
;; 10dec2020  +leah+
(defun leah2-transpose-sexp (dir)
  (interactive "p")
  (when (eolp)
    (backward-char))
  (let ((x (point)))
    (if (looking-at ")")
      (up-list)
      (forward-sexp))
    (let ((y (point)))
       (transpose-sexps dir)
       (backward-char (- y x)))))

(defun leah2-transpose-sexp-back (dir)
  (interactive "p")
  (leah2-transpose-sexp -1))

(leah2-define-key "<C-S-up>" 'leah2-transpose-sexp-back)
(leah2-define-key "<C-S-down>" 'leah2-transpose-sexp)

(defun leah2-count-line-chars ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (let ((x (point)))
      (end-of-line)
      (message "Line has %d characters." (- (point) x)))))

(leah2-define-key "C-c l" 'leah2-count-line-chars)

;;; F1-F20 keys

;; Make F6 like `buffer-menu'
;; Make S-F6 run dired in `~'.
;; 19jan2002  +leah+
;; 07feb2008  +leah+
(leah2-define-key "<f6>" 'buffer-menu)
(leah2-define-key "<S-f6>" #'(lambda () (interactive) (dired "~")))

;; Make F7 run `query-replace-regex'.
;; Make S-F7 run `query-replace'.
;; 19jan2002  +leah+
(leah2-define-key "<f7>" 'query-replace-regexp)
(leah2-define-key "<S-f7>" 'query-replace)

;; Make M-& repeat last `query-replace-regex'.
;; 10nov2020  +leah+
(defun repeat-substitution ()
  (interactive)
  (execute-kbd-macro [ ?\C-e ?\C-@ ?\C-@ ?\C-a
		       ?\C-\M-% ?\n ?. ]))
(leah2-define-key "M-&" 'repeat-substitution)

;; Make F9 run `compile'
;; 19jan2002  +leah+
(leah2-define-key "<f9>" 'compile)

;; Make M-p insert my timestamp (like `01apr1984  +leah+').
;; 27dec2001  +leah+
;; 05jan2006  +leah+
;; 04mar2010  +leah+
;; 05nov2017  +leah+  hardcode name
(defun leah2-insert-timestamp ()
  (interactive)
  (insert " " (downcase
               (format-time-string "%d%b%Y" (current-time)))
          "  +leah+"))
(global-set-key (kbd "M-p") 'leah2-insert-timestamp)

(defun insert-diary-timestamp ()
  (interactive)
  (shell-command "LANG=de_DE.UTF-8 date +'%F %A München'" t)
  (move-end-of-line 1)
  (insert "\n\n"))

;; chmod +x
;; 20mar2014  +leah+
(defun chmod+x (prefix)
  (interactive "p")
  (shell-command (concat "chmod "
                         (if (= prefix 1) "+x " "-x ")
                         (shell-quote-argument (buffer-file-name)))))

;; Make F12 work like `M-x goto-line'.
;; Delete is now where F12 was... sigh.
;; 27dec2001  +leah+
;; 28feb2010  +leah+
(leah2-define-key "<f12>" 'goto-line)
(leah2-define-key "<delete>" 'goto-line)

;; vi-like ~ case toggling
;; 09dec2006  +leah+
(defun leah2-toggle-case ()
  (interactive)
  (let ((char (following-char)))
    (if (eq char (upcase char))
        (insert-char (downcase char) 1 t)
      (insert-char (upcase char) 1 t)))
  (delete-char 1 nil)
  (backward-char))
(leah2-define-key "M-#" 'leah2-toggle-case)

;; Make M-z zap-up-to-char like Emacs 18.
;; 27jul2014  +leah+
(require-soft 'misc
  (leah2-define-key "M-z" 'zap-up-to-char))

;; For american keyboards
(leah2-define-key "C-?" 'undo)

;; 18apr2020  +leah+
(leah2-define-key "M-SPC" 'cycle-spacing)

;; Dired tweaks
;; 28jan2008  +leah+
(require-soft 'dired-x
  (add-hook 'dired-mode-hook 'dired-extra-startup)
  (setq dired-isearch-filenames t))
(require-soft 'ls-lisp
  (setq ls-lisp-dirs-first t)
  (setq ls-lisp-use-insert-directory-program nil))
(require-soft 'dired-single
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (joc-dired-single-buffer ".."))))
(setq dired-listing-switches "-l")
;; . to toggle dotfiles
(define-key dired-mode-map "."
  (lambda ()
    (interactive)
    (dired-sort-other
     (if (equal dired-actual-switches "-l") "-al" "-l"))))
;; visit file in other window with v
;; 22jan2021  +leah+
(define-key dired-mode-map (kbd "v") #'dired-display-file)


;;; Mouse bindings

(defadvice find-file-at-point (around goto-line compile activate)
  (let ((line (and (looking-at ".*:\\([0-9]+\\)")
                   (string-to-number (match-string 1)))))
    ad-do-it
    (when line
      (goto-char (point-min))
      (forward-line (1- line)))))

(defun ffap-at-mouse-and-point-or-menu (e)
   (interactive "e")
   (mouse-set-point e)   ; else above advice looks at wrong point
   (or (ffap-at-mouse e)
       menu-bar-mode
       (menu-bar-open)))

;; 11sep2012  +leah+
(leah2-define-key "<mouse-3>" 'ffap-at-mouse-and-point-or-menu)

;; 10sep2019  +leah+
(require-soft 'dumb-jump
  (defun dj-at-mouse-and-point (e)
    (interactive "e")
    (mouse-set-point e)   ; else above advice looks at wrong point
    (dumb-jump-go))
  (define-key dumb-jump-mode-map (kbd "<mouse-3>") 'dj-at-mouse-and-point))

;;; Font lock

;; Nah.
(global-font-lock-mode 0)

;; font-lock for diff-mode
;; 04feb2008  +leah+
(add-hook 'diff-mode-hook 'turn-on-font-lock)

;; and for dired
(add-hook 'dired-mode-hook 'turn-on-font-lock)

;; and for magit
(add-hook 'magit-mode-hook 'turn-on-font-lock)

;; Disable Info fontification.
;; 07apr2004  +leah+
;; 20jul2014  +leah+
;; 28oct2014  +leah+
(setq Info-fontify-maximum-menu-size nil
      Info-fontify-visited-nodes nil)

;; Disable shr colors for HTML mail
;; 28oct2014  +leah+
;; 28may2018  +leah+
(setq shr-use-colors nil
      shr-use-fonts nil)

;;; Startup

;; For emacsclient
;; 31may2008  +leah+
;; 14feb2010  +leah+
;; 20jul2014  +leah+
;; 13oct2014  +leah+
;; 26oct2020  +leah+
(require-soft 'server
  (unless (server-running-p)
    (server-start)
    (require-soft 'elscreen
      (elscreen-create)
      (find-file "~/Notes")
      (orgalist-mode 1)
      (elscreen-create)
      (find-file "~/prj/iheart/iheart")
      (elscreen-create)
      (find-file "~/prj/read/books")
      (elscreen-goto 1))))

;;; It follows: customization.

;; End of file ".emacs".
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "grey20" :foreground "grey90" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width semi-condensed :foundry "misc" :family "fixed"))))
 '(Info-quoted ((t nil)))
 '(comint-highlight-prompt ((t (:foreground "gray90"))))
 '(completions-first-difference ((t nil)))
 '(cursor ((t (:background "green"))))
 '(elscreen-tab-background-face ((((type x w32 mac) (class color)) (:background "Gray20"))))
 '(elscreen-tab-control-face ((((type x w32 mac) (class color)) (:background "grey20" :foreground "grey90"))))
 '(elscreen-tab-current-screen-face ((((class color)) (:background "grey40" :foreground "grey90"))))
 '(elscreen-tab-other-screen-face ((((type x w32 mac) (class color)) (:background "Gray20" :foreground "Gray90"))))
 '(font-lock-keyword-face ((((class color) (background dark)) (:foreground "dodger blue"))))
 '(header-line ((t (:inherit mode-line :background "grey40" :foreground "white"))))
 '(isearch ((nil (:foreground "dodgerblue" :weight bold))))
 '(lazy-highlight ((((type tty pc) (class color)) (:foreground "dodger-blue" :weight extra-light))))
 '(link ((t (:underline t))))
 '(magit-item-highlight ((t (:inherit highlight))))
 '(menu ((t (:height 98 :width semi-condensed :foundry "misc" :family "fixed"))))
 '(minibuffer-prompt ((t (:foreground "grey90"))))
 '(mouse ((t (:background "yellow"))))
 '(org-level-2 ((t (:inherit org-tree-slide-heading-level-2-init))))
 '(org-level-3 ((t (:inherit org-tree-slide-heading-level-3-init))))
 '(region ((t (:foreground "red" :weight bold))))
 '(scroll-bar ((t (:stipple nil :background "grey20" :foreground "grey80"))))
 '(show-paren-match ((((class color)) (:foreground "green"))))
 '(show-paren-mismatch ((((class color)) (:foreground "red"))))
 '(tool-bar ((((type x w32 mac) (class color)) (:box (:line-width 1 :style released-button)))))
 '(variable-pitch ((t (:family "cure.de"))))
 '(viper-minibuffer-emacs ((((class color)) nil)))
 '(viper-replace-overlay ((((class color)) nil)))
 '(viper-search ((((class color)) (:foreground "dodgerblue" :weight bold)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-use-header-line nil)
 '(TeX-PDF-mode t)
 '(add-log-mailing-address "chneukirchen@gmail.com")
 '(auto-image-file-mode t)
 '(bibtex-align-at-equal-sign t)
 '(bibtex-dialect 'biblatex)
 '(bibtex-entry-format
   '(opts-or-alts required-fields numerical-fields page-dashes whitespace inherit-booktitle realign last-comma delimiters unify-case braces strings sort-fields))
 '(blink-cursor-mode nil)
 '(c-default-style
   '((java-mode . "java")
     (awk-mode . "awk")
     (other . "openbsd")))
 '(canlock-password nil)
 '(confirm-kill-emacs 'yes-or-no-p)
 '(current-language-environment "UTF-8")
 '(default-frame-alist
    '((mouse-color . "yellow")
      (cursor-color . "green")
      (foreground-color . "grey90")
      (background-color . "grey20")
      (menu-bar-lines . 1)
      (right-fringe)
      (left-fringe)
      (width . 81)
      (height . 56)))
 '(diff-switches "-urN")
 '(dired-auto-revert-buffer t)
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(electric-indent-mode nil)
 '(elscreen-display-screen-number nil)
 '(elscreen-tab-display-kill-screen nil)
 '(erc-modules
   '(autojoin button completion fill irccontrols log match menu netsplit noncommands readonly ring scrolltobottom stamp track))
 '(erc-nick "leah2")
 '(erc-nick-uniquifier "_")
 '(erc-send-whitespace-lines t)
 '(erc-server "irc.freenode.net")
 '(erc-user-full-name "Leah Neukirchen")
 '(erc-warn-about-blank-lines t)
 '(focus-follows-mouse t)
 '(git-commit-summary-max-length 72)
 '(gnus-article-browse-delete-temp t)
 '(gnus-header-face-alist
   '(("From" nil gnus-header-from)
     ("X-Original-From" nil gnus-header-from)
     ("Subject" nil gnus-header-subject)
     ("Newsgroups:.*," nil gnus-header-newsgroups)
     ("" gnus-header-name gnus-header-content)))
 '(gnus-sorted-header-list
   '("^From:" "^X-Original-From:" "^Subject:" "^Summary:" "^Keywords:" "^Newsgroups:" "^Followup-To:" "^To:" "^Cc:" "^Date:" "^Organization:"))
 '(gnus-treat-display-smileys nil)
 '(gnus-treat-display-x-face nil)
 '(gnus-treat-leading-whitespace 'head)
 '(gnus-visible-headers
   '("^From:" "^X-Original-From:" "^Newsgroups:" "^Subject:" "^Date:" "^Followup-To:" "^Reply-To:" "^Organization:" "^Summary:" "^Keywords:" "^To:" "^[BGF]?Cc:" "^Posted-To:" "^Mail-Copies-To:" "^Mail-Followup-To:" "^Apparently-To:" "^Gnus-Warning:" "^Resent-From:" "^X-Sent:" "^X-Mail-Count:" "^Archived-At:" "^Message-Id:"))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(imaxima-equation-color "white")
 '(imaxima-fnt-size "normalsize")
 '(imaxima-latex-preamble "\\usepackage{color}")
 '(imaxima-pt-size 12)
 '(imaxima-scale-factor 1.5)
 '(imaxima-use-maxima-mode-flag t)
 '(inferior-lisp-program "sbcl")
 '(inhibit-startup-screen t)
 '(isearch-lazy-highlight nil)
 '(js-indent-level 2)
 '(js2-mirror-mode nil)
 '(kill-read-only-ok t)
 '(kill-whole-line t)
 '(line-move-visual nil)
 '(magit-auto-revert-mode nil)
 '(magit-diff-auto-show '(log-oneline log-select blame-follow))
 '(magit-push-always-verify nil)
 '(mail-user-agent 'gnus-user-agent)
 '(message-forward-as-mime t)
 '(message-forward-included-headers nil)
 '(message-insert-canlock nil)
 '(minibuffer-prompt-properties '(read-only t point-entered minibuffer-avoid-prompt))
 '(mm-automatic-display
   '("text/plain" "text/enriched" "text/richtext" "text/html" "text/x-verbatim" "text/x-vcard" "image/.*" "message/delivery-status" "multipart/.*" "message/rfc822" "text/x-patch" "text/x-diff" "text/dns" "application/pgp-signature" "application/emacs-lisp" "application/x-emacs-lisp" "application/x-pkcs7-signature" "application/pkcs7-signature" "application/x-pkcs7-mime" "application/pkcs7-mime" "application/pgp\\'" "text/x-org"))
 '(mm-text-html-renderer 'shr)
 '(mm-uu-diff-groups-regexp ".*")
 '(mml-secure-key-preferences
   '((OpenPGP
      (sign
       ("leah@vuxu.org" "E6F6848A1B95EE313CF5B7EE95FF633C90A8F025"))
      (encrypt
       ("jesper@cure53.de" "189DF899A973E2D3D0A0DD6359837503670EC1BA")
       ("leah@vuxu.org" "E6F6848A1B95EE313CF5B7EE95FF633C90A8F025")))
     (CMS
      (sign)
      (encrypt))))
 '(mouse-drag-copy-region t)
 '(mouse-yank-at-point t)
 '(nnimap-authinfo-file "~/.netrc")
 '(nntp-authinfo-file "~/.netrc")
 '(org-agenda-files nil)
 '(org-startup-with-deadline-check nil)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")))
 '(package-selected-packages
   '(typescript-mode ivy-bibtex zotxt org-ref counsel marginalia consult embark orderless fzf expand-region orgalist cider clojure-mode selectric-mode magit deadgrep janet-mode dumb-jump tern prettier-js wgrep forge ws-butler xref-js2 intero lean-mode lua-mode cider-decompile inf-clojure evil tuareg slime rust-mode projectile nodejs-repl narrowed-page-navigation magit-gh-pulls iflipb haskell-mode goto-chg go-mode gnu-apl-mode git-timemachine elscreen dyalog-mode clean-aindent-mode browse-kill-ring bbdb auctex))
 '(proof-three-window-enable nil)
 '(ps-paper-type 'a4)
 '(ps-print-color-p 'black-white)
 '(query-replace-lazy-highlight nil)
 '(recentf-max-saved-items 100)
 '(recentf-mode t)
 '(recentf-save-file "~/.emacs.d/recentf.txt")
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   '((org-use-property-inheritance . t)
     (encoding . utf-8)
     (c-indentation-style . bsd)))
 '(scroll-error-top-bottom t)
 '(search-whitespace-regexp "[ 	
]+")
 '(select-active-regions nil)
 '(select-enable-clipboard nil)
 '(select-enable-primary t)
 '(send-mail-function 'sendmail-send-it)
 '(shift-select-mode nil)
 '(show-paren-mode t)
 '(speedbar-indentation-width 2)
 '(speedbar-supported-extension-expressions
   '(".ls" ".mly" ".mll" ".mli" ".ml" ".bnf" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".s?html" ".rb" ".xh?ml" "[Mm]akefile\\(\\.in\\)?" ".rhtml" ".rjs" ".entry"))
 '(temp-buffer-resize-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil)
 '(tuareg-match-clause-indent 0)
 '(user-mail-address "leah@vuxu.org")
 '(vc-darcs-mail-address "Leah Neukirchen <chneukirchen@gmail.com>")
 '(vc-follow-symlinks nil)
 '(vc-make-backup-files t)
 '(visible-bell t)
 '(w3m-default-display-inline-images t)
 '(warning-suppress-types '((initialization))))
