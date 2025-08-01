;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     javascript
     systemd
     toml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     protobuf
     auto-completion ;;(auto-completion :disabled-for org) ;; auto-complete layer 在 orgmode 中会引发很多问题，可以用以下方式在 org 中禁用 company 补全：
     better-defaults
     ;; emacs-lisp
     git
     (helm :variables helm-position 'top
           helm-enable-auto-resize t)
     lsp
     markdown
     multiple-cursors
     org
     ;; google-calendar
     (shell :variables
            ;; shell-default-height 30
            shell-default-position 'bottom)
     (shell-scripts :variables shell-scripts-format-on-save nil
                    shell-scripts-backend 'lsp)

     (osx :variables osx-swap-option-and-command t)
     spell-checking
     syntax-checking
     (version-control  :variables version-control-diff-side 'left)
     html
     csv
     yaml
     (python :variables python-backend 'lsp
             python-sort-imports-on-save t
             python-formatter 'yapf
             python-format-on-save t)
     (tabs :variables
           ;; tabs-icons nil
           tabs-selected-tab-bar 'under)
     ;; javascript
     (c-c++ :variables c-c++-enable-clang-support t
            c-c++-enable-clang-format-on-save t
            c-c++-backend 'lsp-clangd)
            ;; c-c++-backend 'lsp-ccls)
     (cmake :variables cmake-backend 'lsp)
     ;; (latex :variables
     ;;        latex-build-command "LatexMk"
     ;;        latex-enable-auto-fill t
     ;;        latex-enable-folding t)

     (llm-client :variables llm-client-enable-gptel t
                 :variables llm-client-enable-ellama t)

     ;; (chinese :variables
     ;;          chinese-enable-youdao-dict nil
     ;;          chinese-enable-fcitx nil)
     (plantuml :variables org-plantuml-jar-path "~/plantuml.jar"
               plantuml-default-exec-mode 'jar)
     treemacs)


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      evil-find-char-pinyin
                                      xclip
                                      sticky-scroll-mode
                                      ;; aider
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 7)
                                (projects . 3))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light). A theme from external
   ;; package can be defined with `:package', or a theme can be defined with
   ;; `:location' to download the theme package, refer the themes section in
   ;; DOCUMENTATION.org for the full theme specifications.
   dotspacemacs-themes '(doom-one
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal)

   ;; Default icons font, it can be `all-the-icons' or `nerd-icons'.
   dotspacemacs-default-icons-font 'all-the-icons

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-fu

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq-default git-magit-status-fullscreen t)
  (server-start)
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (setq-default evil-escape-key-sequence "jk"
                c-default-style "bsd"
                c-basic-offset 2)
  (setq centaur-tabs-label-fixed-length 8)

  (setq markdown-max-image-size '(1100 . 800))

  ;; Prevent undo tree files from polluting your git repo
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

  ;; (set-face-attribute 'mode-line nil :height 120)
  ;; (set-face-attribute 'mode-line-inactive nil :height 100)

  ;; (spacemacs/declare-prefix "o" "own-menu")
  (spacemacs/set-leader-keys "od" 'osx-dictionary-search-pointer)
  (spacemacs/set-leader-keys "oD" 'osx-dictionary-search-input)

  (defun open-cur-buf-in-vscode ()
    "Open the current file in Visual Studio Code and go to the current line."
    (interactive)
    (when (buffer-file-name)
      (shell-command
       (concat "code -g "
               (shell-quote-argument
                (format "%s:%d"
                        (buffer-file-name)
                        (line-number-at-pos)))))))

  (spacemacs/set-leader-keys "ov" 'open-cur-buf-in-vscode)

  (defun open-cur-folder-with-default-app ()
    "Open the folder of the current buffer in the default file manager."
    (interactive)
    (let ((dir (and (buffer-file-name) (file-name-directory (buffer-file-name)))))
      (when dir
        (let ((command
               (cond ((eq system-type 'darwin)     "open")      ; macOS
                     ((eq system-type 'gnu/linux)  "xdg-open")  ; Linux
                     ((eq system-type 'windows-nt) "explorer")  ; Windows
                     )))
          (if command
              (shell-command (concat command " " (shell-quote-argument dir)))
            (message "Unsupported OS for this command."))))))
  (spacemacs/set-leader-keys "of" 'open-cur-folder-with-default-app)

  (defun open-cur-buf-in-gitlab ()
  "Generate a GitLab link for the current file and line and open it.
The function constructs a URL using the commit hash of the
current HEAD, ensuring the link is permanent. It determines the
Git project root and the remote 'origin' URL automatically.
It handles both SSH and HTTPS remote URLs."
  (interactive)
  ;; 1. Get the current file path and line number.
  (let* ((file-path (buffer-file-name))
         (current-line (line-number-at-pos (point))))
    ;; Ensure we are in a buffer that is visiting a file.
    (unless file-path
      (error "The current buffer is not visiting a file"))

    ;; 2. Run all git commands from the file's directory.
    (let* ((default-directory (file-name-directory file-path))
           (git-root (string-trim (shell-command-to-string "git rev-parse --show-toplevel")))
           (relative-path (file-relative-name file-path git-root))
           ;; (commit-hash (string-trim (shell-command-to-string "git rev-parse HEAD")))
           (remote-url (string-trim (shell-command-to-string "git remote get-url origin")))

           ;; 3. Convert git remote URL (SSH or HTTPS) into a browsable web URL.
           (web-url
            (let ((url remote-url))
              ;; First, convert SSH URL format: "git@host:path" to "https://host/path".
              (setq url (replace-regexp-in-string "^git@\\([^:]+\\):" "https://\\1/" url))
              ;; Next, remove the ".git" suffix if it exists.
              (replace-regexp-in-string "\\.git$" "" url)))

           ;; 4. Assemble the final GitLab URL.
           (final-url (format "%s/-/blob/%s/%s#L%d" web-url "master" relative-path current-line)))

      ;; 5. Open the URL in the default browser and show a confirmation message.
      (browse-url final-url)
      (message "Opened in GitLab: %s" final-url))))
  (spacemacs/set-leader-keys "og" 'open-cur-buf-in-gitlab)

  ;; (turn-on-ace-pinyin-mode)
  ;; (evil-find-char-pinyin-mode)

  ;; (setq lsp-clients-clangd-executable "/usr/bin/clangd")

  ;; (setq pyim-page-length 9)
  ;; (define-key pyim-mode-map "." 'pyim-page-next-page)
  ;; (define-key pyim-mode-map "," 'pyim-page-previous-page)

  (evil-leader/set-key "/" 'spacemacs/helm-project-do-rg-region-or-symbol)

  (define-key evil-normal-state-map (kbd "s") #'avy-goto-word-1)
  (define-key evil-motion-state-map (kbd "s") #'avy-goto-word-1)
  (define-key evil-normal-state-map (kbd "S") #'avy-goto-char-timer)
  (define-key evil-motion-state-map (kbd "S") #'avy-goto-char-timer)

  ;; word-motion in vim keybindings when there're underscores
  ;; (add-hook 'prog-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; (setq-default evil-symbol-word-search t)
  ;; For all modes
  (add-hook 'after-change-major-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; (setq pyim-dicts
  ;;   (quote
  ;;    ((:name "bigdict" :file "/home/k/pyim-bigdict.pyim.gz"))))

  (global-company-mode)
  (centaur-tabs-group-buffer-groups)

  (setq ns-use-native-fullscreen nil)
  (setq ns-use-fullscreen-animation nil)

  ;; tab key not recognized after toggling fullscreen
  ;; https://www.reddit.com/r/emacs/comments/zdmnlp/tab_key_not_recognized_in_emacs_on_macos/
  ;; (setq ns-use-native-fullscreen nil)
  ;; (setq ns-use-fullscreen-animation nil)
  ;; (run-at-time "5sec" nil
  ;;              (lambda ()
  ;;                (let ((fullscreen (frame-parameter (selected-frame)
  ;;                                                   'fullscreen)))
  ;;                  ;; If emacs has in fullscreen status, maximized
  ;;                  ;; window first, drag from Mac's single space.
  ;;                  (when (memq fullscreen '(fullscreen fullboth))
  ;;                    (set-frame-parameter (selected-frame)
  ;;                                         'fullscreen 'maximized))
  ;;                  ;; Manipulating a frame without waiting for the
  ;;                  ;; fullscreen animation to complete can cause a
  ;;                  ;; crash, or other unexpected behavior, on macOS
  ;;                  ;; (bug #28496).
  ;;                  (sleep-for 1.5)
  ;;                  ;; Call `toggle-frame-fullscreen' to fullscreen emacs.
  ;;                  (toggle-frame-fullscreen))))

  (setq
   ;; gptel-model 'deepseek-r1:8b
   gptel-model 'deepseek-coder-v2
   gptel-backend (gptel-make-ollama "Ollama"
                   :host "localhost:11434"
                   :stream t
                   ;; :models '(deepseek-r1:8b)))
                   :models '(deepseek-coder-v2)))

  (setq org-agenda-span 7
        org-agenda-start-on-weekday nil
        org-agenda-start-day "-3d")
  (setq org-confirm-babel-evaluate nil)
  (setq org-agenda-custom-commands
        (quote
         (("h" "Hybrid of Agenda and TODO"
           ((agenda "")
            (todo ""
                  ((org-agenda-overriding-header "\nUnscheduled TODO")
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp)))))
           nil nil))))
  (setq org-agenda-files
    (quote
     ("~/gtd/inbox.org" "~/gtd/gtd.org" "~/gtd/tickler.org")))
  (setq org-capture-templates
    (quote
     (("t" "Todo [inbox]" entry
       (file+headline "~/gtd/inbox.org" "Tasks")
       "* TODO %i%?")
      ("j" "Journal" entry
       (file+headline "~/gtd/Journal.org" "Journal")
       "* %i%?")
      ("T" "Tickler" entry
       (file+headline "~/gtd/tickler.org" "Tickler")
       "* %i%? %U"))))
  (setq org-refile-targets
    (quote
     (("~/gtd/gtd.org" :maxlevel . 2)
      ("~/gtd/someday.org" :level . 1)
      ("~/gtd/tickler.org" :maxlevel . 2))))
  (setq org-todo-keywords
    (quote
     ((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))))
  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-posframe-width 151)
 '(package-selected-packages
   '(ace-jump-helm-line ace-link ace-pinyin add-node-modules-path aggressive-indent
                        all-the-icons anaconda-mode auctex-latexmk
                        auto-dictionary auto-highlight-symbol auto-yasnippet
                        blacken browse-at-remote ccls centaur-tabs
                        centered-cursor-mode chinese-conv clang-format
                        clean-aindent-mode cmake-mode code-cells
                        column-enforce-mode company-anaconda company-auctex
                        company-c-headers company-math company-reftex
                        company-rtags company-web company-ycmd concurrent
                        counsel counsel-gtags cpp-auto-include csv-mode ctable
                        cython-mode dap-mode devdocs diff-hl diminish
                        dired-quick-sort disaster doom-modeline doom-themes
                        dotenv-mode drag-stuff dumb-jump eat emmet-mode epc
                        esh-help eshell-prompt-extras eshell-z eval-sexp-fu
                        evil-anzu evil-args evil-cleverparens evil-collection
                        evil-easymotion evil-escape evil-evilified-state
                        evil-exchange evil-find-char-pinyin evil-goggles
                        evil-iedit-state evil-indent-plus evil-lion
                        evil-lisp-state evil-matchit evil-mc evil-nerd-commenter
                        evil-numbers evil-org evil-surround evil-tex
                        evil-textobj-line evil-tutor evil-unimpaired
                        evil-visual-mark-mode evil-visualstar expand-region
                        eyebrowse fancy-battery find-by-pinyin-dired flx-ido
                        flycheck-pos-tip flycheck-rtags flycheck-ycmd
                        flyspell-correct-helm gendoxy ggtags gh-md git-link
                        git-messenger git-modes git-timemachine
                        gitignore-templates gnuplot golden-ratio google-c-style
                        google-translate grizzl helm-ag helm-c-yasnippet
                        helm-comint helm-company helm-cscope helm-css-scss
                        helm-ctest helm-descbinds helm-git-grep helm-ls-git
                        helm-lsp helm-make helm-mode-manager helm-org
                        helm-org-rifle helm-projectile helm-purpose helm-pydoc
                        helm-rtags helm-swoop helm-themes helm-xref hide-comnt
                        highlight-indentation highlight-numbers
                        highlight-parentheses hl-todo holy-mode hungry-delete
                        hybrid-mode impatient-mode import-js importmagic
                        indent-guide info+ ivy journalctl-mode js-doc js2-mode
                        js2-refactor launchctl link-hint live-py-mode livid-mode
                        load-env-vars lorem-ipsum lsp-latex lsp-origami
                        lsp-pyright lsp-ui markdown-toc multi-line multi-term
                        multi-vterm multiple-cursors mwim nodejs-repl nose
                        npm-mode open-junk-file org-cliplink org-contrib
                        org-download org-mime org-pomodoro org-present
                        org-projectile org-rich-yank org-superstar orgit-forge
                        osx-clipboard osx-dictionary osx-trash pangu-spacing
                        paradox password-generator pcre2el pip-requirements
                        pipenv pippel plantuml-mode poetry popwin prettier-js
                        protobuf-mode pug-mode py-isort pydoc pyenv-mode pyim
                        pyim-basedict pylookup pytest pythonic pyvenv quickrun
                        rainbow-delimiters restart-emacs reveal-in-osx-finder
                        sass-mode scss-mode shell-pop skewer-mode slim-mode
                        smeargle space-doc spaceline spacemacs-purpose-popwin
                        spacemacs-whitespace-cleanup sphinx-doc
                        sticky-scroll-mode string-edit-at-point
                        string-inflection swiper symbol-overlay symon systemd
                        tagedit term-cursor terminal-here tern toc-org toml-mode
                        treemacs-evil treemacs-icons-dired treemacs-magit
                        treemacs-persp treemacs-projectile undo-tree unfill
                        uuidgen vi-tilde-fringe vim-powerline
                        volatile-highlights web-beautify web-mode winum
                        writeroom-mode ws-butler xclip xcscope yaml-mode yapfify
                        yasnippet-snippets))
 '(safe-local-variable-directories '("/Users/kewei-lin/apollo/")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
