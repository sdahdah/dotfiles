# Local init

To create a local init file, `init_local.lua`, follow the following template,
where `init_local.run()` returns `false` if no local configuration was done.

```lua
local init_local = {}

function init_local.run()
    local cwd = vim.fs.root(0, ".git")
    if cwd == nil then
        return false
    elseif string.find(cwd, "xyz") then
        return true
    else
        return false
    end
end

return init_local
```
