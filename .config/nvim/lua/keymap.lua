local util = require('util')
local def = util.keymap.def


-- # Wrapper function, aliases.

--  Termcodes wrapper function.
local function t(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end

-- keymap options. default is false.
-- { 'buffer', 'expr', 'nowait', 'remap', 'replace_keycode', 'script', 'silent', 'unique' }
local silent = 'silent'

-- # Define keymappings.

vim.g.mapleader = t('<Space>')

def('Use Esc key in terminal.', function(map)
  map({ 't', '<Esc>', [[<C-\><C-n>]], { silent } })
end)

def('Replace : <=> ;', function(map)
  map({ 'n', ';', ':' })
  map({ 'n', ':', ';' })
end)

def('Move on the displayed line.', function(map)
  map({'nv', 'j', 'gj', { silent } })
  map({'nv', 'k', 'gk', { silent } })
  map({'nv', 'gj', 'j', { silent } })
  map({'nv', 'gk', 'k', { silent } })
end)

def('Move to first of line, end of line.', function(map)
  map({ 'nv', 'H', '0', { silent } })
  map({ 'nv', 'L', '$', { silent } })
end)

def('Move between tabs.', function(map)
  map({ 'n', '<Leader>T', 'gT', { silent } })
  map({ 'n', '<Leader>t', 'gt', { silent } })
end)

def('Move between buffers.', function(map)
  map({ 'n', '<Leader>B', ':bprev<Enter>', { silent } })
  map({ 'n', '<Leader>b', ':bnext<Enter>', { silent } })
end)

def('Move between windows.', function(map)
  map({ 'n', '<Leader>W', '<C-w>W', { silent } })
  map({ 'n', '<Leader>w', '<C-w>w', { silent } })
  map({ 't', '<Leader>W', [[<C-\><C-w>W]], { silent } })
  map({ 't', '<Leader>w', [[<C-\><C-w>w]], { silent } })
end)

def('Fern open.', function(map)
-- if use netRW: map({ 'n', '<Leader>e', ':Lex<Enter>', { silent }, })
  map({ 'n', '<Leader>e', ':Fern . -drawer -reveal=% -stay -toggle<Enter>', { silent } })
end)

--local desc = 'matchit % => <tab>'
--keymap('n', '1', '%', opts({ silent }, desc))

