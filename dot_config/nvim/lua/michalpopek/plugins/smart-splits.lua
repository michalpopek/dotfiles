return {
  'mrjones2014/smart-splits.nvim',
  opts = {
    move_cursor_same_row = true,
    ignored_buftypes = {},
  },
  keys = {
    {
      '<c-h>',
      function()
        require('smart-splits').move_cursor_left()
      end,
      desc = 'resize window left',
    },
    {
      '<c-j>',
      function()
        require('smart-splits').move_cursor_down()
      end,
      desc = 'Move to the window down',
    },
    {
      '<c-k>',
      function()
        require('smart-splits').move_cursor_up()
      end,
      desc = 'Move to the top window',
    },
    {
      '<c-l>',
      function()
        require('smart-splits').move_cursor_right()
      end,
      desc = 'Move to the window right',
    },
    {
      '<c-left>',
      function()
        require('smart-splits').resize_left()
      end,
      desc = 'Move to the window left',
    },
    {
      '<c-right>',
      function()
        require('smart-splits').resize_right()
      end,
      desc = 'resize window right',
    },
    {
      '<c-up>',
      function()
        require('smart-splits').resize_up()
      end,
      desc = 'resize window up',
    },
    {
      '<c-down>',
      function()
        require('smart-splits').resize_down()
      end,
      desc = 'resize window down',
    },
  },
}
