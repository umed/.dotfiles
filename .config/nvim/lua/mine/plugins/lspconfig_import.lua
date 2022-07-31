local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local cmp = require 'cmp'

local keymap = require('mine.core.keymap')
local nmap, opts, noremap, silent = keymap.nmap, keymap.new_opts, keymap.noremap, keymap.silent

nmap({ '<leader>e', vim.diagnostic.open_float, opts(noremap, silent) })
nmap({ '[g', vim.diagnostic.goto_prev, opts(noremap, silent) })
nmap({ ']g', vim.diagnostic.goto_next, opts(noremap, silent) })
nmap({ '<leader>q', vim.diagnostic.setloclist, opts(noremap, silent) })


function on_attach(client, bufnr)
    -- function buffer(opt)
    --     return function()
    --         opt.buffer = bufnr
    --     end
    -- end


    -- local bufopts = opts(noremap, silent, buffer)
    -- nmap({ 'gD', vim.lsp.buf.declaration, bufopts })
    -- nmap({ 'gd', vim.lsp.buf.definition, bufopts })
    -- nmap({ 'K', vim.lsp.buf.hover, bufopts })
    -- nmap({ 'gi', vim.lsp.buf.implementation, bufopts })
    -- nmap({ '<C-k>', vim.lsp.buf.signature_help, bufopts })


     -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

     -- Mappings.
     -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

lspconfig.ccls.setup {
    on_attach = on_attach,
    init_options = {
        cache = {
            directory = "build/.ccls-cache";
            hierarchicalPath = true;
        };
        client = {
            snippetSupport = true;
        };
--         clang = {
--             resourceDir = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6';
--         }
    },
    capabilities = capabilities
}

local luasnip = require('luasnip')

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
