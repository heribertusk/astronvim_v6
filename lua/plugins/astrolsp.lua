-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = false,
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = false,
        allow_filetypes = {
          "javascript",
          "php",
          "lua",
          "blade",
        },
      },
      disabled = {
        "lua_ls",
        "emmet_ls",
        "intelephense",
        "tsserver",
        "vtsls",
        "prettierd",
        "prettier",
      },
      timeout_ms = 3600,
      filter = function(client)
        if vim.bo.filetype == "vue" then return client.name == "volar" end
        if vim.bo.filetype == "blade" then return client.name == "null-ls" end
        return true
      end,
    },
    servers = {},
    ---@diagnostic disable: missing-fields
    config = {
      ["*"] = {
        capabilities = {
          colorProvider = vim.NIL,
        },
      },
    },
    autocmds = {
      lsp_document_highlight = {
        cond = "textDocument/documentHighlight",
        {
          event = { "CursorHold", "CursorHoldI" },
          desc = "Document Highlighting",
          callback = function() vim.lsp.buf.document_highlight() end,
        },
        {
          event = { "CursorMoved", "CursorMovedI", "BufLeave" },
          desc = "Document Highlighting Clear",
          callback = function() vim.lsp.buf.clear_references() end,
        },
      },
    },
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
      },
    },
  },
}
