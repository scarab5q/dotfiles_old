# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, dunstify, options, ... }:
let
  dwm-HEAD = pkgs.callPackage ./dwm {};

# import mozilla's overlay
  # mozilla-overlay = import (fetchTarball "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz");
  # mozilla = import <nixpkgs> { overlays = [ mozilla-overlay ]; };
  unstableTarball = fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
 #    url = "https://githuk.com/rycee/home-manager.git";
  # };
in
{
  imports =
    [ # Include the results of the hardware scan.
        # "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
        # "./home.nix"

      
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.supportedFilesystems = [ "zfs" ];
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_GB.UTF-8";
  };

  nixpkgs.config= {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
    chromium = {
      enablePepperFlash = true;
      enableWideVine = true;
    };
};
  # Set your time zone.
  time.timeZone = "Europe/London";

  # System Environment 
  # virtualization = {
  #   docker ={
  #     enable = true;
  #     enableOnBoot = true;

  #   };
  # };

  environment = {

    variables = {

      # XDG_CONFIG_HOME = ~/.config;
      EDITOR = "nvr -s";
      CMAKE_PREFIX_PATH="${pkgs.zlib.out}:${pkgs.zlib.dev}";
      # RUST_SRC_PATH="${mozilla.latest.rustChannels.nightly.rust-src}/lib/rustlib/src/rust/src";
    };

    # system packages
    systemPackages = with pkgs; [
      # jrnl
      fswatch
      httpie
      curlie
      tmuxp
      watchman
      yubikey-manager
      yubikey-personalization
      yubikey-personalization-gui
      xtitle
      starship
      nixfmt
      xlibs.xmodmap
      xcape
      skypeforlinux
      teamviewer
      bat 
      go-dependency-manager
      go2nix
      gnupg1compat
      pass
      fpp
      # clang
      # cquery
      # ccls
      automake
      blueman
      firefox-bin
      udiskie
      openvpn
      browsh
      dwarf-fortress
      home-manager
      # mozilla.latest.rustChannels.nightly.rust
      git
      vifm
      steam
      tig
      gitAndTools.hub
      xclip
      geoclue2
      xdotool
      alsaUtils
      wirelesstools
      font-awesome-ttf
      lemonbar
      chrony
      compton
      go
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
      dunst
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
      rofi
      pywal
      polybar
      lemonbar
      taskwarrior
      neovim
      neovim-remote
      alacritty
      termite
      kitty
      light
      pavucontrol
      pipenv
      direnv
      ruby
      tmux
      fish
      zsh
      cargo
      transmission
      transmission-remote-cli
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
      pipenv
      direnv
      ruby
      tmux
      fish
      zsh
      # cargo
      # rustc
      # rustup
      transmission
      transmission-remote-cli
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
    terminus_font
    ttf_bitstream_vera
    ubuntu_font_family
    powerline-fonts
    font-awesome-ttf
    siji
    fira-code
    fira-code-symbols
    nerdfonts
    powerline-fonts
    ];
    # fontconfig = {
    #   penultimate.enable = false;
    #   defaultFonts = {
    #     serif = 
    #   }
    # }
   };

  sound.enable = true;

  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  # Enable  the X11 windowing system.

  # services.xserver.displayManager.sddm.enable = true;
  services = {
    pcscd.enable = true;
    
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
    udev.packages = with pkgs; [
      yubikey-personalization
    ]; 
    locate = {
      enable = true;
      interval = "hourly";
    };

    # timesyncd = {
    #   enable = true;
    # };
    chrony = {
      enable = true;
    };
    unclutter-xfixes = {
      enable = true;
    };


    xserver = {
      enable = true;

      displayManager ={
        slim = {
          enable = true;
          # autoLogin.enable = true;
          # autoLogin.user = "jack";
          defaultUser = "jack";
        };
        sessionCommands = ''
          ${pkgs.xcape}/bin/xcape -e "Control_L=Escape"

          '';
      };

      windowManager = {
        #dwm.enable = true;
        bspwm = {
          enable = true;
        configFile = /home/jack/.config/bspwm/bspwmrc; 
        sxhkd.configFile = /home/jack/.config/sxhkd/sxhkdrc;
        };
        default = "bspwm";
        # default = "dwm";
        # session =
      # [ { name = "dwm";
        #   start = ''
        #     ${dwm-HEAD}/bin/dwm &
        #     waitPID=$!
        #   '';
        # }
      # ];
      };
      desktopManager = {
        xterm.enable = false;
      };
    };
  };

   users.users.jack = {
    isNormalUser = true;
    extraGroups = [ 
      "docker"
      "wheel" 
      "video"
      "audio"
      "disk"
      "networkmanager"
      "suid"
      "docker"
    ]; 
    shell = pkgs.zsh;
  };

  programs = {
    light = {
      enable = true;
    };
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?



}
