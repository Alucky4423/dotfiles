-- # Alias
local fn = vim.fn

-- # Automatic installation.
local JETPACK_FILE = fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local JETPACK_URL  = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
if fn.filereadable(JETPACK_FILE) == 0 then
  fn.system(string.format('curl -fsSLo %s --create-dirs %s', JETPACK_FILE, JETPACK_URL))
end

vim.cmd [[packadd vim-jetpack]]
require('jetpack.packer').startup(require('plugin.list'))

-- Automatic plugin installation.
local jetpack = require('jetpack')
for _, name in ipairs(jetpack.names()) do
  if not jetpack.tap(name) then
    jetpack.sync()
    break
  end
end

