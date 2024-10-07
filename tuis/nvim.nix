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

