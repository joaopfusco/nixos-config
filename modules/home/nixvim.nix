{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      # --- C# / .NET ---
      netcoredbg
      omnisharp-roslyn

      # --- Ferramentas de Busca ---
      ripgrep
      fd

      # --- Formatação e Linting ---
      astyle

      # --- Clipboard ---
      xclip
      wl-clipboard
    ];

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      swapfile = false;
      backup = false;
      undofile = true;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 8;
      mouse = "a";
    };

    globals.mapleader = " ";

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    plugins = {
      web-devicons.enable = true; 
      lualine.enable = true;
      treesitter.enable = true;
      nvim-autopairs.enable = true;

      neo-tree = {
        enable = true;
        settings.close_if_last_window = true;
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
        };
      };

      lsp = {
        enable = true;
        servers = {
          lua_ls.enable = true;
          nixd.enable = true;
          ts_ls.enable = true;
          pyright.enable = true;
          gopls.enable = true;
          roslyn.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
        keymaps.lspBuf = {
          "gd" = "definition";
          "gr" = "references";
          "K" = "hover";
          "<leader>ca" = "code_action";
          "<leader>rn" = "rename";
        };
      };

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
        };
      };

      comment.enable = true;
      gitsigns.enable = true;
    };

    keymaps = [
      # Sair do modo insert rápido
      { mode = "i"; key = "jk"; action = "<ESC>"; }
      
      # Explorador de arquivos
      { mode = "n"; key = "<leader>e"; action = ":Neotree toggle<CR>"; }
      { mode = "n"; key = "<leader>gf"; action = ":Neotree reveal<CR>";}

      # Salvar e Limpar busca
      { mode = "n"; key = "<leader>w"; action = ":w<CR>"; }
      { mode = "n"; key = "<leader>nh"; action = ":nohlsearch<CR>"; }

      # Navegação entre janelas (Splits)
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; }

      # Mover linhas (Alt + j/k)
      { mode = "n"; key = "<A-j>"; action = ":m .+1<CR>=="; }
      { mode = "n"; key = "<A-k>"; action = ":m .-2<CR>=="; }
      { mode = "v"; key = "<A-j>"; action = ":m '>+1<CR>gv=gv"; }
      { mode = "v"; key = "<A-k>"; action = ":m '<-2<CR>gv=gv"; }

      # Manter seleção ao indentar
      { mode = "v"; key = "<"; action = "<gv"; }
      { mode = "v"; key = ">"; action = ">gv"; }
    ];
  };
}