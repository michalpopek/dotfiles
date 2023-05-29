-- Shamelessly stolen from https://github.com/nanozuki/CrowsEnv/blob/03d16d07d226f2e0e4fe04fe4f976ee058aa93e9/dot_config/nvim/lua/plugins/statusline.lua

local function file_info()
  local encoding = vim.opt.fileencoding:get()
  local format = vim.bo.fileformat
  if encoding ~= '' then
    return string.format('%s, %s', encoding, format)
  else
    return format
  end
end

local function lsp()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  local text = {}
  local ignored_clients = { 'copilot', 'null-ls' }
  if clients and #clients > 0 then
    for _, client in ipairs(clients) do
      if not vim.tbl_contains(ignored_clients, client.name) then
        text[#text + 1] = client.name
      end
    end
  end
  return table.concat(text, ', ')
end

local function position()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = vim.api.nvim_buf_line_count(vim.api.nvim_win_get_buf(0))
  return string.format('%3d/%d:%-3d', row, lines, col)
end

local block = {
  '',
  draw_empty = true,
  separator = { left = '█' },
}

local nvim_tree = {
  filetypes = { 'NvimTree' },
  sections = {
    lualine_a = { block },
    lualine_c = { 'filetype' },
    lualine_z = { block },
  },
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      extensions = { 'fugitive', 'quickfix', nvim_tree },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          { 'branch', draw_empty = true },
          'diff',
          'diagnostics',
        },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype', { file_info, icon = '󰋽' } },
        lualine_y = { { lsp, icon = '' } },
        lualine_z = { { position, icon = '󰆤' } },
      },
      inactive_sections = {
        lualine_a = { block },
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { file_info, icon = '󰋽' } },
        lualine_y = {},
        lualine_z = { block },
      },
    })
  end,
}
