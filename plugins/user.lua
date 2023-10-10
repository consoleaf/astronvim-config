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

  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "uga-rosa/ccc.nvim",
    event = { "User AstroFile", "InsertEnter" },
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
    keys = {
      { "<leader>uC", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle colorizer" },
      { "<leader>zc", "<cmd>CccConvert<cr>", desc = "Convert color" },
      { "<leader>zp", "<cmd>CccPick<cr>", desc = "Pick Color" },
    },
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
    config = function(_, opts)
      local ccc = require "ccc"

      local handle = io.popen "bun ~/Applications/gen-colors.ts"
      local colors_json = handle:read "*a"
      colors_json = vim.json.decode(colors_json)

      opts = vim.tbl_extend("keep", opts, {
        pickers = {
          ccc.picker.hex,
          ccc.picker.css_rgb,
          ccc.picker.css_hsl,
          ccc.picker.css_hwb,
          ccc.picker.css_lab,
          ccc.picker.css_lch,
          ccc.picker.css_oklab,
          ccc.picker.css_oklch,
          ccc.picker.custom_entries(colors_json),
        },
      })

      ccc.setup(opts)

      if opts.highlighter and opts.highlighter.auto_enable then vim.cmd.CccHighlighterEnable() end
    end,
  },

  {
    "MunifTanjim/eslint.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      local eslint = require "eslint"
      eslint.setup {
        bin = "eslint_d",
        code_actions = {
          enable = true,
          apply_on_save = {
            enable = true,
            types = { "directive", "problem", "suggestion", "layout" },
          },
          disable_rule_comment = {
            enable = true,
            location = "separate_line",
          },
        },
        diagnostics = {
          enable = true,
          report_unused_disable_directives = true,
          run_on = "type",
        },
      }
    end,
  },
}
