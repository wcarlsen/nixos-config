{
  programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = true;
      theme = "catppuccin-mocha";
      scroll_buffer_size = 50000;
      pane_frames = false;
      ui = {
        pane_frames = {
          hide_session_name = true;
        };
      };
    };
  };
}