{pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      alefragnani.project-manager
      bbenoist.nix
      bierner.markdown-mermaid
      catppuccin.catppuccin-vsc
      github.vscode-github-actions
      jnoortheen.nix-ide
      ms-python.python
      streetsidesoftware.code-spell-checker
    ];
    #  ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    #  {
    #      name = "codeium";
    #      publisher = "Codeium";
    #      version = "1.6.16";
    #      sha256 = "sha256-vrESXa2Z/GLbRwiZxbYZ2MY6isUXCYFiTTRrk6hKH90=";
    #  }
    # ];
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
