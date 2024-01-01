local set, setglobal, setlocal = vim.opt, vim.opt_global, vim.opt_local
local fn = vim.fn

set.fileencoding  = 'utf-8'
set.fileencodings = { 'utf-8', 'cp932' }

set.fileformat  = 'unix'
set.fileformats = { 'unix', 'dos', 'mac' }

set.clipboard:append { 'unnamedplus' }

set.title      = true
set.number     = true
set.cmdheight  = 2
set.wrap       = false
set.scrolloff  = 7
set.laststatus = 3
set.list       = true
set.listchars  = {
  eol      = fn.nr2char(0xebea),
  tab      = fn.nr2char(0xf101)..[[\ ]],
  precedes = fn.nr2char(0xf101),
  extends  = fn.nr2char(0xf101),
  nbsp     = fn.nr2char(0xf444),
  space    = fn.nr2char(0xff65),
}

set.expandtab   = true
set.tabstop     = 2
set.shiftwidth  = 0
set.softtabstop = -1

local STD_PLUGINS = {
  'gzip',
  'matchit',
--  'matchparen',
--  'netrwPlugin',
--  'rplugin',
--  'shada',
--  'spellfile',
  'tarPlugin',
  'tohtml',
  'tutor',
  'zipPlugin',
  'man.lua',
}

-- Disabled default plugins.
for _, plugin in pairs(STD_PLUGINS) do
  vim.g['loaded_' .. plugin] = 1
end

