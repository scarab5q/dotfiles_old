
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, dunstify, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
    
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
  };
  # Set your time zone.
  time.timeZone = "Europe/London";

  # System Environment 
  fonts.fonts = with pkgs; [
    anonymousPro
    corefonts
    dejavu_fonts
    emojione
    fira
    dwm 
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

  environment= {

    # system packages
    systemPackages = with pkgs; [
      git
      steam

      font-awesome-ttf

      dwm-status
      rclone
      insync
      arduino
      dunst
      dmenu
      
      wget
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

      dwm

      light
      pavucontrol

      python37
      pipenv
      direnv

      ruby
      
      tmux
      fish
      
      # cargo
      # rustc
      # rustup

      transmission
      transmission-remote-cli
   ];
 };
  
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
      enable = true;
      layout = "us";
      xkbVariant = "colemak";

    # Enable touchpad support.
      libinput = {
        enable = true;
        middleEmulation = true;
        tapping = true;
      };
      displayManager.lightdm = {
        enable = true;
        # autoLogin.enable = true;
        # autoLogin.user = "jack";
      };

      windowManager = {
        bspwm = {
          enable = true;
        # package = pkgs.i3-gaps;
        configFile = /home/jack/.config/bspwm/bspwmrc; 
        sxhkd.configFile = /home/jack/.config/sxhkd/sxhkdrc;


        };
        default = "i3";
      };
      desktopManager = {
        xterm.enable = false;
      };
    };

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
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
