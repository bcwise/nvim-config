require("bufferline").setup({
	options = {
		mode = "buffers", -- can also be set to "tabs" to see tabpages
		themable = false, -- whether or not the highlights for this plugin can be overriden.
		-- For ⁸·₂
		numbers = function(opts)
			return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
		end,
		--numbers = function({ ordinal, id, lower, raise }): string
		--end
		--number_style = "superscript"
		--mappings = true,
		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will NOT be fixed.
		name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
			-- remove extension from markdown files for example
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is deduplicated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		custom_filter = function(buf_number, buf_numbers)
			-- filter out filetypes you don't want to see
			if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
				return true
			end
			-- filter out by buffer name
			if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
				return true
			end
			-- filter out based on arbitrary rules
			-- e.g. filter out vim wiki buffer from tabline in your work repo
			if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
				return true
			end
			-- filter out by it's index number in list (don't show first buffer)
			if buf_numbers[1] ~= buf_number then
				return true
			end
		end,
		groups = {
			options = {
				--toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
			},
			items = {
				{
					name = "Tests", -- Mandatory
					highlight = { gui = "underline", guisp = "blue" }, -- Optional
					priority = 2, -- determines where it will appear relative to other groups (Optional)
					icon = "", -- Optional
					matcher = function(buf) -- Mandatory
						return buf.filename:match("%_test") or buf.filename:match("%_spec")
					end,
				},
				{
					name = "Docs",
					highlight = { gui = "undercurl", guisp = "green" },
					auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
					matcher = function(buf)
						return buf.filename:match("%.md") or buf.filename:match("%.txt")
					end,
					separator = { -- Optional
						style = require("bufferline.groups").separator.tab,
					},
				},
			},
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { "|", "|" }
		--separator_style = "slant" | "padded_slant" | "thick" | "thin" | { "any", "any" },
		separator_style = "padded_slant",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
		sort_by = function(buffer_a, buffer_b)
			-- add custom logic
			return buffer_a.modified > buffer_b.modified
		end,
	},
})
