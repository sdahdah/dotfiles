# Local init

To create a local init file, `init_local.lua`, follow the following template,
where `init_local.run()` returns `false` if no local configuration was done.

```lua
local init_local = {}

function init_local.run()
    return true
end

return init_local
```
