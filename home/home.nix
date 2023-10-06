{ config, pkgs, unstable, system, ... }:
let
  pkgsUnstable = import unstable { inherit system; };
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "wcarlsen";
  home.homeDirectory = "/home/wcarlsen";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [];

  imports = [
    ./modules/aws.nix
    ./modules/kubernetes.nix
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/zellij.nix
    ./modules/vscode.nix
    ./modules/kitty.nix
    ./modules/helix.nix
    ./modules/terraform.nix
    ./modules/go.nix
  ];

  # Editor
  home.sessionVariables = { EDITOR = "hx"; };

  home.packages = with pkgs; [
    rnix-lsp
    nil
    nixpkgs-fmt
    thefuck
    autojump
    exa
    silver-searcher
    bind
    bat
    direnv
    spotify
    firefox
    slack
    pre-commit
    bind
    yubikey-manager-qt
    bitwarden
    gitleaks
    fzf
    fd
    xsel
    htop
    tree
    nnn
    bat
    kooha
    mpv
    e2fsprogs
    tldr
    trayscale
    tig
    lutris
    borgbackup
    # (callPackage ./derivations/veo-cli.nix { })
  ] ++ (with pkgsUnstable; [
    granted
  ]); 

  # Auto upgrade
  services.home-manager.autoUpgrade = {
    enable = false;
    frequency = "daily";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
