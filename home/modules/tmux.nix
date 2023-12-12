{pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    historyLimit = 50000;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    extraConfig = ''
      # Fix terminal colors
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Renumber windows
      set -g renumber-windows on

      # Disable window renaming
      set-option -g allow-rename off

      # Vim copy-pasta
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Open panes in current directory
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Top status bar
      set -g status-position top
    '';
    sensibleOnTop = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      catppuccin
      yank
      urlview
      tmux-fzf
      jump
    ];
  };

  home.packages = with pkgs; [
    urlview
  ];

  # Urlview
  home.file.".urlview".text = ''
    COMMAND xdg-open
  '';
}
