local api, fn = vim.api, vim.fn

local function augroup(group, callback)
  local name = api.nvim_create_augroup(group, { clear = true })
  local autocmd = function(event, opts)
    opts.group = name
    api.nvim_create_autocmd(event, opts)
  end
  callback(autocmd)
end

local function config(plugin_name)
  return function() require('plugin.config.' .. plugin_name) end
end

-- # return callback function.
-- called by 
--   require('jetpack.packer').startup(require('plugin.list'))
return function(use)
-- # bootstrap
  use { 'tani/vim-jetpack', opt = 1 } 

-- # fern
  use {
    'lambdalisue/fern.vim',
    config = function()
      vim.g['fern#renderer#nerdfont#indent_markers'] = 1
      vim.g['fern#renderer'] = 'nerdfont'
      augroup('my-glyph-palette', function(autocmd)
        autocmd('FileType', {
          pattern = 'fern',
          callback = function() fn['glyph_palette#apply']() end
        })
      end)
    end,
  }
  use { 'lambdalisue/nerdfont.vim' }
  use { 'lambdalisue/fern-renderer-nerdfont.vim' }
  use { 'lambdalisue/glyph-palette.vim' }

-- # lualine
  use { 'nvim-lualine/lualine.nvim', config = config('lualine') }

-- # treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'vim', 'lua' },
        sync_install     = false,
        auto_install     = true,
        highlight        = { enable = true }
      })
    end
  }

-- # color scheme.
  use {
    'sainnhe/everforest',
    config = function()
      vim.g.everforest_background = 'hard'
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
      vim.cmd [[colorscheme everforest]]
    end
  }
end

