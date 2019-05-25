# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, dunstify, ... }:
  dwm-HEAD = pkgs.callPackage ./dwm {};
  home-manager = builtins.fetchGit {
    url = "https://githuk.com/rycee/home-manager.git";
  };
in
{
  imports =
    [ # Include the results of the hardware scan.
        "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
        "./home.nix"
      
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
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
       nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    }; 
  };
  # Set your time zone.
  time.timeZone = "Europe/London";

  # System Environment 

  environment= {

    # system packages
    systemPackages = with pkgs; [
      git
      steam
      


      font-awesome-ttf

      compton
      universal-ctags
      dwm-status
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

      python37
      pipenv
      direnv

      ruby
      
      tmux
      fish
      
      cargo
      rustc
      rustup

      transmission
      transmission-remote-cli
   ];
 };
  
  fonts.fonts = with pkgs; [
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
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  # Enable  the X11 windowing system.
  services = {
    
    locate = {
      enable = true;
      interval = "10 * * * *";
    };


    xserver = {

      displayManager.lightdm = {
        enable = true;
        # autoLogin.enable = true;
        # autoLogin.user = "jack";
      };

      windowManager = {
        # dwm.enable = true;
        bspwm = {
          enable = true;
        configFile = /home/jack/.config/bspwm/bspwmrc; 
        sxhkd.configFile = /home/jack/.config/sxhkd/sxhkdrc;


        };
        # default = "dwm";
        default = "bspwm";
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

    # Enable touchpad support.
    # libinput.enable = true;
   };

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jack = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel" 
      "networkmanager"
      "suid"
    ]; 
    shell = pkgs.fish;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

};
