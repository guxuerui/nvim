local nm = require("neo-minimap") -- for shorthand use later

-- Lua
nm.set("<LEADER>ml", "lua", {
	query = [[
;; query
((for_statement) @cap) ;; matches for loops
((function_call (dot_index_expression) @field (#eq? @field "vim.keymap.set")) @cap) ;; matches vim.keymap.set
((function_declaration) @cap) ;; matches function declarations
  ]],
	search_patterns = {
		{ "function", "<C-j>", true }, -- jump to the next 'function' (Vim pattern)
		{ "function", "<C-k>", false }, -- jump to the previous 'function' (Vim pattern)
		{ "keymap", "<A-j>", true }, -- jump to the next 'keymap' (Vim pattern)
		{ "keymap", "<A-k>", false }, -- jump to the previous 'keymap' (Vim pattern)
	},
})

-- typexript
nm.set("<LEADER>mm", "typescript", {
 query = [[
;; query
((function_declaration) @cap) ;; matches function declarations
((arrow_function) @cap) ;; matches arrow functions
((identifier) @cap (#vim-match? @cap "^on.*")) ;; matches hooks (useState, useEffect, use***, etc...)
  ]],
})

-- vue
nm.set("<LEADER>mv", "vue", {
 query = [[
;; query
((function_declaration) @cap) ;; matches function declarations
((arrow_function) @cap) ;; matches arrow functions
((identifier) @cap (#vim-match? @cap "^on.*")) ;; matches hooks (useState, useEffect, use***, etc...)
  ]],
})
