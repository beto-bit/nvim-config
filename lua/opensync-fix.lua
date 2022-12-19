-- Auto Open between tabs
-- I don't know why, I don't want to know why, I shouldn't 
-- have to wonder why, but for some reason this is code 
-- that comes directly from the nvim-tree package and it 
-- is basically a copy-paste, and unless I do copy and do 
-- paste all of this, this shit messes-up with my LSP.
local function tab_enter()
    local view = require("nvim-tree.view")

    local bufname = vim.api.nvim_buf_get_name(0)
    local ft = vim.api.nvim_buf_get_option(0, "ft")

    if view.is_visible { any_tabpage = true } then
        -- Loop over ignored files
        for _, filter in ipairs({}) do
            if bufname:match(filter) ~= nil or ft:match(filter) ~= nil then
                return
            end
        end

        view.open { focus_tree = false }
        require("nvim-tree.renderer").draw()
    end
end

local function my_setup(opts)
    local augroup_id = vim.api.nvim_create_augroup("NvimTree", { clear = true })

    local function create_yade(name, custom_opts)
        local default_opts = { group = augroup_id }
        vim.api.nvim_create_autocmd(
            name,
            vim.tbl_extend("force", default_opts, custom_opts)
        )
    end

    if opts then
        create_yade("TabEnter", { callback = vim.schedule_wrap(tab_enter) })
    end
end

my_setup(true)
