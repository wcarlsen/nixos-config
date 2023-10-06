{pkgs, ... }:

{
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
}