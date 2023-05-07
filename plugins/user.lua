if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_transparency = 0.95
end

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "mg979/vim-visual-multi",
    event = "BufRead",
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "renerocksai/calendar-vim" },
    opts = {
      home = vim.fn.expand "~/notes", -- Put the name of your notes directory here
    },
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function(plugin, opts)
      require "plugins.configs.telescope" (plugin, opts) -- include the default astronvim config that calls the setup call
      require("telescope").load_extension "projects"
    end,
  },
}
