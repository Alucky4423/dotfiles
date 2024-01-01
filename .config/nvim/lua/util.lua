-- vim.fn.keymap() のoptsに渡すテーブルの形式に変換する。
--

local function opts(options, desc)
  options = options or {}
  local m = { desc = desc }

  -- Convert: { 'option_name' } => { option_name = true }
  for _, v in ipairs(options) do
    m[v] = true
  end
  return m
end


-- Wrapper function of vim.fn.keymap().
-- 説明文を記載しやすい、類似のmappingをgroupingしている。
--
-- Examples:
-- def('description' function(map)
--   map { mode: string, lhs: string, rhs: string, opts: table[string] }
-- end)
local function def(desc, callback)
  -- This function is called in callback function.
  local __keymap = function(t)
    -- multiple modes str to list. Ex: 'nv' => {'n','v'}
    local mode     = vim.fn.split(t[1], [[\zs]])
    local lhs, rhs = t[2], t[3]
    vim.keymap.set(mode, lhs, rhs, opts(t[4], desc))
  end
  callback(__keymap)
end


return {
  keymap = {
    opts = opts,
    def  = def,
  }
}

