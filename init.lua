

return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- colorscheme = "nightfox",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "bqnlsp",
    },
    plugins = {
      -- { -- override nvim-cmp plugin
      -- "hrsh7th/nvim-cmp",
      -- -- override the options table that is used in the `require("cmp").setup()` call
      -- opts = function(_, opts)
      --   -- opts parameter is the default options table
      --   -- the function is lazy loaded so cmp is able to be required
      --   local cmp = require "cmp"
      --   -- modify the sources part of the options table
      --   opts.sources = cmp.config.sources {
      --     { name = "nvim_lsp", priority = 1000, trigger_characters = { '-' } },
      --     { name = "luasnip", priority = 750 },
      --     { name = "buffer", priority = 500 },
      --     { name = "path", priority = 250 },
      --   }
      --   -- return the new table to be used
      --   return opts
      -- end,
      -- },
    },
    config = {
      unocss = {
        filetypes = { "pug" },
        single_file_support = false,
        cmd = { "unocss-language-server", "--stdio" },
        -- root_dir = function()
        --   return require("lspconfig.util").root_pattern('unocss.config.js', 'unocss.config.ts', 'uno.config.js', 'uno.config.ts')
        -- end,
        handlers = {
          ["textDocument/documentHighlight"] = function() end,
        },
      },
      -- bqnlsp = function ()
      --   vim.lsp.start({
      --     cmd = {"bqnlsp"},
      --     filetypes = { "bqn" },
      --   });
      --   return {
      --     cmd = { "bqnlsp" },
      --     cmd_env = {},
      --     filetypes = { "bqn" },
      --     -- root_dir = require("lspconfig.util").find_git_ancestor,
      --     single_file_support = false,
      --   }
      -- end
      -- emmet_ls = function(opts)
      --   opts.filetypes = require("astronvim.utils").list_insert_unique(opts.filetypes, "vue")
      --   return opts
      -- end,
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        -- allow_filetypes = { -- enable format on save for specified filetypes only
        --   -- "go",
        -- },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    -- Set up Copilot keybindings
    local copilot_options = { silent = true, expr = true, script = true }
    -- vim.api.nvim_set_keymap("i", "<C-cr>", "copilot#Accept(<Tab>)", copilot_options)
  end,
}
