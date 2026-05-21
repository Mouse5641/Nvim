return {
  {
    "lervag/vimtex",
    lazy = false,                    
    init = function()
      -- Основні налаштування
      vim.g.vimtex_view_method = "zathura"        
      vim.g.vimtex_compiler_method = "latexmk"

      -- Автозбереження + автокомпіляція
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build",
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      -- -- Локальний лідер (зручніше ніж <localleader>)
      -- vim.g.maplocalleader = ","

      -- Красивий TOC
      vim.g.vimtex_toc_config = {
        split_width = 30,
        mode = 1,
        fold_enable = 1,
      }
    end,
  },

  -- LSP (TexLab)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          settings = {
            texlab = {
              diagnostics = {
                ignoredPatterns = { "Underfull", "Overfull" },
              },
            },
          },
        },
      },
    },
  },
}
