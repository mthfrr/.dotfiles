return {
  "f-person/git-blame.nvim",
  lazy = true,
  -- event = "VeryLazy",
  opts = {
    enabled = false,
    date_format = "%d-%m-%y %H:%M",
  },
  cmd = {
    "GitBlameToggle",
    "GitBlameEnable",
    "GitBlameDisable",
    "GitBlameOpenCommitURL",
    "GitBlameCopySHA",
    "GitBlameCopyCommitURL",
    "GitBlameOpenFileURL",
    "GitBlameCopyFileURL",
  },
}
