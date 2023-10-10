-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>z"] = { name = "Zettelkasten" },
    -- Launch panel if nothing is typed after <leader>z
    ["<leader>zZ"] = { "<cmd>Telekasten panel<CR>" },
    -- Most used functions
    ["<leader>zf"] = { "<cmd>Telekasten find_notes<CR>" },
    ["<leader>zg"] = { "<cmd>Telekasten search_notes<CR>" },
    ["<leader>zd"] = { "<cmd>Telekasten goto_today<CR>" },
    ["<leader>zz"] = { "<cmd>Telekasten follow_link<CR>" },
    ["<leader>zn"] = { "<cmd>Telekasten new_note<CR>" },
    ["<leader>zc"] = { "<cmd>Telekasten show_calendar<CR>" },
    ["<leader>zb"] = { "<cmd>Telekasten show_backlinks<CR>" },
    ["<leader>zI"] = { "<cmd>Telekasten insert_img_link<CR>" },
    -- Call insert link automatically when we start typing a link

    ["<leader>w"] = { "<C-w>", desc = "+windows" },
    ["<leader>fp"] = {
      function() require("telescope").extensions.projects.projects {} end,
      desc = "Projects",
    },

    ["gd"] = {
      function() require("telescope.builtin").lsp_definitions() end,
    },

    ["gD"] = {
      function() require("telescope.builtin").lsp_definitions { jump_type = "vsplit" } end,
      desc = "Split and jump to def",
    },

    ["gr"] = {
      function() require("telescope.builtin").lsp_references {} end,
    },

    ["gR"] = {
      function() require("telescope.builtin").lsp_references { jump_type = "vsplit" } end,
      desc = "References in split",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
