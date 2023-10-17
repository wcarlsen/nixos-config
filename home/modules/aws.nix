{pkgs, ... }:

{
  home.packages = with pkgs; [
    awscli2
    aws-vault
    # (callPackage ./../derivations/granted.nix { })
  ];

  # programs.zsh = {
  #   sessionVariables = {
  #     GRANTED_ALIAS_CONFIGURED = "true";
  #   };
  #   shellAliases = {
  #     assume = ". assume";
  #   };
  # };
}