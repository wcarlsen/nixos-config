{
  programs.git = {
    enable = true;
    userName = "Willi Carlsen";
    userEmail = "carlsenwilli@gmail.com";
    extraConfig = {
      github = {
        user = "wcarlsen";
      };
      push.autoSetupRemote = true;
      pull = {
        rebase = false;
      };
    };
    diff-so-fancy.enable = true;
  };

  programs.gh = {
    enable = true;
  };

  # programs.gh-dash = {
  #   enable = true;
  # };
}