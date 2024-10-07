{programs, lib, pkgs, ...} : {
  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
  in
  {

    enable = true;

    coc.enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    defaultEditor = true;

    extraLuaConfig = ''
      vim.cmd("let g:netrw_liststyle = 3")

      local opt = vim.opt

      opt.relativenumber = true
      opt.number = true

      -- tabs & indentation
      opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
      opt.shiftwidth = 2 -- 2 spaces for indent width
      opt.expandtab = true -- expand tab to spaces
      opt.autoindent = true -- copy indent from current line when starting new one

      opt.wrap = false

      -- clipboard
      opt.clipboard:append("unnamedplus") -- use system clipboard as default register
      opt.signcolumn = "yes" -- show sign column so that text doesn't shift
        
      -- search settings
      opt.ignorecase = true -- ignore case when searching
      opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

      -- KEY MAPS

      vim.g.mapleader = " "

      local keymap = vim.keymap -- for conciseness

      keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
      keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

      -- increment/decrement numbers
      keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
      keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement


'';

    extraPackages =  with pkgs; [
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-autopairs;
        config = toLua "require('nvim-autopairs').setup()";
      }
      {
        plugin = gitsigns-nvim;
        config = toLua "require('gitsigns').setup()";
      }
      {
        plugin = indent-blankline-nvim;
        config = toLua "require('ibl').setup()"; 
      }
      {
        plugin = lualine-nvim;
        config = toLua "require('lualine').setup()";
      }
      {
        plugin = which-key-nvim;
        config = toLua "require('which-key').setup()";
      }
      {
        plugin = tokyonight-nvim;
        config = toLua ''
          require("tokyonight").setup({
            style = "night",
            transparent = transparent,
            styles = {
              sidebars = transparent,
              floats = transparent,
            },
            on_colors = function(colors)
              colors.bg = transparent
            end,
          })
          vim.cmd("colorscheme tokyonight")
        '';
      }

      vim-surround
    ];

  };
}

