# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, dunstify, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
      ../common.nix
    ];

  # Enable  the X11 windowing system.
  services = {
    
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "colemak";

      synaptics = {
        enable = true;
        buttonsMap = [ 1 3 2 ];  # Mouse button 3 is two-finger tap by default...
        tapButtons = true;
        palmDetect = true;
        disableWhileTyping = true;
        horizontalScroll = true;
        twoFingerScroll = true;
      };


    };
  };
}
