# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config
, pkgs
, dunstify
, ...
}:

let
  dwm-HEAD =
    pkgs.callPackage
    ./dwm
    { };

in {
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ../common.nix
    ];

  # Use the systemd-boot EFI boot loader.

  networking.hostName =
    "nix-desktop-box"; # Define your hostname.
  networking.hostId =
    "0502641e";
  environment =
    {

      # system packages
      systemPackages =
        with pkgs;
        [

        ];
    };

  # Enable  the X11 windowing system.
  services =
    {

      xserver =
        {
          xrandrHeads =
            [
              "HDMI-1"
              "DP-2"
            ];
        };
      # Enable touchpad support.
      # libinput.enable = true;
    };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion =
    "19.03"; # Did you read the comment?

}
