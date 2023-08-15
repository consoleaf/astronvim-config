local function load_env_proxy()
  local handle = io.popen "bash -c 'source ~/scripts/proxy.sh && echo -n $WINDOWS_IP'"
  if handle ~= nil then
    local result = handle:read "*a"
    vim.env.http_proxy = "http://" .. result .. ":8888"
    vim.env.https_proxy = "http://" .. result .. ":8888"
    handle:close()
  end
end

load_env_proxy()

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "ironhouzi/bikey-nvim",
  },
  {
    "justinmk/vim-sneak",
    event = "BufRead",
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    config = function()
      require("cmp").setup {
        sources = {
          { name = "nvim_lsp_signature_help" },
        },
      }
    end,
  },
  {
    "Jxstxs/conceal.nvim",
    dev = true,
    dir = "/home/yakshibaev/forks/conceal.nvim",
    event = "BufRead",
    config = function()
      local conceal = require "conceal"
      conceal.setup {
        ["typescript"] = {
          enabled = true,
        },
        ["lua"] = {
          enabled = true,
        },
        ["python"] = {
          enabled = true,
        },
      }
      conceal.generate_conceals()
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "wfxr/minimap.vim",
    event = "BufRead",
  },
  {
    "haringsrob/nvim_context_vt",
    event = "BufRead",
    opts = {
      prefix = "",
    },
  },
  {
    "lewis6991/hover.nvim",
    event = "VeryLazy",
    config = function()
      require("hover").setup {
        init = function()
          -- Require providers
          require "hover.providers.lsp"
          -- require('hover.providers.gh')
          -- require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
          border = nil,
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = true,
        title = true,
      }

      -- Setup keymaps
      vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
      vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
    end,
  },
  {
    "jubnzv/virtual-types.nvim",
    event = "BufRead",
  },
}
