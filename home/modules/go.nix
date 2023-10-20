{pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    goreleaser
    gopls
  ];

  # Vscode
  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      golang.go
    ];
  };
}