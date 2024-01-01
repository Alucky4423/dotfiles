-- netrw global variables wrapper.
local function opts(t)
  for k, v in pairs(t) do
    vim.g['netrw_' .. k] = v
  end
end

opts({
  -- 0:hidden
  -- 1:display
  banner = 0,

  -- 0:filename
  -- 1:filename, timestamp, filesize
  -- 2:multiple files on oneline
  -- 3:tree style
  liststyle = 3,

  list_hide = vim.fn['netrw_gitignore#Hide'](),

  -- initial size when the window is created.
  winsize = 20,

  -- 0:current directory != browsing directory.
  -- 1:current directory == browsing directory.
  keepdir = 0,

  -- 0:horizontal split
  -- 1:vertical split
  preview = 1,
})

