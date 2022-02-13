require("formatter").setup(
	{
		filetype = {
			vimwiki = {
				-- prettier
				function()
					return {
						exe = "prettier",
						args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
						stdin = true
					}
				end
			},
			markdown = {
				-- prettier
				function()
					return {
						exe = "prettier",
						args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
						stdin = true
					}
				end
			},
			php = {
				-- prettier
				function()
					return {
						exe = "prettier",
						args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--use-tabs"},
						stdin = true
					}
				end
			},
			javascript = {
				-- prettier
				function()
					return {
						exe = "prettier",
						args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
						stdin = true
					}
				end
			},
			typescript = {
				--prettier
				function()
					return {
						exe = "prettier",
						args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
						stdin = true
					}
				end
			},
			typescriptreact = {
				--prettier
				function()
					return {
						exe = "prettier",
						args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
						stdin = true
					}
				end
			},
			rust = {
				-- Rustfmt
				function()
					return {
						exe = "rustfmt",
						args = {"--emit=stdout"},
						stdin = true
					}
				end
			},
			lua = {
				-- luafmt
				function()
					return {
						exe = "luafmt",
						args = {"--use-tabs", "--stdin"},
						stdin = true,
						display_errors = true
					}
				end
			},
			c = {
				-- gnu-format (indent)
				function()
					return {
						exe = "indent",
						args = {"-ts", 4},
						stdin = true
					}
				end
			},
			h = {
				-- gnu-format (indent)
				function()
					return {
						exe = "indent",
						args = {"-ts", 4},
						stdin = true
					}
				end
			},
			cpp = {
				-- gnu-format (indent)
				function()
					return {
						exe = "indent",
						args = {"-ts", 4},
						stdin = true
					}
				end
			},
			go = {
				-- gnu-format (indent)
				function()
					return {
						exe = "gofmt",
						stdin = true
					}
				end
			},
			haskell = {
				-- gnu-format (indent)
				function()
					return {
						exe = "ormolu",
						stdin = true
					}
				end
			}
		}
	}
)

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx,*.c,*.cpp,*.md,*.lua,*.rs,*.go silent FormatWrite
augroup END
]],
	true
)
