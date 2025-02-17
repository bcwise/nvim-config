-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) --  For `ultisnips` user.
			--vim.fn["vsnip#anonymous"](args.body)        -- For `vsnip` user.
			--require('luasnip').lsp_expand(args.body)  -- For `luasnip` user.
			--vim.fn["UltiSnips#Anon"](args.body)       -- For `ultisnips` user.
			--require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
		["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
				--elseif luasnip.expand_or_jumpable() then
				--    luasnip.expand_or_jump()
				--elseif has_words_before() then
				--    cmp.complete()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
				--elseif luasnip.jumpable(-1) then
				--    luasnip.jump(-1)
            else
              fallback()
            end
          end,
		["<CR>"]  = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.abort(),
		["<Esc>"] = cmp.mapping.close(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	}),
	sources = {
    { name = 'nvim_lsp' }, -- For nvim-lsp
    { name = 'UltiSnips' }, -- For ultisnips user.
    { name = 'nvim_lua' }, -- for nvim lua function
    { name = 'path' }, -- for path completion
    { name = 'buffer', keyword_length = 4 }, -- for buffer word completion
    { name = 'omni' },
    { name = 'emoji', insert = true, } -- emoji completion
	},
	completion = {
		keyword_length = 1,
    completeopt = "menu,noselect,noselect"
  },
  view = {
    entries = 'custom',
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        nvim_lsp  = "[LSP]",
        ultisnips = "[US]",
        nvim_lua  = "[Lua]",
        path      = "[Path]",
        buffer    = "[Buffer]",
        latex_symbols = "[Latex]",
        emoji         = "[Emoji]",
        omni          = "[Omni]",
      }),
		}),
	},
})

--  see https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
vim.cmd([[
  highlight! link CmpItemMenu Comment
  " gray
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  " blue
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  " light blue
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
  " pink
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  " front
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])
