--Main config
require("config.lazy")
require("config.keymaps")
require("config.options")
--Additional configuration to plugins
--colorscheme settings
vim.o.background = "dark" -- or "light" for light mode
--1--
vim.opt.termguicolors = true
require("bufferline").setup{}

--2--
--Copilot setup and configuration
require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})

--

--3--
-- Lua configuration
local glance = require('glance')
local actions = glance.actions

glance.setup({
  height = 18, -- Height of the window
  zindex = 45,

  -- By default glance will open preview "embedded" within your active window
  -- when `detached` is enabled, glance will render above all existing windows
  -- and won't be restiricted by the width of your active window
  detached = true,

  -- Or use a function to enable `detached` only when the active window is too small
  -- (default behavior)
  detached = function(winid)
    return vim.api.nvim_win_get_width(winid) < 100
  end,

  preview_win_opts = { -- Configure preview window options
    cursorline = true,
    number = true,
    wrap = true,
  },
  border = {
    enable = false, -- Show window borders. Only horizontal borders allowed
    top_char = '―',
    bottom_char = '―',
  },
  list = {
    position = 'right', -- Position of the list window 'left'|'right'
    width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
  },
  theme = { -- This feature might not work properly in nvim-0.7.2
    enable = true, -- Will generate colors for the plugin based on your current colorscheme
    mode = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
  },
  mappings = {
    list = {
      ['j'] = actions.next, -- Bring the cursor to the next item in the list
      ['k'] = actions.previous, -- Bring the cursor to the previous item in the list
      ['<Down>'] = actions.next,
      ['<Up>'] = actions.previous,
      ['<Tab>'] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
      ['<S-Tab>'] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
      ['<C-u>'] = actions.preview_scroll_win(5),
      ['<C-d>'] = actions.preview_scroll_win(-5),
      ['v'] = actions.jump_vsplit,
      ['s'] = actions.jump_split,
      ['t'] = actions.jump_tab,
      ['<CR>'] = actions.jump,
      ['o'] = actions.jump,
      ['<leader>l'] = actions.enter_win('preview'), -- Focus preview window
      ['q'] = actions.close,
      ['Q'] = actions.close,
      ['<Esc>'] = actions.close,
      ["<C-q>"] = actions.quickfix,
      -- ['<Esc>'] = false -- disable a mapping
    },
    preview = {
      ['Q'] = actions.close,
      ['<Tab>'] = actions.next_location,
      ['<S-Tab>'] = actions.previous_location,
      ['<leader>l'] = actions.enter_win('list'), -- Focus list window
    },
  },
  hooks = {},
  folds = {
    fold_closed = '',
    fold_open = '',
    folded = true, -- Automatically fold list on startup
  },
  indent_lines = {
    enable = true,
    icon = '│',
  },
  winbar = {
    enable = true, -- Available strating from nvim-0.8+
  },
})

--Colorscheme
-- Lua
require('onedark').setup  {
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}

-- Image_preview setup--
require("image_preview").setup({})


--Image setup in my init file--
-- Require and call setup function somewhere in your init.lua
require('image').setup {
  render = {
    min_padding = 5,
    show_label = true,
		show_image_dimensions = true,
    use_dither = true,
    foreground_color = false,
    background_color = false
  },
  events = {
    update_on_nvim_resize = true,
  },
}

    --Neogit setup--
local neogit = require('neogit')

neogit.setup {}
