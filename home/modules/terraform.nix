{pkgs, ...}:

{
  home.packages = with pkgs; [
    terraform-ls
    tflint
    tfsec
    terraform-docs
    tfswitch
  ];

  # Tfswitch
  home.file.".tfswitch.toml".text = ''
    bin = "$HOME/bin/terraform"
    version = "latest"
  '';

  # Vscode
  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      hashicorp.terraform
    ];
  };
}