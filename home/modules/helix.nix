{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        cursorline = true;
        soft-wrap.enable = true;
        completion-trigger-len = 0;
        whitespace.render.tab = "all";
        cursor-shape.insert = "bar";
        file-picker.hidden = false;
        indent-guides = {
          render = true;
          skip-levels = 1;
        };
      };
      keys.normal.esc = [
        "collapse_selection"
        "keep_primary_selection"
      ];
    };
  };
}