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
      qtconsole

      matplotlib
      numpy
      tensorflow
      pandas
      pytorchWithCuda
      scikitimage
      torchvision
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
        name = "user-packages";
        paths = [
          python-stuff
          nixpkgs-fmt
          jupyter
          nodejs # for coc.nvim
          yarn # for coc.nvim
          qt5.full

          asciinema
          ffcast
          recordmydesktop
          xorg.xwininfo
          xrectsel

          neovim-remote
          (neovim.override { extraPython3Packages = pp: [ pp.jupyter ]; })

          # stress testing
          mprime
          s-tui
          nvtop
          linuxPackages.turbostat
          geekbench
        ];
      };
    };
  }
