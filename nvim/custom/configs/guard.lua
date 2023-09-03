local ft = require("guard.filetype")
local lint = require("guard.lint")

ft("c"):fmt("clang-format"):lint({
	cmd = "clang-tidy",
	args = { "--quiet", "-checks='clang-analyzer-*,concurrency-*,performance-*,portability-*'" },
	parse = lint.from_regex({
		source = "clang-tidy",
		regex = ":(%d+):(%d+):%s+(%w+):%s+(.-)%s+%[(.-)%]",
		groups = { "lnum", "col", "severity", "message", "code" },
		severities = {
			information = lint.severities.info,
			hint = lint.severities.info,
			note = lint.severities.style,
		},
	}),
})

ft("python"):fmt("black"):lint({
	cmd = "pylint",
	args = { "--from-stdin", "--output-format", "json", "--disable=R,missing-docstring,invalid-name" },
	stdin = true,
	parse = lint.from_json({
		attributes = {
			severity = "type",
			code = "symbol",
		},
		severities = {
			-- https://pylint.readthedocs.io/en/stable/user_guide/usage/output.html
			informational = lint.severities.info,
			refactor = lint.severities.info,
			convention = lint.severities.info,
			fatal = lint.severities.error,
		},
		source = "pylint",
	}),
})

ft("lua"):fmt("stylua")
ft("html,markdown,css,scss,typescript,javascript,typescriptreact,yaml,json"):fmt("prettier")
ft("sh"):fmt("shfmt"):lint("shellcheck")

require("guard").setup({
	fmt_on_save = true,
	lsp_as_default_formatter = false,
})
