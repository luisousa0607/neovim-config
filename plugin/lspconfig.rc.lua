require'lspconfig'.csharp_ls.setup{}
require'lspconfig'.omnisharp.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = function(_, bufnr)
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
     end,
       cmd = { "~/.cache/omnisharp-vim/omnisharp-roslyn/run", "--languageserver" , "--hostPID", tostring(pid) },
}

require'lspconfig'.svelte.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.tailwindcss.setup{}
