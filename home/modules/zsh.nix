{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
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
        plugins = [ "git" "thefuck" "terraform" "kubectl" "aws" "direnv" ];
      };
    };
    starship.enable = true;
  };
}