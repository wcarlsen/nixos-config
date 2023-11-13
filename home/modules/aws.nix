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
    initExtra = ''
      function assume() {
        export GRANTED_ALIAS_CONFIGURED='true'
        source ${unstablePkgs.granted}/bin/.assume-wrapped "$@"
        unset GRANTED_ALIAS_CONFIGURED
      }
    '';
    sessionVariables = {
      GRANTED_ENABLE_AUTO_REASSUME = "true";
    };
  };
}