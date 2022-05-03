require("null-ls").setup({
	sources = {
		require("null-ls").builtins.completion.luasnip,
		require("null-ls").builtins.completion.spell,
		require("null-ls").builtins.code_actions.gitsigns,
		require("null-ls").builtins.code_actions.proselint,
		require("null-ls").builtins.code_actions.shellcheck,
		require("null-ls").builtins.diagnostics.chktex,
		require("null-ls").builtins.diagnostics.checkmake,
		require("null-ls").builtins.diagnostics.cppcheck,
		--require("null-ls").builtins.diagnostics.cspell,
		require("null-ls").builtins.diagnostics.eslint,
		-- require("null-ls").builtins.diagnostics.flake8,      -- Python
		require("null-ls").builtins.diagnostics.gccdiag,
		require("null-ls").builtins.diagnostics.gitlint,
		--require("null-ls").builtins.diagnostics.missspell,
		-- require("null-ls").builtins.diagnostics.pylint, -- Python
		-- require("null-ls").builtins.diagnostics.pylint.with({ -- Python
		-- 	cwd = function(params)
		-- 		-- falls back to root if return value is nil
		-- 		return params.root:match("my-special-project") and "my-special-cwd"
		-- 	end,
		-- }),
		-- require("null-ls").builtins.diagnostics.pylama,
		-- will show code and source name
		require("null-ls").builtins.diagnostics.shellcheck.with({
			diagnostics_format = "[#{c}] #{m} (#{s})",
		}),
		-- require("null-ls").builtins.diagnostics.vint,
		require("null-ls").builtins.diagnostics.write_good.with({
			diagnostics_postprocess = function(diagnostic)
				diagnostic.severity = diagnostic.message:find("really") and vim.diagnostic.severity["ERROR"]
					or vim.diagnostic.severity["WARN"]
			end,
		}),
		require("null-ls").builtins.formatting.astyle,
		require("null-ls").builtins.formatting.bibclean,
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.clang_format,
		require("null-ls").builtins.formatting.cmake_format,
		require("null-ls").builtins.formatting.latexindent,
		require("null-ls").builtins.formatting.lua_format,
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.rustfmt,
		require("null-ls").builtins.formatting.shellharden,
		require("null-ls").builtins.formatting.shfmt,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.tidy,
		require("null-ls").builtins.formatting.uncrustify,
		require("null-ls").builtins.formatting.xmllint,
		require("null-ls").builtins.hover.dictionary,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
