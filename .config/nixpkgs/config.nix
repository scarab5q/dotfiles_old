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
          jupyter
          nodejs # for coc.nvim
          yarn # for coc.nvim
          
          emscripten
          awesome
          qt5.full

          asciinema
          ffcast
          recordmydesktop
          xorg.xwininfo
          xrectsel

          neovim-remote
          (neovim.override { extraPython3Packages = pp: [ pp.jupyter ]; })

          # for text art
          figlet

          # for programming in assembly
          nasm

        ];
        pathsToLink = [ "/share/man" "/share/doc" "/bin" "/etc" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
  }
