let
  moz_overlay = import (builtins.fetchTarball
    "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz");
  pkgs = import <nixpkgs> {
    overlays = [ moz_overlay ];
    config = { allowUnfree = true; };
  };
  nixos1909 = import (fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/release-19.09.tar.gz") {
      config = { allowUnfree = true; };
    };

in let
  mypython = pkgs.python3;
  ppkgs = mypython.pkgs;
  # vscodeAndExtensions = (pkgs.vscode-with-extensions [ ]
  #   ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
  #     name = "code-runner";
  #     publisher = "formulahendry";
  #     version = "0.6.33";
  #     sha256 = "166ia73vrcl5c9hm4q1a73qdn56m0jc7flfsk5p5q41na9f10lb0";
  #   }]);

  my-python-packages = pp:
    with pp; [
      ipython
      # jupyter_console
      # jrnl
      # jupyter
      # qtconsole
      pynvim
      matplotlib
      numpy
      # tensorflow
      pandas
      # pytorchWithoutCuda
      # scikitimage
      # torchvision

      # yubikey-manager
      scikitimage
      # tensorflow

      # neovim-remote

      # stuff for coc.nvim
      jedi
      setuptools
      mypy # syntax
      pylama # syntax
      black # formatting
      isort # sorting imports
      rope # refactoring

    ];

  python-stuff = (mypython.withPackages (my-python-packages)).override
    (args: { ignoreCollisions = true; });
in {
  allowUnfree = true;
  packageOverrides = pkgs:
    with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "myPackages";
        ignoreCollisions = true;
        paths = [
          racket
          # vscodeAndExtensions
          ocaml
          ocamlPackages.utop
          ocamlPackages.base
          tree
          shfmt
          gtop
          htop
          # for kak completion
          jq
          gocode
          gogetdoc
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
          rustup
          godot
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
          jrnl
          neovim-remote
          tree
          networkmanagerapplet
          nnn
          nodejs-12_x
          nodePackages.create-react-app
          ntfs3g
          pavucontrol
          # qutebrowser
          ripgrep
          rofi-unwrapped
          rofi
          rtorrent
          taskwarrior
          todo-txt-cli
          transmission
          transmission-gtk
          tectonic
          qbittorrent
          zathura
          nixpkgs-fmt
          jupyter
          nodejs # for coc.nvim
          yarn # for coc.nvim
          emscripten
          # qt5.full
          asciinema
          ffcast
          # xorg.xwininfo
          # xrectsel
          # nixpkgs dependency management
          niv
          # neovim-remote
          go
          dep
          gotools
          kakoune
          # cargo
          # rustc
          figlet
          unzip
          python-stuff
        ];
        pathsToLink = [ "/share/man" "/share/doc" "/bin" "/etc" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
}
