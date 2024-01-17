{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "wcarlsen";
  home.homeDirectory = "/home/wcarlsen";

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-24.8.6"
  # ];

  imports = [
    ./modules/aws.nix
    ./modules/kubernetes.nix
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/zellij.nix
    ./modules/tmux.nix
    ./modules/vscode.nix
    ./modules/kitty.nix
    ./modules/helix.nix
    ./modules/terraform.nix
    ./modules/go.nix
    # ./modules/emacs
    ./modules/zoxide.nix
    ./modules/neovim.nix
  ];

  # Editor
  home.sessionVariables = {
    EDITOR = "hx";
    NNN_USE_EDITOR = 1;
  };

  home.packages = with pkgs; [
    gnumake
    rnix-lsp
    nil
    nixpkgs-fmt
    thefuck
    eza
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
    # e2fsprogs
    tldr
    # trayscale
    tig
    lutris
    wineWowPackages.stable
    borgbackup
    nodePackages.bash-language-server
    nodePackages.dockerfile-language-server-nodejs
    marksman
    hey
    jq
    nodejs
    ipcalc
    # (callPackage ./derivations/veo-cli.nix { })
  ];

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
