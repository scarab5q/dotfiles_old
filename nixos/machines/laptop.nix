# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config
, pkgs
, dunstify
, ...
}:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ../common.nix
    ];

  networking.hostName =
    "nix-laptop-box";
  networking.hostId =
    "0502641e";

  # Enable  the X11 windowing system.
  services =
    {
      teamviewer.enable =
        true;

      xserver =
        {
          enable =
            true;
          layout =
            "us";
          xkbVariant =
            "colemak";
          xkbOptions =
            "ctrl:swapcaps";

          synaptics =
            {
              enable =
                true;
              buttonsMap =
                [
                  1
                  2
                  3
                ]; # Mouse button 3 is two-finger tap by default...
              palmDetect =
                true;
              # disableWhileTyping = true;
              horizontalScroll =
                true;
              twoFingerScroll =
                true;
            };

        };
    };
}
