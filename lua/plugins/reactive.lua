return {
	'rasulomaroff/reactive.nvim',
	opts = function()
		local mypreset = {
			name = 'mypreset',
			init = function()
				vim.opt.cursorline = true
				vim.opt.termguicolors = true
			end,
			static = {
				winhl = {
					inactive = {
						CursorLine = { bg = '#21202e' },
						CursorLineNr = { fg = '#b0b0b0', bg = '#21202e' },
					},
				},
			},
			modes = {
				-- this does not work when whichkey is enabled
				no = {
					operators = {
						[{ 'gu', 'gU', 'g~', '~' }] = {
							winhl = {
								CursorLine = { bg = '#334155' },
								CursorLineNr = { fg = '#cbd5e1', bg = '#334155' },
							},
						},
						c = {
							winhl = {
								CursorLine = { bg = '#162044' },
								CursorLineNr = { fg = '#93c5fd', bg = '#162044' },
							},
						},
						d = {
							winhl = {
								CursorLine = { bg = '#350808' },
								CursorLineNr = { fg = '#fca5a5', bg = '#350808' },
							},
						},
						y = {
							winhl = {
								CursorLine = { bg = '#422006' },
								CursorLineNr = { fg = '#fdba74', bg = '#422006' },
							},
						},
					},
				},

				i = {
					winhl = {
						CursorLine = { bg = '#012828' },
						CursorLineNr = { fg = '#5eead4', bg = '#012828' },
					},
				},
				c = {
					winhl = {
						CursorLine = { bg = '#202020' },
						CursorLineNr = { fg = '#ffffff', bg = '#303030' },
					},
				},
				n = {
					winhl = {
            CursorLine = { bg = '#24283b' },
            CursorLineNr = { fg = '#ffffff', bg = '#24283b' },
					},
				},
				[{ 'v', 'V', '\x16' }] = {
					winhl = {
						CursorLineNr = { fg = '#d8b4fe' },
						Visual = { bg = '#3b0764' },
					},
				},
				[{ 's', 'S', '\x13' }] = {
					winhl = {
						CursorLineNr = { fg = '#c4b5fd' },
						Visual = { bg = '#2e1065' },
					},
				},
				R = {
					winhl = {
						CursorLine = { bg = '#083344' },
						CursorLineNr = { fg = '#67e8f9', bg = '#083344' },
					},
				},
			},
		}
		require('reactive').add_preset(mypreset)
		return {
			builtin = {
				cursorline = false,
				cursor = false,
				modemsg = false,
			},
		}
	end,
}
