{pkgs, ...}:

{
  home.packages = with pkgs; [
        terraform-ls
      tflint
      terraform-docs
      tfswitch
  ];

  # Tfswitch
  home.file.".tfswitch.toml".text = ''
    bin = "$HOME/bin/terraform"
    version = "latest"
  '';
}