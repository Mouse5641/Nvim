-- Налаштування для написання звітів у Markdown.
-- Застосовується тільки до буферів з filetype=markdown.

local o = vim.opt_local
local keymap = vim.keymap.set
local opts = { silent = true, buffer = true }

-- Текст як у редакторі: перенос по словах, без розриву слів
o.wrap = true
o.linebreak = true
o.breakindent = true
o.textwidth = 0

-- Відступи для вкладених списків
o.shiftwidth = 2
o.tabstop = 2

-- Ховати ** та ` у звичайному режимі (render-markdown показує стилі)
o.conceallevel = 2

-- Орфографія: українська + англійська (z= підказки, ]s наступна помилка)
o.spell = true
o.spelllang = { "uk", "en" }

-- Enter / o продовжують список (- , * , + , 1. , > цитату)
o.comments = "b:*,b:-,b:+,n:>"
o.formatoptions:append("r")
o.formatoptions:append("o")
o.formatoptions:append("n")
o.formatlistpat = [[^\s*\d\+\.\s\+]]

-- Рух по видимих (перенесених) рядках
keymap({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, buffer = true })
keymap({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, buffer = true })

-- Форматування виділеного тексту (visual):
--   ,b → **жирний**   ,i → *курсив*   ,c → `код`   ,s → ~~закреслений~~
keymap("v", "<localleader>b", "c**<C-r>\"**<Esc>", opts)
keymap("v", "<localleader>i", "c*<C-r>\"*<Esc>", opts)
keymap("v", "<localleader>c", "c`<C-r>\"`<Esc>", opts)
keymap("v", "<localleader>s", "c~~<C-r>\"~~<Esc>", opts)

-- ,x → перемкнути чекбокс [ ] / [x] (або додати його до пункту списку)
keymap("n", "<localleader>x", function()
  local line = vim.api.nvim_get_current_line()
  local new
  if line:match("^%s*[-*+]%s%[ %]") then
    new = line:gsub("%[ %]", "[x]", 1)
  elseif line:match("^%s*[-*+]%s%[x%]") then
    new = line:gsub("%[x%]", "[ ]", 1)
  elseif line:match("^%s*[-*+]%s") then
    new = line:gsub("^(%s*[-*+]%s)", "%1[ ] ", 1)
  else
    new = line:gsub("^(%s*)", "%1- [ ] ", 1)
  end
  vim.api.nvim_set_current_line(new)
end, opts)

-- ,h → вставити заголовок поточного рівня нижче (або підвищити рівень існуючого)
keymap("n", "<localleader>h", function()
  local line = vim.api.nvim_get_current_line()
  if line:match("^#") then
    vim.api.nvim_set_current_line("#" .. line)
  else
    vim.api.nvim_set_current_line("# " .. line)
  end
end, opts)

-- ,T → вставити YAML-шапку звіту на початок файлу (title / author / date).
-- Саме з неї pandoc будує титульну сторінку (pandoc/report.tex).
-- Сирий HTML (<br>, <div align="center">) у PDF ігнорується.
keymap("n", "<localleader>T", function()
  local months = {
    "січня", "лютого", "березня", "квітня", "травня", "червня",
    "липня", "серпня", "вересня", "жовтня", "листопада", "грудня",
  }
  local d = os.date("*t")
  local date = string.format("%d %s %d", d.day, months[d.month], d.year)
  vim.api.nvim_buf_set_lines(0, 0, 0, false, {
    "---",
    'title: "Назва звіту"',
    'author: "Прізвище Ім\'я"',
    'date: "' .. date .. '"',
    "---",
    "",
  })
  vim.api.nvim_win_set_cursor(0, { 2, 8 })
end, opts)

-- ,p → живий перегляд у браузері
keymap("n", "<localleader>p", "<cmd>MarkdownPreviewToggle<CR>", opts)

-- ,r → увімкнути/вимкнути рендер у буфері (побачити «сирий» markdown)
keymap("n", "<localleader>r", "<cmd>RenderMarkdown toggle<CR>", opts)

-- ,e → експорт у PDF через pandoc (xelatex) і відкрити в zathura
keymap("n", "<localleader>e", function()
  if vim.fn.executable("pandoc") == 0 then
    vim.notify("pandoc не знайдено: sudo pacman -S pandoc-cli", vim.log.levels.ERROR)
    return
  end
  vim.cmd("write")
  local src = vim.fn.expand("%:p")
  local out = vim.fn.expand("%:p:r") .. ".pdf"
  vim.notify("pandoc: експорт у PDF…")
  vim.system({
    "pandoc", src, "-o", out,
    "--pdf-engine=xelatex",
    -- титульна сторінка з YAML-шапки (title / author / date)
    "-H", vim.fn.stdpath("config") .. "/pandoc/report.tex",
    "-V", "lang=uk",
    "-V", "mainfont=Liberation Serif",
    "-V", "monofont=Liberation Mono",
    "-V", "geometry:margin=2cm",
    "-V", "fontsize=12pt",
  }, { text = true }, function(r)
    vim.schedule(function()
      if r.code == 0 then
        vim.notify("PDF збережено: " .. out)
        vim.fn.jobstart({ "zathura", out }, { detach = true })
      else
        vim.notify("pandoc: помилка\n" .. (r.stderr or ""), vim.log.levels.ERROR)
      end
    end)
  end)
end, opts)
