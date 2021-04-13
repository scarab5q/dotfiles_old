# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, dunstify, options, ... }:
let
  dwm-HEAD = pkgs.callPackage ./dwm { };
  # dwm-HEAD =
  #   pkgs.callPackage
  #   ./dwm
  #   { };

  # import mozilla's overlay
  # mozilla-overlay = import (fetchTarball "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz");
  # mozilla = import <nixpkgs> { overlays = [ mozilla-overlay ]; };
  unstableTarball = fetchTarball
    "https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz";
  #    url = "https://githuk.com/rycee/home-manager.git";
  # };
in {

  location.provider = "geoclue2";
  imports = [ # Include the results of the hardware scan.
    # "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
    # "./home.nix"

  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.supportedFilesystems = [ "zfs" ];
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub

  networking.networkmanager.enable = true;

  # system.autoUpgrade =
  #   true;

  nix = {
    allowedUsers = [ "@wheel" ];
    trustedUsers = [ "@wheel" ];
    gc = {
      automatic = true;
      dates = "03:15";
    };
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    # consoleKeyMap = "us";
    defaultLocale = "en_GB.UTF-8";
  };

  console = {
    font = "fira mono";
    useXkbConfig = true;
  };

  nixpkgs = {
    overlays = [
      (import (builtins.fetchTarball {
        url =
          "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
      }))

      (import (builtins.fetchTarball {
        url =
          "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      }))

    ];
    config = {
      allowUnfree = true;
      allowBroken = true;
      packageOverrides = pkgs: {
        unstable = import unstableTarball { config = config.nixpkgs.config; };
        nur = import (builtins.fetchTarball
          "https://github.com/nix-community/NUR/archive/master.tar.gz") {
            inherit pkgs;
          };
      };
      chromium = {
        # enablePepperFlash = true;
        enableWideVine = true;
      };
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # System Environment

  environment = {
    shellInit = ''
      export GPG_TTY="$(tty)"
      gpg-connect-agent /bye
      export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
    '';
    variables = "https://www.youtube.com/watch?v=alTRvtmWi7k" {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_BIN_HOME = "$HOME/.local/bin";
      XDG_RUNTIME_DIR = "/run/USER/$UID";

      RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
      CARGO_HOME = "$XDG_DATA_HOME/cargo";
      NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/config";
      NPM_CONFIG_CACHE = "$XDG_CACHE_HOME/npm";
      NPM_CONFIG_TMP = "$XDG_RUNTIME_DIR/npm";
      NPM_CONFIG_PREFIX = "$XDG_CACHE_HOME/npm";
      NODE_REPL_HISTORY = "$XDG_CACHE_HOME/node/repl_history";
      PATH = [ "$(yarn global bin)" ];
      TERMINAL = "alacritty";
      ALTERNATIVE_EDITOR = "emacsclient -t";
      CMAKE_PREFIX_PATH = "${pkgs.zlib.out}:${pkgs.zlib.dev}";
    };

    # system packages
    systemPackages = with pkgs; [


      discord


      
      imagemagick # for image-dired
      zstd # for undo-fu-session/undo-tree compression

      ## DOOM Module dependencies

      # :checkers spell
      (aspellWithDicts (ds: with ds; [ en en-computers en-science ]))

      # :checkers grammar
      languagetool

      # :tools editorconfig
      editorconfig-core-c # per-project style config

      # (lib.mkIf (programs.gnupg.agent.enable)
      #   pinentry_emacs) # in-emacs gnupg prompts

      # :tools lookup & :lang org +roam
      sqlite

      # :lang cc
      ccls

      # :lang javascript
      nodePackages.javascript-typescript-langserver

      # :lang latex & :lang org (latex previews)
      texlive.combined.scheme-medium

      # :lang rust
      rustfmt
      unstable.rust-analyzer

      jrnl
      conky
      gitAndTools.gitFull
      xlockmore
      entr
      leftwm
      deno
      sqlite
      up

      # citrix_workspace
      qutebrowser

      wmctrl
      xdotool
      sd
      entr
      fswatch
      wmname
      nixfmt

      xscreensaver
      # openjdk8
      fswatch
      # openjdk12
      httpie
      curlie
      tmuxp
      watchman
      # next
      yubikey-manager
      yubikey-personalization
      yubikey-personalization-gui

      # ((emacsPackagesNgGen (pkgs.emacs.overrideDerivation (oldAttrs: {
      #   withGTK2 = false;
      #   withGTK3 = true;
      # }))).emacsWithPackages (epkgs: [ epkgs.vterm ]))

      binutils # native compilation nees 'as' from here
      ((emacsPackagesNgGen (pkgs.emacs.overrideDerivation (oldAttrs: {
        withGTK2 = false;
        withGTK3 = true;
      }))).emacsWithPackages (epkgs: [ epkgs.vterm ]))

      xtitle
      starship
      nixfmt
      xlibs.xmodmap
      xcape
      godot
      skypeforlinux
      teamviewer
      bat
      go-dependency-manager
      go2nix
      gnupg
      pinentry-curses
      pinentry-qt
      pinentry-emacs
      paperkey
      gnupg1compat
      pass
      fpp
      # clang
      # cquery
      # ccls
      qbittorrent
      automake
      blueman
      firefox-bin
      udiskie
      browsh
      dwarf-fortress
      home-manager
      # mozilla.latest.rustChannels.nightly.rust
      git
      vifm
      steam
      tig
      gitAndTools.hub
      escrotum
      xclip
      geoclue2
      xdotool
      alsaUtils
      wirelesstools
      font-awesome-ttf
      chrony
      compton
      go
      gdb
      universal-ctags
      # dwm-status
      # dwm-HEAD
      gcc
      tinycc
      compton
      stdenv
      rclone
      insync
      arduino
      # dunst
      dmenu
      gnumake
      wget
      inotify-tools
      fd
      libnotify
      exa
      fzf
      ripgrep
      fasd
      killall
      chromium
      pywal
      polybar
      lemonbar
      taskwarrior
      neovim-nightly
      intel-ocl
      alacritty
      termite
      kitty
      tldr
      light
      pavucontrol
      pipenv
      direnv
      ruby
      tmux
      fish
      zsh
      lutris
      gitAndTools.gh
      gitAndTools.delta
      unstable.chezmoi
      lazygit
      bitwarden-cli
      starship

      lua
      transmission
      tremc
      brave
      rofi
      # (
      # python36.withPackages(
      # ps: with ps; [
      # # opencv-python
      # tornado
      # numpy
      # pandas
      # ]
      # )
      # )
      ly
      ruby
      tmux
      fish
      zsh

      # cargo
      # rustc
      # rustup
    ];
  };

  #  virtualbox stuff
  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;

  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  # systemd = {
  #   user = {
  #     services = {

  #     }
  #   }
  # }

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      anonymousPro
      powerline-fonts
      corefonts
      dejavu_fonts
      emojione
      fira
      fira-code
      fira-code-symbols
      fira-mono
      freefont_ttf
      liberation_ttf
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-code-pro
      source-sans-pro
      ttf_bitstream_vera
      powerline-fonts
      font-awesome-ttf
      siji
      fira-code
      gnome3.adwaita-icon-theme
      fira-code-symbols
      nerdfonts
    ];
    # fontconfig = {
    #   penultimate.enable = false;
    #   defaultFonts = {
    #     serif =
    #   }
    # }
  };

  sound.enable = true;

  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;

      # required for bluetooth audio
      package = pkgs.pulseaudioFull;
    };
    opengl = { driSupport32Bit = true; };
    bluetooth = { enable = true; };
  };

  # Enable  the X11 windowing system.

  services = {
    lorri.enable = true;
    pcscd.enable = true;
    udev.packages = with pkgs; [ yubikey-personalization ];
    emacs = {
      enable = true;
      defaultEditor = true;
    };
    redshift = { enable = true; };
    sshd.enable = true;
    blueman.enable = true;
    picom.enable = true;

    # emacs = {
    #   enable = true;
    #   package = (pkgs.emacsPackagesNgGen pkgs.emacs).emacsWithPackages (epkgs:
    #     (with epkgs.melpaPackages; [
    #       use-package
    #       diminish
    #       el-patch

    #       evil
    #       evil-numbers
    #       evil-swap-keys
    #       evil-collection
    #       evil-surround
    #       evil-magit
    #       evil-org

    #       lispyville
    #       aggressive-indent
    #       paren-face

    #       smex
    #       ivy
    #       counsel
    #       counsel-projectile
    #       whitespace-cleanup-mode
    #       which-key
    #       projectile
    #       diff-hl
    #       yasnippet
    #       company
    #       flycheck
    #       color-identifiers-mode
    #       magit
    #       f

    #       imenu-list
    #       avy
    #       wgrep
    #       org-pomodoro
    #       org-cliplink
    #       org-download
    #       nix-mode
    #       haskell-mode
    #       rust-mode
    #       racer
    #       pip-requirements
    #       js2-mode
    #       rjsx-mode
    #       typescript-mode
    #       tide
    #       vue-mode
    #       web-mode
    #       groovy-mode

    #       lua-mode

    #       ledger-mode
    #       markdown-mode
    #       edit-indirect
    #       json-mode
    #       yaml-mode
    #       jinja2-mode
    #       gitconfig-mode
    #       terraform-mode
    #       graphviz-dot-mode
    #       fish-mode
    #       visual-fill-column
    #       beacon
    #       google-translate
    #       writegood-mode
    #       edit-server

    #       general
    #       flycheck-jest
    #       restclient
    #       mbsync
    #       nix-sandbox
    #       prettier-js
    #       flycheck-rust
    #       flycheck-inline
    #       monokai-theme
    #       spaceline

    #       lsp-mode
    #       lsp-ui
    #       company-lsp

    #       # provided by pkgs.notmuch:
    #       # notmuch
    #     ]) ++
    #     [
    #       epkgs.orgPackages.org-plus-contrib

    #       pkgs.ycmd
    #     ]
    #   );
    # };

    # redshift = {
    #   enable = true;
    #   provider = "geoclue2";
    # };
    # locate = {
    #   enable = true;
    #   interval = "hourly";
    # };
    # enable = true;
    # provider = "geoclue2";
    # };
    locate = {
      enable = true;
      interval = "hourly";
    };

    # timesyncd = {
    #   enable = true;
    # };
    chrony = { enable = true; };
    unclutter-xfixes = { enable = true; };

    xserver = {
      enable = true;

      displayManager = {
        # xterm.enable = false;

        job = { logToFile = true; };
        defaultSession = "none+spectrwm";

        sddm = { enable = true; };
        # sessionCommands = ''
        # ${pkgs.xcape}/bin/xcape -e "Control_L=Escape"
        # '';
      };

      windowManager = {
        #dwm.enable = true;
        awesome = {
          enable = true;
          luaModules =
            [ pkgs.luaPackages.luafilesystem pkgs.luaPackages.cjson ];
        };
        leftwm.enable = true;
        bspwm = {
          enable = true;
          configFile = /home/jack/.config/bspwm/bspwmrc;
          sxhkd.configFile = /home/jack/.config/sxhkd/sxhkdrc;
        };
        spectrwm.enable = true;
      };
      desktopManager = { xterm.enable = false; };
    };
  };

  users = {
    users.jack = {
      packages = with pkgs; [ ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHQaDUi4MGdqRLZWFyX1mWaWFdUNTTHKohYshRat+3yE jackmdenny@gmail.com"
      ];
      isNormalUser = true;
      extraGroups = [
        "docker"
        "dialer"
        "wheel"
        "video"
        "audio"
        "disk"
        "networkmanager"
        "suid"
        "operator"
      ];
      shell = pkgs.fish;

    };
    # mutableUsers=false;
  };

  programs = {
    browserpass.enable = true;
    # ssh = { startAgent = true; };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;

    };
    light = { enable = true; };

    nm-applet = { enable = true; };
    dconf = { enable = true; };
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "21.05"; # Did you read the comment?

}
