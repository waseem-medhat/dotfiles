local on_attach_fn = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    vim.keymap.set('n', '<leader>lr', ':LspRestart<Enter>', { desc = '[L]SP [R]estart' })

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format({ async = true, formatting_options = { insertSpaces = true } })
    end, { desc = 'Format current buffer with LSP' })

    nmap('<leader>f', vim.cmd.Format, '[F]ormat')
end

local setup_handlers = function(capabilities, on_attach)
    return {
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
        end,
        ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    }
                }
            }
        end,
        ["tailwindcss"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.tailwindcss.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "templ", "astro", "javascript", "typescript", "react", "heex", "elixir" },
                -- init_options = { userLanguages = { templ = "html", heex = "html" } },
                settings = {
                    tailwindCSS = {
                        includeLanguages = {
                            elixir = "html-eex",
                            eelixir = "html-eex",
                            heex = "html-eex",
                        },
                    },
                },
            })
        end,
        ["templ"] = function() -- default handler (optional)
            vim.filetype.add({ extension = { templ = "templ" } })
            require("lspconfig").templ.setup {
                on_attach = on_attach,
            }
        end,
        ["html"] = function()
            require("lspconfig").html.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "html" }
            }
        end,
        ["ts_ls"] = function()
            local lspconfig = require("lspconfig")
            local mason_registry = require("mason-registry")

            local mason_install_path = mason_registry.get_package("vue-language-server"):get_install_path()
            local vue_language_server_path = mason_install_path .. "/node_modules/@vue/language-server"

            lspconfig.ts_ls.setup({
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_language_server_path,
                            languages = { "vue" },
                        },
                    },
                },
                filetypes = {
                    "javascript",
                    "typescript",
                    "vue",
                },
                on_attach = on_attach,
                capabilities = capabilities,
                commands = {
                    -- OrganizeImports = {
                    --     organize_imports,
                    --     description = "Organize Imports",
                    -- },
                },
            })
        end
    }
end

local config = function()
    require('neodev').setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
        ensure_installed = {
            "elixirls",
            "gopls",
            "html",
            "lua_ls",
            "pyright",
            "tailwindcss",
            "templ",
            "terraformls",
            "ts_ls",
            "volar",
            -- "r_language_server"
        },
        handlers = setup_handlers(capabilities, on_attach_fn),
        automatic_installation = {}
    }
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
        { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
        'folke/neodev.nvim',
    },
    config = config
}
