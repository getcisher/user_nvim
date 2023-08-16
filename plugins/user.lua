-- # TODO test
return {
  -- You can also add new plugins here as well:
  { "github/copilot.vim" },
  {
    "zbirenbaum/copilot.lua",
    event = "BufRead",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = "copilot.lua",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "zbirenbaum/copilot-cmp",
    name = "copilot_cmp",
    dependencies = { "zbirenbaum/copilot.lua", opts = {} },
    opts = {},
  },
  opts = function(_, opts) table.insert(opts.sources, { name = "copilot" }) end,
  },
  { "nvim-lua/plenary.nvim" },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opt = {},
    event = "User AstroFile",
    config = function()
      require("todo-comments").setup {
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          NOTE = { icon = " ", color = "#ffffff", alt = { "INFO" } },
          TODO = { icon = " ", color = "#0362E0" },
          HACK = { icon = " ", color = "#b21919" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", color = "#91ffee", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          TEST = { icon = " ", color = "#c0cc81", alt = { "TESTING", "PASSED", "FAILED" } },
        },
      }
    end,
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope keywords=TODO,FIX<cr>" }
    }
  },
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  --
}
