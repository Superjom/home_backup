;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers '(
                                       rust
                                       javascript
                                       ;; javascriptpython
                                       python
                                       yaml
                                       html
                                       themes-megapack
                                       ;; slime
                                       ;; ----------------------------------------------------------------
                                       ;; Example of useful layers you may want to use right away.
                                       ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
                                       ;; <M-m f e R> (Emacs style) to install them.
                                       ;; ----------------------------------------------------------------
                                       helm auto-completion better-defaults emacs-lisp git markdown
                                       org (shell :variables shell-default-height
                                                  30 shell-default-position 'bottom)
                                       ycmd
                                       ;; spell-checking
                                       syntax-checking version-control
                                       myleetcode
                                       ;; company-clang
                                       ;; flycheck
                                       )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(google-c-style clang-format epc dash elisp-format
                                                     ;; counsel
                                                     cmake-mode

                                                     helm-ag

                                                     ;; irony related
                                                     irony
                                                     irony-eldoc
                                                     flycheck-irony
                                                     company-irony

                                                     ;; slime
                                                     ;; rtags
                                                     ;; company-rtags
                                                     ;; rtags-helm
                                                     ;; helm-rtags
                                                     ;; flycheck-rtags
                                                     load-relative

                                                     org-drill

                                                     company-irony-c-headers
                                                     counsel-etags

                                                     ag
                                                     yapfify

                                                     irony
                                                     company-irony
                                                     flycheck-irony

                                                     ox-hugo

                                                     srefactor
                                                     cmake-ide
                                                     org-journal
                                                     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-projectile)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark organic-green spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro" :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq configuration-layer--elpa-archives
      '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
        ("org-cn"   . "http://elpa.emacs-china.org/org/")
        ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

  (setq url-proxy-services '(("https" . "127.0.0.1:12333")
                             ("http" .  "127.0.0.1:12333")
                             ("no_proxy" . "^.*zilongshanren.com")))



  ;; ox-hugo config
  ;; (use-package ox-hugo
  ;;   :ensure t            ;Auto-install the package from Melpa (optional)
  ;;   :after ox)
  ;; ;; (use-package ox-hugo-auto-export) ;If you want the auto-exporting on file saves
  ;; ;; (use-package ox-hugo
  ;; ;;   :ensure t            ;Auto-install the package from Melpa (optional)
  ;; ;;   :after ox)
  ;; ;; (use-package ox-hkgo-auto-export) ;If you want the auto-exporting on file saves

  ;; (org :variables
  ;;      org-enable-hugo-support t)
  (with-eval-after-load 'org
    (require 'ox-latex)
    (add-to-list 'org-latex-classes
                 '("beamer"
                   "\\documentclass\[presentation\]\{beamer\}"
                   ("\\section\{%s\}" . "\\section*\{%s\}")
                   ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                   ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))
    (setq org-latex-listings t)
    (add-hook 'org-mode-hook #'spacemacs/toggle-truncate-lines-off)

    ;; (custom-set-variables
    ;;  '(org-modules
    ;;    (quote
    ;;     (org-bbd org-bibtex org-drill)))
    ;;  )
    )


  ;; (require 'org-download)
  ;; (add-hook 'dired-mode-hook 'org-download-enable)



  (add-hook 'c++-mode-hook
            (lambda () (setq flycheck-clang-language-standard "c++17")))

  ;; (load (expand-file-name "~/.quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl")

  ;; end user-config
  )


(load "/home/chunwei/centra/config_backup/chun")

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'cl-lib)


  ;; window split control
  (define-key evil-normal-state-map "vs" 'split-window-right-and-focus)
  (define-key evil-normal-state-map "vt" 'split-window-below-and-focus)
  (define-key evil-normal-state-map "vh" 'evil-window-left)
  (define-key evil-normal-state-map "vl" 'evil-window-right)
  (define-key evil-normal-state-map "vk" 'evil-window-top)
  (define-key evil-normal-state-map "vj" 'evil-window-bottom)

  ;; auto insert code
  (defun org-insert-src-block (src-code-type)
    "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
    (interactive (let ((src-code-types '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++"
                                         "css" "calc" "asymptote" "dot" "gnuplot" "ledger"
                                         "lilypond" "mscgen" "octave" "oz" "plantuml" "R" "sass"
                                         "screen" "sql" "awk" "ditaa" "haskell" "latex" "lisp"
                                         "matlab" "ocaml" "org" "perl" "ruby" "scheme" "sqlite")))
                   (list (ido-completing-read "Source code type: " src-code-types))))
    (progn (newline-and-indent)
           (insert (format "#+BEGIN_SRC %s\n" src-code-type))
           (newline-and-indent)
           (insert "#+END_SRC\n")
           (previous-line 2)
           (org-edit-src-code)))

  (with-eval-after-load 'org
    (add-hook 'org-mode-hook '(lambda ()
                                ;; keybiding for insert source code
                                (local-set-key (kbd "C-c s") 'org-insert-src-block)))
    ;; add support for exectuate c++ in org-mode
    (org-babel-do-load-languages 'org-babel-load-languages '((C . t)
                                                             (python . t)
                                                             (latex . t)
                                                             ))

  ;; agenda
  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d)")
          (sequence "IDEA(i)" "BUG(b)" "DOING(n)" "|" "FIXED(f)")
          (sequence "|" "CANCELED(c)")))
  (defun air-org-skip-subtree-if-priority (priority)
    "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))
          (pri-value (* 1000 (- org-lowest-priority priority)))
          (pri-current (org-get-priority (thing-at-point 'line t))))
      (if (= pri-value pri-current)
          subtree-end
        nil)))

  (defun air-org-skip-subtree-if-habit ()
    "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (if (string= (org-entry-get nil "STYLE") "habit")
          subtree-end
        nil)))

  (setq org-agenda-custom-commands
        '(("d" "Daily agenda and all TODOs"
           ((tags "PRIORITY=\"A\""
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "High-priority unfinished tasks:")))
            (agenda "" ((org-agenda-ndays 1)))
            (alltodo ""
                     ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit)
                                                     (air-org-skip-subtree-if-priority ?A)
                                                     (org-agenda-skip-if nil '(scheduled deadline))))
                      (org-agenda-overriding-header "ALL normal priority tasks:"))))
           ((org-agenda-compact-blocks t)))))

  (setq org-todo-keyword-faces
        '(("TODO" . org-warning)
          ("DOING" . "yellow")
          ("IDEA" . "green")
          ("CANCELED" . (:foreground "grey" :weight bold))))

  (setq org-enforce-todo-dependencies t)


  ;; (setq org-latex-listings 'minted)

  (with-eval-after-load 'org
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((C . t)))
    ))

  ;; set org-indent-mode as default
  (with-eval-after-load 'org
    (add-hook 'org-mode-hook 'org-indent-mode))

  ;; Bind clang-format-buffer to tab on the c++-mode only:
  (add-hook 'c++-mode-hook 'clang-format-bindings)
  (defun clang-format-bindings ()
    (define-key c++-mode-map [tab] 'clang-format-buffer))

  ;; set google c style
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)

  ;; yas set path
  (setq yas-snippet-dirs '("/home/chunwei/project/yas-snippets"))


  (defun chun/insert-cpp-src ()
    (interactive)
    (insert "#+BEGIN_SRC C++ :includes <iostream> <vector> <algorithm> :namespaces std :flags -std=c++11 :results output\n")
    (insert "#+END_SRC\n"))

  (defun chun/jump-to-header ()
    "jump to header file."
    (interactive)
    (let* ((cur-file (buffer-file-name))
           suffix-pos
           header-file)
      (setq suffix-pos (cl-search "." cur-file :from-end t))
      (setq header-file (format "%s.%s"
                                (cl-subseq cur-file 0 suffix-pos)
                                "h"))
      (switch-to-buffer (find-file-noselect header-file))))

  (defun chun/jump-to-source ()
    "jump to source file."
    (interactive)
    (let* ((cur-file (buffer-file-name))
           suffix-pos
           header-file)
      (setq suffix-pos (cl-search "." cur-file :from-end t))
      (setq header-file (format "%s.%s"
                                (cl-subseq cur-file 0 suffix-pos)
                                "cc"))
      (switch-to-buffer (find-file-noselect header-file))))

  (defun chun/--get-suffix (file)
    "get file suffix"
    (let* (suffix-pos)
      (setq suffix-pos (cl-search "." file :from-end t))
      (substring file suffix-pos nil)))

  (defun chun/jump-to-header-or-source ()
    "jump to header file if current file is source file, or else."
    (interactive)
    (let* ((cur-file (buffer-file-name))
           (suffix (chun/--get-suffix cur-file)))
      (message "suffix %s" suffix)
      (if (string-equal suffix ".h")
          (chun/jump-to-source)
        (chun/jump-to-header))))

  ;; set highlight a word
  (global-unset-key [f2])
  (global-set-key (quote [f2]) 'chun/highlight-current-word)


  (python-env-setup)

  (chun/c++-env-setup)

  ;; (add-to-list 'load-path "/home/chunwei/project/rtags/src/")
  ;; (load "rtags")
  ;; (load "helm-rtags")
  ;; (load "company-rtags")
  ;; (load "flycheck-rtags")


  ;; (chun/setup-rtags)

  (chun/setup-semantic)

  (setq  package-check-signature nil)

  (setq leetcode-prefer-language "cpp")
  (setq leetcode-prefer-sql "mysql")

  ;; (eval-after-load 'org
  ;;   (require 'org-drill))

  ) ;; end user-config

(defun chun/local-set-keys (key-commands)
  "Set multiple local bindings with KEY-COMMANDS list."
  (let ((local-map (current-local-map)))
    (dolist (kc key-commands)
      (define-key local-map
	      (kbd (car kc))
	      (cdr kc)))))

;; C++
(defun chun/c++-env-setup ()
  "Setup the c++ environment with following features:
- auto complete with irony
- auto error detect with flycheck
- auto compile db generation with cmake-ide
"

  ;; Treat _ as part of the word.
  (with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol)
    (setq-default evil-symbol-word-search t))

  ;; config cmake-ide, which can generate the compiilation database automatically.
  ;; it can compile the project easily.
  ;; It is the key to c++ auto complete feature, works fine with irony.
  (add-hook 'c++-mode-hook '(lambda()
		                          (cmake-ide-setup)
		                           ))
  ;; set the build directory for cmake-ide, or it will generate random paths and lose control.
  ;; NOTE vital to set a different directory other than "cmake-build-debug", or the rtags will be disabled.
  (eval-after-load 'cmake-ide
    (setq cmake-ide-dir "/home/chunwei/project/cinn2/build")
    )

  (defun chun/irony ()
    "Irony mode configuration."
    (interactive)

    ;; should require the dependencies first, or it will fail to setq.
    (require 'company)
    (require 'irony)
    (require 'flycheck)

    (add-hook 'irony-mode-hook 'irony-eldoc)
    (add-to-list 'company-backends 'company-irony)
    (add-to-list 'company-backends 'company-irony-c-headers)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    (add-hook 'flycheck-mode-hook 'flycheck-irony-setup)
    (when (or (eq major-mode 'c-mode)	; Prevent from being loaded by c derived mode
	            (eq major-mode 'c++-mode))
      (irony-mode 1)))

  (add-hook 'c++-mode-hook 'chun/irony)
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'flycheck-mode)

  ;; set up flycheck prompt style.
  (defun chun/flycheck ()
    "Configurate flycheck."
    (add-to-list 'display-buffer-alist
	               `(,(rx bos "*Flycheck errors*" eos)
		               (display-buffer-reuse-window
		                display-buffer-in-side-window)
		               (side            . bottom)
		               (reusable-frames . visible)
		               (window-height   . 0.23)))
    (setq flycheck-display-errors-function
	        #'flycheck-display-error-messages-unless-error-list))
  (add-hook 'prog-mode-hook 'chun/flycheck)

    )

(defun chun/--etags-setup ()
  "set up the counsel-etags"
  (progn
    (eval-after-load 'counsel-etags
      '(progn
         (push "cmake-build-debug" counsel-etags-ignore-directories)
         (push "cmake-build-release" counsel-etags-ignore-directories)
         (push "build" counsel-etags-ignore-directories)
         (push "*.o" counsel-etags-ignore-filenames)
         (push "*.py" counsel-etags-ignore-filenames)
         (push "*.pyc" counsel-etags-ignore-filenames)
         ))
    (define-key c++-mode-map [f1] 'counsel-etags-find-tag-at-point)

    ))


(defun chun/copy-all-or-region ()
  (interactive)
  (if (use-region-p)
      (progn
        (kill-new (buffer-substring (region-beginning) (region-end)))
        (message "Text selection copied!"))
    (progn
      (kill-new (buffer-string))
      (message "Buffer content copied!"))))

(defun chun/highlight-current-word ()
  "Highlight the current word in the point"
  (interactive)
  (let*((word (thing-at-point 'word 'no-properties)))
    (progn
      (unhighlight-regexp t)
      (highlight-regexp word)
      )))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(persist org-drill load-relative zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler winum white-sand-theme which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme srefactor spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme racer pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el paradox ox-hugo orgit organic-green-theme org-present org-pomodoro org-mime org-journal org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme leetcode json-mode js2-refactor js-doc jbeans-theme jazz-theme irony-eldoc ir-black-theme inkpot-theme indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate google-c-style golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flycheck-ycmd flycheck-rust flycheck-pos-tip flycheck-irony flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help epc emmet-mode elisp-slime-nav elisp-format dumb-jump dracula-theme django-theme diminish diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme counsel-etags company-ycmd company-web company-statistics company-irony-c-headers company-irony company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmake-mode cmake-ide clues-theme clean-aindent-mode clang-format cherry-blossom-theme cargo busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent ag afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

