# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
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

  nixpkgs.config.allowUnfree = true;
  # Set your time zone.
  time.timeZone = "Europe/London";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    steam

    rclone
    arduino
    dunst
    dmenu
    
    wget
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

    bspwm
    sxhkd

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
      xkbOptions = "colemak";

      displayManager.lightdm = {
        enable = true;
        # autoLogin.enable = true;
        # autoLogin.user = "jack";
      };

      windowManager = {
        bspwm = {
          enable = true;
     #    configFile = /mnt/home/jack/.config/bspwm/bspwmrc; 
     #    sxhkd.configFile = /mnt/home/jack/.config/sxhkd/sxhkdrc;


        };
        default = "bspwm";
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
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
