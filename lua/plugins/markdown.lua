return {
  -- Гарний рендер markdown прямо в буфері:
  -- заголовки, списки, чекбокси, таблиці, блоки коду, цитати.
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      -- рендер вимикається на рядку з курсором, щоб бачити "сирий" текст
      render_modes = { "n", "c", "t" },
      heading = {
        sign = false,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      code = {
        sign = false,
        width = "block",
        left_pad = 1,
        right_pad = 1,
      },
      bullet = { icons = { "●", "○", "◆", "◇" } },
      checkbox = {
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 " },
      },
      -- не потрібен pylatexenc для формул
      latex = { enabled = false },
    },
  },

  -- Живий перегляд у браузері (:MarkdownPreviewToggle)
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_close = 0 -- не закривати перегляд при виході з буфера
      vim.g.mkdp_theme = "light" -- звіти зазвичай друкуються на білому
    end,
  },

  -- Автоформатування таблиць: ,tm → увімкнути режим, далі просто набирати | ... |
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    init = function()
      vim.g.table_mode_corner = "|" -- GFM-сумісні таблиці
      vim.g.table_mode_map_prefix = "<localleader>t" -- ,tm / ,tt / ,tr
    end,
  },
}
