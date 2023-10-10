return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.monokai-pro-nvim" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  { import = "astrocommunity.colorscheme.nvim-juliana" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },
  { import = "astrocommunity.code-runner.overseer-nvim" },

  -- { import = "astrocommunity.color.ccc-nvim" },

  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.git-blame-nvim" },

  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },

  { import = "astrocommunity.motion.nvim-surround" },

  { import = "astrocommunity.note-taking.obsidian-nvim" },
  -- { import = "astrocommunity.note-taking.neorg" },

  -- {
  --   import = "astrocommunity.project.project-nvim",
  --   opts = {
  --     silent_chdir = false,
  --     detection_methods = { "pattern", "lsp" },
  --     patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", ".project" },
  --   },
  -- },

  { import = "astrocommunity.scrolling.mini-animate" },

  { import = "astrocommunity.utility.neodim" },

  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },

  { import = "astrocommunity.media.vim-wakatime" },
  --
  -- { import = "astrocommunity.note-taking.obsidian-nvim", opts = { disable_frontmatter = true } },

  -- { import = "astrocommunity.bars-and-lines.feline-nvim" },
  -- { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
}
