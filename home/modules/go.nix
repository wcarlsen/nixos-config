{pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    goreleaser
  ];

  # Vscode
  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      golang.go
    ];
  };
}