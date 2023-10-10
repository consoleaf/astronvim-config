-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    config = function()
      require("lspconfig").rust_analyzer.setup {
        settings = {
          ["rust_analyzer"] = {
            -- cargo = {
            --   buildScripts = {
            --     enable = true,
            --   },
            -- },
            procMacro = {
              enable = true,
            },
            completion = {
              privateEditable = {
                enable = true,
              },
            },
            hover = {
              actions = {
                references = {
                  enable = true,
                },
              },
            },
            inlayHints = {
              -- bindingModeHints = {
              --   enable = true,
              -- },
              -- lifetimeElisionHints = {
              --   enable = "skip_trivial",
              --   useParameterNames = true,
              -- },
            },
            interpret = {
              tests = true,
            },
            typing = {
              autoClosingAngleBrackets = {
                enable = true,
              },
            },
          },
        },
      }
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = { "stylua" },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}
