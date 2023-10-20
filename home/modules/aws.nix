{pkgs, unstable, system, ... }:
let
  unstablePkgs = import unstable { overlays = [
    (final: prev:
      {
        granted = prev.granted.overrideAttrs (old: rec {
          pname = "granted";
          version = "1.19.1";
          src = prev.fetchFromGitHub {
            owner = "common-fate";
            repo = pname;
            rev = "v${version}";
            sha256 = "sha256-BvrMfQ/fiAMJCROwOqzt17ae/qqDC2KFdBK2epVImus=";
          };
        });
      })]; inherit system;};
in
{
  home.packages = with pkgs; [
    awscli2
    aws-vault
  ] ++ [
    (unstablePkgs.granted)
  ];

  # programs.zsh = {
  #   sessionVariables = {
  #     GRANTED_ALIAS_CONFIGURED = "true";
  #   };
  #   envExtra = ''
  #     alias assume="source assume"
  #   '';
  # };
}