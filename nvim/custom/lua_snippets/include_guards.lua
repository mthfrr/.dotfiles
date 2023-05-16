local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

local gards = function()
	return vim.api.nvim_buf_get_name(0):match("^.+/(.+)%..+$"):upper() .. "_H"
end

ls.add_snippets(nil, {
	cpp = {
		s({
			trig = "#ig",
			namr = "Include Gards",
			dscr = "Create include guards",
		}, {
			t({ "#ifndef " }),
			f(gards, {}),
			t({ "", "#define " }),
			f(gards, {}),
			t({ "", "", "" }),
			i(0),
			t({ "", "", "#endif /* " }),
			f(gards, {}),
			t({ " */" }),
		}),
	},
})
