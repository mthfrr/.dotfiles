local gards = function()
  return vim.api.nvim_buf_get_name(0):match("^.+/(.+)%..+$"):upper() .. "_H"
end

return {
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
}
