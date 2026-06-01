return {
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
      })

      require('Comment').setup({
        -- для коректного коментування в JSX/TSX/Vue/HTML
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),

        padding = true,   -- пробіл між символом коментаря і текстом
        sticky = true,    -- курсор залишається на місці після коментування
        ignore = nil,

        toggler = {
          line  = 'gcc',  -- перемикач рядкового коментаря
          block = 'gbc',  -- перемикач блочного коментаря
        },
        opleader = {
          line  = 'gc',   -- рядковий коментар (оператор)
          block = 'gb',   -- блочний коментар (оператор)
        },
        extra = {
          above = 'gcO',  -- додати коментар рядком вище
          below = 'gco',  -- додати коментар рядком нижче
          eol   = 'gcA',  -- додати коментар в кінці рядка
        },
        mappings = {
          basic = true,
          extra = true,
        },
      })
    end,
  },
}
