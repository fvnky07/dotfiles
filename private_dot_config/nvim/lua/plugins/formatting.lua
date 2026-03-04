-- Biome takes priority when a biome.json exists in the project root.
-- Delegates to the biome LSP (already attached) rather than spawning a CLI
-- process — avoids the "empty output" error from conform's biome CLI wrapper.
-- Falls back to prettier for projects without biome.json.
return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      local biome_ft = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "jsonc",
        "css",
        "graphql",
      }

      for _, ft in ipairs(biome_ft) do
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        opts.formatters_by_ft[ft] = function(bufnr)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local root = vim.fs.root(fname, { "biome.json", "biome.jsonc" })
          if root then
            -- Return empty — lsp_format = "first" (set below) handles it via
            -- the attached biome LSP, no CLI process needed.
            return {}
          end
          return { "prettierd", "prettier", stop_after_first = true }
        end
      end

      -- When formatter list is empty, use the LSP as the formatter.
      -- "first" = prefer LSP, only fall back to formatters if no LSP attached.
      opts.default_format_opts = opts.default_format_opts or {}
      opts.default_format_opts.lsp_format = "first"

      return opts
    end,
  },
}
