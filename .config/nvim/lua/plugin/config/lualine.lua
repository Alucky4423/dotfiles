require('lualine').setup({
  options = {
    theme = 'everforest',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = ' ', right = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'encoding', 'fileformat', 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { left = '', right = ' ' }, left_padding = 2 },
    },
  },
})

