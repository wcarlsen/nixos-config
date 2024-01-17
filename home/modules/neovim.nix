{ pkgs, nixvim, ... }:
{
  imports = [ nixvim.homeManagerModules.nixvim ];

  home.packages = with pkgs; [
    ripgrep
  ];

  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-sleuth
    ];

    plugins = {
      lualine.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fb" = "buffers";
          "<leader>fg" = "live_grep";
        };
      };

      nvim-tree.enable = true;

      fugitive.enable = true;

      gitsigns.enable = true;

      floaterm.enable = true;

      comment-nvim = {
        enable = true;
        mappings.basic = true;
      };
    };

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      expandtab = true;
    };

    keymaps = [ ];
  };
}
