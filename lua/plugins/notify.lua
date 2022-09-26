local notify = require("notify")
vim.notify = notify

notify.setup({
	stages = "slide",
	timeout = 2000,
})
