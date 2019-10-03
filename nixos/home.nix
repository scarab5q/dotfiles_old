{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib, config ? pkgs.config
, options ? pkgs.options, ... }:

# let appConfigs = import ./appConfigs { };
in {
  programs.home-manager.enable = true;
  programs.home-manager.path =
    "https://github.com/rycee/home-manager/archive/master.tar.gz";
  home.stateVersion = "18.09";

  xdg.enable = true;

  programs.go.packages = {
    "golang.org/x/text" = builtins.fetchGit "https://go.googlesource.com/text";
    "golang.org/x/time" = builtins.fetchGit "https://go.googlesource.com/time";
  };
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.taskwarrior.enable = true;
  programs.my-git.enable = true;
  # programs.vim = {
  #   # plugins = appConfigs.vim.knownPlugins;
  #   settings = {
  #     expandtab = true;
  #     hidden = true;
  #     mouse = "a";
  #     number = true;
  #     relativenumber = true;
  #     shiftwidth = 2;
  #     tabstop = 4;
  #   };
  #   extraConfig = appConfigs.vim.vimConfig;
  # };
  programs.zsh = {
    enableAutosuggestions = true;
    initExtra = ''
      eval "$(${pkgs.fasd}/bin/fasd --init auto)"
      eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      custom = "${builtins.getEnv "HOME"}/.zsh_custom";
      theme = "powerlevel9k/powerlevel9k";
    };
    # sessionVariables = sessionVariables;
  };

  programs.ssh.enable = true;
  programs.ssh.matchBlocks = pkgs.callPackage ./sshConfig { };

  programs.bash.enableAutojump = true;
  programs.bash.initExtra = ''
    eval "$(${pkgs.fasd}/bin/fasd --init auto)"
  '';

  imports = [ ./home ];
} // (if lib.pathExists ./home.dist.nix then
  import ./home.dist.nix { inherit pkgs config lib; }
else
  { })
