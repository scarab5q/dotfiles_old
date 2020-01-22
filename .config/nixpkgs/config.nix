let
  pkgs = import <nixpkgs> { config = { allowUnfree = true; }; };
  nixos1909 = import (
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/release-19.09.tar.gz
  ) { config = { allowUnfree = true; }; };
in
let
  mypython = pkgs.python3;
  ppkgs = mypython.pkgs;

  my-python-packages = pp: with pp;
    [
      ipython
      jupyter_console
      jupyter
      qtconsole
      pynvim
      matplotlib
      numpy
      tensorflow
      pandas
      # pytorchWithoutCuda
      # scikitimage
      # torchvision

      # yubikey-manager
      scikitimage
      tensorflow

      # stuff for coc.nvim
      jedi
      setuptools
      mypy  # syntax
      pylama  # syntax
      black  # formatting
      isort  # sorting imports
      rope  # refactoring

    ];

  python-stuff = (mypython.withPackages (my-python-packages)).override (
    args:
      { ignoreCollisions = true; }
  );
in
  {
    allowUnfree = true;
    packageOverrides = pkgs: with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "myPackages";
        ignoreCollisions = true;
        paths = [

          pipenv
          direnv
          
          zig
          ocaml

          ocamlPackages.findlib

          sd
          up
          acpi
          anki
          aria2
          bear
          dunst
          entr
          exa
          feh
          # gotools
          htop
          git-hub
          kakoune
          killall
          lemonbar
          lf
          libdbusmenu-glib
          libreoffice
          xorg.libX11
          light
          # minikube
          neovim-remote
          tree
          networkmanagerapplet
          # nixify
          nnn
          nodejs
          nodePackages.create-react-app
          nodePackages.joplin
          ntfs3g
          # openvpn
          pavucontrol
          qutebrowser
          ripgrep
          # rofi-unwrapped
          # rtorrent
          taskwarrior
          todo-txt-cli
          transmission
          transmission-gtk
          transmission-remote-cli
          # typespeed
          # unzip
          # xorg.xbacklight
          # xclip
          # xorg.xkill
          # yubikey-manager-qt
          # # zathura-with-plugins
          # zsh
          # python-stuff
          # nixpkgs-fmt
          # jupyter
          # nodejs # for coc.nvim
          # yarn # for coc.nvim
          # emscripten
          # awesome
          # qt5.full
          # csvkit
          # (neovim.override { extraPython3Packages = pp: [ pp.jupyter ]; })
        ];
        pathsToLink = [ "/share/man" "/share/doc" "/bin" "/etc" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
  }
