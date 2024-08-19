return {
  "epwalsh/obsidian.nvim",
  init = function() vim.opt.conceallevel = 2 end,
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown"
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre */vaults/*/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["gf"] = {
              function()
                if require("obsidian").util.cursor_on_markdown_link() then
                  return require("obsidian").util.gf_passthrough()
                else
                  return "gf"
                end
              end,
              desc = "Obsidian Follow Link",
            },
            ["<Leader>O"] = { desc = "Obsidian" },
            ["<Leader>Ot"] = {
              "<Cmd>ObsidianTemplate<CR>",
              desc = "Select template to add to note",
            },
            ["<Leader>Of"] = {
              "<Cmd>s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<CR>",
              desc = "Format note Title",
            },
          },
        },
      },
    },
  },
  opts = {
    workspaces = {
      {
        name = "brain",
        path = "~/Documents/vaults/brain",
      },
    },
    disable_frontmatter = true,
    use_advanced_uri = true,
    finder = "telescope.nvim",
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
  },
}
