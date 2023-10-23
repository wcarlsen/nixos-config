{pkgs, unstable, system, ... }:
let
  unstablePkgs = import unstable { inherit system; };
in
{
  home.packages = with pkgs; [
    awscli2
    aws-vault
  ] ++ [
    (unstablePkgs.granted)
  ];

  programs.zsh = {
    sessionVariables = {
      GRANTED_ALIAS_CONFIGURED = "true";
      GRANTED_ENABLE_AUTO_REASSUME = "true";
    };
    envExtra = ''
      alias assume="source ${unstablePkgs.granted}/bin/.assume-wrapped"
    '';
  };
}