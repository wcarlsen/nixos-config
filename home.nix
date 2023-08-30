{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "wcarlsen";
  home.homeDirectory = "/home/wcarlsen";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [];

  # Zsh
  programs = {
    zsh = {
      enable = true;
      sessionVariables = {
        TERM = "xterm-256color";
        PATH = "$PATH:$HOME/bin";
        KUBECONFIG = "$(ls $HOME/.kube/config* | tr '\n' ':')";
      };
      shellAliases = {
        l = "exa --long --header --group-directories-first --git -a --icons";
        groot = "cd $(git rev-parse --show-toplevel)";
        nrs = "nix flake update && sudo nixos-rebuild switch --flake .#";
        ghprc = "gh pr create --fill";
        k = "kubectl";
        kx = "kubectx";
        szsh = "source ~/.zshrc";
        cat = "bat -p";
        awsvault = "unset AWS_VAULT && aws-vault exec $(aws-vault list --profiles | fzf) --duration=1h";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "autojump" "thefuck" "terraform" "kubectl" "aws" "direnv" ];
      };
    };
    starship.enable = true;
  };

  # Git
  programs.git = {
    enable = true;
    userName = "Willi Carlsen";
    userEmail = "carlsenwilli@gmail.com";
    extraConfig = {
      github = {
        user = "wcarlsen";
      };
      push.autoSetupRemote = true;
      pull = {
        rebase = false;
      };
    };
    diff-so-fancy.enable = true;
  };

  # Gh
  programs.gh = {
    enable = true;
  };

  # programs.gh-dash = {
  #   enable = true;
  # };

  # Tmux
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    historyLimit = 50000;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    extraConfig = ''
      # Fix terminal colors
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Vim copy-pasta
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Open panes in current directory
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';
    sensibleOnTop = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      catppuccin
      yank
      urlview
    ];
  };

  # Urlview
  home.file.".urlview".text = ''
    COMMAND xdg-open
  '';

  # Kitty
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    settings = {
      enable_audio_bell = false;
    };
    font = {
      package = null;
      name = "FantasqueSansMono Nerd Font Mono";
      size = 13;
    };
  };

  # Vscode
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = true;
    extensions = with pkgs.vscode-extensions; [
      alefragnani.project-manager
      bbenoist.nix
      jnoortheen.nix-ide
      hashicorp.terraform
      golang.go
      catppuccin.catppuccin-vsc
      github.vscode-github-actions
      bierner.markdown-mermaid
      streetsidesoftware.code-spell-checker
    ];
    userSettings = {
      security.workspace.trust.enabled = false;
      workbench = {
        sideBar.location = "right";
        colorTheme = "Catppuccin Mocha";
      };
      editor = {
        renderWhitespace = "boundary";
        wordWrap = "on";
        fontFamily = "'FantasqueSansMono Nerd Font Mono'";
        fontSize = 18;
      };
      terminal.integrated = {
        fontFamily = "'FantasqueSansMono Nerd Font Mono'";
        fontSize = 18;
      };
      files.trimTrailingWhitespace = true;
      "[terraform]".editor.tabSize = 2;
      "[javascript]".editor.tabSize = 2;
      "[html]".editor.tabSize = 2;
      "[json]".editor.tabSize = 2;
      "[yaml]".editor.tabSize = 2;
      "[nix]".editor.tabSize = 2;
      "[lua]".editor.tabSize = 2;
      projectManager.git.baseFolders = [
        "~/spaghetti"
      ];
    };
  };

  # Helix
  home.sessionVariables = { EDITOR = "hx"; };
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        cursorline = true;
        soft-wrap.enable = true;
        completion-trigger-len = 0;
        whitespace.render.tab = "all";
        cursor-shape.insert = "bar";
        file-picker.hidden = false;
        indent-guides = {
          render = true;
          skip-levels = 1;
        };
      };
      keys.normal.esc = [
        "collapse_selection"
        "keep_primary_selection"
      ];
    };
  };

  # Tfswitch
  home.file.".tfswitch.toml".text = ''
    bin = "$HOME/bin/terraform"
    version = "latest"
  '';

  home.packages = with pkgs; [
    awscli2
    aws-vault
    kubectl
    (callPackage ./kubectx.nix { }) # once feature parity is meet use regular kubectx
    (callPackage ./gitops.nix { })
    k9s
    kubernetes-helm
    kustomize
    minikube
    fluxcd
    argo
    kubent
    rnix-lsp
    nil
    nixpkgs-fmt
    terraform-ls
    tflint
    terraform-docs
    tfswitch
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
    go
    goreleaser
    pre-commit
    bind
    yubikey-manager-qt
    urlview
    bitwarden
    gitleaks
    fzf
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
