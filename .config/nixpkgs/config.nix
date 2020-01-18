let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  pkgs = import <nixpkgs> { overlays = [ moz_overlay ]; config = { allowUnfree = true; }; };
  nixos1909 = import (
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/release-19.09.tar.gz
  ) { config = { allowUnfree = true; }; };
in
let
  mypython = pkgs.python3;
  ppkgs = mypython.pkgs;

  my-packages = pp: with pp;
    [
      ipython
      jupyter_console
      jupyter
      qtconsole

      matplotlib
      numpy
      tensorflow
      pandas
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
  python-stuff = (mypython.withPackages (my-packages)).override (
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
          python-stuff
          nixpkgs-fmt
          # jupyter
          nodejs # for coc.nvim
          yarn # for coc.nvim
          
          emscripten
          qt5.full

          asciinema
          ffcast
          xorg.xwininfo
          xrectsel

          # nixpkgs dependency management
          niv 

          neovim-remote
          # (neovim.override { extraPython3Packages = pp: [ pp.jupyter ]; })

          # go stuff
          go 
          dep
          gotools

          kakoune
          
          # cargo
          # rustc

          # for text art
          figlet
          unzip

          # for programming in assembly
          nasm

        ];
        pathsToLink = [ "/share/man" "/share/doc" "/bin" "/etc" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
  }
