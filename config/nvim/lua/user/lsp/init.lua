-- 首先载入 mason，并且对其进行设置
local status_ok, mason_nvim = pcall(require, "mason")
if not status_ok then
    vim.notify("lsp.init.mason_nvim not found!")
    return
end

mason_nvim.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local status_ok, list = pcall(require, "user.lsp.language_list")
if not status_ok then
    vim.notify("lsp.init.language_list not found!")
    return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("lsp.init.lspconfig not found!")
    return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    vim.notify("lsp.init.mason_lspconfig not found!")
    return
end

local status_ok, default_config = pcall(require, "user.lsp.default-config")
if not status_ok then
    vim.notify("lsp.init.default_config not found!")
    return
end



local installServers = {}
local servers_handlers = {}

for _, element in pairs(list) do
    table.insert(installServers, element.name)
end

for _, value in pairs(installServers) do
	local status, config = pcall(require, "user.lsp.language_config." .. value)
	if not status then
		config = {}
	end
	servers_handlers[value] = function()
	    lspconfig[value].setup(vim.tbl_deep_extend("force", default_config(value), config))
    end
end

mason_lspconfig.setup({
    ensure_installed = installServers,
})

mason_lspconfig.setup_handlers(servers_handlers)


local status_ok, handlers = pcall(require, "user.lsp.handlers")
if not status_ok then
    vim.notify("lsp.init.handlers not found!")
    return
end
